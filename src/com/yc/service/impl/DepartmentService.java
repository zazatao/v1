package com.yc.service.impl;

import java.util.List;

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

	@Override
	public List<Department> getDepartmentByParent() {
		StringBuffer hql = new StringBuffer(" from Department depart where depart.parentLevel.departmentID is null");
		return departmentDao.find(hql.toString(), null, null);
	}

	@Override
	public boolean deleteForTree(Department department) {
		StringBuffer hql = new StringBuffer("DELETE FROM Department WHERE departmentID = "+department.getDepartmentID());
		System.out.println("hql============"+hql.toString());
		departmentDao.getEntityManager().getTransaction().begin();
		boolean isok = departmentDao.getEntityManager().createNativeQuery(hql.toString(), Department.class).executeUpdate()>0;
		departmentDao.getEntityManager().getTransaction().commit();
		departmentDao.getEntityManager().clear();
		return isok;
	}
}
