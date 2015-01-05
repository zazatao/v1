package com.yc.service;

import java.util.List;

import com.yc.entity.Package;

public interface IPackageService extends IGenericService<Package> {

	List<Package> findByGroupID(Integer id);

	List<Package> getAllByTransitAndDelivery(String transit, String delivery);

}
