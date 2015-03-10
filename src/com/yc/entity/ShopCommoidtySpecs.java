package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@DiscriminatorValue("shopcommoidtyspecs")//商品表
public class ShopCommoidtySpecs {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "shopComm_id")
	private ShopCommoidty shopCommSpecs;
	
	@Column
	private String commSpec;//规格【，颜色-红色，尺寸-12L,】
	
	@Column
	private Integer stock = 1 ;//库存数量
	
	@Column
	private Float  unitPrice =0f;//单价

	public Float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ShopCommoidty getShopCommSpecs() {
		return shopCommSpecs;
	}

	public void setShopCommSpecs(ShopCommoidty shopCommSpecs) {
		this.shopCommSpecs = shopCommSpecs;
	}

	public String getCommSpec() {
		return commSpec;
	}

	public void setCommSpec(String commSpec) {
		this.commSpec = commSpec;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}
	
}
