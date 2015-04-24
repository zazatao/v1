package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.yc.entity.user.User;

@Entity
@DiscriminatorValue("promotioncode")//鉴别字段，促销码表
public class PromotionCode {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column(length = 32, unique = true , nullable = false)
	private String code;
	
	@Column
	private String description;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setId( Integer id )
	{
		this.id = id;
	}
	
	public Integer getId()
	{
		return this.id;
	}
	
	public void setCode( String code )
	{
		this.code = code;
	}
	
	public String getCode()
	{
		return this.code;
	}
	
	public void setDescription( String description )
	{
		this.description = description;
	}
	
	public String getDescription()
	{
		return this.description;
	}
}
