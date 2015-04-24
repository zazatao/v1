package com.yc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Positions;
import com.yc.service.IDepartAndPositionsService;

@Component
public class DepartAndPositionsService extends GenericService<DepartAndPositions> implements IDepartAndPositionsService {

	@Autowired
	GenericDao<DepartAndPositions> depAndPosDao;
	
	@Override
	GenericDao<DepartAndPositions> getDao() {
		return depAndPosDao;
	}

	@Override
	public boolean deleteDepAndPosByID(Integer id) {
		StringBuffer hql = new StringBuffer("delete from DepartAndPositions where id = "+id);
		depAndPosDao.getEntityManager().getTransaction().begin();
		boolean isok = depAndPosDao.getEntityManager().createNativeQuery(hql.toString(), DepartAndPositions.class).executeUpdate()>0;
		depAndPosDao.getEntityManager().getTransaction().commit();
		depAndPosDao.getEntityManager().clear();
		return isok;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DepartAndPositions> findDepAndPosByDep(Department department) {
		StringBuffer hql = new StringBuffer("select * from DepartAndPositions depAndPos where depAndPos.departments_id = "+department.getDepartmentID());
		return depAndPosDao.getEntityManager().createNativeQuery(hql.toString(), DepartAndPositions.class).getResultList();
	}
	
	@Override
	public DepartAndPositions getAllByDepAndPos(Department department, Positions positions) {
		List<String> keys = new ArrayList<String>();
		keys.add("department.departmentID");
		keys.add("positions.positionid");
		List<Object> values = new ArrayList<Object>();
		values.add(department.getDepartmentID());
		values.add(positions.getPositionid());
		return depAndPosDao.getFirstRecord(keys, values);
	}

}
