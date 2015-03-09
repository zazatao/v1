package com.yc.service;


import com.yc.entity.OrderForm;

import java.util.List;
import java.util.Map;

public interface IOrderFormService extends IGenericService<OrderForm>{

	List<OrderForm> findByPackAgeID(Integer id);

	List<OrderForm> findByUserName(String parameter);

	List<OrderForm> findByUserID(Integer id);

	List<OrderForm> getOrderByOrderGroup(Integer id);

	List<OrderForm> getOrderFormByParameters(Map<String, Object> map);

}
