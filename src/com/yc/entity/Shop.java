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
@DiscriminatorValue("shop")//商店
public class Shop {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private String shopName;
	
	@Column
	private String blank;
	
	@Column( unique = true, updatable = false)
	private String blankAccount;//公司账户
	
	@Column
	private String phone;
	
	@Column
	private String email;
	
	@Column
	private Boolean isPermit;//是否许可开店
	
	@OneToMany(mappedBy = "belongTo")
	private List<ShopCommoidty> shopCommoidties;//店铺商品
	
	public List<ShopCommoidty> getShopCommoidties() {
		return shopCommoidties;
	}

	public void setShopCommoidties(List<ShopCommoidty> shopCommoidties) {
		this.shopCommoidties = shopCommoidties;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getBlank() {
		return blank;
	}

	public void setBlank(String blank) {
		this.blank = blank;
	}

	public String getBlankAccount() {
		return blankAccount;
	}

	public void setBlankAccount(String blankAccount) {
		this.blankAccount = blankAccount;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getIsPermit() {
		return isPermit;
	}

	public void setIsPermit(Boolean isPermit) {
		this.isPermit = isPermit;
	}

}
