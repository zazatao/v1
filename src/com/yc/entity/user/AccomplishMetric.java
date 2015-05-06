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
@DiscriminatorValue("accomplishMetric")//员工
public class AccomplishMetric {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private String accomplishDate;
	
	@Column
	private Integer accomplishNum;
	
	@ManyToOne
	@JoinColumn(name = "personnel_id")
	private Personnel personnel;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccomplishDate() {
		return accomplishDate;
	}

	public void setAccomplishDate(String accomplishDate) {
		this.accomplishDate = accomplishDate;
	}

	public Integer getAccomplishNum() {
		return accomplishNum;
	}

	public void setAccomplishNum(Integer accomplishNum) {
		this.accomplishNum = accomplishNum;
	}

	public Personnel getPersonnel() {
		return personnel;
	}

	public void setPersonnel(Personnel personnel) {
		this.personnel = personnel;
	}
	
}
