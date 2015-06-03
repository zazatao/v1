package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Brand;
import com.yc.entity.ShopCommoidty;
import com.yc.service.IBrandService;

@Component
public class BrandService extends GenericService<Brand> implements IBrandService {

	@Autowired
	GenericDao<Brand> brandService;
	
	@Override
	GenericDao<Brand> getDao() {
		return brandService;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Brand> getAllunlike() {
		StringBuffer hql=new StringBuffer("SELECT * FROM brand GROUP BY brand.brandName ORDER BY brand.brandID ");
		return brandService.getEntityManager().createNativeQuery(hql.toString(), Brand.class).getResultList();
	}

}
