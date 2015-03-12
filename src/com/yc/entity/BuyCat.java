package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.yc.entity.user.User;

@Entity
@DiscriminatorValue("buycat")
public class BuyCat {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer catID;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User catUser;
	
	@ManyToOne
	@JoinColumn(name = "shopCommoidty_id")
	private ShopCommoidty shopCommoidty;
	
	@Column
	private String deliveryComm;
	
	@Column
	private Float deliveryMoney;
	
	@Column
	private Integer buyAmount;
	
	@Column
	private String specs;
	
	public String getDeliveryComm() {
		return deliveryComm;
	}

	public void setDeliveryComm(String deliveryComm) {
		this.deliveryComm = deliveryComm;
	}

	public Float getDeliveryMoney() {
		return deliveryMoney;
	}

	public void setDeliveryMoney(Float deliveryMoney) {
		this.deliveryMoney = deliveryMoney;
	}

	public String getSpecs() {
		return specs;
	}

	public void setSpecs(String specs) {
		this.specs = specs;
	}

	public Integer getCatID() {
		return catID;
	}

	public void setCatID(Integer catID) {
		this.catID = catID;
	}

	public User getCatUser() {
		return catUser;
	}

	public void setCatUser(User catUser) {
		this.catUser = catUser;
	}

	public ShopCommoidty getShopCommoidty() {
		return shopCommoidty;
	}

	public void setShopCommoidty(ShopCommoidty shopCommoidty) {
		this.shopCommoidty = shopCommoidty;
	}

	public Integer getBuyAmount() {
		return buyAmount;
	}

	public void setBuyAmount(Integer buyAmount) {
		this.buyAmount = buyAmount;
	}
}
