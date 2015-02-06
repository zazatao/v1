package com.yc.service;

import java.util.List;

import com.yc.entity.ShopCommoidty;

public interface IShopCommoidtyService extends IGenericService<ShopCommoidty> {

	List<ShopCommoidty> getAllByShop(Integer id);

	List<ShopCommoidty> getAllByCondition(String condition, boolean isTrue, Integer shopID);

}
