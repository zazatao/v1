package com.yc.entity.user;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.yc.entity.Ticket;

@Entity
@DiscriminatorValue("departAndPositions")
public class DepartAndPositions {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "departments_id")
	private Department department;
	
	@ManyToOne
	@JoinColumn(name = "positions_id")
	private Positions positions;
	
	@OneToOne
	@JoinColumn(name = "ticket_id")
	private Ticket ticket;
	
	@Column
	private Double wage;// 工资
	
	@Column
	private Integer rules;// 规则
	
	@Column
	private Integer saleCut;// 提成
	
	@OneToMany(mappedBy = "departAndPositions")
	private List<Personnel> personnels;

	public Double getWage() {
		return wage;
	}

	public void setWage(Double wage) {
		this.wage = wage;
	}

	public Integer getRules() {
		return rules;
	}

	public void setRules(Integer rules) {
		this.rules = rules;
	}

	public Integer getSaleCut() {
		return saleCut;
	}

	public void setSaleCut(Integer saleCut) {
		this.saleCut = saleCut;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Positions getPositions() {
		return positions;
	}

	public void setPositions(Positions positions) {
		this.positions = positions;
	}

	public Ticket getTicket() {
		return ticket;
	}

	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}

	public List<Personnel> getPersonnels() {
		return personnels;
	}

	public void setPersonnels(List<Personnel> personnels) {
		this.personnels = personnels;
	}
	
}
