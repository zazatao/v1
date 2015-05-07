package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.yc.entity.user.User;

@Entity
@DiscriminatorValue("shopreviews")
@JsonIgnoreProperties(value = { "shopcommodity"})
public class ShopReviews {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private String reviews;
	
	@Column
	private String businessreply;
	
	@Column
	private String reviewsdate;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private  User user;
	
	@ManyToOne
	@JoinColumn(name = "shopcomm_id")
	private  ShopCommoidty shopscommodity;
	
	@Column
	@Enumerated(EnumType.STRING)
	private ReviewsRank reviewsRank;//评论等级
	
	@Column
	private String rankImagesPath;//评论等级路径
	
	
	
	public ReviewsRank getReviewsRank() {
		return reviewsRank;
	}
	public void setReviewsRank(ReviewsRank reviewsRank) {
		this.reviewsRank = reviewsRank;
	}
	public String getRankImagesPath() {
		return rankImagesPath;
	}
	public void setRankImagesPath(String rankImagesPath) {
		this.rankImagesPath = rankImagesPath;
	}
	public String getReviewsdate() {
		return reviewsdate;
	}
	public void setReviewsdate(String reviewsdate){
		this.reviewsdate = reviewsdate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public ShopCommoidty getShopscommodity() {
		return shopscommodity;
	}
	public void setShopscommodity(ShopCommoidty shopscommodity) {
		this.shopscommodity = shopscommodity;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getReviews() {
		return reviews;
	}
	public void setReviews(String reviews) {
		this.reviews = reviews;
	}
	public String getBusinessreply() {
		return businessreply;
	}
	public void setBusinessreply(String businessreply) {
		this.businessreply = businessreply;
	}
    
}
