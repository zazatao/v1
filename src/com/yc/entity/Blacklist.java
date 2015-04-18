package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
@DiscriminatorValue("blacklist")//商店
public class Blacklist {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	@Enumerated(EnumType.STRING)
	private BlacklistType blacklistType;
	
	@Column
	private String reasons;//原因
	
	@Column
	private String addDate;
	
	@OneToOne(mappedBy = "blacklist")
	private Shop shop;
	
	@OneToOne(mappedBy = "blacklist")
	private ShopCommoidty commoidty;
	
	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public ShopCommoidty getCommoidty() {
		return commoidty;
	}

	public void setCommoidty(ShopCommoidty commoidty) {
		this.commoidty = commoidty;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BlacklistType getBlacklistType() {
		return blacklistType;
	}

	public void setBlacklistType(BlacklistType blacklistType) {
		this.blacklistType = blacklistType;
	}

	public String getReasons() {
		return reasons;
	}

	public void setReasons(String reasons) {
		this.reasons = reasons;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}
	
}
