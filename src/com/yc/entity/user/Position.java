package com.yc.entity.user;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@DiscriminatorValue("position")//职位

public class Position {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer positionid;//职位ID；
	
	@Column(length = 32)
    private String positionname;//职位名称；
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
}
