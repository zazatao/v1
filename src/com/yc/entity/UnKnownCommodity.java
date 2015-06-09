package com.yc.entity;

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

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.yc.entity.user.Personnel;

@Entity
@DiscriminatorValue("unknowncommodity")
@JsonIgnoreProperties(value={"operator"})
public class UnKnownCommodity {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Integer code;

	@ManyToOne
	@JoinColumn(name = "from_personnel")//操作员
	private Personnel operator;

	@Column
	private Integer amountNum;//数量

	@Column
	private String category;//类型

	@Column(length = 255)
	private String comment;//原因
	
	@OneToMany(mappedBy = "unKnownComm")
	private List<ImagePath> imagePaths;//图片路径
	
	

	public List<ImagePath> getImagePaths() {
		return imagePaths;
	}

	public void setImagePaths(List<ImagePath> imagePaths) {
		this.imagePaths = imagePaths;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Personnel getOperator() {
		return operator;
	}

	public void setOperator(Personnel operator) {
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
