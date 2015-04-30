package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Surcharges;
import com.yc.service.ISurchargesService;

@Component
public class SurchargesService extends GenericService<Surcharges> implements ISurchargesService {

	@Autowired
	GenericDao<Surcharges> surchargesDao;
	@Override
	GenericDao<Surcharges> getDao() {
		return surchargesDao;
	}

}
