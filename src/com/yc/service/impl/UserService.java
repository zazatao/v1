
package com.yc.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.user.*;
import com.yc.service.IUserService;

@Component
public class UserService extends GenericService<User> implements IUserService {

    @Autowired
    GenericDao<User> userDao;

	@Override
	GenericDao<User> getDao() {
		return userDao;
	}

	@Override
	public User getUser(String name) {
		return userDao.getFirstRecord("loginName", name);
	}

}
