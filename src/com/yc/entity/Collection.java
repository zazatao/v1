package com.yc.entity;

import java.util.List;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("collection")
public class Collection {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@OneToMany(mappedBy = "collection" )
	private List<ShopCommoidty> shopCommoidtyList;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<ShopCommoidty> getShopComm() {
		return shopCommoidtyList;
	}

	public void setShopComm(List<ShopCommoidty> shopComm) {
		this.shopCommoidtyList = shopComm;
	}
}
