package com.yc.model;

public class PersonnelStatistics {

	private String userName;
	private String depart;
	private String pos;
	private Integer accomplishNum;
	private String accomplishDate;
	private Integer rules;
	private Double wage;
	private Double saleCut;

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getPos() {
		return pos;
	}

	public void setPos(String pos) {
		this.pos = pos;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getAccomplishNum() {
		return accomplishNum;
	}

	public void setAccomplishNum(Integer accomplishNum) {
		this.accomplishNum = accomplishNum;
	}

	public String getAccomplishDate() {
		return accomplishDate;
	}

	public void setAccomplishDate(String accomplishDate) {
		this.accomplishDate = accomplishDate;
	}

	public Integer getRules() {
		return rules;
	}

	public void setRules(Integer rules) {
		this.rules = rules;
	}

	public Double getWage() {
		return wage;
	}

	public void setWage(Double wage) {
		this.wage = wage;
	}

	public Double getSaleCut() {
		return saleCut;
	}

	public void setSaleCut(Double saleCut) {
		this.saleCut = saleCut;
	}

}
