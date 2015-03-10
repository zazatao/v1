package com.yc.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@DiscriminatorValue("Specifications")//货品规格属性类
@JsonIgnoreProperties(value = { "shopCommoidties", "shopCategories"})
public class Specifications {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private String specificatName;//类别名
	
	@Column
	private String attribute;//属性名

	@ManyToMany(cascade = CascadeType.ALL)
	private List<ShopCategory> shopCategories;

	public List<ShopCategory> getShopCategories() {
		return shopCategories;
	}

	public void setShopCategories(List<ShopCategory> shopCategories) {
		this.shopCategories = shopCategories;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSpecificatName() {
		return specificatName;
	}

	public void setSpecificatName(String specificatName) {
		this.specificatName = specificatName;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}
	
}
