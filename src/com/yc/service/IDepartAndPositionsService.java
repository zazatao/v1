package com.yc.service;

import java.util.List;

import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Positions;

public interface IDepartAndPositionsService extends IGenericService<DepartAndPositions> {

	boolean deleteDepAndPosByID(Integer id);

	List<DepartAndPositions> findDepAndPosByDep(Department department);

	DepartAndPositions getAllByDepAndPos(Department department, Positions positions);

}
