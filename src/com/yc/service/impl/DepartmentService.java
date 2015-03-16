package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.user.Department;
import com.yc.service.IDepartmentService;

@Component
public class DepartmentService extends GenericService<Department> implements IDepartmentService {

	@Autowired
	GenericDao<Department> departmentDao;
	
	@Override
	GenericDao<Department> getDao() {
		return departmentDao;
	}


}
