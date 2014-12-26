package com.yc.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

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
	@Column
	private String cellDate;//入单元格时间
	@Column
	private String inStoreRoomDate;//入库房时间
	@OneToMany(mappedBy = "storeRoom")
	private List<Commodity> commodities;

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

	public String getCellDate() {
		return cellDate;
	}

	public void setCellDate(String cellDate) {
		this.cellDate = cellDate;
	}

	public String getInStoreRoomDate() {
		return inStoreRoomDate;
	}

	public void setInStoreRoomDate(String inStoreRoomDate) {
		this.inStoreRoomDate = inStoreRoomDate;
	}

	public List<Commodity> getCommodities() {
		return commodities;
	}

	public void setCommodities(List<Commodity> commodities) {
		this.commodities = commodities;
	}

}
