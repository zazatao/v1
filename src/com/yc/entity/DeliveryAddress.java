package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DeliveryAddress {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	@Column
	private String toName;// 给xx
	@Column
	private String toEmail;// 邮件
	@Column
	private String phone;// 电话
	@Column
	private String country;// 国家
	@Column
	private String provience; // 省：新疆
	@Column
	private String city;// 市：乌鲁木齐
	@Column
	private String district;// 区：新市区
	@Column
	private String street;// 街道：天津路
	@Column
	private String orther;// 其它
	@Column
	private String handedAddress;// 转交地址

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	public String getToEmail() {
		return toEmail;
	}

	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getProvience() {
		return provience;
	}

	public void setProvience(String provience) {
		this.provience = provience;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getOrther() {
		return orther;
	}

	public void setOrther(String orther) {
		this.orther = orther;
	}

	public String getHandedAddress() {
		return handedAddress;
	}

	public void setHandedAddress(String handedAddress) {
		this.handedAddress = handedAddress;
	}

}
