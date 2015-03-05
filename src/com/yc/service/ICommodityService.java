package com.yc.service;

import java.util.List;

import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.OrderForm;
import com.yc.entity.Shop;
import com.yc.entity.ShopCommoidty;

import java.util.Map;

import com.yc.entity.StoreRoom;

public interface ICommodityService extends IGenericService<Commodity> {

	List<Commodity> getAllByRoomForHave(Integer cellID, boolean b);

	List<Commodity> getCommodityByRoom(StoreRoom storeRoom);

	List<Commodity> getAllByStatus();

	List<Commodity> getAllByParameters(Map<String, Object> map, boolean b);

	List<Commodity> getAllByParametersForOrder(Map<String, Object> map);
	
	List getAllByShopCategoryID(Integer id);
	
	//订单处理
	List<Commodity> getDisposeByParameters(Map<String, Object> map);
	
	//订单详情显示
	List<Commodity> getAllByParameters(Map<String, Object> map);
	
	//状态订单商品状态查询
	List<Commodity> getShopCommodityByStatus(CommoidityStatus commoidStatus, CommoidityStatus cancel, CommoidityStatus delete, CommoidityStatus marriage, Shop shop);

}
