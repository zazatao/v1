package com.yc.service.impl;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Shop> getShopByParam(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from Shop shop where (? is null or shop.shopName like ?) and (? is null or shop.juridicalPerson like ?) and (? is null or shop.phone = ?)");
		Object[] paramete = new Object[6];
		paramete[0] = map.get("shopName");
		paramete[1] = "%"+map.get("shopName")+"%";
		paramete[2] = map.get("juridicalPerson");
		paramete[3] = "%"+map.get("juridicalPerson")+"%";
		paramete[4] = map.get("phone");
		paramete[5] = map.get("phone");
		return shopDao.find(hql.toString(), paramete, -1,-1);
	}
	
	@Override
	public List<Shop> getShopForManage() {
		String hql = " from Shop where isPermit = 1";
		return shopDao.find(hql.toString(), null, null);
	}
}
