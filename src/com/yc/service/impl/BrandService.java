package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Brand;
import com.yc.service.IBrandService;

@Component
public class BrandService extends GenericService<Brand> implements IBrandService {

	@Autowired
	GenericDao<Brand> brandService;
	
	@Override
	GenericDao<Brand> getDao() {
		return brandService;
	}


}
