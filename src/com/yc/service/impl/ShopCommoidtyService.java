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
/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
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
		StringBuffer hql = new StringBuffer("SELECT shc.* FROM ShopCommoidty shc JOIN Shop shop ON shop.id = shc.shop_id WHERE (shc.blacklist_id IS NULL AND shop.blacklist_id IS NULL AND shc.shelves = 1 ) AND shc.shop_id IS NOT NULL AND shc.shopCategory_id ="+id);
		if (page.equals("brand")) {
			hql.append(" and shc.brand_id is not null");
		}
		if (page.equals("special")) {
			hql.append(" and shc.isSpecial = 1");
		}
		System.out.println("hql==============="+hql.toString());
		Query query = shopCommoidtyDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommoidty.class);
		List<ShopCommoidty> list = query.getResultList();
		return list;
	}

	//Integer id, String brand, String specs, String money
	@Override
	public List<ShopCommoidty> getAllByParams(Map<String, Object> map,String page ) {
		StringBuffer hql = new StringBuffer("select shc.* from ShopCommoidty shc JOIN Shop shop ON shop.id = shc.shop_id right join ShopCommoidtySpecs sp on shc.commCode = sp.shopComm_id where (shc.blacklist_id IS NULL AND shop.blacklist_id IS NULL AND shc.shelves = 1 ) and shc.shelves = 1 ");
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
					hql.append(" and ('"+spec[i]+"' is null or sp.commSpec like '"+spec[i]+"') ");
				}
			}else{
				hql.append(" and ('"+map.get("specs")+"' is null or sp.commSpec like '"+map.get("specs")+"') ");
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

	@Override
	public ShopCommoidty getAllByCommItemAndShop(String commItem, Integer id) {
		 List<String> keys = new ArrayList<String>();
	        keys.add("commItem");
	        keys.add("belongTo.id");
	        List<Object> values = new ArrayList<Object>();
	        values.add(commItem);
	        values.add(id);
		return shopCommoidtyDao.getFirstRecord(keys, values);
	}

	@Override
	public List<String> getShopCommBySpecesAndCommID(Integer id, String speces) {
		StringBuffer hql = new StringBuffer("select sp.commSpec from ShopCommoidty sc join ShopCommoidtySpecs sp on sp.shopComm_id = sc.commCode where sc.blacklist_id is null and sp.commSpec  LIKE '%,"+speces+"%'");
		Query query = shopCommoidtyDao.getEntityManager().createNativeQuery(hql.toString());
		@SuppressWarnings("rawtypes")
		List objecArraytList = query.getResultList(); 
		List<String> list = new ArrayList<String>();
		for (Object object : objecArraytList) {
			list.add(object.toString());
		}
		return list;
	}

	@Override
	public List<ShopCommoidty> getAllByParamsForBlack(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from ShopCommoidty comm where (? is null or comm.commoidtyName like ?) and (? is null or comm.commItem = ?) and (? is null or comm.commCode = ?)");
		Object[] paramete = new Object[6];
		paramete[0] = map.get("commoidtyName");
		paramete[1] = "%"+map.get("commoidtyName")+"%";
		paramete[2] = map.get("commItem");
		paramete[3] = map.get("commItem");
		paramete[4] = map.get("commCode");
		paramete[5] = map.get("commCode");
		return shopCommoidtyDao.find(hql.toString(), paramete, -1,-1);
	}

	@Override
	public ShopCommoidty IsShopCommByNumber(int number) {
		return shopCommoidtyDao.findById(number);
	}
    
	/* (non-Javadoc)
	 * @see com.yc.service.IShopCommoidtyService#getShopCommByCateAndIsspecial()
	 * 根據類型和是否折扣展示商品
	 */
	@Override
	public List<ShopCommoidty> getShopCommByCateAndIsspecial(Integer CateId, Boolean flag) {
		StringBuffer hql=new StringBuffer("SELECT * FROM shopcommoidty WHERE shopcommoidty.isSpecial="+flag);
		if(CateId<=1){
			hql.append("  AND shopcommoidty.shopCategory_id IS NOT NULL");
		}else{
			hql.append("  AND shopcommoidty.shopCategory_id="+CateId);
		}
		Query query = shopCommoidtyDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommoidty.class);
		@SuppressWarnings("unchecked")
		List<ShopCommoidty> list = query.getResultList();
		return list;
	}

	
	/* (non-Javadoc)
	 * @see com.yc.service.IShopCommoidtyService#getShopCommByCateAndBrand(java.lang.Integer)
	 * 根据商品类型和品牌查找商品
	 */
	@Override
	public List<ShopCommoidty> getShopCommByCateAndBrand(Integer id) {
		StringBuffer hql=new StringBuffer("SELECT * FROM shopcommoidty WHERE shopcommoidty.`brand_id` IS NOT NULL");
		if(id<=1){
			hql.append("  AND shopcommoidty.shopCategory_id IS NOT NULL");
		}else{
			hql.append("  AND shopcommoidty.shopCategory_id="+id);
		}
		Query query = shopCommoidtyDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommoidty.class);
		@SuppressWarnings("unchecked")
		List<ShopCommoidty> list = query.getResultList();
		return list;
	}

	/* (non-Javadoc)
	 * @see com.yc.service.IShopCommoidtyService#getShopCommByBrandId(java.lang.Integer)
	 * 根据品牌Id查找对应商品
	 */
	@Override
	public List<ShopCommoidty> getShopCommByBrandId(Integer id) {
		StringBuffer hql=new StringBuffer("SELECT * FROM shopcommoidty WHERE shopcommoidty.`brand_id`="+id);
		Query query = shopCommoidtyDao.getEntityManager().createNativeQuery(hql.toString(), ShopCommoidty.class);
		@SuppressWarnings("unchecked")
		List<ShopCommoidty> list = query.getResultList();
		return list;
	}
    

}
