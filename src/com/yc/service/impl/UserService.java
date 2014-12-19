
package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.user.*;
import com.yc.service.IUserService;

@Component
public class UserService implements IUserService {

    @Autowired
    GenericDao<User> userDao;

    @Override
    public User getUser(String name) {
        return userDao.getFirstRecord("loginName", name);
    }

    @Override
    public User getUserByID(int parseInt) {
        return userDao.findById(parseInt);
    }

    @Override
    public boolean update(User user) {
        return userDao.update(user);
    }

    @Override
    public boolean regist(User user) {
        return userDao.save(user);
    }

    @Override
    @SuppressWarnings("rawtypes")
    public List getAll(Role role) {
        return null;
    }

}
