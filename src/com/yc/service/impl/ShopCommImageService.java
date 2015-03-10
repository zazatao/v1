package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.ShopCommImage;
import com.yc.service.IShopCommImageService;

@Component
public class ShopCommImageService extends GenericService<ShopCommImage> implements IShopCommImageService {

	@Autowired
	GenericDao<ShopCommImage> shopCommImageDao;
	@Override
	GenericDao<ShopCommImage> getDao() {
		return shopCommImageDao;
	}

}
