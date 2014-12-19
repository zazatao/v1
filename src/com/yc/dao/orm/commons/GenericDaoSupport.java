
package com.yc.dao.orm.commons;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

import org.springframework.transaction.annotation.Transactional;

public class GenericDaoSupport<T> implements GenericDao<T> {

    protected Class<T> clazz;

    protected EntityManager em;

    @PersistenceUnit
    public void setEntityManagerFactory(EntityManagerFactory emf) {
        em = emf.createEntityManager();
    }

    public GenericDaoSupport(Class<T> clazz) {
        this.clazz = clazz;
    }

    /**
     * @param t
     * @return
     */
    @Transactional
    public synchronized boolean save(final T t) {
        try {
            if (!em.getTransaction().isActive()) {
                em.getTransaction().begin();
            }
            em.persist(t);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
        return false;
    }

    @Transactional
    public boolean deleteById(Object id) {
        if (id == null)
            throw new java.lang.IllegalArgumentException("id not exists");
        T object = this.findById(id);
        if (object != null) {
            try {

                if (!em.getTransaction().isActive()) {
                    em.getTransaction().begin();
                }
                em.remove(object);
                em.getTransaction().commit();
                return true;
            } catch (Exception e) {
                return false;
            }
        }
        return false;
    }

    /**
     * @param t
     * @return
     */

    /**
     * @param t
     * @return
     */
    @Transactional
    public boolean update(T t) {
        if (t != null) {

            if (!em.getTransaction().isActive()) {
                em.getTransaction().begin();
            }
            em.merge(t);
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    @Override
    public int batchUpdate(final String jpql, final Object[] params) {
        Query query = em.createQuery(jpql);
        int parameterIndex = 1;
        if (params != null && params.length > 0) {
            for (Object obj : params) {
                query.setParameter(parameterIndex++, obj);
            }
        }
        return query.executeUpdate();
    }

    @SuppressWarnings("unchecked")
    public List<T> findAll() {
        String sql = "select t from " + clazz.getName() + " t ";
        Query query = em.createQuery(sql);
        return query.getResultList();
    }

    public T findById(Object id) {
        if (id != null) {
            return em.find(clazz, id);
        }
        return null;

    }

    @Override
    public List<T> getBy(final String propertyName, final Object value) {
        List<String> propertyNames = new ArrayList<String>();
        propertyNames.add(propertyName);
        List<Object> values = new ArrayList<Object>();
        values.add(value);
        return getBy(propertyNames, values);

    }

    @Override
    public T getFirstRecord(final String propertyName, final Object value) {
        List<T> results = getBy(propertyName, value);
        if (results.isEmpty()) {
            return null;
        }
        return results.get(0);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<T> getBy(final List<String> propertyNames, final List<Object> values) {

        String clazzName = clazz.getSimpleName();
        StringBuffer stringBuffer = new StringBuffer("select obj from ");
        stringBuffer.append(clazzName).append(" obj");
        Query query = null;
        String propertyName = "";
        Object value = null;
        System.out.println("propertyNames.size()===="+propertyNames.size());
        for (int i = 0; i < propertyNames.size(); i++) {
            propertyName = propertyNames.get(i);
            value = values.get(i);
            if (propertyName != null && value != null) {
                if (i == 0) {
                    stringBuffer.append(" where ");
                } else {
                    stringBuffer.append(" and ");
                }
                stringBuffer.append(" obj.").append(propertyName).append("='" + value + "'");

            }
        }
        System.out.println("sql jiangbo :" + stringBuffer.toString());
        query = em.createQuery(stringBuffer.toString());

        return query.getResultList();

    }

    @Override
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public List<T> find(final String hql, final String[] names, final Object[] values) {
    	System.out.println("hql ========="+hql);
        Query query = em.createQuery(hql);
        if (names != null && names.length > 0) {
            for (int i = 0; i < names.length; i++) {
                query.setParameter(names[i], values[i]);
            }
        }

        List list = query.getResultList();
        if (list != null && list.size() >= 0) {
            return list;
        } else {
            return new ArrayList<T>();
        }
    }

    @Override
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public List<T> find(final String hql, final Object[] params, final int begin, final int max) {

        Query query = em.createQuery(hql);
        int parameterIndex = 1;
        if (params != null && params.length > 0) {
            for (Object obj : params) {
                query.setParameter(parameterIndex++, obj);
            }
        }

        if (begin >= 0 && max > 0) {
            query.setFirstResult(begin);
            query.setMaxResults(max);
        }

        List list = query.getResultList();
        if (list != null && list.size() >= 0) {
            return list;
        } else {
            return new ArrayList<T>();
        }
    }

    @Override
    public T getFirstRecord(List<String> propertyNames, List<Object> values) {
        List<T> results = getBy(propertyNames, values);
        if (results.isEmpty()) {
            return null;
        }
        return results.get(0);
    }

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

}
