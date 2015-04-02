package com.yc.service;

import java.util.List;

import com.yc.entity.user.Department;

public interface IDepartmentService extends IGenericService<Department> {

	List<Department> getDepartmentByParent();

	boolean  deleteForTree(Department department);

}
