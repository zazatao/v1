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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("cargoGroup")
public class CargoGroup {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer cargoGroupID;
	
	@Column
	private String tpekCargoGroup; 

	@OneToMany(mappedBy = "cargoGroup")
	private List<Package> packAges;
	
	@ManyToOne
	@JoinColumn(name = "transitSiteID")
	private TransitSite transitSte;
	
	@Column
	private Double totalWeight;
	
	@Column
	@Enumerated(EnumType.STRING)
	private Transit transit;//中转地
	
	@Column
	@Enumerated(EnumType.STRING)
	private Delivery delivery;
	
	@Column
	@Enumerated(EnumType.STRING)
	private CommoidityStatus status;// 状态
	
	@Column
	private String createDate;
	
	@Column
	private String sendDate;//发货日期

	@Column
	private String receiveDate;//收货日期
	
	@Column
	private String lateDays;//晚点天数
	
	@Column
	private Float compensation;//赔付金额

	public TransitSite getTransitSte() {
		return transitSte;
	}

	public void setTransitSte(TransitSite transitSte) {
		this.transitSte = transitSte;
	}

	public String getTpekCargoGroup() {
		return tpekCargoGroup;
	}

	public void setTpekCargoGroup(String tpekCargoGroup) {
		this.tpekCargoGroup = tpekCargoGroup;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public Float getCompensation() {
		return compensation;
	}

	public void setCompensation(Float compensation) {
		this.compensation = compensation;
	}

	public String getLateDays() {
		return lateDays;
	}

	public void setLateDays(String lateDays) {
		this.lateDays = lateDays;
	}

	public String getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}

	public Integer getCargoGroupID() {
		return cargoGroupID;
	}

	public void setCargoGroupID(Integer cargoGroupID) {
		this.cargoGroupID = cargoGroupID;
	}

	public List<Package> getPackAges() {
		return packAges;
	}

	public void setPackAges(List<Package> packAges) {
		this.packAges = packAges;
	}

	public Double getTotalWeight() {
		return totalWeight;
	}

	public void setTotalWeight(Double totalWeight) {
		this.totalWeight = totalWeight;
	}

	public Transit getTransit() {
		return transit;
	}

	public void setTransit(Transit transit) {
		this.transit = transit;
	}

	public Delivery getDelivery() {
		return delivery;
	}

	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}

	public CommoidityStatus getStatus() {
		return status;
	}

	public void setStatus(CommoidityStatus status) {
		this.status = status;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	
}
