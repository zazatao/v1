package com.yc.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

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

	@Override
	public List<ShopCommoidty> getAllByShopCategoryID(Integer id,String page) {
		StringBuffer hql = new StringBuffer("select shc.* from ShopCommoidty shc where shc.shelves = 1 and shc.shop_id is not null and shopCategory_id = "+id);
		if (page.equals("brand")) {
			hql.append(" and shc.brand_id is not null");
		}
		if (page.equals("special")) {
			hql.append(" and shc.isSpecial = 1");
		}
		Query query = shopCommoidtyDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommoidty.class);
		List<ShopCommoidty> list = query.getResultList();
		return list;
	}

	//Integer id, String brand, String specs, String money
	@Override
	public List<ShopCommoidty> getAllByParams(Map<String, Object> map,String page ) {
		StringBuffer hql = new StringBuffer("select shc.* from ShopCommoidty shc where shc.shop_id is not null and shc.shelves = 1 ");
		if (page.equals("special")) {
			hql.append(" and shc.isSpecial = 1");
		}
		if (page.equals("brand")) {
			hql.append(" and shc.brand_id is not null");
		}
		String[] spec = null;
		if (map.get("specs") != null && !map.get("specs").equals("")) {
			if (map.get("specs").toString().contains("@")) {
				spec =map.get("specs").toString().split("@");
				for (int i = 0; i < spec.length; i++) {
					hql.append(" and ('"+spec[i]+"' is null or shc.commSpec like '"+spec[i]+"') ");
				}
			}else{
				hql.append(" and ('"+map.get("specs")+"' is null or shc.commSpec like '"+map.get("specs")+"') ");
			}
		}
		if (map.get("money") != null && !map.get("money").equals("")) {
			if (!map.get("money").toString().split("@")[0].equals("")) {
				hql = hql.append(" and ("+map.get("money").toString().split("@")[0]+" is null or shc.unitPrice >= "+map.get("money").toString().split("@")[0]+")");
			}
			if (!map.get("money").toString().split("@")[1].equals("")) {
				hql = hql.append(" and ("+map.get("money").toString().split("@")[1]+" is null or shc.unitPrice < "+map.get("money").toString().split("@")[1]+")");
			}
		}
		if (map.get("id") != null && !map.get("id").equals("")) {
			hql = hql.append(" and ("+map.get("id")+" is null or shc.shopCategory_id = "+map.get("id")+")");
		}
		if (map.get("brand") != null && !map.get("brand").equals("")) {
			hql = hql.append(" and (shc.brand_id in "+map.get("brand")+")");
		}
		System.out.println("hql===========   "+hql.toString());
		Query query = shopCommoidtyDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommoidty.class);
		List<ShopCommoidty> list = query.getResultList();
		return list;
	}

	@Override
	public List<ShopCommoidty> getAllByNameAndShop(String commoName, Integer shopID) {
		 List<String> keys = new ArrayList<String>();
	        keys.add("commoidtyName");
	        keys.add("belongTo.id");
	        List<Object> values = new ArrayList<Object>();
	        values.add(commoName);
	        values.add(shopID);
		return shopCommoidtyDao.getBy(keys,values );
	}

}
