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
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import vn.javaweb.real.estate.manage.exceptions.NonexistentEntityException;
import vn.javaweb.real.estate.manage.exceptions.PreexistingEntityException;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.RegionalPrice;

/**
 * @date 25/08/2015
 * @author PhanAnh
 */
public class RegionalPriceModelManage implements Serializable {
    private EntityManagerFactory emf = null;
    private static RegionalPriceModelManage instance;
    
    public RegionalPriceModelManage(EntityManagerFactory emf) {
        this.emf = emf;
    }
    
    public static RegionalPriceModelManage getInstance() {
        if(instance == null){
            instance = new RegionalPriceModelManage(Persistence.createEntityManagerFactory(ConfigConnection.PERSISTENCE_UNIT_NAME));
        }
        return instance;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(RegionalPrice regionalPrice) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (regionalPrice.getProfileLandList() == null) {
            regionalPrice.setProfileLandList(new ArrayList<ProfileLand>());
        }
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            List<ProfileLand> attachedProfileLandList = new ArrayList<>();
            for (ProfileLand profileLandListProfileLandToAttach : regionalPrice.getProfileLandList()) {
                profileLandListProfileLandToAttach = em.getReference(profileLandListProfileLandToAttach.getClass(), profileLandListProfileLandToAttach.getCode());
                attachedProfileLandList.add(profileLandListProfileLandToAttach);
            }
            regionalPrice.setProfileLandList(attachedProfileLandList);
            em.persist(regionalPrice);
            for (ProfileLand profileLandListProfileLand : regionalPrice.getProfileLandList()) {
                RegionalPrice oldCodeRegionalOfProfileLandListProfileLand = profileLandListProfileLand.getCodeRegional();
                profileLandListProfileLand.setCodeRegional(regionalPrice);
                profileLandListProfileLand = em.merge(profileLandListProfileLand);
                if (oldCodeRegionalOfProfileLandListProfileLand != null) {
                    oldCodeRegionalOfProfileLandListProfileLand.getProfileLandList().remove(profileLandListProfileLand);
                    oldCodeRegionalOfProfileLandListProfileLand = em.merge(oldCodeRegionalOfProfileLandListProfileLand);
                }
            }
            et.commit();
        } catch (Exception ex) {
            System.out.println("Error exception create RegionalPrice !");
            try {
                et.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findByCode(regionalPrice.getCode()) != null) {
                throw new PreexistingEntityException("RegionalPrice " + regionalPrice + " already exists.", ex);
            }
            throw ex;
        } finally {
            em.close();
        }
    }

    public void edit(RegionalPrice regionalPrice) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            RegionalPrice persistentRegionalPrice = em.find(RegionalPrice.class, regionalPrice.getCode());
            List<ProfileLand> profileLandListOld = persistentRegionalPrice.getProfileLandList();
            List<ProfileLand> profileLandListNew = regionalPrice.getProfileLandList();
            List<ProfileLand> attachedProfileLandListNew = new ArrayList<ProfileLand>();
            for (ProfileLand profileLandListNewProfileLandToAttach : profileLandListNew) {
                profileLandListNewProfileLandToAttach = em.getReference(profileLandListNewProfileLandToAttach.getClass(), profileLandListNewProfileLandToAttach.getCode());
                attachedProfileLandListNew.add(profileLandListNewProfileLandToAttach);
            }
            profileLandListNew = attachedProfileLandListNew;
            regionalPrice.setProfileLandList(profileLandListNew);
            regionalPrice = em.merge(regionalPrice);
            for (ProfileLand profileLandListOldProfileLand : profileLandListOld) {
                if (!profileLandListNew.contains(profileLandListOldProfileLand)) {
                    profileLandListOldProfileLand.setCodeRegional(null);
                    profileLandListOldProfileLand = em.merge(profileLandListOldProfileLand);
                }
            }
            for (ProfileLand profileLandListNewProfileLand : profileLandListNew) {
                if (!profileLandListOld.contains(profileLandListNewProfileLand)) {
                    RegionalPrice oldCodeRegionalOfProfileLandListNewProfileLand = profileLandListNewProfileLand.getCodeRegional();
                    profileLandListNewProfileLand.setCodeRegional(regionalPrice);
                    profileLandListNewProfileLand = em.merge(profileLandListNewProfileLand);
                    if (oldCodeRegionalOfProfileLandListNewProfileLand != null && !oldCodeRegionalOfProfileLandListNewProfileLand.equals(regionalPrice)) {
                        oldCodeRegionalOfProfileLandListNewProfileLand.getProfileLandList().remove(profileLandListNewProfileLand);
                        oldCodeRegionalOfProfileLandListNewProfileLand = em.merge(oldCodeRegionalOfProfileLandListNewProfileLand);
                    }
                }
            }
            et.commit();
        } catch (Exception ex) {
            System.out.println("Error exception edit RegionalPrice !");
            try {
                et.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = regionalPrice.getCode();
                if (findByCode(id) == null) {
                    throw new NonexistentEntityException("The regionalPrice with id " + id + " no longer exists.");
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
            RegionalPrice regionalPrice;
            try {
                regionalPrice = em.getReference(RegionalPrice.class, code);
                regionalPrice.getCode();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The regionalPrice with id " + code + " no longer exists.", enfe);
            }
            List<ProfileLand> profileLandList = regionalPrice.getProfileLandList();
            for (ProfileLand profileLandListProfileLand : profileLandList) {
                profileLandListProfileLand.setCodeRegional(null);
                profileLandListProfileLand = em.merge(profileLandListProfileLand);
            }
            em.remove(regionalPrice);
            et.commit();
        } catch (Exception ex) {
            System.out.println("Error exception delete RegionalPrice !");
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

    public List<RegionalPrice> findAll() {
        return findRegionalPriceEntities(true, -1, -1);
    }

    public List<RegionalPrice> findRegionalPriceEntities(int maxResults, int firstResult) {
        return findRegionalPriceEntities(false, maxResults, firstResult);
    }

    private List<RegionalPrice> findRegionalPriceEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(RegionalPrice.class));
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

    public RegionalPrice findByCode(String code) {
        EntityManager em = getEntityManager();
        try {
            return em.find(RegionalPrice.class, code);
        } finally {
            em.close();
        }
    }
    
    public List<RegionalPrice> findByCity(String city){
        EntityManager em = getEntityManager();  
        try {                          
            Query query = em.createNamedQuery("RegionalPrice.findByCity");
            query.setParameter("city", city);
            return (List<RegionalPrice>)query.getResultList();
        } finally {
            em.close();
        }
        
    }
    
    public List<RegionalPrice> findByRegionalNameLike(String regionalName){
        EntityManager em = getEntityManager();   
        try {
            Query query = em.createNamedQuery("RegionalPrice.findByRegionalNameLike");
            query.setParameter("regionalName", "%" + regionalName + "%");
            return (List<RegionalPrice>)query.getResultList(); 
        } finally {
            em.close();
        }        
    }

    public int getRegionalPriceCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<RegionalPrice> rt = cq.from(RegionalPrice.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
