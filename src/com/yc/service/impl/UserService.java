package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.user.User;
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
	
	@Override
	public List<User> FindByUserID(Integer id) {
		return userDao.getBy("user.id", id);
	}

	@Override
	public List<User> getUsersByParameters(String loginName, String userName) {
		StringBuffer hql = new StringBuffer(" from User u where (? is null or u.loginName like ?) and (? is null or u.userName like ?)");
		Object[] paramete =  new Object[4];
		paramete[0] = loginName ;
		paramete[1] = "%"+loginName +"%";
		paramete[2] = userName ;
		paramete[3] = "%"+userName +"%";
		return userDao.find(hql.toString(), paramete, -1,-1);
	}

}
