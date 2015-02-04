package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.ShopCategory;
import com.yc.service.IShopCategoryService;
@Component
public class ShopCategoryService extends GenericService<ShopCategory> implements IShopCategoryService {

	@Autowired
	GenericDao<ShopCategory> shopCategoryDao;
	
	@Override
	GenericDao<ShopCategory> getDao() {
		return shopCategoryDao;
	}

	@Override
	public List<ShopCategory> getAllByLevel(Integer level) {
		return shopCategoryDao.getBy("level", level);
	}
	
}
