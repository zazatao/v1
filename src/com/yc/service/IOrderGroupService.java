package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.OrderGroup;

public interface IOrderGroupService extends IGenericService<OrderGroup> {

	List<OrderGroup> getOrderGroupByParameters(Map<String, Object> map);
	
}
