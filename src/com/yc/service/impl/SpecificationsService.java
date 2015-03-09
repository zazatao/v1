package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Specifications;
import com.yc.service.ISpecificationsService;

@Component
public class SpecificationsService extends GenericService<Specifications> implements ISpecificationsService {

	@Autowired
	GenericDao<Specifications> specificationsDao;
	
	@Override
	GenericDao<Specifications> getDao() {
		return specificationsDao;
	}

	@Override
	public List<Specifications> getAllByShopCateg(Integer shopCate) {
		String hql = "select s from Specifications s left join s.shopCategories sp where sp.categoryID = ?";
		Object[] para = new Object[1];
        para[0] = shopCate;
        return specificationsDao.find(hql, para, -1, -1);
	}

}
