package com.yc.service;

import java.util.List;

import com.yc.entity.Commodity;

import java.util.Map;

import com.yc.entity.StoreRoom;

public interface ICommodityService extends IGenericService<Commodity> {

	List<Commodity> getAllByRoomForHave(Integer cellID, boolean b);

	List<Commodity> getCommodityByRoom(StoreRoom storeRoom);

	List<Commodity> getAllByStatus();

	List<Commodity> getAllByParameters(Map<String, Object> map, boolean b);

	List<Commodity> getAllByParametersForOrder(Map<String, Object> map);

	List<Commodity> getAllByParameters(Map<String, Object> map);

}
