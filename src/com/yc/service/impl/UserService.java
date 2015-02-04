package com.yc.service.impl;

import java.util.List;
import java.util.Map;

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
		return userDao.getBy("id", id);
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

	@Override
	public List<User> getAllByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from User u where (? is null or u.userName like ?) and (? is null or u.password like ?)"
				+ "and (? is null or u.email like ?) and (? is null or u.phone like ?) and (? is null or u.sex like ?)");
		Object[] paramete =  new Object[10];
		paramete[0] = map.get("userName");
		paramete[1] = "%"+map.get("userName")+"%";
		paramete[2] = map.get("password"); 
		paramete[3] = "%"+map.get("password")+"%";
		paramete[4] = map.get("email");
		paramete[5] = "%"+map.get("email")+"%";
		paramete[6] = map.get("phone");
		paramete[7] = "%"+map.get("phone")+"%";
		paramete[8] = map.get("sex");
		paramete[9] = "%"+map.get("sex")+"%";
		return userDao.find(hql.toString(), paramete, -1, -1);
	}

}
