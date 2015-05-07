package com.yc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.OrderStatus;
import com.yc.entity.Shop;
import com.yc.entity.StoreRoom;
import com.yc.entity.user.User;
import com.yc.model.CommdityModel;
import com.yc.model.Products;
import com.yc.service.ICommodityService;

import java.util.Map;

import javax.persistence.Query;

@Component
public class CommodityService extends GenericService<Commodity> implements ICommodityService {

	@Autowired
	GenericDao<Commodity> commodityDao;

	@Override
	GenericDao<Commodity> getDao() {
		return commodityDao;
	}

	@Override
	public List<Commodity> getAllByRoomForHave(Integer cellID, boolean b) {
		StringBuffer hql = new StringBuffer(" from Commodity c where c.orderNumber.orderUser.storeRoom.cellID = " + cellID);
		if (b) {
			hql.append(" and c.status in ('lose','inWarehouse','senToWarehouse','packing')");
		} else {
			hql.append(" and c.status in ('marriage','cancel','delete','marriage','refuse')");
		}
		return commodityDao.find(hql.toString(), null, null);
	}

	@Override
	public List<Commodity> getCommodityByRoom(StoreRoom storeRoom) {
		String hql = " from Commodity c where c.orderNumber.orderstatus = 'transitGoods' and c.status not in ('cancel','delete','marriage','inWarehouse','inCell','senToWarehouse','packing') and c.orderNumber.orderUser.storeRoom.cellID = " + storeRoom.getCellID();
		return commodityDao.find(hql, null, null);
	}

	@Override
	public List<Commodity> getAllByStatus(String status) {
		String hql = " from Commodity c where c.status in ('" + status + "')";
		return commodityDao.find(hql, null, null);
	}

	@Override
	public List<Commodity> getAllByParameters(Map<String, Object> map, boolean b) {
		StringBuffer hql = new StringBuffer();
		hql.append("from Commodity c where (? is null or c.orderNumber.orderUser.storeRoom.cellStr like ?) and (? is null or c.orderNumber.orderFormID = ?) and (? is null or c.orderNumber.orderUser.userName like ?) and (? is null or c.tpek = ?) and (? is null or c.cellDate like ?) and (? is null or c.inStoreRoomDate like ?) ");
		Object[] paramete = null;
		if (map.get("formStatus") == null && map.get("packageCode") == null) {
			if (b) {
				hql.append(" and c.status in ('lose','inWarehouse','senToWarehouse','packing')");
			} else {
				hql.append(" and c.status in ('marriage','cancel','delete','marriage','refuse')");
			}
			paramete = new Object[12];
		} else if (map.get("formStatus") == null && map.get("packageCode") != null) {
			if (b) {
				hql.append(" and c.status in ('lose','inWarehouse','senToWarehouse','packing')");
			} else {
				hql.append(" and c.status in ('marriage','cancel','delete','marriage','refuse')");
			}
			paramete = new Object[14];
			hql.append(" and (? is null or c.orderNumber.packAge.packageCode = ?)");
			paramete[12] = map.get("packageCode");
			paramete[13] = map.get("packageCode");
		} else if (map.get("formStatus") != null && map.get("packageCode") == null) {
			hql.append("and (? is null or c.status = ?)");
			paramete = new Object[14];
			paramete[12] = map.get("formStatus");
			paramete[13] = map.get("formStatus");
		} else {
			hql.append(" and (? is null or c.orderNumber.packAge.packageCode = ?) and (? is null or c.status = ?)");
			paramete = new Object[16];
			paramete[12] = map.get("packageCode");
			paramete[13] = map.get("packageCode");
			paramete[14] = map.get("formStatus");
			paramete[15] = map.get("formStatus");
		}
		paramete[0] = map.get("cellStr");
		paramete[1] = "%" + map.get("cellStr") + "%";
		paramete[2] = map.get("orderFormID");
		paramete[3] = map.get("orderFormID");
		paramete[4] = map.get("userName");
		paramete[5] = "%" + map.get("userName") + "%";
		paramete[6] = map.get("tpek");
		paramete[7] = map.get("tpek");
		paramete[8] = map.get("cellDate");
		paramete[9] = map.get("cellDate") + "%";
		paramete[10] = map.get("inStoreRoomDate");
		paramete[11] = map.get("inStoreRoomDate") + "%";

		return commodityDao.find(hql.toString(), paramete, -1, -1);
	}

