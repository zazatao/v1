package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import com.yc.entity.user.User;
//仓库
@Entity
@DiscriminatorValue("storeroom")
public class StoreRoom {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer cellID;
	@Column
	private String cellStr;
	@Column
	private String packageNum;
	@OneToOne(mappedBy = "storeRoom")
	private User user;

	private Boolean isInCell; //单元格已经被用了
	
	public Boolean getIsInCell() {
		return isInCell;
	}

	public void setIsInCell(Boolean isInCell) {
		this.isInCell = isInCell;
	}

	public Integer getCellID() {
		return cellID;
	}

	public void setCellID(Integer cellID) {
		this.cellID = cellID;
	}

	public String getCellStr() {
		return cellStr;
	}

	public void setCellStr(String cellStr) {
		this.cellStr = cellStr;
	}

	public String getPackageNum() {
		return packageNum;
	}

	public void setPackageNum(String packageNum) {
		this.packageNum = packageNum;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
