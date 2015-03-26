package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.TransitSite;
import com.yc.service.ITransitSiteService;

@Component
public class TransitSiteService extends GenericService<TransitSite> implements ITransitSiteService {

	@Autowired
	GenericDao<TransitSite> transitSiteDao; 
	
	@Override
	GenericDao<TransitSite> getDao() {
		return transitSiteDao;
	}

}
