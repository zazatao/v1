package com.yc.service;

import java.util.List;

import com.yc.entity.StoreRoom;

public interface IStoreRoomService extends IGenericService<StoreRoom>{

	List<StoreRoom> getCellForTrue();

	List<StoreRoom> getCellForFalse();

}
