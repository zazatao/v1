package com.yc.service.impl;

import java.util.List;

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
		StringBuffer hql = new StringBuffer(" from Commodity c where c.storeRoom.cellID = "+cellID);
		if (b) {
			hql.append(" and c.status in ('marriage','lose','refuse','inWarehouse','senToWarehouse')");
		}else{
			hql.append(" and c.status in ('cancel','delete')");
		}
		return commodityDao.find(hql.toString(), null, null);
	}

	@Override
	public List<Commodity> getCommodityByRoom(StoreRoom storeRoom) {
		String hql = " from Commodity c where c.status not in ('cancel','delete') and c.storeRoom.cellID = "+ storeRoom.getCellID();
		return commodityDao.find(hql, null, null);
	}

	@Override
	public List<Commodity> getAllByStatus() {
		String hql = " from Commodity c where c.status int ('packing')";
		return commodityDao.find(hql, null, null);
	}

}
