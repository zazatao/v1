package com.yc.service;

import java.util.List;

import com.yc.entity.Brand;
import com.yc.entity.ShopCategory;

public interface IBrandService extends IGenericService<Brand> {
	    List<Brand> getAllunlike();
}
