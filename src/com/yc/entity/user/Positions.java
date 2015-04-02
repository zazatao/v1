package com.yc.entity.user;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
//职位
@Entity
@DiscriminatorValue("position")
public class Positions {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer positionid;// 职位ID；

	@Column(length = 32)
	private String positionname;// 职位名称；

	@ManyToOne
	@JoinColumn(name = "department_id")
	private Department department;

	@Column
	private String significance;

	@ManyToMany(mappedBy = "positions")
	private List<Personnel> personnels;
	
	@ManyToOne(cascade = {CascadeType.MERGE,CascadeType.DETACH,CascadeType.PERSIST,CascadeType.REFRESH}, fetch = FetchType.EAGER)
	@JoinColumn(name = "parentLevel")
	private Positions parentLevel;//父节点；
	
	@OneToMany(mappedBy = "parentLevel",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Positions> children = new ArrayList<Positions>();

	public Positions getParentLevel() {
		return parentLevel;
	}

	public void setParentLevel(Positions parentLevel) {
		this.parentLevel = parentLevel;
	}

	public List<Positions> getChildren() {
		return children;
	}

	public void setChildren(List<Positions> children) {
		this.children = children;
	}

	public String getSignificance() {
		return significance;
	}

	public void setSignificance(String significance) {
		this.significance = significance;
	}

	public List<Personnel> getPersonnels() {
		return personnels;
	}

	public void setPersonnels(List<Personnel> personnels) {
		this.personnels = personnels;
	}

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
}
