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
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@DiscriminatorValue("package")
@JsonIgnoreProperties(value={"packageSize","orderForms","storeOperator"})
public class Package {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer packageID;
	
	@Column
	private String packageCode;
	
	@Column
	@Enumerated(EnumType.STRING)
	private Delivery delivery;
	
	@Column(unique=true)
	private String packAgeTpek;//货物编号
	
	@Column
	private Double totalWeight;//总重量
	
	@Column
	private Double grossWeight;//毛重量
	
	@OneToMany(mappedBy = "packAge")
	private List<OrderForm> orderForms;
	
	@Column
	private String sendDate;//发货日期
	
	@Column
	private String tpekDate;//追踪日期
	
	@Column
	private Float transportFee;//运输费
	
	@Column
	private String traffic;//交通方式
	
	@Column
	@Enumerated(EnumType.STRING)
	private Transit transit;//中转地
	
	@ManyToOne
	@JoinColumn(name = "from_cargoGroup")
	private CargoGroup cargoGroup;
	
	@ManyToOne
	@JoinColumn(name = "transitSiteID")
	private TransitSite transitSte;
	
	@Column
	private Boolean isClearing = false;//是否结算
	
	@Column
	private Boolean isFee = false;//运费已付
	
	@OneToOne(mappedBy = "package1")
	private ProblemPack problemPack;

	public ProblemPack getProblemPack() {
		return problemPack;
	}

	public void setProblemPack(ProblemPack problemPack) {
		this.problemPack = problemPack;
	}

	public TransitSite getTransitSte() {
		return transitSte;
	}

	public void setTransitSte(TransitSite transitSte) {
		this.transitSte = transitSte;
	}

	public Boolean getIsClearing() {
		return isClearing;
	}

	public void setIsClearing(Boolean isClearing) {
		this.isClearing = isClearing;
	}

	public Boolean getIsFee() {
		return isFee;
	}

	public void setIsFee(Boolean isFee) {
		this.isFee = isFee;
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

	public CargoGroup getCargoGroup() {
		return cargoGroup;
	}

	public void setCargoGroup(CargoGroup cargoGroup) {
		this.cargoGroup = cargoGroup;
	}

	public Float getTransportFee() {
		return transportFee;
	}

	public void setTransportFee(Float transportFee) {
		this.transportFee = transportFee;
	}

	public String getPackAgeTpek() {
		return packAgeTpek;
	}

	public void setPackAgeTpek(String packAgeTpek) {
		this.packAgeTpek = packAgeTpek;
	}

	public String getTpekDate() {
		return tpekDate;
	}

	public void setTpekDate(String tpekDate) {
		this.tpekDate = tpekDate;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public Double getTotalWeight() {
		return totalWeight;
	}

	public void setTotalWeight(Double totalWeight) {
		this.totalWeight = totalWeight;
	}

	public Double getGrossWeight() {
		return grossWeight;
	}

	public void setGrossWeight(Double grossWeight) {
		this.grossWeight = grossWeight;
	}

	public String getPackageCode() {
		return packageCode;
	}

	public void setPackageCode(String packageCode) {
		this.packageCode = packageCode;
	}

	public Integer getPackageID() {
		return packageID;
	}

	public void setPackageID(Integer packageID) {
		this.packageID = packageID;
	}

	public List<OrderForm> getOrderForms() {
		return orderForms;
	}

	public void setOrderForms(List<OrderForm> orderForms) {
		this.orderForms = orderForms;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

}
