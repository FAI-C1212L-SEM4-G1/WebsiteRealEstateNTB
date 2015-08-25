package vn.javaweb.real.estate.manage;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import vn.javaweb.real.estate.model.Account;
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
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.Person;

/**
 *
 * @author PhanAnh
 */
public class PersonModelManage implements Serializable {

    private EntityManagerFactory emf = null;
    private static PersonModelManage instance;

    public PersonModelManage(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public static PersonModelManage getInstance() {
        if (instance == null) {
            instance = new PersonModelManage(Persistence.createEntityManagerFactory(ConfigConnection.PERSISTENCE_UNIT_NAME));
        }
        return instance;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Person person) throws IllegalOrphanException, PreexistingEntityException, RollbackFailureException, Exception {
        List<String> illegalOrphanMessages = null;
        Account usernameOrphanCheck = person.getUsername();
        if (usernameOrphanCheck != null) {
            Person oldPersonOfUsername = usernameOrphanCheck.getPerson();
            if (oldPersonOfUsername != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Account " + usernameOrphanCheck + " already has an item of type Person whose username column cannot be null. Please make another selection for the username field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            Account username = person.getUsername();
            if (username != null) {
                username = em.getReference(username.getClass(), username.getLoginId());
                person.setUsername(username);
            }
            em.persist(person);
            if (username != null) {
                username.setPerson(person);
                username = em.merge(username);
            }
            et.commit();
        } catch (Exception ex) {
            try {
                et.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findPerson(person.getId()) != null) {
                throw new PreexistingEntityException("Person " + person + " already exists.", ex);
            }
            throw ex;
        } finally {
            em.close();
        }
    }

    public void edit(Person person) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            Person persistentPerson = em.find(Person.class, person.getId());
            Account usernameOld = persistentPerson.getUsername();
            Account usernameNew = person.getUsername();
            List<String> illegalOrphanMessages = null;
            if (usernameNew != null && !usernameNew.equals(usernameOld)) {
                Person oldPersonOfUsername = usernameNew.getPerson();
                if (oldPersonOfUsername != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Account " + usernameNew + " already has an item of type Person whose username column cannot be null. Please make another selection for the username field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (usernameNew != null) {
                usernameNew = em.getReference(usernameNew.getClass(), usernameNew.getLoginId());
                person.setUsername(usernameNew);
            }
            person = em.merge(person);
            if (usernameOld != null && !usernameOld.equals(usernameNew)) {
                usernameOld.setPerson(null);
                usernameOld = em.merge(usernameOld);
            }
            if (usernameNew != null && !usernameNew.equals(usernameOld)) {
                usernameNew.setPerson(person);
                usernameNew = em.merge(usernameNew);
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
                String id = person.getId();
                if (findPerson(id) == null) {
                    throw new NonexistentEntityException("The person with id " + id + " no longer exists.");
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
            Person person;
            try {
                person = em.getReference(Person.class, code);
                person.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The person with id " + code + " no longer exists.", enfe);
            }
            Account username = person.getUsername();
            if (username != null) {
                username.setPerson(null);
                username = em.merge(username);
            }
            em.remove(person);
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

    public List<Person> findPersonEntities() {
        return findPersonEntities(true, -1, -1);
    }

    public List<Person> findPersonEntities(int maxResults, int firstResult) {
        return findPersonEntities(false, maxResults, firstResult);
    }

    private List<Person> findPersonEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Person.class));
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

    public Person findPerson(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Person.class, id);
        } finally {
            em.close();
        }
    }

    public int getPersonCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Person> rt = cq.from(Person.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
