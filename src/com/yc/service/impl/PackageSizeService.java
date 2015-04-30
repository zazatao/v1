package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.PackageSize;
import com.yc.service.IPackageSizeService;
@Component
public class PackageSizeService extends GenericService<PackageSize> implements IPackageSizeService {

	@Autowired
	GenericDao<PackageSize> packageSizeDao;
	
	@Override
	GenericDao<PackageSize> getDao() {
		return packageSizeDao;
	}
}
