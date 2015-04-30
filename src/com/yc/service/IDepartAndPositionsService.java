package com.yc.service;

import java.util.List;

import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;

public interface IDepartAndPositionsService extends IGenericService<DepartAndPositions> {

	boolean deleteDepAndPosByID(Integer id);

	List<DepartAndPositions> findDepAndPosByDep(Department department);

	DepartAndPositions getAllByDepAndPos(Integer depID, Integer posID);

	List<DepartAndPositions> getDepByDepID(Integer depID);

}
