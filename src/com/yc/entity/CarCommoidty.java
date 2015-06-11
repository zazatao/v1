package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
@DiscriminatorValue("carcommoidty")//购物车商品
public class CarCommoidty {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private Integer commCode;//商品编码
	
	@Column
	private String commoidtyName;//商品名称
	
	@Column
	private String commItem;// 货号
	
	@Column
	private String supplier ;//供应商
	
	@Column
	private Integer proportion = 1;//显示比例
	
	@Column
	private Float  unitPrice =0f;//单价
	
	@Column
	private Float fare = 0f;//附加费
	
	@Column
	private Integer stock = 1 ;//库存总数量
	
	@Column(nullable = true)
	private Float  probablyWeight = 0f;//大概重量
	
	@Column
	private Boolean shelves =true;//是否上架
	
	@Column
	private Boolean isSpecial =false;//是否折扣
	
	@Column
	private Float  special  = 1f;//打几折
	
	@OneToOne
	@JoinColumn(name = "currency_id")
	private Currency currency;// 币种
	
	@Column
	private  Boolean iscChoice = false;//是否精品
	
	@Column
	private  Boolean auction =false;//是否拍卖
	
	@ManyToOne
	@JoinColumn(name = "shopCategory_id")
	private ShopCategory carCategory;//商品类别表
	
	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;//品牌表
	
	@ManyToOne
	@JoinColumn(name = "shop_id")
	private Shop carbelongTo;//商品所属店面
	
	@Column
	private String describes;//描述
	
	@Column
	private String russinaCommoidtyName;
	
	@Column
	private String imagePath;
	
	@Column
	private String russinaDescribes;
	
	

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getRussinaCommoidtyName() {
		return russinaCommoidtyName;
	}

	public void setRussinaCommoidtyName(String russinaCommoidtyName) {
		this.russinaCommoidtyName = russinaCommoidtyName;
	}

	public String getRussinaDescribes() {
		return russinaDescribes;
	}

	public void setRussinaDescribes(String russinaDescribes) {
		this.russinaDescribes = russinaDescribes;
	}

	public Float getFare() {
		return fare;
	}

	public void setFare(Float fare) {
		this.fare = fare;
	}

	public String getDescribes() {
		return describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCommCode() {
		return commCode;
	}

	public void setCommCode(Integer commCode) {
		this.commCode = commCode;
	}

	public String getCommoidtyName() {
		return commoidtyName;
	}

	public void setCommoidtyName(String commoidtyName) {
		this.commoidtyName = commoidtyName;
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

	public Integer getProportion() {
		return proportion;
	}

	public void setProportion(Integer proportion) {
		this.proportion = proportion;
	}

	public Float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
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

	public Currency getCurrency() {
		return currency;
	}

	public void setCurrency(Currency currency) {
		this.currency = currency;
	}

	public Boolean getIscChoice() {
		return iscChoice;
	}

	public void setIscChoice(Boolean iscChoice) {
		this.iscChoice = iscChoice;
	}

	public Boolean getAuction() {
		return auction;
	}

	public void setAuction(Boolean auction) {
		this.auction = auction;
	}

	public ShopCategory getCarCategory() {
		return carCategory;
	}

	public void setCarCategory(ShopCategory carCategory) {
		this.carCategory = carCategory;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Shop getCarbelongTo() {
		return carbelongTo;
	}

	public void setCarbelongTo(Shop carbelongTo) {
		this.carbelongTo = carbelongTo;
	}
	
}
