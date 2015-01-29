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
@DiscriminatorValue("shopCategory")//商品类别表
public class ShopCategory {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer categoryID;//列别ID
	
	@Column
	private String category;//商品名称;
	
	@Column
	private Integer level;//节点级别
	
	@Column
	private Integer parentLevel;//父节点；

	@OneToMany(mappedBy = "shopCategory")
	private List<ShopCommoidty>  shopCommoidties;//商品

	@OneToMany(mappedBy = "shopCateg")
	private List<Brand> brands;//品牌
	
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
