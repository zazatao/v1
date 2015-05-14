package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@DiscriminatorValue("advertisement")
public class Advertisement {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private String imagePath;
	
	@Column
	private String link;

	@Column
	private int expenditure;
	
	@Column
	private int income;
	
	@Column
	private String startDate;
	
	@Column
	private int during;
	
	@ManyToOne
	@JoinColumn( name = "adverDistribution_id" )
	private AdvertiseDistribution adverDistribution;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	public String getLink() {
		return link;
	}

	public void setLink(String chinaLink) {
		this.link = chinaLink;
	}
	
	public AdvertiseDistribution getAdverDistribution() {
		return adverDistribution;
	}

	public void setAdverDistribution(AdvertiseDistribution adverDistribution) {
		this.adverDistribution = adverDistribution;
	}
	
	public int getExpenditure() {
		return expenditure;
	}

	public void setExpenditure(int expenditure) {
		this.expenditure = expenditure;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public int getDuring() {
		return during;
	}

	public void setDuring(int during) {
		this.during = during;
	}

	
}
