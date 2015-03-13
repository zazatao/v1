package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.StoreRoom;
import com.yc.service.IStoreRoomService;

@Component
public class StoreRoomService extends GenericService<StoreRoom> implements IStoreRoomService {

	@Autowired
	GenericDao<StoreRoom> storeRoomDao;

	@Override
	GenericDao<StoreRoom> getDao() {
		return storeRoomDao;
	}

	@Override
	public List<StoreRoom> getCellForTrue() {
		return storeRoomDao.getBy("isInCell", 1);
	}

	@Override
	public List<StoreRoom> getCellForFalse() {
		return storeRoomDao.getBy("isInCell", 0);
	}

	@Override
	public StoreRoom getStoreRoomByIsInCell(boolean b) {
		return storeRoomDao.getFirstRecord("isInCell", b?1:0);
	}

}
