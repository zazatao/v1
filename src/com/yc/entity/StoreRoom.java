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
	private Boolean isInCell;//单元格已经用了
	@Column
	private Boolean isInStoreRoom;
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

	public Boolean getIsInCell() {
		return isInCell;
	}

	public void setIsInCell(Boolean isInCell) {
		this.isInCell = isInCell;
	}

	public Boolean getIsInStoreRoom() {
		return isInStoreRoom;
	}

	public void setIsInStoreRoom(Boolean isInStoreRoom) {
		this.isInStoreRoom = isInStoreRoom;
	}

	public List<Commodity> getCommodities() {
		return commodities;
	}

	public void setCommodities(List<Commodity> commodities) {
		this.commodities = commodities;
	}

}
