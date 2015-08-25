/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.javaweb.real.estate.manage;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import vn.javaweb.real.estate.model.ProfileLand;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import vn.javaweb.real.estate.manage.exceptions.IllegalOrphanException;
import vn.javaweb.real.estate.manage.exceptions.NonexistentEntityException;
import vn.javaweb.real.estate.manage.exceptions.PreexistingEntityException;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.PaymentMode;

/**
 *
 * @author NguyenNgoc
 */
public class PaymentModeModelManage implements Serializable {
    private EntityManagerFactory emf = null;
    private static PaymentModeModelManage instance;

    public PaymentModeModelManage() {
        emf.createEntityManager();
    }
        
    public PaymentModeModelManage(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public static PaymentModeModelManage getInstance(){
        if(instance == null)
            instance = new PaymentModeModelManage();
        return instance;
    }
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void createPaymentMode(PaymentMode paymentMode) throws IllegalOrphanException, PreexistingEntityException, RollbackFailureException, Exception {
        List<String> illegalOrphanMessages = null;
        ProfileLand codeProfileLandOrphanCheck = paymentMode.getCodeProfileLand();
        if (codeProfileLandOrphanCheck != null) {
            PaymentMode oldPaymentModeOfCodeProfileLand = codeProfileLandOrphanCheck.getPaymentMode();
            if (oldPaymentModeOfCodeProfileLand != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The ProfileLand " + codeProfileLandOrphanCheck + " already has an item of type PaymentMode whose codeProfileLand column cannot be null. Please make another selection for the codeProfileLand field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = getEntityManager();
        try {
            ProfileLand codeProfileLand = paymentMode.getCodeProfileLand();
            if (codeProfileLand != null) {
                codeProfileLand = em.getReference(codeProfileLand.getClass(), codeProfileLand.getCode());
                paymentMode.setCodeProfileLand(codeProfileLand);
            }
            em.persist(paymentMode);
            if (codeProfileLand != null) {
                codeProfileLand.setPaymentMode(paymentMode);
                codeProfileLand = em.merge(codeProfileLand);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findPaymentMode(paymentMode.getCode()) != null) {
                throw new PreexistingEntityException("PaymentMode " + paymentMode + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void editPaymentMode(PaymentMode paymentMode) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = getEntityManager();
        try {
            PaymentMode persistentPaymentMode = em.find(PaymentMode.class, paymentMode.getCode());
            ProfileLand codeProfileLandOld = persistentPaymentMode.getCodeProfileLand();
            ProfileLand codeProfileLandNew = paymentMode.getCodeProfileLand();
            List<String> illegalOrphanMessages = null;
            if (codeProfileLandNew != null && !codeProfileLandNew.equals(codeProfileLandOld)) {
                PaymentMode oldPaymentModeOfCodeProfileLand = codeProfileLandNew.getPaymentMode();
                if (oldPaymentModeOfCodeProfileLand != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The ProfileLand " + codeProfileLandNew + " already has an item of type PaymentMode whose codeProfileLand column cannot be null. Please make another selection for the codeProfileLand field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (codeProfileLandNew != null) {
                codeProfileLandNew = em.getReference(codeProfileLandNew.getClass(), codeProfileLandNew.getCode());
                paymentMode.setCodeProfileLand(codeProfileLandNew);
            }
            paymentMode = em.merge(paymentMode);
            if (codeProfileLandOld != null && !codeProfileLandOld.equals(codeProfileLandNew)) {
                codeProfileLandOld.setPaymentMode(null);
                codeProfileLandOld = em.merge(codeProfileLandOld);
            }
            if (codeProfileLandNew != null && !codeProfileLandNew.equals(codeProfileLandOld)) {
                codeProfileLandNew.setPaymentMode(paymentMode);
                codeProfileLandNew = em.merge(codeProfileLandNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = paymentMode.getCode();
                if (findPaymentMode(id) == null) {
                    throw new NonexistentEntityException("The paymentMode with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void deletePaymentMode(String id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = getEntityManager();
        try {
            PaymentMode paymentMode;
            try {
                paymentMode = em.getReference(PaymentMode.class, id);
                paymentMode.getCode();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The paymentMode with id " + id + " no longer exists.", enfe);
            }
            ProfileLand codeProfileLand = paymentMode.getCodeProfileLand();
            if (codeProfileLand != null) {
                codeProfileLand.setPaymentMode(null);
                codeProfileLand = em.merge(codeProfileLand);
            }
            em.remove(paymentMode);
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<PaymentMode> findPaymentModeEntities() {
        return findPaymentModeEntities(true, -1, -1);
    }

    public List<PaymentMode> findPaymentModeEntities(int maxResults, int firstResult) {
        return findPaymentModeEntities(false, maxResults, firstResult);
    }

    private List<PaymentMode> findPaymentModeEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(PaymentMode.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public PaymentMode findPaymentMode(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(PaymentMode.class, id);
        } finally {
            em.close();
        }
    }

    public int getPaymentModeCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<PaymentMode> rt = cq.from(PaymentMode.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
