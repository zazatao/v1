package com.yc.service;

import com.yc.entity.Address;

public interface IAddressService extends IGenericService<Address> {
	
	Address FindByAddressID(Integer id);
	
	public boolean deleteByadd(Integer id);

}
