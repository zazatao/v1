package com.yc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Commodity;
import com.yc.entity.Shop;
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
	public User FindByUserID(Integer id) {
		return userDao.getFirstRecord("user.id", id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsersByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer("select DISTINCT u.* from User u RIGHT join ProblemPack problem on problem.user_id = u.id where 1=1 ");
		if (map.get("userName") !=null) {
			hql.append(" and u.userName like '%"+map.get("userName") +"%'");
		}
		if (map.get("phone") !=null) {
			hql.append(" and u.phone = '"+map.get("phone") +"'");
		}
		return userDao.getEntityManager().createNativeQuery(hql.toString(), User.class).getResultList();
	}

	public List<User> getAllByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from User u where (? is null or u.addresses.toName like ?) " + " and (? is null or u.addresses.toEmail like ?) "
				+ "and (? is null or u.addresses.phone like ?) and (? is null or u.addresses.country like ?) ");
		Object[] paramete = new Object[8];
		paramete[0] = map.get("toName");
		paramete[1] = "%"+map.get("toName")+"%";
		paramete[2] = map.get("toEmail");
		paramete[3] = "%" + map.get("toEmail") + "%";
		paramete[4] = map.get("phone");
		paramete[5] = "%" +map.get("phone")+"%";
		paramete[6] = map.get("country");
		paramete[7] = "%" +map.get("country")+"%";
		return userDao.find(hql.toString(), paramete, -1, -1);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserForProblemPack() {
		StringBuffer hql = new StringBuffer("select DISTINCT u.* from User u RIGHT join ProblemPack problem on problem.user_id = u.id ");
		return userDao.getEntityManager().createNativeQuery(hql.toString(), User.class).getResultList();
	}
	
}
