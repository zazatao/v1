package com.yc.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("adverDistribution")
public class AdvertiseDistribution {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer adverDisId;
	
	@Column
	@Enumerated(EnumType.STRING)
	private AdvertisementPage whichPage;
	
	@Column
	private Integer position;
	
	@Column
	private Integer num;

	@OneToMany(mappedBy = "adverDistribution")
	private List<Advertisement> advertisementList;

	public Integer getId() {
		return adverDisId;
	}

	public void setId(Integer adverDisId) {
		this.adverDisId = adverDisId;
	}

	public AdvertisementPage getWhichPage() {
		return whichPage;
	}

	public void setWhichPage(AdvertisementPage whichPage) {
		this.whichPage = whichPage;
	}
	
	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public List<Advertisement> getAdvertisementList() {
		return advertisementList;
	}

	public void setAdvertisementList(List<Advertisement> advertisementList) {
		this.advertisementList = advertisementList;
	}
	
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

}
