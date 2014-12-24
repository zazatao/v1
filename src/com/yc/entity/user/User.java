
package com.yc.entity.user;

import java.util.List;

import javax.persistence.*;

import com.yc.entity.UnKnownCommodity;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorValue("user")
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
    
    @OneToMany(mappedBy = "operator")
    private List<UnKnownCommodity> operators ;

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

	public List<UnKnownCommodity> getOperators() {
		return operators;
	}

	public void setOperators(List<UnKnownCommodity> operators) {
		this.operators = operators;
	}
 
}
