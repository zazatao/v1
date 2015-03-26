package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.PackageGenre;
import com.yc.service.IPackageGenreService;
@Component
public class PackageGenreService extends GenericService<PackageGenre> implements IPackageGenreService {

	@Autowired
	GenericDao<PackageGenre> genericDao;
	
	@Override
	GenericDao<PackageGenre> getDao() {
		return genericDao;
	}

}
