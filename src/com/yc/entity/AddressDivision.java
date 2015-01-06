package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//地理位置区划
@Entity
public class AddressDivision {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer addressDivID;
	
	@Column
	private Integer  parentNode;
	
	@Column
	private Integer  nodeRank;
	
	@Column
	private Integer addressCode;
	
	@Column(length = 50)
    private String  geogDesignation;

	public Integer getAddressDivID() {
		return addressDivID;
	}

	public void setAddressDivID(Integer addressDivID) {
		this.addressDivID = addressDivID;
	}

	public Integer getParentNode() {
		return parentNode;
	}

	public void setParentNode(Integer parentNode) {
		this.parentNode = parentNode;
	}

	public Integer getNodeRank() {
		return nodeRank;
	}

	public void setNodeRank(Integer nodeRank) {
		this.nodeRank = nodeRank;
	}

	public Integer getAddressCode() {
		return addressCode;
	}

	public void setAddressCode(Integer addressCode) {
		this.addressCode = addressCode;
	}

	public String getGeogDesignation() {
		return geogDesignation;
	}

	public void setGeogDesignation(String geogDesignation) {
		this.geogDesignation = geogDesignation;
	}
	
}
