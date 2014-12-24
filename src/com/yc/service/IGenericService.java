package com.yc.service;

public interface IGenericService<T> {

    T save(T t);

    T update(T t);

    Boolean delete(Integer id);

    T findById(Object id);
}
