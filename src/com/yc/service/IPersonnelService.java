package com.yc.service;

import java.util.List;

import com.yc.entity.user.Personnel;

public interface IPersonnelService extends IGenericService<Personnel> {

	Personnel getUser(String name);

	List<Personnel> getUsersByParameters(String loginName, String userName);

}
