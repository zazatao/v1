package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.Commodity;
import com.yc.entity.user.User;

public interface IUserService extends IGenericService<User> {

	User getUser(String name);

	List<User> getUsersByParameters(String loginName, String userName);
	
	User FindByUserID(Integer id);
	
	List<User> getAllByParameters(Map<String, Object> map);
}
