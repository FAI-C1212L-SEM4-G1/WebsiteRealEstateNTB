package vn.javaweb.real.estate.manage;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;
import vn.javaweb.real.estate.manage.exceptions.NonexistentEntityException;
import vn.javaweb.real.estate.manage.exceptions.PreexistingEntityException;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.BuyLand;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.InvoiceTransaction;

/**
 *
 * @author PhanAnh
 */
public class InvoiceTransactionModelManage implements Serializable {

    private EntityManagerFactory emf = null;
    private static InvoiceTransactionModelManage instance;

    public InvoiceTransactionModelManage(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public static InvoiceTransactionModelManage getInstance() {
        if (instance == null) {
            instance = new InvoiceTransactionModelManage(Persistence.createEntityManagerFactory(ConfigConnection.PERSISTENCE_UNIT_NAME));
        }
        return instance;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(InvoiceTransaction invoiceTransaction) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            BuyLand codeBuyLand = invoiceTransaction.getCodeBuyLand();
            if (codeBuyLand != null) {
                codeBuyLand = em.getReference(codeBuyLand.getClass(), codeBuyLand.getCode());
                invoiceTransaction.setCodeBuyLand(codeBuyLand);
            }
            em.persist(invoiceTransaction);
            if (codeBuyLand != null) {
                codeBuyLand.getInvoiceTransactionList().add(invoiceTransaction);
                codeBuyLand = em.merge(codeBuyLand);
            }
            et.commit();
        } catch (Exception ex) {
            try {
                et.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findInvoiceTransaction(invoiceTransaction.getCode()) != null) {
                throw new PreexistingEntityException("InvoiceTransaction " + invoiceTransaction + " already exists.", ex);
            }
            throw ex;
        } finally {
            em.close();
        }
    }

    public void edit(InvoiceTransaction invoiceTransaction) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            InvoiceTransaction persistentInvoiceTransaction = em.find(InvoiceTransaction.class, invoiceTransaction.getCode());
            BuyLand codeBuyLandOld = persistentInvoiceTransaction.getCodeBuyLand();
            BuyLand codeBuyLandNew = invoiceTransaction.getCodeBuyLand();
            if (codeBuyLandNew != null) {
                codeBuyLandNew = em.getReference(codeBuyLandNew.getClass(), codeBuyLandNew.getCode());
                invoiceTransaction.setCodeBuyLand(codeBuyLandNew);
            }
            invoiceTransaction = em.merge(invoiceTransaction);
            if (codeBuyLandOld != null && !codeBuyLandOld.equals(codeBuyLandNew)) {
                codeBuyLandOld.getInvoiceTransactionList().remove(invoiceTransaction);
                codeBuyLandOld = em.merge(codeBuyLandOld);
            }
            if (codeBuyLandNew != null && !codeBuyLandNew.equals(codeBuyLandOld)) {
                codeBuyLandNew.getInvoiceTransactionList().add(invoiceTransaction);
                codeBuyLandNew = em.merge(codeBuyLandNew);
            }
            et.commit();
        } catch (Exception ex) {
            try {
                et.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = invoiceTransaction.getCode();
                if (findInvoiceTransaction(id) == null) {
                    throw new NonexistentEntityException("The invoiceTransaction with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            em.close();
        }
    }

    public void deleteByCode(String code) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            InvoiceTransaction invoiceTransaction;
            try {
                invoiceTransaction = em.getReference(InvoiceTransaction.class, code);
                invoiceTransaction.getCode();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The invoiceTransaction with id " + code + " no longer exists.", enfe);
            }
            BuyLand codeBuyLand = invoiceTransaction.getCodeBuyLand();
            if (codeBuyLand != null) {
                codeBuyLand.getInvoiceTransactionList().remove(invoiceTransaction);
                codeBuyLand = em.merge(codeBuyLand);
            }
            em.remove(invoiceTransaction);
            et.commit();
        } catch (Exception ex) {
            try {
                et.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            em.close();
        }
    }

    public List<InvoiceTransaction> findInvoiceTransactionEntities() {
        return findInvoiceTransactionEntities(true, -1, -1);
    }

    public List<InvoiceTransaction> findInvoiceTransactionEntities(int maxResults, int firstResult) {
        return findInvoiceTransactionEntities(false, maxResults, firstResult);
    }

    private List<InvoiceTransaction> findInvoiceTransactionEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(InvoiceTransaction.class));
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

    public InvoiceTransaction findInvoiceTransaction(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(InvoiceTransaction.class, id);
        } finally {
            em.close();
        }
    }

    public int getInvoiceTransactionCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<InvoiceTransaction> rt = cq.from(InvoiceTransaction.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
