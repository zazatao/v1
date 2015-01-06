
package com.yc.dao.orm.commons;

import java.util.List;

import javax.persistence.EntityManager;

public interface GenericDao<T> {

    boolean save(final T t);

    boolean deleteById(final Object id);

    boolean update(final T t);

    int batchUpdate(final String jpql, final Object[] params);

    List<T> findAll();

    T findById(final Object id);

    List<T> getBy(final String propertyName, final Object value);

    T getFirstRecord(final String propertyName, final Object value);

    List<T> getBy(final List<String> propertyNames, final List<Object> values);

    T getFirstRecord(final List<String> propertyNames, final List<Object> values);

    List<T> find(final String hql, final Object[] params, final int begin, final int max);

    List<T> find(final String hql, final String[] names, final Object[] values);
    
    EntityManager getEntityManager();

}
