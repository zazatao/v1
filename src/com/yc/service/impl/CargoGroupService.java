package com.yc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.CargoGroup;
import com.yc.service.ICargoGroupService;

@Component
public class CargoGroupService extends GenericService<CargoGroup> implements ICargoGroupService {

	@Autowired
	GenericDao<CargoGroup> cargoGroupDao;

	@Override
	GenericDao<CargoGroup> getDao() {
		return cargoGroupDao;
	}

	@Override
	public List<CargoGroup> getCargoGroupByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from CargoGroup g where (? is null or g.cargoGroupID = ?) and (? is null or g.transit = ?) and (? is null or g.delivery = ?) and (? is null or g.sendDate = ?) and (? is null or g.status = ?)");
		Object[] paramete = new Object[10];
		paramete[0] = map.get("cargoGroupID");
		paramete[1] = map.get("cargoGroupID");
		paramete[2] = map.get("formTransit");
		paramete[3] = map.get("formTransit");
		paramete[4] = map.get("formDelivery");
		paramete[5] = map.get("formDelivery");
		paramete[6] = map.get("sendDate");
		paramete[7] = map.get("sendDate");
		paramete[8] = map.get("formStatus");
		paramete[9] = map.get("formStatus");
		return cargoGroupDao.find(hql.toString(), paramete, -1,-1);
	}

}
