package vn.javaweb.real.estate.manage;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;
import vn.javaweb.real.estate.manage.exceptions.IllegalOrphanException;
import vn.javaweb.real.estate.manage.exceptions.NonexistentEntityException;
import vn.javaweb.real.estate.manage.exceptions.PreexistingEntityException;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.BuyLand;
import vn.javaweb.real.estate.model.PaymentMode;
import vn.javaweb.real.estate.model.ProfileLand;
import vn.javaweb.real.estate.model.RegionalPrice;

/**
 *
 * @author NguyenNgoc
 */
public class ProfileLandModelManage implements Serializable {
    private static ProfileLandModelManage instance;
    private EntityManagerFactory emf = null;

    public ProfileLandModelManage() {

    }

    public ProfileLandModelManage(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public static ProfileLandModelManage getInstance() {
        if (instance == null) {
            instance = new ProfileLandModelManage();
        }
        return instance;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void createProfileLand(ProfileLand profileLand) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (profileLand.getBuyLandList() == null) {
            profileLand.setBuyLandList(new ArrayList<BuyLand>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            PaymentMode paymentMode = profileLand.getPaymentMode();
            if (paymentMode != null) {
                paymentMode = em.getReference(paymentMode.getClass(), paymentMode.getCode());
                profileLand.setPaymentMode(paymentMode);
            }
            RegionalPrice codeRegional = profileLand.getCodeRegional();
            if (codeRegional != null) {
                codeRegional = em.getReference(codeRegional.getClass(), codeRegional.getCode());
                profileLand.setCodeRegional(codeRegional);
            }
            List<BuyLand> attachedBuyLandList = new ArrayList<>();
            for (BuyLand buyLandListBuyLandToAttach : profileLand.getBuyLandList()) {
                buyLandListBuyLandToAttach = em.getReference(buyLandListBuyLandToAttach.getClass(), buyLandListBuyLandToAttach.getCode());
                attachedBuyLandList.add(buyLandListBuyLandToAttach);
            }
            profileLand.setBuyLandList(attachedBuyLandList);
            em.persist(profileLand);
            if (paymentMode != null) {
                ProfileLand oldCodeProfileLandOfPaymentMode = paymentMode.getCodeProfileLand();
                if (oldCodeProfileLandOfPaymentMode != null) {
                    oldCodeProfileLandOfPaymentMode.setPaymentMode(null);
                    oldCodeProfileLandOfPaymentMode = em.merge(oldCodeProfileLandOfPaymentMode);
                }
                paymentMode.setCodeProfileLand(profileLand);
                paymentMode = em.merge(paymentMode);
            }
            if (codeRegional != null) {
                codeRegional.getProfileLandList().add(profileLand);
                codeRegional = em.merge(codeRegional);
            }
            for (BuyLand buyLandListBuyLand : profileLand.getBuyLandList()) {
                ProfileLand oldCodeProfileLandOfBuyLandListBuyLand = buyLandListBuyLand.getCodeProfileLand();
                buyLandListBuyLand.setCodeProfileLand(profileLand);
                buyLandListBuyLand = em.merge(buyLandListBuyLand);
                if (oldCodeProfileLandOfBuyLandListBuyLand != null) {
                    oldCodeProfileLandOfBuyLandListBuyLand.getBuyLandList().remove(buyLandListBuyLand);
                    oldCodeProfileLandOfBuyLandListBuyLand = em.merge(oldCodeProfileLandOfBuyLandListBuyLand);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {            
            if (findProfileLand(profileLand.getCode()) != null) {
                throw new PreexistingEntityException("ProfileLand " + profileLand + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void editProfileLand(ProfileLand profileLand) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            ProfileLand persistentProfileLand = em.find(ProfileLand.class, profileLand.getCode());
            PaymentMode paymentModeOld = persistentProfileLand.getPaymentMode();
            PaymentMode paymentModeNew = profileLand.getPaymentMode();
            RegionalPrice codeRegionalOld = persistentProfileLand.getCodeRegional();
            RegionalPrice codeRegionalNew = profileLand.getCodeRegional();
            List<BuyLand> buyLandListOld = persistentProfileLand.getBuyLandList();
            List<BuyLand> buyLandListNew = profileLand.getBuyLandList();
            List<String> illegalOrphanMessages = null;
            if (paymentModeOld != null && !paymentModeOld.equals(paymentModeNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain PaymentMode " + paymentModeOld + " since its codeProfileLand field is not nullable.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (paymentModeNew != null) {
                paymentModeNew = em.getReference(paymentModeNew.getClass(), paymentModeNew.getCode());
                profileLand.setPaymentMode(paymentModeNew);
            }
            if (codeRegionalNew != null) {
                codeRegionalNew = em.getReference(codeRegionalNew.getClass(), codeRegionalNew.getCode());
                profileLand.setCodeRegional(codeRegionalNew);
            }
            List<BuyLand> attachedBuyLandListNew = new ArrayList<BuyLand>();
            for (BuyLand buyLandListNewBuyLandToAttach : buyLandListNew) {
                buyLandListNewBuyLandToAttach = em.getReference(buyLandListNewBuyLandToAttach.getClass(), buyLandListNewBuyLandToAttach.getCode());
                attachedBuyLandListNew.add(buyLandListNewBuyLandToAttach);
            }
            buyLandListNew = attachedBuyLandListNew;
            profileLand.setBuyLandList(buyLandListNew);
            profileLand = em.merge(profileLand);
            if (paymentModeNew != null && !paymentModeNew.equals(paymentModeOld)) {
                ProfileLand oldCodeProfileLandOfPaymentMode = paymentModeNew.getCodeProfileLand();
                if (oldCodeProfileLandOfPaymentMode != null) {
                    oldCodeProfileLandOfPaymentMode.setPaymentMode(null);
                    oldCodeProfileLandOfPaymentMode = em.merge(oldCodeProfileLandOfPaymentMode);
                }
                paymentModeNew.setCodeProfileLand(profileLand);
                paymentModeNew = em.merge(paymentModeNew);
            }
            if (codeRegionalOld != null && !codeRegionalOld.equals(codeRegionalNew)) {
                codeRegionalOld.getProfileLandList().remove(profileLand);
                codeRegionalOld = em.merge(codeRegionalOld);
            }
            if (codeRegionalNew != null && !codeRegionalNew.equals(codeRegionalOld)) {
                codeRegionalNew.getProfileLandList().add(profileLand);
                codeRegionalNew = em.merge(codeRegionalNew);
            }
            for (BuyLand buyLandListOldBuyLand : buyLandListOld) {
                if (!buyLandListNew.contains(buyLandListOldBuyLand)) {
                    buyLandListOldBuyLand.setCodeProfileLand(null);
                    buyLandListOldBuyLand = em.merge(buyLandListOldBuyLand);
                }
            }
            for (BuyLand buyLandListNewBuyLand : buyLandListNew) {
                if (!buyLandListOld.contains(buyLandListNewBuyLand)) {
                    ProfileLand oldCodeProfileLandOfBuyLandListNewBuyLand = buyLandListNewBuyLand.getCodeProfileLand();
                    buyLandListNewBuyLand.setCodeProfileLand(profileLand);
                    buyLandListNewBuyLand = em.merge(buyLandListNewBuyLand);
                    if (oldCodeProfileLandOfBuyLandListNewBuyLand != null && !oldCodeProfileLandOfBuyLandListNewBuyLand.equals(profileLand)) {
                        oldCodeProfileLandOfBuyLandListNewBuyLand.getBuyLandList().remove(buyLandListNewBuyLand);
                        oldCodeProfileLandOfBuyLandListNewBuyLand = em.merge(oldCodeProfileLandOfBuyLandListNewBuyLand);
                    }
                }
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
                String id = profileLand.getCode();
                if (findProfileLand(id) == null) {
                    throw new NonexistentEntityException("The profileLand with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void deleteProfileLand(String id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            ProfileLand profileLand;
            try {
                profileLand = em.getReference(ProfileLand.class, id);
                profileLand.getCode();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The profileLand with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            PaymentMode paymentModeOrphanCheck = profileLand.getPaymentMode();
            if (paymentModeOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<>();
                }
                illegalOrphanMessages.add("This ProfileLand (" + profileLand + ") cannot be destroyed since the PaymentMode " + paymentModeOrphanCheck + " in its paymentMode field has a non-nullable codeProfileLand field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            RegionalPrice codeRegional = profileLand.getCodeRegional();
            if (codeRegional != null) {
                codeRegional.getProfileLandList().remove(profileLand);
                codeRegional = em.merge(codeRegional);
            }
            List<BuyLand> buyLandList = profileLand.getBuyLandList();
            for (BuyLand buyLandListBuyLand : buyLandList) {
                buyLandListBuyLand.setCodeProfileLand(null);
                buyLandListBuyLand = em.merge(buyLandListBuyLand);
            }
            em.remove(profileLand);
            em.getTransaction().commit();
        } catch (NonexistentEntityException | IllegalOrphanException ex) {           
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ProfileLand> findProfileLandEntities() {
        return findProfileLandEntities(true, -1, -1);
    }

    public List<ProfileLand> findProfileLandEntities(int maxResults, int firstResult) {
        return findProfileLandEntities(false, maxResults, firstResult);
    }

    private List<ProfileLand> findProfileLandEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ProfileLand.class));
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

    public ProfileLand findProfileLand(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ProfileLand.class, id);
        } finally {
            em.close();
        }
    }

    public int getProfileLandCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ProfileLand> rt = cq.from(ProfileLand.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
