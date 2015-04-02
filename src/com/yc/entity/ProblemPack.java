package com.yc.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.yc.entity.user.User;

@Entity
@DiscriminatorValue("problemPack")
public class ProblemPack {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer problemPackID;
	
	@OneToOne
	@JoinColumn(name = "package_id")
	private Package package1;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public Integer getProblemPackID() {
		return problemPackID;
	}

	public void setProblemPackID(Integer problemPackID) {
		this.problemPackID = problemPackID;
	}

	public Package getPackage1() {
		return package1;
	}

	public void setPackage1(Package package1) {
		this.package1 = package1;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
