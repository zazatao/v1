package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.CargoGroup;
import com.yc.service.ICargoGroupService;
@Component
public class CargoGroupService extends GenericService<CargoGroup> implements ICargoGroupService {

	@Autowired
	GenericDao<CargoGroup> cargoGroupDao;
	
	@Override
	GenericDao<CargoGroup> getDao() {
		return cargoGroupDao;
	}

}
