package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

//地理位置区划
@Entity
public class AddressDivision {
	@Id
	private Integer addressDivID;
	
	@Column
	private Integer  addressCode;
	
	@Column
	private String  addressName;

	public Integer getAddressDivID() {
		return addressDivID;
	}

	public void setAddressDivID(Integer addressDivID) {
		this.addressDivID = addressDivID;
	}

	public Integer getAddressCode() {
		return addressCode;
	}

	public void setAddressCode(Integer addressCode) {
		this.addressCode = addressCode;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	
}
