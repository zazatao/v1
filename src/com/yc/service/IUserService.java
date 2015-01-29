package com.yc.service;

import java.util.List;

import com.yc.entity.user.User;

public interface IUserService extends IGenericService<User> {

	User getUser(String name);

	List<User> getUsersByParameters(String loginName, String userName);
	
	List<User> FindByUserID(Integer id);

}
