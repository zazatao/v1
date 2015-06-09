package com.yc.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("packageSize")
public class PackageSize {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer sizeID;
	
	@Column
	private String genre;//类型
	
	@OneToMany(mappedBy = "packageSize")
	private List<PackageGenre> packageGenres;//材料
	
	public List<PackageGenre> getPackageGenres() {
		return packageGenres;
	}

	public void setPackageGenres(List<PackageGenre> packageGenres) {
		this.packageGenres = packageGenres;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public Integer getSizeID() {
		return sizeID;
	}

	public void setSizeID(Integer sizeID) {
		this.sizeID = sizeID;
	}

}
