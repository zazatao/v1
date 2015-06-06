package com.yc.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.ShopCommoidty;
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

	@Override
	public List<StoreRoom> getRoomByCondition(String cellStr, String user,Boolean  isInCell) {
		StringBuffer hql=new StringBuffer("SELECT sr.* FROM storeroom sr LEFT JOIN USER u ON u.storeRoom_id=sr.cellID WHERE 1=1");
	    if(cellStr!=null&&!cellStr.equals("")){
	    	hql.append(" AND sr.cellStr="+cellStr);
	    }
	    if(user!=null&&!user.equals("")){
	    	hql.append(" AND u.userName='"+user+"'");
	    }
	    if(isInCell!=null&&!isInCell.equals("")){
	    	hql.append(" AND sr.isInCell="+isInCell);
	    }
		Query query = storeRoomDao.getEntityManager().createNativeQuery(hql.toString(), StoreRoom.class);
		@SuppressWarnings("unchecked")
		List<StoreRoom> list = query.getResultList();
		return list;
	}

}
