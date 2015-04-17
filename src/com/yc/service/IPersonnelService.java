package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;

public interface IPersonnelService  extends IGenericService<Personnel>{

	Personnel getPersonnle(String name);

	List<Personnel> getUsersByParameters(String loginName, String userName);
	
	List<Personnel> FindByUserID(Integer id);

	List<Personnel> getPurchaseByUser(User user);

	List<Personnel> getAllByParametersForManage(Map<String, Object> map);

	List<Personnel> getPersonnelByDepAndPos(Department department, Integer positionid);

}
