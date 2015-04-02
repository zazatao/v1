package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.user.User;

public interface IUserService extends IGenericService<User> {

	User getUser(String name);

	List<User> getUsersByParameters(Map<String, Object> map);
	
	User FindByUserID(Integer id);
	
	List<User> getAllByParameters(Map<String, Object> map);

	List<User> getUserForProblemPack();
}
