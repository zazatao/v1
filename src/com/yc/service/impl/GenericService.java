
package com.yc.service.impl;

import java.util.List;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.service.IGenericService;

public abstract class GenericService<T> implements IGenericService<T> {

    @Override
    public T save(T t) {
        getDao().save(t);

        return t;
    }

    @Override
    public Boolean delete(Integer id) {
        return getDao().deleteById(id);
    }

    @Override
    public T update(T t) {
    	System.out.println("t========"+t);
        getDao().update(t);
        return t;
    }

    @Override
    public T findById(Object id) {
        return getDao().findById(id);
    }
    
    @Override
    public List<T> getAll() {
    	return getDao().findAll();
    }

    abstract GenericDao<T> getDao();
}
