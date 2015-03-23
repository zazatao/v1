package com.yc.service;

import java.util.List;

import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;

public interface IPersonnelService  extends IGenericService<Personnel>{

	Personnel getPersonnle(String name);

	List<Personnel> getUsersByParameters(String loginName, String userName);
	
	List<Personnel> FindByUserID(Integer id);

	List<Personnel> getPurchaseByUser(User user);

}
