package com.yc.entity.user;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@DiscriminatorValue("position")//职位
public class Position {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer positionid;//职位ID；
	
	@Column(length = 32)
    private String positionname;//职位名称；
	
	@ManyToOne
    @JoinColumn(name = "department_id")
	private Department department;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User commUser;
	
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Integer getPositionid() {
		return positionid;
	}
	public void setPositionid(Integer positionid) {
		this.positionid = positionid;
	}
	public String getPositionname() {
		return positionname;
	}
	public void setPositionname(String positionname) {
		this.positionname = positionname;
	}
	public User getCommUser() {
		return commUser;
	}
	public void setCommUser(User commUser) {
		this.commUser = commUser;
	}
}
