package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@DiscriminatorValue("commodity")
public class Commodity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer commodity;
	@Column
	private String orderNumber;
	@Column
	private String transactionsNum;
	@Column
	private String commItem;
	@Column
	private String barcodes;
	@Column
	private String tpek;

	public Integer getCommodity() {
		return commodity;
	}

	public void setCommodity(Integer commodity) {
		this.commodity = commodity;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getTransactionsNum() {
		return transactionsNum;
	}

	public void setTransactionsNum(String transactionsNum) {
		this.transactionsNum = transactionsNum;
	}

	public String getCommItem() {
		return commItem;
	}

	public void setCommItem(String commItem) {
		this.commItem = commItem;
	}

	public String getBarcodes() {
		return barcodes;
	}

	public void setBarcodes(String barcodes) {
		this.barcodes = barcodes;
	}

	public String getTpek() {
		return tpek;
	}

	public void setTpek(String tpek) {
		this.tpek = tpek;
	}

}
