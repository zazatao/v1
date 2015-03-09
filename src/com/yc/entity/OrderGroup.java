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

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@DiscriminatorValue("ordergroup")
@JsonIgnoreProperties(value={"orderForms"})
public class OrderGroup {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer orderGroupID;
	
	@Column
	private String sale;//销售
	
	@Column
	private Integer taskNumber;//任务号
	
	@Column
	private String alipayPay;//支付宝支付
	
	@Column
	private Float sumOfMoney;//金额
	
	@Column
	@Enumerated(EnumType.STRING)
	private OrderStatus groupStatus;
	
	@Column
	private String pay;//支付
	
	@OneToMany(mappedBy = "orderGroup")
	private List<OrderForm> orderForms;

	public Integer getOrderGroupID() {
		return orderGroupID;
	}

	public void setOrderGroupID(Integer orderGroupID) {
		this.orderGroupID = orderGroupID;
	}

	public String getSale() {
		return sale;
	}

	public void setSale(String sale) {
		this.sale = sale;
	}

	public Integer getTaskNumber() {
		return taskNumber;
	}

	public void setTaskNumber(Integer taskNumber) {
		this.taskNumber = taskNumber;
	}

	public String getAlipayPay() {
		return alipayPay;
	}

	public void setAlipayPay(String alipayPay) {
		this.alipayPay = alipayPay;
	}

	public Float getSumOfMoney() {
		return sumOfMoney;
	}

	public void setSumOfMoney(Float sumOfMoney) {
		this.sumOfMoney = sumOfMoney;
	}

	public OrderStatus getGroupStatus() {
		return groupStatus;
	}

	public void setGroupStatus(OrderStatus groupStatus) {
		this.groupStatus = groupStatus;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public List<OrderForm> getOrderForms() {
		return orderForms;
	}

	public void setOrderForms(List<OrderForm> orderForms) {
		this.orderForms = orderForms;
	}
	
}
