package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Address;
import com.yc.entity.ImagePath;
import com.yc.entity.user.User;
import com.yc.service.IAddressService;
@Component
public class AddressService extends GenericService<Address> implements IAddressService {

	@Autowired
	GenericDao<Address> addressDao;
	
	@Override
	GenericDao<Address> getDao() {
		return addressDao;
	}
	@Override
	public Address FindByAddressID(Integer id) {
		return addressDao.getFirstRecord("adress.id", id);
	}
	@Override
	public boolean deleteByadd(Integer id) {
		boolean isok = false;
		List<Address> list =  addressDao.getBy("address.id", id);
		for (Address address : list) {
			isok = addressDao.deleteById(address.getId());
		}
		return isok ;
	}

}
