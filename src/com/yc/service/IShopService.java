package com.yc.service;

import com.yc.entity.Shop;

public interface IShopService extends IGenericService<Shop> {

	Shop getShopByUser(Integer id);

}
