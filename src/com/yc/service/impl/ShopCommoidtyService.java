package com.yc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.ShopCommoidty;
import com.yc.service.IShopCommoidtyService;
@Component
public class ShopCommoidtyService extends GenericService<ShopCommoidty> implements IShopCommoidtyService {

	@Autowired
	GenericDao<ShopCommoidty> shopCommoidtyDao;
	
	@Override
	GenericDao<ShopCommoidty> getDao() {
		return shopCommoidtyDao;
	}

	@Override
	public List<ShopCommoidty> getAllByShop(Integer id) {
		return shopCommoidtyDao.getBy("belongTo.id", id);
	}

	@Override
	public List<ShopCommoidty> getAllByCondition(String condition, boolean isTrue, Integer shopID) {
		 List<String> keys = new ArrayList<String>();
	        keys.add(condition);
	        keys.add("belongTo.id");
	        List<Object> values = new ArrayList<Object>();
	        values.add(isTrue?1:0);
	        values.add(shopID);
		return shopCommoidtyDao.getBy(keys,values );
	}

}
