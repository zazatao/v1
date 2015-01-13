package com.yc.service.impl;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<OrderGroup> getOrderGroupByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from OrderGroup o where (? is null or o.orderGroupID = ?) and (? is null or o.taskNumber = ?) and (? is null or o.groupStatus = ?)");
		Object[] paramete = new Object[6];
		paramete[0] = map.get("orderGroupID");
		paramete[1] = map.get("orderGroupID");
		paramete[2] = map.get("taskNumber");
		paramete[3] = map.get("taskNumber");
		paramete[4] = map.get("orderStatus");
		paramete[5] = map.get("orderStatus");
		return orderGroupDao.find(hql.toString(), paramete, -1,-1);
	}
}
