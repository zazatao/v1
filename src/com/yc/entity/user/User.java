package com.yc.entity.user;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.yc.entity.Address;
import com.yc.entity.OrderForm;
import com.yc.entity.StoreRoom;
import com.yc.entity.UnKnownCommodity;
@Entity
@DiscriminatorValue("user")//用户
@JsonIgnoreProperties(value = { "unCommOperators", "commOperators", "purchases", "orderForms","address" })
public class User {

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
	private String phone;

	@OneToMany(mappedBy = "user")
	private List<Address> addresses;//用户邮寄地址
	
	@Column(unique = true, updatable = false)
	private String personalAccount;//个人账户
	
	@OneToMany(mappedBy = "commUser")
    private List<Position> positions; //职位
	
	@Column
	private Integer accomplishNum;//完成订单数
	
	@OneToMany(mappedBy = "storeOperator")
    private List<OrderForm> commOperators ;//仓库接收订单
	
    @OneToMany(mappedBy = "operator")
    private List<UnKnownCommodity> unCommOperators ;
    
    @OneToMany(mappedBy = "purchase")
    private List<OrderForm> purchases ;//采购接收订单
    
    @OneToMany(mappedBy = "orderUser")
	private List<OrderForm> orderForms;//用户订单
	
	@OneToOne
	@JoinColumn(name = "storeRoom_id")
	private StoreRoom storeRoom;

	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public String getPersonalAccount() {
		return personalAccount;
	}

	public void setPersonalAccount(String personalAccount) {
		this.personalAccount = personalAccount;
	}

	public List<Position> getPositions() {
		return positions;
	}

	public void setPositions(List<Position> positions) {
		this.positions = positions;
	}

	public List<OrderForm> getOrderForms() {
		return orderForms;
	}

	public void setOrderForms(List<OrderForm> orderForms) {
		this.orderForms = orderForms;
	}

	public StoreRoom getStoreRoom() {
		return storeRoom;
	}

	public void setStoreRoom(StoreRoom storeRoom) {
		this.storeRoom = storeRoom;
	}

	public List<UnKnownCommodity> getUnCommOperators() {
		return unCommOperators;
	}

	public void setUnCommOperators(List<UnKnownCommodity> unCommOperators) {
		this.unCommOperators = unCommOperators;
	}

	public List<OrderForm> getCommOperators() {
		return commOperators;
	}

	public void setCommOperators(List<OrderForm> commOperators) {
		this.commOperators = commOperators;
	}

	public List<OrderForm> getPurchases() {
		return purchases;
	}

	public void setPurchases(List<OrderForm> purchases) {
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
	
}
