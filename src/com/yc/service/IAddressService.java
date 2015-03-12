package com.yc.service;

import java.util.List;

import com.yc.entity.Address;

public interface IAddressService extends IGenericService<Address> {
	
	Address FindByAddressID(Integer id);
	
	public boolean deleteByadd(Integer id);

	List<Address> getAllByUser(Integer id);

}
