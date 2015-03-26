package com.yc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.CargoGroup;
import com.yc.entity.user.Personnel;
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
		StringBuffer hql = new StringBuffer(" from CargoGroup g where (? is null or g.cargoGroupID = ?) and (? is null or g.transit = ?) and (? is null or g.delivery = ?) and (? is null or g.sendDate = ?) and g.status = 'packing' )");
		Object[] paramete = new Object[10];
		paramete[0] = map.get("cargoGroupID");
		paramete[1] = map.get("cargoGroupID");
		paramete[2] = map.get("formTransit");
		paramete[3] = map.get("formTransit");
		paramete[4] = map.get("formDelivery");
		paramete[5] = map.get("formDelivery");
		paramete[6] = map.get("sendDate");
		paramete[7] = map.get("sendDate");
		return cargoGroupDao.find(hql.toString(), paramete, -1,-1);
	}

	@Override
	public List<CargoGroup> getCarGroupByStatus() {
		StringBuffer hql = new StringBuffer(" from CargoGroup g where g.status = 'packing'");
		return cargoGroupDao.find(hql.toString(), null, null);
	}
	
	@Override
	public CargoGroup getCargoGroupByTpek(String tpek) {
		return cargoGroupDao.getFirstRecord("tpekCargoGroup", tpek);
	}
	
	@Override
	public List<CargoGroup> getCargoGroupByForTransit(Personnel personnel) {
		StringBuffer hql = new StringBuffer(" from CargoGroup cargo where cargo.transitSte.personnel.id = "+personnel.getId()+" and cargo.transitSte.sendDate is null");
		return cargoGroupDao.find(hql.toString(), null, null);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CargoGroup> getCargoGroupParameters(Map<String, Object> map, Personnel personnel) {
		StringBuffer hql = new StringBuffer("select DISTINCT cargo.* from CargoGroup cargo left join TransitSite tran on tran.transitSiteID = cargo.transitSiteID "
				+ " where tran.sendDate is null and tran.store_user = "+personnel.getId());
		if (map.get("tpekCargoGroup") != null) {
			hql.append(" and cargo.tpekCargoGroup = '"+map.get("tpekCargoGroup")+"'");
		}
		if (map.get("formDelivery") != null) {
			hql.append(" and cargo.delivery = '"+map.get("formDelivery")+"'");
		}
		if (map.get("receiveDate") != null) {
			hql.append(" and tran.receiveDate like '"+map.get("receiveDate")+"%'");
		}
		return cargoGroupDao.getEntityManager().createNativeQuery(hql.toString(), CargoGroup.class).getResultList();
	}
}
