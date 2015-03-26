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

import com.yc.entity.user.Personnel;

@Entity
@DiscriminatorValue("transitSite")
public class TransitSite {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer transitSiteID;
	
	@Column
	private String receiveDate;
	
	@Column
	private String sendDate;
	
	@OneToMany(mappedBy = "transitSte")
	private List<Package> packages;
	
	@OneToMany(mappedBy = "transitSte")
	private List<CargoGroup> cargoGroups;
	
	@ManyToOne
	@JoinColumn(name = "store_user")
	private Personnel personnel;

	public Integer getTransitSiteID() {
		return transitSiteID;
	}

	public void setTransitSiteID(Integer transitSiteID) {
		this.transitSiteID = transitSiteID;
	}

	public String getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public List<Package> getPackages() {
		return packages;
	}

	public void setPackages(List<Package> packages) {
		this.packages = packages;
	}

	public List<CargoGroup> getCargoGroups() {
		return cargoGroups;
	}

	public void setCargoGroups(List<CargoGroup> cargoGroups) {
		this.cargoGroups = cargoGroups;
	}

	public Personnel getPersonnel() {
		return personnel;
	}

	public void setPersonnel(Personnel personnel) {
		this.personnel = personnel;
	}
	
}
