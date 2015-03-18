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
			hql.append(" and c.status in ('marriage','lose','refuse','inWarehouse','senToWarehouse')");
		} else {
			hql.append(" and c.status in ('cancel','delete','marriage')");
		}
		return commodityDao.find(hql.toString(), null, null);
	}

	@Override
	public List<Commodity> getCommodityByRoom(StoreRoom storeRoom) {
		String hql = " from Commodity c where c.status not in ('cancel','delete','marriage') and c.orderNumber.orderUser.storeRoom.cellID = " + storeRoom.getCellID();
		return commodityDao.find(hql, null, null);
	}

	@Override
	public List<Commodity> getAllByStatus() {
		String hql = " from Commodity c where c.status in ('packing')";
		return commodityDao.find(hql, null, null);
	}

	@Override
	public List<Commodity> getAllByParameters(Map<String, Object> map, boolean b) {
		StringBuffer hql = new StringBuffer();
		hql.append("from Commodity c where (? is null or c.orderNumber.orderUser.storeRoom.cellStr like ?) and (? is null or c.orderNumber.orderFormID = ?) and (? is null or c.orderNumber.orderUser.userName like ?) and (? is null or c.tpek = ?) and (? is null or c.cellDate like ?) and (? is null or c.inStoreRoomDate like ?) ");
		Object[] paramete = null;
		if (map.get("formStatus") == null && map.get("packageCode") == null) {
			if (b) {
				hql.append(" and c.status in ('marriage','lose','refuse','inWarehouse','senToWarehouse')");
			} else {
				hql.append(" and c.status in ('cancel','delete','marriage')");
			}
			paramete = new Object[12];
		} else if (map.get("formStatus") == null && map.get("packageCode") != null) {
			if (b) {
				hql.append(" and c.status in ('marriage','lose','refuse','inWarehouse','senToWarehouse')");
			} else {
				hql.append(" and c.status in ('cancel','delete','marriage')");
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
		paramete[9] =  map.get("cellDate") + "%";
		paramete[10] = map.get("inStoreRoomDate");
		paramete[11] = map.get("inStoreRoomDate") + "%";

		return commodityDao.find(hql.toString(), paramete, -1, -1);
	}

	@Override
	public List<Commodity> getAllByParametersForOrder(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer();
		hql.append("from Commodity c where (? is null or c.transNumForTaobao = ?) " + " and (? is null or c.orderNumber.orderFormID = ?) and (? is null or c.orderNumber.orderUser.userName like ?) " + " and (? is null or c.tpek like ?) and (? is null or c.orderNumber.changeStatusDate like ?) and " + "(? is null or c.status = ?) and c.orderNumber.orderUser.storeRoom.isInCell = 1");
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

	@Override
	public List<Commodity> getDisposeByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from Commodity c where (? is null or c.transNumForTaobao = ?) and (? is null or c.seller = ?) and (? is null or c.sellerDate = ?) and (? is null or c.disposeStatus = ?)");
		Object[] paramete = new Object[8];
		paramete[0] = map.get("transNumForTaobao");
		paramete[1] = map.get("transNumForTaobao");
		paramete[2] = map.get("seller");
		paramete[3] = map.get("seller");
		paramete[4] = map.get("sellerDate");
		paramete[5] = map.get("sellerDate");
		paramete[6] = map.get("disposeStatus");
		paramete[7] = map.get("disposeStatus");
		return commodityDao.find(hql.toString(), paramete, -1, -1);
	}

	public List<Commodity> getAllByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from Commodity c where (? is null or c.transNumForTaobao = ?) " + " and (? is null or c.orderNumber.purchase.userName like ?) and (? is null or c.tpek = ?) and (? is null or c.status = ?) " + "  and  (? is null or c.orderNumber.orderUser.userName like ?) and (? is null or c.orderNumber.orderDate = ?) "
				+ "  and  (? is null or c.orderNumber.paymentDate = ?) and  (? is null or c.orderNumber.orderFormID = ?)" + " and  (? is null or c.commItem = ?) and c.orderNumber.orderUser.storeRoom.isInCell = 1 ");
		Object[] paramete = null;
		if (map.get("packageCode") == null) {
			paramete = new Object[18];
			paramete = getParamete(paramete, map);

		} else {
			hql.append(" and (? is null or c.orderNumber.packAge.packageCode = ?)");
			paramete = new Object[20];
			paramete = getParamete(paramete, map);
			paramete[18] = map.get("packageCode");
			paramete[19] = map.get("packageCode");
		}
		return commodityDao.find(hql.toString(), paramete, -1, -1);
	}

	private Object[] getParamete(Object[] paramete, Map<String, Object> map) {
		paramete[0] = map.get("transNumForTaobao");
		paramete[1] = map.get("transNumForTaobao");
		paramete[2] = map.get("operatorPurchase");
		paramete[3] = "%" + map.get("operatorPurchase") + "%";
		paramete[4] = map.get("tpek");
		paramete[5] = map.get("tpek");
		paramete[6] = map.get("formStatus");
		paramete[7] = map.get("formStatus");
		paramete[8] = map.get("userName");
		paramete[9] = "%" + map.get("userName") + "%";
		paramete[10] = map.get("orderDate");
		paramete[11] = map.get("orderDate");
		paramete[12] = map.get("paymentDate");
		paramete[13] = map.get("paymentDate");
		paramete[14] = map.get("orderNum");
		paramete[15] = map.get("orderNum");
		paramete[16] = map.get("commItem");
		paramete[17] = map.get("commItem");
		return paramete;
	}

	@Override
	public List<Commodity> getShopCommodityByStatus(CommoidityStatus commoidStatus,CommoidityStatus cancel, CommoidityStatus delete, CommoidityStatus marriage,  Shop shop) {
		StringBuffer hql = new StringBuffer(" from Commodity c where  c.status = ? or c.status = ? or c.status = ? or c.status = ? and c.seller.id = ?");
		Object[] paramete = new Object[5];
		paramete[0] = commoidStatus;
		paramete[1] = cancel;
		paramete[2] = delete;
		paramete[3] = marriage;
		paramete[4] = shop.getId();
		return commodityDao.find(hql.toString(), paramete, -1, -1);
	}
	
	//分类查询
	@Override
	public List<CommdityModel> getAllByShopCategoryID(Integer id) {
		StringBuffer hql = new StringBuffer("select SUM(quantity) sums,s.categoryID categoryID,s.category category from commodity c right join shopcategory s on s.categoryID = c.shopcategory where  c.shopcategory in (select sc.categoryID from shopcategory sc where sc.parentLevel in (select cat.categoryID from shopcategory cat where cat.parentLevel = "+id+"))group by s.parentLevel order by sums desc limit 7");
		Query query = commodityDao.getEntityManager().createNativeQuery(hql.toString());
		@SuppressWarnings("rawtypes")
		List objecArraytList = query.getResultList();  
		List<CommdityModel> list = new ArrayList<CommdityModel>();
		CommdityModel mode = null;
		if (objecArraytList != null && objecArraytList.size()>0) {
			for(int i=0;i<objecArraytList.size();i++) {   
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
	
	//热销商品查询
	@Override
	public List<Products> getAllByCommdityID(Integer id) {
		StringBuffer hql = new StringBuffer("SELECT SUM(quantity) sums,c.transNumForTaobao,s.categoryID,c.seller_name,c.nameOfGoods,i.path FROM commodity c RIGHT JOIN shopcategory s ON s.categoryID = c.shopcategory LEFT JOIN  ImagePath i  on c.commodityID = i.from_commodity WHERE  c.shopcategory = "+id+" GROUP BY c.shopcategory ORDER BY sums DESC LIMIT 7");
		Query query = commodityDao.getEntityManager().createNativeQuery(hql.toString());
		@SuppressWarnings("rawtypes")
		List objecArraytList = query.getResultList();  
//		List<CommdityModel> listone = new ArrayList<CommdityModel>();
		List<Products> pr = new ArrayList<Products>();
		Products mode = null;
		if (objecArraytList != null && objecArraytList.size()>0) {
			for(int i=0;i<objecArraytList.size();i++) {   
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
		StringBuffer hql = new StringBuffer("select DISTINCT comm.* from Commodity comm left join OrderForm orders on orders.orderFormID = comm.orderform_id where comm.status = '"+support+"' and orders.orderstatus = '"+waitdelivery+"' and comm.seller_name = 1");
		return commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Commodity> getOrderPollByParam(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer("select DISTINCT comm.* from Commodity comm left join OrderForm orders on orders.orderFormID = comm.orderform_id left join User u on u.id = orders.user_id where comm.seller_name = 1 " );
		if (map.get("transNumForTaobao") !=null) {
			hql.append(" and comm.transNumForTaobao = "+map.get("transNumForTaobao"));
		}
		if (map.get("orderUserName") != null) {
			hql.append(" and u.userName like '%"+map.get("orderUserName")+"%'");
		}
		if (map.get("paymentDate") != null) {
			hql.append(" and orders.paymentDate like '%"+map.get("paymentDate")+"%'");
		}
		if (map.get("disposeStatus") != null) {
			hql.append(" and comm.disposeStatus = '"+map.get("disposeStatus")+"'");
		}
		return commodityDao.getEntityManager().createNativeQuery(hql.toString(), Commodity.class).getResultList();
	}
	
	@Override
	public Commodity getCommByOrderIDAndCommCode(Integer orderid, Integer commCode) {
		List<String> keys = new ArrayList<String>();
        keys.add("orderNumber.orderFormID");
        keys.add("transNumForTaobao");
        List<Object> values = new ArrayList<Object>();
        values.add(orderid);
        values.add(commCode);
		return commodityDao.getFirstRecord(keys, values);
	}
}
