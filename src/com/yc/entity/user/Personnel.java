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

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.yc.entity.Commodity;
import com.yc.entity.OrderForm;
import com.yc.entity.TransitSite;
import com.yc.entity.UnKnownCommodity;

@Entity
@DiscriminatorValue("personnel")//员工
@JsonIgnoreProperties(value = { "commOperators", "unCommOperators", "purchases", "orderForms" ,"transitSites"})
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

	@OneToMany(mappedBy = "personnel")
	private List<AccomplishMetric> accomplishNum;//完成订单数
	
	@Column
	private String forbidden;//

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
	@JsonIgnore
	public List<TransitSite> getTransitSites() {
		return transitSites;
	}
	@JsonIgnore
	public void setTransitSites(List<TransitSite> transitSites) {
		this.transitSites = transitSites;
	}
	@JsonIgnore
	public List<Commodity> getCommOperators() {
		return commOperators;
	}
	@JsonIgnore
	public List<Commodity> getPurchases() {
		return purchases;
	}
	@JsonIgnore
	public void setCommOperators(List<Commodity> commOperators) {
		this.commOperators = commOperators;
	}
	@JsonIgnore
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

	public List<AccomplishMetric> getAccomplishNum() {
		return accomplishNum;
	}

	public void setAccomplishNum(List<AccomplishMetric> accomplishNum) {
		this.accomplishNum = accomplishNum;
	}

	@JsonIgnore
	public List<UnKnownCommodity> getUnCommOperators() {
		return unCommOperators;
	}
	@JsonIgnore
	public void setUnCommOperators(List<UnKnownCommodity> unCommOperators) {
		this.unCommOperators = unCommOperators;
	}
	@JsonIgnore
	public List<OrderForm> getOrderForms() {
		return orderForms;
	}
	@JsonIgnore
	public void setOrderForms(List<OrderForm> orderForms) {
		this.orderForms = orderForms;
	}

	public String getForbidden() {
		return forbidden;
	}

	public void setForbidden(String forbidden) {
		this.forbidden = forbidden;
	}
	
}
