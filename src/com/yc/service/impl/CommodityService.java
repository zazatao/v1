package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Commodity;
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
	public List<Commodity> getAllByRoom(Integer cellID) {
		String hql = " from Commodity c where c.status not in ('refuse','lose') and c.storeRoom.cellID = "+cellID;
		return commodityDao.find(hql, null, null);
	}


}
