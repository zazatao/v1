
package com.yc.entity.user;

import java.util.List;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.yc.entity.Commodity;
import com.yc.entity.OrderForm;
import com.yc.entity.UnKnownCommodity;

@Entity
@DiscriminatorValue("user")
@JsonIgnoreProperties(value={"unCommOperators","commOperators","purchases","orderForms"})
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
    
    @OneToMany(mappedBy = "operator")
    private List<UnKnownCommodity> unCommOperators ;
    
    @OneToMany(mappedBy = "storeOperator")
    private List<Commodity> commOperators ;
    
    @OneToMany(mappedBy = "purchase")
    private List<Commodity> purchases ;
    
    @OneToMany(mappedBy = "orderUser")
    private List<OrderForm> orderForms;

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Commodity> getPurchases() {
		return purchases;
	}

	public void setPurchases(List<Commodity> purchases) {
		this.purchases = purchases;
	}

	public List<OrderForm> getOrderForms() {
		return orderForms;
	}

	public void setOrderForms(List<OrderForm> orderForms) {
		this.orderForms = orderForms;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public List<UnKnownCommodity> getUnCommOperators() {
		return unCommOperators;
	}

	public void setUnCommOperators(List<UnKnownCommodity> unCommOperators) {
		this.unCommOperators = unCommOperators;
	}

	public List<Commodity> getCommOperators() {
		return commOperators;
	}

	public void setCommOperators(List<Commodity> commOperators) {
		this.commOperators = commOperators;
	}

}
