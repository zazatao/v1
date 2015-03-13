package com.yc.service;

import java.util.List;

import com.yc.entity.StoreRoom;
import com.yc.entity.user.User;

public interface IStoreRoomService extends IGenericService<StoreRoom>{

	List<StoreRoom> getCellForTrue();

	List<StoreRoom> getCellForFalse();

	StoreRoom getStoreRoomByIsInCell(boolean b);

}
