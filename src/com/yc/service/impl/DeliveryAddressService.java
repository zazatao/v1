package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.DeliveryAddress;
import com.yc.service.IDeliveryAddressService;

@Component
public class DeliveryAddressService extends GenericService<DeliveryAddress> implements IDeliveryAddressService{

	@Autowired
	GenericDao<DeliveryAddress> deliveryAddressDao;
	
	@Override
	GenericDao<DeliveryAddress> getDao() {
		return deliveryAddressDao;
	}
}