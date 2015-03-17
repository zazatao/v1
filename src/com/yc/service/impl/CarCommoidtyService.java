package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.CarCommoidty;
import com.yc.service.ICarCommoidtyService;
@Component
public class CarCommoidtyService extends GenericService<CarCommoidty> implements ICarCommoidtyService {

	@Autowired
	GenericDao<CarCommoidty> carCommoidtyDao;

	@Override
	GenericDao<CarCommoidty> getDao() {
		return carCommoidtyDao;
	}
}
