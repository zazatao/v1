package com.yc.service;

import java.util.List;

import com.yc.entity.ShopCategory;

public interface IShopCategoryService extends IGenericService<ShopCategory> {

	List<ShopCategory> getAllByLevel(Integer i);

	List<ShopCategory> getAllForBrand();

	List<ShopCategory> getAllForSpecial();

	List<ShopCategory> getAllByParentLevel(Integer categoryID);
	
	List<ShopCategory> getAllParentLevel();

}
