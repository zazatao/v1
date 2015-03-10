package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.UnKnownCommodity;
import com.yc.service.IUnKnownCommodityService;

@Component
public class UnKnownCommodityService  extends GenericService<UnKnownCommodity> implements IUnKnownCommodityService{

	@Autowired
	GenericDao<UnKnownCommodity> unKnownCommodityDao;
	
	@Override
	GenericDao<UnKnownCommodity> getDao() {
		return unKnownCommodityDao;
	}

}
