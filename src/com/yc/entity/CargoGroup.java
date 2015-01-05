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
@DiscriminatorValue("cargoGroup")
public class CargoGroup {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer cargoGroupID;

	@OneToMany(mappedBy = "cargoGroup")
	private List<Package> packAges;
	
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
	private OrderStatus status;// 状态
	
	@Column
	private String sendDate;//发货日期

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

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	
}
