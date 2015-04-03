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

//部门
@Entity
@DiscriminatorValue("department")
public class Department {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer departmentID;// 部门ID

	@Column(length = 32)
	private String departmentname;// 部门名称

	@Column
	private String describes; // 描述

	@ManyToMany(cascade = CascadeType.REFRESH)
	private List<Positions> positions;//部门角色
	
	@OneToMany(mappedBy = "department")
	private List<Personnel> personnels;//部门员工
	
	@ManyToOne(cascade = {CascadeType.MERGE,CascadeType.DETACH,CascadeType.PERSIST,CascadeType.REFRESH}, fetch = FetchType.EAGER)
	@JoinColumn(name = "parentLevel")
	private Department parentLevel;//父节点；
	
	@OneToMany(mappedBy = "parentLevel",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private List<Department> children = new ArrayList<Department>();

	public List<Personnel> getPersonnels() {
		return personnels;
	}

	public void setPersonnels(List<Personnel> personnels) {
		this.personnels = personnels;
	}

	public Department getParentLevel() {
		return parentLevel;
	}

	public void setParentLevel(Department parentLevel) {
		this.parentLevel = parentLevel;
	}

	public List<Department> getChildren() {
		return children;
	}

	public void setChildren(List<Department> children) {
		this.children = children;
	}

	public Integer getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(Integer departmentID) {
		this.departmentID = departmentID;
	}

	public String getDepartmentname() {
		return departmentname;
	}

	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}

	public String getDescribes() {
		return describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes;
	}

	public List<Positions> getPositions() {
		return positions;
	}

	public void setPositions(List<Positions> positions) {
		this.positions = positions;
	}

}
