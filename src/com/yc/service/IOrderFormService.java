package com.yc.service;


import com.yc.entity.OrderForm;
import com.yc.entity.user.User;

import java.util.List;
import java.util.Map;

public interface IOrderFormService extends IGenericService<OrderForm>{

	List<OrderForm> findByPackAgeID(Integer id);

	List<OrderForm> findByUserName(String parameter);

	List<OrderForm> findByUserID(Integer id);

	List<OrderForm> getOrderByOrderGroup(Integer id);

	List<OrderForm> getOrderFormByParameters(Map<String, Object> map);
	
	List<OrderForm> getAllByOrderStatus();

	List<OrderForm> getAllByParams(Map<String, Object> map, User user);
}
