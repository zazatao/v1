package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Shop;
import com.yc.service.IShopService;

@Component
public class ShopService extends GenericService<Shop> implements IShopService {

	@Autowired
	GenericDao<Shop> shopDao;
	
	@Override
	GenericDao<Shop> getDao() {
		return shopDao;
	}

	@Override
	public Shop getShopByUser(Integer id) {
		return shopDao.getFirstRecord("user.id", id);
	}

}
