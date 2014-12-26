package com.yc.service;

import java.util.List;

import com.yc.entity.Commodity;

public interface ICommodityService extends IGenericService<Commodity> {

	List<Commodity> getAllByRoomForHave(Integer cellID, boolean b);

}
