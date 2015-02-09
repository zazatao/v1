package com.yc.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@DiscriminatorValue("shopCategory")//商品类别表
@JsonIgnoreProperties(value = { "shops", "shopCommoidties", "brands", "specifications" })
public class ShopCategory {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer categoryID;//列别ID
	
	@Column
	private String category;//商品类名;
	
	@Column
	private Integer level;//节点级别
	
	@Column
	private Integer parentLevel;//父节点；
	
	@OneToMany(mappedBy = "shopCat")
	private List<Shop>  shops;//商店
	
	@OneToMany(mappedBy = "shopCategory")
	private List<ShopCommoidty>  shopCommoidties;//商品

	@OneToMany(mappedBy = "shopCateg")
	private List<Brand> brands;//品牌
	
	@ManyToMany(mappedBy = "shopCategories")
	private List<Specifications> specifications;//规格

	public List<Specifications> getSpecifications() {
		return specifications;
	}

	public void setSpecifications(List<Specifications> specifications) {
		this.specifications = specifications;
	}

	public List<Shop> getShops() {
		return shops;
	}

	public void setShops(List<Shop> shops) {
		this.shops = shops;
	}

	public List<ShopCommoidty> getShopCommoidties() {
		return shopCommoidties;
	}

	public void setShopCommoidties(List<ShopCommoidty> shopCommoidties) {
		this.shopCommoidties = shopCommoidties;
	}

	public List<Brand> getBrands() {
		return brands;
	}

	public void setBrands(List<Brand> brands) {
		this.brands = brands;
	}

	public Integer getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(Integer categoryID) {
		this.categoryID = categoryID;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getParentLevel() {
		return parentLevel;
	}

	public void setParentLevel(Integer parentLevel) {
		this.parentLevel = parentLevel;
	}
	
}
