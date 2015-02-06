package com.yc.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("shopCommoidty")//商品表
public class ShopCommoidty {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer commCode;//商品编码
	
	@Column
	private String commoidtyName;//商品名称
	
	@Column
	private String commItem;// 货号
	
	@Column
	private String supplier ;//供应商
	
	@Column
	private String commSpec;//规格【，颜色-红色，】
	
	@Column
	private Integer stock = 0 ;//库存数量
	
	@Column
	private String proportion;//显示比例
	
	@Column
	private Float  unitPrice =0f;//单价
	
	@Column(nullable = true)
	private Float  probablyWeight = 0f;//大概重量
	
	@Column
	private Boolean shelves =true;//是否上架
	
	@Column
	private Boolean isSpecial =false;//是否折扣
	
	@Column
	private Float  special;//打几折
	
	@Column
	private  Boolean iscChoice = false;//是否精品
	
	@Column
	private  Boolean auction =false;//是否拍卖
	
	@ManyToOne
	@JoinColumn(name = "shopCategory_id")
	private ShopCategory shopCategory;//商品类别表
	
	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;//品牌表
	
	@ManyToOne
	@JoinColumn(name = "shop_id")
	private Shop belongTo;//商品所属店面
	
	@OneToMany(mappedBy = "shopCommoidty")
	private List<ShopCommImage> shopCommImages;//商品照片
	
	public Boolean getAuction() {
		return auction;
	}

	public void setAuction(Boolean auction) {
		this.auction = auction;
	}

	public String getCommSpec() {
		return commSpec;
	}

	public void setCommSpec(String commSpec) {
		this.commSpec = commSpec;
	}

	public String getCommoidtyName() {
		return commoidtyName;
	}

	public void setCommoidtyName(String commoidtyName) {
		this.commoidtyName = commoidtyName;
	}

	public List<ShopCommImage> getShopCommImages() {
		return shopCommImages;
	}

	public void setShopCommImages(List<ShopCommImage> shopCommImages) {
		this.shopCommImages = shopCommImages;
	}

	public ShopCategory getShopCategory() {
		return shopCategory;
	}

	public void setShopCategory(ShopCategory shopCategory) {
		this.shopCategory = shopCategory;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Integer getCommCode() {
		return commCode;
	}

	public void setCommCode(Integer commCode) {
		this.commCode = commCode;
	}

	public String getCommItem() {
		return commItem;
	}

	public void setCommItem(String commItem) {
		this.commItem = commItem;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public Shop getBelongTo() {
		return belongTo;
	}

	public void setBelongTo(Shop belongTo) {
		this.belongTo = belongTo;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getProportion() {
		return proportion;
	}

	public void setProportion(String proportion) {
		this.proportion = proportion;
	}

	public Float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Float getProbablyWeight() {
		return probablyWeight;
	}

	public void setProbablyWeight(Float probablyWeight) {
		this.probablyWeight = probablyWeight;
	}

	public Boolean getShelves() {
		return shelves;
	}

	public void setShelves(Boolean shelves) {
		this.shelves = shelves;
	}

	public Boolean getIsSpecial() {
		return isSpecial;
	}

	public void setIsSpecial(Boolean isSpecial) {
		this.isSpecial = isSpecial;
	}

	public Float getSpecial() {
		return special;
	}

	public void setSpecial(Float special) {
		this.special = special;
	}

	public Boolean getIscChoice() {
		return iscChoice;
	}

	public void setIscChoice(Boolean iscChoice) {
		this.iscChoice = iscChoice;
	}
	
}
