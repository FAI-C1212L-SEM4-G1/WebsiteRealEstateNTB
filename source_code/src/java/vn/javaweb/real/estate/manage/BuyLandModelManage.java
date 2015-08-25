package vn.javaweb.real.estate.manage;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import vn.javaweb.real.estate.model.ProfileLand;
import vn.javaweb.real.estate.model.Account;
import vn.javaweb.real.estate.model.InvoiceTransaction;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import vn.javaweb.real.estate.manage.exceptions.NonexistentEntityException;
import vn.javaweb.real.estate.manage.exceptions.PreexistingEntityException;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.BuyLand;
import vn.javaweb.real.estate.model.ConfigConnection;

/**
 *
 * @author PhanAnh
 */
public class BuyLandModelManage implements Serializable {

    private EntityManagerFactory emf = null;
    private static BuyLandModelManage instance;

    public BuyLandModelManage(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public static BuyLandModelManage getInstance() {
        if (instance == null) {
            instance = new BuyLandModelManage(Persistence.createEntityManagerFactory(ConfigConnection.PERSISTENCE_UNIT_NAME));
        }
        return instance;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(BuyLand buyLand) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (buyLand.getInvoiceTransactionList() == null) {
            buyLand.setInvoiceTransactionList(new ArrayList<InvoiceTransaction>());
        }
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            ProfileLand codeProfileLand = buyLand.getCodeProfileLand();
            if (codeProfileLand != null) {
                codeProfileLand = em.getReference(codeProfileLand.getClass(), codeProfileLand.getCode());
                buyLand.setCodeProfileLand(codeProfileLand);
            }
            Account username = buyLand.getUsername();
            if (username != null) {
                username = em.getReference(username.getClass(), username.getLoginId());
                buyLand.setUsername(username);
            }
            List<InvoiceTransaction> attachedInvoiceTransactionList = new ArrayList<InvoiceTransaction>();
            for (InvoiceTransaction invoiceTransactionListInvoiceTransactionToAttach : buyLand.getInvoiceTransactionList()) {
                invoiceTransactionListInvoiceTransactionToAttach = em.getReference(invoiceTransactionListInvoiceTransactionToAttach.getClass(), invoiceTransactionListInvoiceTransactionToAttach.getCode());
                attachedInvoiceTransactionList.add(invoiceTransactionListInvoiceTransactionToAttach);
            }
            buyLand.setInvoiceTransactionList(attachedInvoiceTransactionList);
            em.persist(buyLand);
            if (codeProfileLand != null) {
                codeProfileLand.getBuyLandList().add(buyLand);
                codeProfileLand = em.merge(codeProfileLand);
            }
            if (username != null) {
                username.getBuyLandList().add(buyLand);
                username = em.merge(username);
            }
            for (InvoiceTransaction invoiceTransactionListInvoiceTransaction : buyLand.getInvoiceTransactionList()) {
                BuyLand oldCodeBuyLandOfInvoiceTransactionListInvoiceTransaction = invoiceTransactionListInvoiceTransaction.getCodeBuyLand();
                invoiceTransactionListInvoiceTransaction.setCodeBuyLand(buyLand);
                invoiceTransactionListInvoiceTransaction = em.merge(invoiceTransactionListInvoiceTransaction);
                if (oldCodeBuyLandOfInvoiceTransactionListInvoiceTransaction != null) {
                    oldCodeBuyLandOfInvoiceTransactionListInvoiceTransaction.getInvoiceTransactionList().remove(invoiceTransactionListInvoiceTransaction);
                    oldCodeBuyLandOfInvoiceTransactionListInvoiceTransaction = em.merge(oldCodeBuyLandOfInvoiceTransactionListInvoiceTransaction);
                }
            }
            et.commit();
        } catch (Exception ex) {
            try {
                et.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findBuyLand(buyLand.getCode()) != null) {
                throw new PreexistingEntityException("BuyLand " + buyLand + " already exists.", ex);
            }
            throw ex;
        } finally {
            em.close();
        }
    }

