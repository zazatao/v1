package com.yc.service;

import java.util.List;

import com.yc.entity.BuyCat;

public interface IBuyCatService extends IGenericService<BuyCat> {

	List<BuyCat> getBuyCatByUser(Integer id);

	List<BuyCat> getBuyCatByShopComm(Integer commCode);

}
