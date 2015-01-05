package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.yc.entity.user.User;

@Entity
@DiscriminatorValue("unknowncommodity")
@JsonIgnoreProperties(value={"operator"})
public class UnKnownCommodity {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Integer code;

	@ManyToOne
	@JoinColumn(name = "from_user")
	private User operator;

	@Column
	private Integer amountNum;

	@Column
	private String category;

	@Column(length = 255)
	private String comment;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public User getOperator() {
		return operator;
	}

	public void setOperator(User operator) {
		this.operator = operator;
	}

	public Integer getAmountNum() {
		return amountNum;
	}

	public void setAmountNum(Integer amountNum) {
		this.amountNum = amountNum;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}
