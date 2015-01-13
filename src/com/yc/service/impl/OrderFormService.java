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
	public List<OrderForm> getOrderFormByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from OrderForm o where (? is null or o.packAge.packageCode = ?) and "
				+ " (? is null or o.orderUser.userName like ?) and (? is null or o.orderDate = ?) and  (? is null or o.paymentDate = ?) ");
		Object[] paramete = new Object[8];
		paramete[0] = map.get("packageCode"); 
		paramete[1] = map.get("packageCode"); 
		paramete[2] = map.get("userName"); 
		paramete[3] = "%"+map.get("userName")+"%"; 
		paramete[4] = map.get("orderDate"); 
		paramete[5] = map.get("orderDate"); 
		paramete[6] = map.get("paymentDate"); 
		paramete[7] = map.get("paymentDate"); 
		return orderFormDao.find(hql.toString(), paramete, -1, -1);
	}
}
