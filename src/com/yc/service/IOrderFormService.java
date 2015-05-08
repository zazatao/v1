package com.yc.service;


import com.yc.entity.OrderForm;
import com.yc.entity.Shop;
import com.yc.entity.user.User;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

public interface IOrderFormService extends IGenericService<OrderForm>{

	List<OrderForm> findByPackAgeID(Integer id);

	List<OrderForm> findByUserName(String parameter);

	List<OrderForm> findByUserID(Integer id);

	List<OrderForm> getOrderByOrderGroup(Integer id);

	Integer getShopOrderByStatusAndShop(String status, Integer shop_id);
	
	List<OrderForm> getOrderFormByParameters(Map<String, Object> map);
	
	List<OrderForm> getAllByOrderStatus();

	List<OrderForm> getAllByParams(Map<String, Object> map, User user);

	List<OrderForm> getShopOrderByShop(Shop shop);

	List<OrderForm> getShopOrderByParam(Map<String, Object> map, Shop shop) throws ParseException ;

	List<OrderForm> getOrderByStatusAndName(Map<String, Object> map);

	List<OrderForm> getAllByStatus();
}
