package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.yc.entity.user.DepartAndPositions;

@Entity
@DiscriminatorValue("ticket")
// 票的类型
public class Ticket {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer brandID;

	@Column
	private String ticketName;// 名称
	
	@OneToOne(mappedBy = "ticket")
	private DepartAndPositions departAndPositions;

	public Integer getBrandID() {
		return brandID;
	}

	public void setBrandID(Integer brandID) {
		this.brandID = brandID;
	}

	public String getTicketName() {
		return ticketName;
	}

	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}
	@JsonIgnore
	public DepartAndPositions getDepartAndPositions() {
		return departAndPositions;
	}
	@JsonIgnore
	public void setDepartAndPositions(DepartAndPositions departAndPositions) {
		this.departAndPositions = departAndPositions;
	}

}
