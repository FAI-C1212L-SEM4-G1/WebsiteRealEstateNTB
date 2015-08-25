package vn.javaweb.real.estate.manage;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import vn.javaweb.real.estate.model.Person;
import vn.javaweb.real.estate.model.BuyLand;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import vn.javaweb.real.estate.manage.exceptions.IllegalOrphanException;
import vn.javaweb.real.estate.manage.exceptions.NonexistentEntityException;
import vn.javaweb.real.estate.manage.exceptions.PreexistingEntityException;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.Account;
import vn.javaweb.real.estate.model.ConfigConnection;

/**
 *
 * @author PhanAnh
 */
public class AccountModelManage implements Serializable {

    private EntityManagerFactory emf = null;
    private static AccountModelManage instance;

    public AccountModelManage(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public static AccountModelManage getInstance() {
        if (instance == null) {
            instance = new AccountModelManage(Persistence.createEntityManagerFactory(ConfigConnection.PERSISTENCE_UNIT_NAME));
        }
        return instance;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Account account) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (account.getBuyLandList() == null) {
            account.setBuyLandList(new ArrayList<BuyLand>());
        }
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            Person person = account.getPerson();
            if (person != null) {
                person = em.getReference(person.getClass(), person.getId());
                account.setPerson(person);
            }
            List<BuyLand> attachedBuyLandList = new ArrayList<BuyLand>();
            for (BuyLand buyLandListBuyLandToAttach : account.getBuyLandList()) {
                buyLandListBuyLandToAttach = em.getReference(buyLandListBuyLandToAttach.getClass(), buyLandListBuyLandToAttach.getCode());
                attachedBuyLandList.add(buyLandListBuyLandToAttach);
            }
            account.setBuyLandList(attachedBuyLandList);
            em.persist(account);
            if (person != null) {
                Account oldUsernameOfPerson = person.getUsername();
                if (oldUsernameOfPerson != null) {
                    oldUsernameOfPerson.setPerson(null);
                    oldUsernameOfPerson = em.merge(oldUsernameOfPerson);
                }
                person.setUsername(account);
                person = em.merge(person);
            }
            for (BuyLand buyLandListBuyLand : account.getBuyLandList()) {
                Account oldUsernameOfBuyLandListBuyLand = buyLandListBuyLand.getUsername();
                buyLandListBuyLand.setUsername(account);
                buyLandListBuyLand = em.merge(buyLandListBuyLand);
                if (oldUsernameOfBuyLandListBuyLand != null) {
                    oldUsernameOfBuyLandListBuyLand.getBuyLandList().remove(buyLandListBuyLand);
                    oldUsernameOfBuyLandListBuyLand = em.merge(oldUsernameOfBuyLandListBuyLand);
                }
            }
            et.commit();
        } catch (Exception ex) {
            try {
                et.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findAccount(account.getLoginId()) != null) {
                throw new PreexistingEntityException("Account " + account + " already exists.", ex);
            }
            throw ex;
        } finally {
            em.close();
        }
    }

    public void edit(Account account) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            Account persistentAccount = em.find(Account.class, account.getLoginId());
            Person personOld = persistentAccount.getPerson();
            Person personNew = account.getPerson();
            List<BuyLand> buyLandListOld = persistentAccount.getBuyLandList();
            List<BuyLand> buyLandListNew = account.getBuyLandList();
            List<String> illegalOrphanMessages = null;
            if (personOld != null && !personOld.equals(personNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain Person " + personOld + " since its username field is not nullable.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (personNew != null) {
                personNew = em.getReference(personNew.getClass(), personNew.getId());
                account.setPerson(personNew);
            }
            List<BuyLand> attachedBuyLandListNew = new ArrayList<BuyLand>();
            for (BuyLand buyLandListNewBuyLandToAttach : buyLandListNew) {
                buyLandListNewBuyLandToAttach = em.getReference(buyLandListNewBuyLandToAttach.getClass(), buyLandListNewBuyLandToAttach.getCode());
                attachedBuyLandListNew.add(buyLandListNewBuyLandToAttach);
            }
            buyLandListNew = attachedBuyLandListNew;
            account.setBuyLandList(buyLandListNew);
            account = em.merge(account);
            if (personNew != null && !personNew.equals(personOld)) {
                Account oldUsernameOfPerson = personNew.getUsername();
                if (oldUsernameOfPerson != null) {
                    oldUsernameOfPerson.setPerson(null);
                    oldUsernameOfPerson = em.merge(oldUsernameOfPerson);
                }
                personNew.setUsername(account);
                personNew = em.merge(personNew);
            }
            for (BuyLand buyLandListOldBuyLand : buyLandListOld) {
                if (!buyLandListNew.contains(buyLandListOldBuyLand)) {
                    buyLandListOldBuyLand.setUsername(null);
                    buyLandListOldBuyLand = em.merge(buyLandListOldBuyLand);
                }
            }
            for (BuyLand buyLandListNewBuyLand : buyLandListNew) {
                if (!buyLandListOld.contains(buyLandListNewBuyLand)) {
                    Account oldUsernameOfBuyLandListNewBuyLand = buyLandListNewBuyLand.getUsername();
                    buyLandListNewBuyLand.setUsername(account);
                    buyLandListNewBuyLand = em.merge(buyLandListNewBuyLand);
                    if (oldUsernameOfBuyLandListNewBuyLand != null && !oldUsernameOfBuyLandListNewBuyLand.equals(account)) {
                        oldUsernameOfBuyLandListNewBuyLand.getBuyLandList().remove(buyLandListNewBuyLand);
                        oldUsernameOfBuyLandListNewBuyLand = em.merge(oldUsernameOfBuyLandListNewBuyLand);
                    }
                }
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
                String id = account.getLoginId();
                if (findAccount(id) == null) {
                    throw new NonexistentEntityException("The account with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            em.close();
        }
    }

    public void deleteByCode(String code) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            Account account;
            try {
                account = em.getReference(Account.class, code);
                account.getLoginId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The account with id " + code + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            Person personOrphanCheck = account.getPerson();
            if (personOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<>();
                }
                illegalOrphanMessages.add("This Account (" + account + ") cannot be destroyed since the Person " + personOrphanCheck + " in its person field has a non-nullable username field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<BuyLand> buyLandList = account.getBuyLandList();
            for (BuyLand buyLandListBuyLand : buyLandList) {
                buyLandListBuyLand.setUsername(null);
                buyLandListBuyLand = em.merge(buyLandListBuyLand);
            }
            em.remove(account);
            et.commit();
        } catch (NonexistentEntityException | IllegalOrphanException ex) {
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

    public List<Account> findAccountEntities() {
        return findAccountEntities(true, -1, -1);
    }

    public List<Account> findAccountEntities(int maxResults, int firstResult) {
        return findAccountEntities(false, maxResults, firstResult);
    }

    private List<Account> findAccountEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Account.class));
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

    public Account findAccount(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Account.class, id);
        } finally {
            em.close();
        }
    }

    public int getAccountCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Account> rt = cq.from(Account.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
