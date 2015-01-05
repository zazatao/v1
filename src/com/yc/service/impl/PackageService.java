package com.yc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Package;
import com.yc.service.IPackageService;

@Component
public class PackageService extends GenericService<Package> implements IPackageService {

	@Autowired
	GenericDao<Package> packAgeDao;

	@Override
	GenericDao<Package> getDao() {
		return packAgeDao;
	}

	@Override
	public List<Package> findByGroupID(Integer id) {
		return packAgeDao.getBy("cargoGroup.cargoGroupID", id);
	}

	@Override
	public List<Package> getAllByTransitAndDelivery(String transit, String delivery) {
		List<String> names = new ArrayList<String>();
		names.add("transit");
		names.add("delivery");
		List<Object> values = new ArrayList<Object>();
		values.add(transit);
		values.add(delivery);
		return packAgeDao.getBy(names, values);
	}
}
