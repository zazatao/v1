package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Collection;
import com.yc.service.ICollectionService;

@Component
public class CollectionService extends GenericService<Collection> implements ICollectionService{

	@Autowired
	GenericDao<Collection> collectionDao;
	
	@Override
	GenericDao<Collection> getDao() {
		return collectionDao;
	}

}
