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

	@Override
	public List<ShopCategory> getAllForBrand() {
		String hql = "select distinct s from ShopCategory s right join s.brands br ";
		return shopCategoryDao.find(hql, null, -1, -1);
	}

	@Override
	public List<ShopCategory> getAllForSpecial() {
		String hql = "select distinct s from ShopCategory s right join s.shopCommoidties sh with sh.isSpecial = 1 order by parentLevel ";
		return shopCategoryDao.find(hql, null, -1, -1);
	}

	@Override
	public List<ShopCategory> getAllByParentLevel(Integer categoryID) {
		return shopCategoryDao.getBy("parentLevel", categoryID);
	}
	
	@Override
	public List<ShopCategory> getAllParentLevel(){
		String hql = "select distinct c from commodity c right join  shopcategory s on c.shopcategory = s.categoryID  where s.`level` and s.parentLevel GROUP BY quantity desc  ";
		return shopCategoryDao.find(hql, null, -1, -1);	
	}
}
