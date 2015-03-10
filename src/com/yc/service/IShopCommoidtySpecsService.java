package com.yc.service;

import java.util.List;

import com.yc.entity.ShopCommoidtySpecs;

public interface IShopCommoidtySpecsService extends IGenericService<ShopCommoidtySpecs>{

	ShopCommoidtySpecs getSpecsByParam(Integer id, String guige);

	List<ShopCommoidtySpecs> getSpecsByShopComm(int parseInt);

}
