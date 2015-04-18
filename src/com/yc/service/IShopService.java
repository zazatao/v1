package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.Shop;

public interface IShopService extends IGenericService<Shop> {

	Shop getShopByUser(Integer id);

	List<Shop> getShopByParam(Map<String, Object> map);

}