    public void edit(BuyLand buyLand) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            BuyLand persistentBuyLand = em.find(BuyLand.class, buyLand.getCode());
            ProfileLand codeProfileLandOld = persistentBuyLand.getCodeProfileLand();
            ProfileLand codeProfileLandNew = buyLand.getCodeProfileLand();
            Account usernameOld = persistentBuyLand.getUsername();
            Account usernameNew = buyLand.getUsername();
            List<InvoiceTransaction> invoiceTransactionListOld = persistentBuyLand.getInvoiceTransactionList();
            List<InvoiceTransaction> invoiceTransactionListNew = buyLand.getInvoiceTransactionList();
            if (codeProfileLandNew != null) {
                codeProfileLandNew = em.getReference(codeProfileLandNew.getClass(), codeProfileLandNew.getCode());
                buyLand.setCodeProfileLand(codeProfileLandNew);
            }
            if (usernameNew != null) {
                usernameNew = em.getReference(usernameNew.getClass(), usernameNew.getLoginId());
                buyLand.setUsername(usernameNew);
            }
            List<InvoiceTransaction> attachedInvoiceTransactionListNew = new ArrayList<InvoiceTransaction>();
            for (InvoiceTransaction invoiceTransactionListNewInvoiceTransactionToAttach : invoiceTransactionListNew) {
                invoiceTransactionListNewInvoiceTransactionToAttach = em.getReference(invoiceTransactionListNewInvoiceTransactionToAttach.getClass(), invoiceTransactionListNewInvoiceTransactionToAttach.getCode());
                attachedInvoiceTransactionListNew.add(invoiceTransactionListNewInvoiceTransactionToAttach);
            }
            invoiceTransactionListNew = attachedInvoiceTransactionListNew;
            buyLand.setInvoiceTransactionList(invoiceTransactionListNew);
            buyLand = em.merge(buyLand);
            if (codeProfileLandOld != null && !codeProfileLandOld.equals(codeProfileLandNew)) {
                codeProfileLandOld.getBuyLandList().remove(buyLand);
                codeProfileLandOld = em.merge(codeProfileLandOld);
            }
            if (codeProfileLandNew != null && !codeProfileLandNew.equals(codeProfileLandOld)) {
                codeProfileLandNew.getBuyLandList().add(buyLand);
                codeProfileLandNew = em.merge(codeProfileLandNew);
            }
            if (usernameOld != null && !usernameOld.equals(usernameNew)) {
                usernameOld.getBuyLandList().remove(buyLand);
                usernameOld = em.merge(usernameOld);
            }
            if (usernameNew != null && !usernameNew.equals(usernameOld)) {
                usernameNew.getBuyLandList().add(buyLand);
                usernameNew = em.merge(usernameNew);
            }
            for (InvoiceTransaction invoiceTransactionListOldInvoiceTransaction : invoiceTransactionListOld) {
                if (!invoiceTransactionListNew.contains(invoiceTransactionListOldInvoiceTransaction)) {
                    invoiceTransactionListOldInvoiceTransaction.setCodeBuyLand(null);
                    invoiceTransactionListOldInvoiceTransaction = em.merge(invoiceTransactionListOldInvoiceTransaction);
                }
            }
            for (InvoiceTransaction invoiceTransactionListNewInvoiceTransaction : invoiceTransactionListNew) {
                if (!invoiceTransactionListOld.contains(invoiceTransactionListNewInvoiceTransaction)) {
                    BuyLand oldCodeBuyLandOfInvoiceTransactionListNewInvoiceTransaction = invoiceTransactionListNewInvoiceTransaction.getCodeBuyLand();
                    invoiceTransactionListNewInvoiceTransaction.setCodeBuyLand(buyLand);
                    invoiceTransactionListNewInvoiceTransaction = em.merge(invoiceTransactionListNewInvoiceTransaction);
                    if (oldCodeBuyLandOfInvoiceTransactionListNewInvoiceTransaction != null && !oldCodeBuyLandOfInvoiceTransactionListNewInvoiceTransaction.equals(buyLand)) {
                        oldCodeBuyLandOfInvoiceTransactionListNewInvoiceTransaction.getInvoiceTransactionList().remove(invoiceTransactionListNewInvoiceTransaction);
                        oldCodeBuyLandOfInvoiceTransactionListNewInvoiceTransaction = em.merge(oldCodeBuyLandOfInvoiceTransactionListNewInvoiceTransaction);
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
                String id = buyLand.getCode();
                if (findBuyLand(id) == null) {
                    throw new NonexistentEntityException("The buyLand with id " + id + " no longer exists.");
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
            BuyLand buyLand;
            try {
                buyLand = em.getReference(BuyLand.class, code);
                buyLand.getCode();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The buyLand with id " + code + " no longer exists.", enfe);
            }
            ProfileLand codeProfileLand = buyLand.getCodeProfileLand();
            if (codeProfileLand != null) {
                codeProfileLand.getBuyLandList().remove(buyLand);
                codeProfileLand = em.merge(codeProfileLand);
            }
            Account username = buyLand.getUsername();
            if (username != null) {
                username.getBuyLandList().remove(buyLand);
                username = em.merge(username);
            }
            List<InvoiceTransaction> invoiceTransactionList = buyLand.getInvoiceTransactionList();
            for (InvoiceTransaction invoiceTransactionListInvoiceTransaction : invoiceTransactionList) {
                invoiceTransactionListInvoiceTransaction.setCodeBuyLand(null);
                invoiceTransactionListInvoiceTransaction = em.merge(invoiceTransactionListInvoiceTransaction);
            }
            em.remove(buyLand);
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

    public List<BuyLand> findBuyLandEntities() {
        return findBuyLandEntities(true, -1, -1);
    }

    public List<BuyLand> findBuyLandEntities(int maxResults, int firstResult) {
        return findBuyLandEntities(false, maxResults, firstResult);
    }

    private List<BuyLand> findBuyLandEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(BuyLand.class));
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

    public BuyLand findBuyLand(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(BuyLand.class, id);
        } finally {
            em.close();
        }
    }

    public int getBuyLandCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<BuyLand> rt = cq.from(BuyLand.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
