package com.yc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Commodity;
import com.yc.entity.StoreRoom;
import com.yc.service.ICommodityService;

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
		StringBuffer hql = new StringBuffer(" from Commodity c where c.storeRoom.cellID = " + cellID);
		if (b) {
			hql.append(" and c.status in ('marriage','lose','refuse','inWarehouse','senToWarehouse')");
		} else {
			hql.append(" and c.status in ('cancel','delete')");
		}
		return commodityDao.find(hql.toString(), null, null);
	}

	@Override
	public List<Commodity> getCommodityByRoom(StoreRoom storeRoom) {
		String hql = " from Commodity c where c.status not in ('cancel','delete') and c.storeRoom.cellID = " + storeRoom.getCellID();
		return commodityDao.find(hql, null, null);
	}

	@Override
	public List<Commodity> getAllByStatus() {
		String hql = " from Commodity c where c.status int ('packing')";
		return commodityDao.find(hql, null, null);
	}

	@Override
	public List<Commodity> getAllByParameters(Map<String, Object> map, boolean b) {
		StringBuffer hql = new StringBuffer();
		hql.append("from Commodity c where (? is null or c.storeRoom.cellStr like ?) and (? is null or c.orderNumber.packAge.packageCode = ?)" + " and (? is null or c.orderNumber.orderFormID = ?) and (? is null or c.orderNumber.orderUser.userName like ?) " + " and (? is null or c.tpek like ?) and (? is null or c.storeRoom.cellDate like ?) and (? is null or c.storeRoom.inStoreRoomDate like ?) ");
		Object[] paramete = null;
		if (map.get("formStatus") == null) {
			if (b) {
				hql.append(" and c.status in ('marriage','lose','refuse','inWarehouse','senToWarehouse')");
			} else {
				hql.append(" and c.status in ('cancel','delete')");
			}
			paramete = new Object[14];
		} else {
			hql.append("and (? is null or c.status = ?)");
			paramete = new Object[16];
			paramete[14] = map.get("formStatus");
			paramete[15] = map.get("formStatus");
		}
		paramete[0] = map.get("cellStr");
		paramete[1] = "%" + map.get("cellStr") + "%";
		paramete[2] = map.get("packageCode");
		paramete[3] = map.get("packageCode");
		paramete[4] = map.get("orderFormID");
		paramete[5] = map.get("orderFormID");
		paramete[6] = map.get("userName");
		paramete[7] = "%" + map.get("userName") + "%";
		paramete[8] = map.get("tpek");
		paramete[9] = map.get("tpek");
		paramete[10] = map.get("cellDate");
		paramete[11] = map.get("cellDate");
		paramete[12] = map.get("inStoreRoomDate");
		paramete[13] = map.get("inStoreRoomDate");
		return commodityDao.find(hql.toString(), paramete, -1, -1);
	}

	@Override
	public List<Commodity> getAllByParametersForOrder(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer();
		hql.append("from Commodity c where (? is null or c.transNumForTaobao = ?) "
				+ " and (? is null or c.orderNumber.orderFormID = ?) and (? is null or c.orderNumber.orderUser.userName like ?) "
				+ " and (? is null or c.tpek like ?) and (? is null or c.orderNumber.changeStatusDate like ?) and "
				+ "(? is null or c.status = ?) and c.storeRoom.isInCell = 0");
		Object[] paramete =  new Object[12];
		paramete[0] = map.get("transNumForTaobao");
		paramete[1] = map.get("transNumForTaobao");
		paramete[2] = map.get("orderFormID");
		paramete[3] = map.get("orderFormID");
		paramete[4] = map.get("userName");
		paramete[5] = "%" + map.get("userName") + "%";
		paramete[6] = map.get("tpek");
		paramete[7] = map.get("tpek");
		paramete[8] = map.get("changeStatusDate");
		paramete[9] ="%" +  map.get("changeStatusDate") + "%";
		paramete[10] = map.get("formStatus");
		paramete[11] = map.get("formStatus");
		return commodityDao.find(hql.toString(), paramete, -1, -1);
	}

}
