package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
@DiscriminatorValue("currency")//鉴别字段，币种表
public class Currency {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column(length = 32, unique = true , nullable = false)
	private String type;
	
	//缩写
	@Column
	private String abbreviation;
	
	//符号
	@Column
	private String symbol;
	
	@OneToOne(mappedBy = "currency")
	private Commodity commodity;
	
	@OneToOne(mappedBy = "currency")
	private CarCommoidty carcommodity;
	
	@OneToOne(mappedBy = "currency")
	private ShopCommoidty shopCommoidty;

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public CarCommoidty getCarcommodity() {
		return carcommodity;
	}

	public void setCarcommodity(CarCommoidty carcommodity) {
		this.carcommodity = carcommodity;
	}

	public ShopCommoidty getShopCommoidty() {
		return shopCommoidty;
	}

	public void setShopCommoidty(ShopCommoidty shopCommoidty) {
		this.shopCommoidty = shopCommoidty;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
}
