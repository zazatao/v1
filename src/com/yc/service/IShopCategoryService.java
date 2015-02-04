package com.yc.service;

import java.util.List;

import com.yc.entity.ShopCategory;

public interface IShopCategoryService extends IGenericService<ShopCategory> {

	List<ShopCategory> getAllByLevel(Integer i);

}
