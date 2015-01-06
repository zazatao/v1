package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@DiscriminatorValue("packageSize")
@JsonIgnoreProperties(value={"packAge"})
public class PackageSize {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer sizeID;
	
	@Column
	private String size;
	
	@Column
	private Double l;//长
	
	@Column
	private Double w;//宽
	
	@Column
	private Double h;//高
	
	@OneToOne(mappedBy = "packageSize")
	private Package packAge;

	public Package getPackAge() {
		return packAge;
	}

	public void setPackAge(Package packAge) {
		this.packAge = packAge;
	}

	public Integer getSizeID() {
		return sizeID;
	}

	public void setSizeID(Integer sizeID) {
		this.sizeID = sizeID;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Double getL() {
		return l;
	}

	public void setL(Double l) {
		this.l = l;
	}

	public Double getW() {
		return w;
	}

	public void setW(Double w) {
		this.w = w;
	}

	public Double getH() {
		return h;
	}

	public void setH(Double h) {
		this.h = h;
	}
}
