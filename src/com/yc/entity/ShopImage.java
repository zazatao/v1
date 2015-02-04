package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

//商品照片
@Entity
@DiscriminatorValue("shopimage")
public class ShopImage {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer imageID;
	
	@Column
	private String imagePath;
	
	@ManyToOne
	@JoinColumn(name = "shopCommoidty_id")
	private ShopCommoidty shopCommoidty;

	public Integer getImageID() {
		return imageID;
	}

	public void setImageID(Integer imageID) {
		this.imageID = imageID;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public ShopCommoidty getShopCommoidty() {
		return shopCommoidty;
	}

	public void setShopCommoidty(ShopCommoidty shopCommoidty) {
		this.shopCommoidty = shopCommoidty;
	}
}
