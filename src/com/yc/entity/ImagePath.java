package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
@DiscriminatorValue("imagePath")
public class ImagePath {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Integer imageId;
	
	@ManyToOne
	private UnKnownCommodity unKnownComm;
	
	@Column
	private String path;

	public Integer getImageId() {
		return imageId;
	}

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

	public UnKnownCommodity getUnKnownComm() {
		return unKnownComm;
	}

	public void setUnKnownComm(UnKnownCommodity unKnownComm) {
		this.unKnownComm = unKnownComm;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	
}
