package com.yc.entity.user;

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

import com.yc.entity.Commodity;
import com.yc.entity.OrderForm;
import com.yc.entity.TransitSite;
import com.yc.entity.UnKnownCommodity;

@Entity
@DiscriminatorValue("personnel")//员工
public class Personnel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(length = 32, unique = true, updatable = false)
	private String loginName;

	@Column(length = 32)
	private String password;

	@Column(length = 32)
	private String userName;

	@Column
	private String email;
	
	@Column
	@Enumerated(EnumType.STRING)
	private Sex sex;

	@Column
	private String phone;
	
	@ManyToOne
	@JoinColumn(name = "depAndPos_id")
	private DepartAndPositions departAndPositions;//部门

	@Column
	private Integer accomplishNum;//完成订单数
	
	@OneToMany(mappedBy = "storeOperator")
    private List<Commodity> commOperators ;//仓库接收订单
	
    @OneToMany(mappedBy = "operator")
    private List<UnKnownCommodity> unCommOperators ;
    
    @OneToMany(mappedBy = "purchase")
    private List<Commodity> purchases ;//采购接收订单
    
    @OneToMany(mappedBy = "orderUser")
	private List<OrderForm> orderForms;//用户订单
    
    @OneToMany(mappedBy = "personnel")
    private List<TransitSite> transitSites;

	public DepartAndPositions getDepartAndPositions() {
		return departAndPositions;
	}

	public void setDepartAndPositions(DepartAndPositions departAndPositions) {
		this.departAndPositions = departAndPositions;
	}

	public List<TransitSite> getTransitSites() {
		return transitSites;
	}

	public void setTransitSites(List<TransitSite> transitSites) {
		this.transitSites = transitSites;
	}

	public List<Commodity> getCommOperators() {
		return commOperators;
	}

	public List<Commodity> getPurchases() {
		return purchases;
	}

	public void setCommOperators(List<Commodity> commOperators) {
		this.commOperators = commOperators;
	}

	public void setPurchases(List<Commodity> purchases) {
		this.purchases = purchases;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Sex getSex() {
		return sex;
	}

	public void setSex(Sex sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getAccomplishNum() {
		return accomplishNum;
	}

	public void setAccomplishNum(Integer accomplishNum) {
		this.accomplishNum = accomplishNum;
	}

	public List<UnKnownCommodity> getUnCommOperators() {
		return unCommOperators;
	}

	public void setUnCommOperators(List<UnKnownCommodity> unCommOperators) {
		this.unCommOperators = unCommOperators;
	}

	public List<OrderForm> getOrderForms() {
		return orderForms;
	}

	public void setOrderForms(List<OrderForm> orderForms) {
		this.orderForms = orderForms;
	}
	
}
