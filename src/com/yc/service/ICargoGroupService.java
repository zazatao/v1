package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.CargoGroup;

public interface ICargoGroupService  extends IGenericService<CargoGroup>{

	List<CargoGroup> getCargoGroupByParameters(Map<String, Object> map);

}
