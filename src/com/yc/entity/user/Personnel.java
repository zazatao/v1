package com.yc.entity.user;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
@DiscriminatorValue("personnel")
public class Personnel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(length = 32, unique = true, updatable = false)
	private String loginName;

	@Column(length = 32)
	private String password;

	@Column(length = 32)
	private String userName;

	@Column
	private String email;

	@Column
	private String phone;

	@Column
	private Integer accomplishNum;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getAccomplishNum() {
		return accomplishNum;
	}

	public void setAccomplishNum(Integer accomplishNum) {
		this.accomplishNum = accomplishNum;
	}
	
}
