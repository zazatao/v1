package com.yc.service.impl;

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

}
