package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.ShopCommoidty;

public interface IShopCommoidtyService extends IGenericService<ShopCommoidty> {

	List<ShopCommoidty> getAllByShop(Integer id);

	List<ShopCommoidty> getAllByCondition(String condition, boolean isTrue, Integer shopID);

	List<ShopCommoidty> getAllByShopCategoryID(Integer id, String page);

	List<ShopCommoidty> getAllByParams(Map<String, Object> map, String page);

}
