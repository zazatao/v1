package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.CargoGroup;
import com.yc.entity.user.Personnel;

public interface ICargoGroupService  extends IGenericService<CargoGroup>{

	List<CargoGroup> getCargoGroupByParameters(Map<String, Object> map);

	List<CargoGroup> getCarGroupByStatus();

	CargoGroup getCargoGroupByTpek(String tpek);

	List<CargoGroup> getCargoGroupByForTransit(Personnel personnel);

	List<CargoGroup> getCargoGroupParameters(Map<String, Object> map, Personnel personnel);

}
