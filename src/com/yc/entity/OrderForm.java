package com.yc.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.yc.entity.user.User;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@DiscriminatorValue("orderform")
@JsonIgnoreProperties(value={"orderUser","commodities","address","packAge"})
public class OrderForm {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer orderFormID;

	@OneToMany(mappedBy = "orderNumber")
	private List<Commodity> commodities;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User orderUser;
	
	@Embedded
	private Address address;
	
	@Column
	@Enumerated(EnumType.STRING)
	private Delivery delivery;
	 
	@Column
	private String changeStatusDate;//状态改变日期
	
	@ManyToOne
	@JoinColumn(name = "package_id")
	private Package packAge;
	
	@Column
	private String orderDate;//下单日期
	
	@ManyToOne
	@JoinColumn(name = "orderGroup_id")
	private OrderGroup orderGroup;
	
	@Column
	private String paymentDate;//付款日期
	
	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public OrderGroup getOrderGroup() {
		return orderGroup;
	}

	public void setOrderGroup(OrderGroup orderGroup) {
		this.orderGroup = orderGroup;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public Package getPackAge() {
		return packAge;
	}

	public void setPackAge(Package packAge) {
		this.packAge = packAge;
	}

	public Delivery getDelivery() {
		return delivery;
	}

	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getChangeStatusDate() {
		return changeStatusDate;
	}

	public void setChangeStatusDate(String changeStatusDate) {
		this.changeStatusDate = changeStatusDate;
	}

	public Integer getOrderFormID() {
		return orderFormID;
	}

	public void setOrderFormID(Integer orderFormID) {
		this.orderFormID = orderFormID;
	}

	public List<Commodity> getCommodities() {
		return commodities;
	}

	public void setCommodities(List<Commodity> commodities) {
		this.commodities = commodities;
	}

	public User getOrderUser() {
		return orderUser;
	}

	public void setOrderUser(User orderUser) {
		this.orderUser = orderUser;
	}

}
