package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.OrderForm;
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

	@Override
	public PackageSize findByName() {
		StringBuffer hql=new StringBuffer("SELECT * FROM packagesize p WHERE p.genre LIKE '%箱%'");
		return (PackageSize) packageSizeDao.getEntityManager().createNativeQuery(hql.toString(), PackageSize.class).getSingleResult();
	}
}