	@Override
	public List<Commodity> getAllByParametersForOrder(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer();
		hql.append("from Commodity c where (? is null or c.transNumForTaobao = ?) " 
		+ " and (? is null or c.orderNumber.orderFormID = ?) and (? is null or c.orderNumber.orderUser.userName like ?) " 
		+ " and (? is null or c.tpek = ?) and (? is null or c.orderNumber.changeStatusDate like ?) and " 
		+ " (? is null or c.status = ?) and c.orderNumber.orderUser.storeRoom.isInCell = 1 "
		+ " and c.orderNumber.orderstatus = 'transitGoods'");
		Object[] paramete = new Object[12];
		paramete[0] = map.get("transNumForTaobao");
		paramete[1] = map.get("transNumForTaobao");
		paramete[2] = map.get("orderFormID");
		paramete[3] = map.get("orderFormID");
		paramete[4] = map.get("userName");
		paramete[5] = "%" + map.get("userName") + "%";
		paramete[6] = map.get("tpek");
		paramete[7] = map.get("tpek");
		paramete[8] = map.get("changeStatusDate");
		paramete[9] = "%" + map.get("changeStatusDate") + "%";
		paramete[10] = map.get("formStatus");
		paramete[11] = map.get("formStatus");
		return commodityDao.find(hql.toString(), paramete, -1, -1);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Commodity> getDisposeByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer("select DISTINCT comm.* from Commodity comm  " 
					+ "left join OrderForm orders on orders.orderFormID = comm.orderform_id  " 
					+ "left join User u on u.id = orders.user_id  "
					+ "where comm.seller_name = 1 ");
		if (map.get("personnel").equals("总经理")) {
			hql.append("and comm.purchase_user is not null ");
		}else{
			hql.append("and comm.purchase_user in ("+map.get("personnel")+")");
		}
		if (map.get("transNumForTaobao") != null) {
			hql.append(" and comm.transNumForTaobao = " + map.get("transNumForTaobao"));
		}
		if (map.get("orderUserName") != null) {
			hql.append(" and u.userName like '%" + map.get("orderUserName") + "%'");
		}
		if (map.get("paymentDate") != null) {
			hql.append(" and orders.paymentDate like '%" + map.get("paymentDate") + "%'");
		}
		if (map.get("disposeStatus") != null) {
			hql.append(" and comm.disposeStatus = '" + map.get("disposeStatus") + "'");
		} else {
			hql.append(" and comm.status = 'support'");
		}
		return commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class).getResultList();
	}

	public List<Commodity> getAllByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from Commodity c where c.orderNumber.orderstatus = 'transitGoods' and (? is null or c.transNumForTaobao = ?) " + " and (? is null or c.tpek = ?) and (? is null or c.status = ?) " + "  and  (? is null or c.orderNumber.orderUser.userName like ?) and (? is null or c.orderNumber.orderDate = ?) " + "  and  (? is null or c.orderNumber.paymentDate = ?) and  (? is null or c.orderNumber.orderFormID = ?)"
				+ " and  (? is null or c.commItem = ?) and c.orderNumber.orderUser.storeRoom.isInCell = 1 ");
		Object[] paramete = null;
		if (map.get("packageCode") == null) {
			paramete = new Object[16];
			paramete = getParamete(paramete, map);

		} else {
			hql.append(" and (? is null or c.orderNumber.packAge.packageCode = ?)");
			paramete = new Object[18];
			paramete = getParamete(paramete, map);
			paramete[16] = map.get("packageCode");
			paramete[17] = map.get("packageCode");
		}
		return commodityDao.find(hql.toString(), paramete, -1, -1);
	}

	private Object[] getParamete(Object[] paramete, Map<String, Object> map) {
		paramete[0] = map.get("transNumForTaobao");
		paramete[1] = map.get("transNumForTaobao");
		// paramete[2] = map.get("operatorPurchase");
		// paramete[3] = "%" + map.get("operatorPurchase") + "%";
		paramete[2] = map.get("tpek");
		paramete[3] = map.get("tpek");
		paramete[4] = map.get("formStatus");
		paramete[5] = map.get("formStatus");
		paramete[6] = map.get("userName");
		paramete[7] = "%" + map.get("userName") + "%";
		paramete[8] = map.get("orderDate");
		paramete[9] = map.get("orderDate");
		paramete[10] = map.get("paymentDate");
		paramete[11] = map.get("paymentDate");
		paramete[12] = map.get("orderNum");
		paramete[13] = map.get("orderNum");
		paramete[14] = map.get("commItem");
		paramete[15] = map.get("commItem");
		return paramete;
	}

	@Override
	public List<Commodity> getShopCommodityByStatus(String status, Shop shop) {
		StringBuffer hql = new StringBuffer(" from Commodity c where  c.status in("+status+") and c.seller.id = "+shop.getId());
		return commodityDao.find(hql.toString(), null, null);
	}

	// 分类查询
	@Override
	public List<CommdityModel> getAllByShopCategoryID(Integer id) {
		StringBuffer hql = new StringBuffer("select SUM(quantity) sums,s.categoryID categoryID,s.category category from commodity c right join shopcategory s on s.categoryID = c.shopcategory where  c.shopcategory in (select sc.categoryID from shopcategory sc where sc.parentLevel in (select cat.categoryID from shopcategory cat where cat.parentLevel = " + id
				+ "))group by s.parentLevel order by sums desc limit 7");
		Query query = commodityDao.getEntityManager().createNativeQuery(hql.toString());
		@SuppressWarnings("rawtypes")
		List objecArraytList = query.getResultList();
		List<CommdityModel> list = new ArrayList<CommdityModel>();
		CommdityModel mode = null;
		if (objecArraytList != null && objecArraytList.size() > 0) {
			for (int i = 0; i < objecArraytList.size(); i++) {
				mode = new CommdityModel();
				Object[] obj = (Object[]) objecArraytList.get(i);
				mode.setSums(Integer.parseInt(obj[0].toString()));
				mode.setCategoryID(Integer.parseInt(obj[1].toString()));
				mode.setCategory(obj[2].toString());
				list.add(mode);
			}
		}
		return list;
	}

	// 热销商品查询
	@Override
	public List<Products> getAllByCommdityID(Integer id) {
		StringBuffer hql = new StringBuffer("SELECT SUM(quantity) sums,c.transNumForTaobao,s.categoryID,c.seller_name,c.nameOfGoods,i.path FROM commodity c RIGHT JOIN shopcategory s ON s.categoryID = c.shopcategory LEFT JOIN  ImagePath i  on c.commodityID = i.from_commodity WHERE  c.shopcategory = " + id + " GROUP BY c.shopcategory ORDER BY sums DESC LIMIT 7");
		Query query = commodityDao.getEntityManager().createNativeQuery(hql.toString());
		@SuppressWarnings("rawtypes")
		List objecArraytList = query.getResultList();
		List<Products> pr = new ArrayList<Products>();
		Products mode = null;
		if (objecArraytList != null && objecArraytList.size() > 0) {
			for (int i = 0; i < objecArraytList.size(); i++) {
				mode = new Products();
				Object[] obj = (Object[]) objecArraytList.get(i);
				mode.setTransNumForTaobao(Integer.parseInt(obj[1].toString()));
				mode.setShopcategory(Integer.parseInt(obj[2].toString()));
				mode.setSeller(obj[3].toString());
				mode.setNameOfGoods(obj[4].toString());
				mode.setPath(obj[5].toString());
				pr.add(mode);
			}
		}
		return pr;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Commodity> getAllByCommStatusAndOrderStatus(CommoidityStatus support, OrderStatus waitdelivery) {
		StringBuffer hql = new StringBuffer("select DISTINCT comm.* from Commodity comm left join OrderForm orders on orders.orderFormID = comm.orderform_id where comm.status = '" + support + "' and orders.orderstatus = '" + waitdelivery + "' and comm.seller_name = 1 and comm.purchase_user is null");
		return commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Commodity> getAllByOrderStatus(String status, Integer shop_id) {
		StringBuffer hql = new StringBuffer("select DISTINCT comm.* from Commodity comm left join OrderForm orders on orders.orderFormID = comm.orderform_id where orders.orderstatus in (" + status + ") and comm.seller.id = '" +  shop_id + "'");
		return commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Commodity> getOrderPollByParam(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer("select DISTINCT comm.* from Commodity comm left join OrderForm orders on orders.orderFormID = comm.orderform_id left join User u on u.id = orders.user_id where comm.seller_name = 1 ");
		if (map.get("transNumForTaobao") != null) {
			hql.append(" and comm.transNumForTaobao = " + map.get("transNumForTaobao"));
		}
		if (map.get("orderUserName") != null) {
			hql.append(" and u.userName like '%" + map.get("orderUserName") + "%'");
		}
		if (map.get("paymentDate") != null) {
			hql.append(" and orders.paymentDate like '%" + map.get("paymentDate") + "%'");
		}
		if (map.get("disposeStatus") != null) {
			hql.append(" and comm.disposeStatus = '" + map.get("disposeStatus") + "'");
		}
		return commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class).getResultList();
	}

	@Override
	public Commodity getCommByOrderIDAndCommCode(Integer orderid, Integer commCode) {
		List<String> keys = new ArrayList<String>();
		keys.add("orderNumber.orderFormID");
		keys.add("commodityID");
		List<Object> values = new ArrayList<Object>();
		values.add(orderid);
		values.add(commCode);
		return commodityDao.getFirstRecord(keys, values);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Commodity> getCommodityByPurchase(String personnel) {
		StringBuffer hql = new StringBuffer("SELECT DISTINCT comm.* FROM Commodity comm LEFT JOIN OrderForm orders ON orders.orderFormID = comm.orderform_id " + "LEFT JOIN Personnel per ON per.id = comm.purchase_user WHERE comm.status = 'support' AND orders.orderstatus = 'waitDelivery' AND comm.seller_name = 1  AND comm.purchase_user in (" + personnel+")");
		return commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Commodity> getAllByPurchase() {
		StringBuffer hql = new StringBuffer("SELECT DISTINCT comm.* FROM Commodity comm LEFT JOIN OrderForm orders ON orders.orderFormID = comm.orderform_id " + "LEFT JOIN Personnel per ON per.id = comm.purchase_user WHERE comm.status = 'support' AND orders.orderstatus = 'waitDelivery' AND comm.seller_name = 1  AND comm.purchase_user is not null");
		return commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Commodity> getCommodityByBillPay() {
		StringBuffer hql = new StringBuffer("SELECT DISTINCT comm.* FROM Commodity comm LEFT JOIN " + "orderform orders ON orders.orderFormID = comm.orderform_id WHERE comm.status = " + "'inAuctionlose' AND comm.purchase_user IS NOT NULL AND comm.seller_name = 1 " + "AND comm.disposeStatus NOT IN ('shortage','commodityAds','waiting')");
		return commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class).getResultList();
	}

	@Override
	public List<Commodity> getOrderByPurchaseAndUser(User user) {
		StringBuffer hql = new StringBuffer("SELECT DISTINCT comm.* FROM Commodity comm LEFT JOIN OrderForm orders ON orders.orderFormID = comm.orderform_id WHERE comm.status = 'support' AND orders.orderstatus = 'waitDelivery' AND comm.seller_name = 1 AND comm.purchase_user IS NULL AND orders.user_id =  " + user.getId());
		Query query = commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class);
		@SuppressWarnings("unchecked")
		List<Commodity> list = query.getResultList();
		return list;
	}

	@Override
	public List<Commodity> getCommodityByParam(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer("SELECT DISTINCT comm.* FROM Commodity comm LEFT JOIN " + "orderform orders ON orders.orderFormID = comm.orderform_id left join User u on u.id = orders.user_id " + "left join Personnel per on per.id = comm.purchase_user  WHERE comm.purchase_user IS NOT NULL AND comm.seller_name = 1 "
				+ "AND comm.disposeStatus NOT IN ('shortage','commodityAds','waiting') " + "and (" + map.get("orderID") + " is null or orders.orderFormID =  " + map.get("orderID") + ")  ");
		if (map.get("orderUser") != null) {
			hql.append(" and u.userName like '%" + map.get("orderUser") + "%'");
		}
		if (map.get("purchase") != null) {
			hql.append(" and per.userName like '%" + map.get("purchase") + "%'");
		}
		if (map.get("paymentDate") != null) {
			hql.append(" and orders.paymentDate like '%" + map.get("paymentDate") + "%'");
		}
		if (map.get("zazataoPayDate") != null) {
			hql.append(" and comm.zazataoPayDate like '%" + map.get("zazataoPayDate") + "%'");
		}
		if (map.get("currency") != null) {
			hql.append(" and comm.currency like '%" + map.get("currency") + "%'");
		}
		if (map.get("status") != null) {
			if (!map.get("status").equals("")) {
				hql.append(" and comm.status = '" + map.get("status") + "'");
			} else {
				hql.append(" and comm.status != 'support'");
			}
		} else {
			hql.append(" and comm.status =  'inAuctionlose' ");
		}
		Query query = commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class);
		@SuppressWarnings("unchecked")
		List<Commodity> list = query.getResultList();
		return list;
	}

	@Override
	public List<Commodity> getAccountBook() {
		StringBuffer hql = new StringBuffer("select * from Commodity comm where comm.seller_name = 1 and comm.purchase_user is not null and comm.status != 'support'");
		Query query = commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class);
		@SuppressWarnings("unchecked")
		List<Commodity> list = query.getResultList();
		return list;
	}
	
	@Override
	public List<Commodity> getAllByUserAndStatus(User user) {
		StringBuffer hql = new StringBuffer(" select com.* from commodity com LEFT JOIN orderform orders on orders.orderFormID = com.orderform_id where orders.user_id = "+user.getId()
				+" AND orders.orderstatus IN ('consigneeSigning','completionTransaction')");
		Query query = commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class);
		@SuppressWarnings("unchecked")
		List<Commodity> list = query.getResultList();
		return list;
	}

	@Override
	public Integer getCommodityByStatusAndShop(String status, Integer shop_id) {
		StringBuffer hql = new StringBuffer("select COUNT(DISTINCT commodityID) from Commodity c where c.status in(" + status + ") and c.seller_name = " + shop_id);
		Query query =  commodityDao.getEntityManager().createNativeQuery(hql.toString());
		return Integer.parseInt(query.getSingleResult().toString());
	}
}
