package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.yc.entity.user.User;

@Entity
public class Address {

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
	private String provience ; // 省：新疆
	@Column
	private String city ;// 市：乌鲁木齐
	@Column
	private String district ;// 区：新市区
	@Column
	private String street;// 街道：天津路
	@Column
	private String orther ;// 其它
	@Column
	@Enumerated(EnumType.STRING)
	private Transit handedAddress;//中转地
	@Column
	private String indexNum ;// 指数
	@Column
	private Boolean theDefault;// 是否默认
	@ManyToOne
	@JoinColumn(name = "user_id")
    private User user;
	
	public Transit getHandedAddress() {
		return handedAddress;
	}

	public void setHandedAddress(Transit handedAddress) {
		this.handedAddress = handedAddress;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public String getIndexNum() {
		return indexNum;
	}

	public void setIndexNum(String indexNum) {
		this.indexNum = indexNum;
	}

	public Boolean getTheDefault() {
		return theDefault;
	}

	public void setTheDefault(Boolean theDefault) {
		this.theDefault = theDefault;
	}

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

}
