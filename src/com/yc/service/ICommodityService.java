package com.yc.service;

import java.util.List;

import com.yc.entity.Commodity;
import com.yc.entity.StoreRoom;

public interface ICommodityService extends IGenericService<Commodity> {

	List<Commodity> getAllByRoomForHave(Integer cellID, boolean b);

	List<Commodity> getCommodityByRoom(StoreRoom storeRoom);

	List<Commodity> getAllByStatus();

}
