package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.yc.entity.user.Sex;
import com.yc.entity.user.User;


@Entity
@DiscriminatorValue("usersize")
public class UserSize {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer code;
	
	@Column
	@Enumerated(EnumType.STRING)
	 private Sex sex;
	
	@Column
	private String filename;
	
	@Column
	private Boolean isdefault =false;//是否默认
	
	@Column
	private String size;
	
	@Column
	private String category;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private  User user;
	
	

	public Boolean getIsdefault() {
		return isdefault;
	}

	public void setIsdefault(Boolean isdefault) {
		this.isdefault = isdefault;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Sex getSex() {
		return sex;
	}

	public void setSex(Sex sex) {
		this.sex = sex;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
