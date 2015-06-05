package com.yc.service;

import java.util.List;

import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.OrderStatus;
import com.yc.entity.Shop;

import java.util.Map;

import com.yc.entity.StoreRoom;
import com.yc.entity.user.User;
import com.yc.model.CommdityModel;

public interface ICommodityService extends IGenericService<Commodity> {

	List<Commodity> getAllByRoomForHave(Integer cellID, boolean b);

	List<Commodity> getCommodityByRoom(StoreRoom storeRoom);

	List<Commodity> getAllByStatus(String status);

	List<Commodity> getAllByParameters(Map<String, Object> map, boolean b);

	List<Commodity> getAllByParametersForOrder(Map<String, Object> map);
	
	List<CommdityModel> getAllByShopCategoryID(Integer id);
	
	List<CommdityModel> getAllByCommdityID(Integer id);
	//订单处理
	List<Commodity> getDisposeByParameters(Map<String, Object> map);
	
	//订单详情显示
	List<Commodity> getAllByParameters(Map<String, Object> map);
	
	//状态订单商品状态查询
	List<Commodity> getShopCommodityByStatus(String status,Shop shop);

	//订单状态和商品状态
	List<Commodity> getAllByCommStatusAndOrderStatus(CommoidityStatus support, OrderStatus waitdelivery);

	List<Commodity> getOrderPollByParam(Map<String, Object> map);

	Commodity getCommByOrderIDAndCommCode(Integer orderid, Integer commCode);

	List<Commodity> getCommodityByPurchase(String ids);

	List<Commodity> getCommodityByBillPay();

	List<Commodity> getOrderByPurchaseAndUser(User user);

	List<Commodity> getCommodityByParam(Map<String, Object> map);

	List<Commodity> getAccountBook();

	List<Commodity> getAllByPurchase();

	List<Commodity> getAllByOrderStatus(String string, Integer shop_id);
	
	public Integer getCommodityByStatusAndShop(String status, Integer shop_id);
	
	List<Commodity> getAllByUserAndStatus(User user);

	List<CommdityModel> getRankByCommdityID(Integer id);

	List<CommdityModel> getRankTwoByCommdityID(Integer id);

	List<Commodity> getCommByOrderId(Integer orderFormID);

}
