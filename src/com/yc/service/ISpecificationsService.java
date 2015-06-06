package com.yc.service;

import java.util.List;

import com.yc.entity.Specifications;

public interface ISpecificationsService extends IGenericService<Specifications> {

	List<Specifications> getAllByShopCateg(Integer ids);
}
