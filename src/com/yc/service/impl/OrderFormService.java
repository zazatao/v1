package com.yc.service.impl;

import java.util.List;

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

}
