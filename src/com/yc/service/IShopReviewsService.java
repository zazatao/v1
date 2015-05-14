package com.yc.service;

import java.util.List;

import com.yc.entity.ShopReviews;

public interface IShopReviewsService extends IGenericService<ShopReviews> {
	public boolean saveReviews(ShopReviews t);

	public List<ShopReviews> getAllBycommCode(Integer commID);

	public List<ShopReviews> getReviewsByShop(Integer id);

	public boolean updateById(String content,Integer id);        
}
