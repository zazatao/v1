package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.user.Position;
import com.yc.service.IPositionService;

@Component
public class PositionService extends GenericService<Position> implements IPositionService {

	@Autowired
	GenericDao<Position> positionDao;
	
	@Override
	GenericDao<Position> getDao() {
		return positionDao;
	}

}
