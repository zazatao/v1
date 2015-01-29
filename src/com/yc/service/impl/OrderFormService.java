package com.yc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.OrderForm;
import com.yc.service.IOrderFormService;

@Component
public class OrderFormService extends GenericService<OrderForm> implements IOrderFormService {

	@Autowired
	GenericDao<OrderForm> orderFormDao;

	@Override
	GenericDao<OrderForm> getDao() {
		return orderFormDao;
	}

	@Override
	public List<OrderForm> findByPackAgeID(Integer id) {
		return orderFormDao.getBy("packAge.packageID", id);
	}

	@Override
	public List<OrderForm> findByUserName(String parameter) {
		return orderFormDao.getBy("orderUser.userName", parameter);
	}

	@Override
	public List<OrderForm> findByUserID(Integer id) {
		return orderFormDao.getBy("orderUser.id", id);
	}

	@Override
	public List<OrderForm> getOrderByOrderGroup(Integer id) {
		return orderFormDao.getBy("orderGroup.orderGroupID", id);
	}
	
	@Override
	public List<OrderForm> getAllByOrderStatus() {
		String hql = " from OrderForm c where c.orderstatus in ('packing')";
		return orderFormDao.find(hql, null, null);
	}

	@Override
	public List<OrderForm> getOrderFormByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from OrderForm o where (? is null or o.orderstatus = ?) and (? is null or o.orderDate like ?) and (? is null or o.storeOperator.userName = ?)");
		Object[] paramete = new Object[6];
		paramete[0] = map.get("orderstatus");
		paramete[1] = map.get("orderstatus");
		paramete[2] = map.get("orderDate"); 
		paramete[3] = "%"+map.get("orderDate")+"%";
		paramete[4] = map.get("storeOperator");
		paramete[5] = map.get("storeOperator");

		return orderFormDao.find(hql.toString(), paramete, -1, -1);
	}
}
