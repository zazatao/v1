package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.OrderGroup;
import com.yc.service.IOrderGroupService;

@Component
public class OrderGroupService extends GenericService<OrderGroup> implements IOrderGroupService {

	@Autowired
	GenericDao<OrderGroup> orderGroupDao;

	@Override
	GenericDao<OrderGroup> getDao() {
		return orderGroupDao;
	}
}
