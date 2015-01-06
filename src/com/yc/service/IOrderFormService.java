package com.yc.service;

import java.util.List;

import com.yc.entity.OrderForm;

public interface IOrderFormService extends IGenericService<OrderForm>{

	List<OrderForm> findByPackAgeID(Integer id);

	List<OrderForm> findByUserName(String parameter);

}
