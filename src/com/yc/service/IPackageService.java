package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.Package;
import com.yc.entity.user.Personnel;

public interface IPackageService extends IGenericService<Package> {

	List<Package> findByGroupID(Integer id);

	List<Package> getAllByTransitAndDelivery(String transit, String delivery);

	List<Package> getPackAgeByParameters(Map<String, Object> map, int i);

	Package getPackAgeByTpek(String packAgeTpek);

	List<Package> getPackagesByIsFee();

	List<Package> getPackages();

	List<Package> getWeighing();

	List<Package> getPackAgesByBatchShipments(Map<String, Object> map);

	List<Package> getPackAgesForTransit(Personnel personnel);

	List<Package> getPackByProblem();

	List<Package> searchPackProblem(Map<String, Object> map);

}
