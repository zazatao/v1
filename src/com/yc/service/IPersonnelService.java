package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.model.PersonnelStatistics;

public interface IPersonnelService  extends IGenericService<Personnel>{

	Personnel getPersonnle(String name);

	List<Personnel> getUsersByParameters(String loginName, String userName);
	
	List<Personnel> FindByUserID(Integer id);

	List<Personnel> getPurchaseByUser(User user);

	List<Personnel> getAllByParametersForManage(Map<String, Object> map);

	List<Personnel> getAllByDepAndPos(DepartAndPositions depAndPos);

	List<PersonnelStatistics> getOrtherByParam(String days, Personnel personnel);

	List<PersonnelStatistics> getAccounting(String days);

}
