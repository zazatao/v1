package com.yc.model;

import com.yc.entity.ShopCommoidty;

public class BuyCatSession {

	private Integer catID;
	
	private ShopCommoidty shopCommoidty;
	
	private String specs;
	
	private Integer buyAmount;

	public Integer getCatID() {
		return catID;
	}

	public void setCatID(Integer catID) {
		this.catID = catID;
	}

	public ShopCommoidty getShopCommoidty() {
		return shopCommoidty;
	}

	public void setShopCommoidty(ShopCommoidty shopCommoidty) {
		this.shopCommoidty = shopCommoidty;
	}

	public String getSpecs() {
		return specs;
	}

	public void setSpecs(String specs) {
		this.specs = specs;
	}

	public Integer getBuyAmount() {
		return buyAmount;
	}

	public void setBuyAmount(Integer buyAmount) {
		this.buyAmount = buyAmount;
	}
	
}
