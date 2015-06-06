package com.yc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Package;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.service.IPackageService;

@Component
public class PackageService extends GenericService<Package> implements IPackageService {

	@Autowired
	GenericDao<Package> packAgeDao;

	@Override
	GenericDao<Package> getDao() {
		return packAgeDao;
	}

	@Override
	public List<Package> findByGroupID(Integer id) {
		return packAgeDao.getBy("cargoGroup.cargoGroupID", id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Package> getAllByTransitAndDelivery(String transit, String delivery) {
		StringBuffer hql = new StringBuffer("select DISTINCT p.* from Package p left join OrderForm o on o.package_id = p.packageID left join User u "
						+ " on u.id = o.user_id  LEFT JOIN Commodity comm  ON comm.orderform_id = o.orderFormID  "
						+ " where p.transit = '"+transit+"' and p.delivery = '"+delivery+"' and p.isFee = 1 and comm.status = 'packing' and p.from_cargoGroup is null");
		return packAgeDao.getEntityManager().createNativeQuery(hql.toString(), Package.class).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Package> getPackAgeByParameters(Map<String, Object> map,int i) {
		StringBuffer hql = new StringBuffer("select DISTINCT p.* from Package p left join OrderForm o on o.package_id = p.packageID left join User u "
				+ " on u.id = o.user_id  LEFT JOIN Commodity comm  ON comm.orderform_id = o.orderFormID  where comm.status NOT IN('inForwarding') and p.isFee = "+i);
		if (map.get("packageCode")!=null) {
			hql.append(" and p.packageCode = '"+map.get("packageCode")+"'");
		}
		if (map.get("formDelivery") != null) {
			hql.append(" and p.delivery = '"+map.get("formDelivery")+"'");
		}
		if (map.get("userName") != null) {
			hql.append(" and u.userName like '%"+map.get("userName")+"%'");
		}
		if (map.get("sendDate") != null) {
			hql.append(" and p.sendDate = '"+map.get("sendDate")+"'");
		}
		return packAgeDao.getEntityManager().createNativeQuery(hql.toString(), Package.class).getResultList();
	}
	
	@Override
	public Package getPackAgeByTpek(String packAgeTpek) {
		return packAgeDao.getFirstRecord("packAgeTpek", packAgeTpek);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Package> getPackagesByIsFee() {
		StringBuffer hql = new StringBuffer("select DISTINCT p.* from Package p left join OrderForm o "
				+ "on o.package_id = p.packageID left join User u on u.id = o.user_id left join Commodity comm "
				+ "on comm.orderform_id = o.orderFormID where p.from_cargoGroup is null and p.isFee = 1 and comm.status not in('inForwarding') ");
		return packAgeDao.getEntityManager().createNativeQuery(hql.toString(), Package.class).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Package> getPackages() {
		StringBuffer hql = new StringBuffer("select DISTINCT p.* from Package p left join OrderForm o "
				+ "on o.package_id = p.packageID left join User u on u.id = o.user_id left join Commodity comm "
				+ "on comm.orderform_id = o.orderFormID where comm.status = 'packing'");
		return packAgeDao.getEntityManager().createNativeQuery(hql.toString(), Package.class).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Package> getWeighing() {
		StringBuffer hql = new StringBuffer("select DISTINCT p.* from Package p left join OrderForm o "
				+ "on o.package_id = p.packageID left join User u on u.id = o.user_id left join Commodity comm "
				+ "on comm.orderform_id = o.orderFormID where comm.status not in('inForwarding')");
		return packAgeDao.getEntityManager().createNativeQuery(hql.toString(), Package.class).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Package> getPackAgesByBatchShipments(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer("select DISTINCT p.* from Package p left join OrderForm o on o.package_id = p.packageID left join User u "
				+ " on u.id = o.user_id  LEFT JOIN Commodity comm  ON comm.orderform_id = o.orderFormID  where comm.status IN('inForwarding','sendOut') and p.isFee = 1");
		if (map.get("packageCode")!=null) {
			hql.append(" and p.packAgeTpek = '"+map.get("packageCode")+"'");
		}
		if (map.get("formDelivery") != null) {
			hql.append(" and p.delivery = '"+map.get("formDelivery")+"'");
		}
		if (map.get("userName") != null) {
			hql.append(" and u.userName like '%"+map.get("userName")+"%'");
		}
		if (map.get("sendDate") != null) {
			hql.append(" and p.sendDate = '"+map.get("sendDate")+"'");
		}
		return packAgeDao.getEntityManager().createNativeQuery(hql.toString(), Package.class).getResultList();
	}
	
	@Override
	public List<Package> getPackAgesForTransit(Personnel personnel) {
		StringBuffer hql = new StringBuffer(" from Package pack where pack.transitSte.personnel.id = "+personnel.getId()+" and pack.transitSte.sendDate is null ");
		return packAgeDao.find(hql.toString(), null, null);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Package> getPackByProblem() {
		StringBuffer hql=new StringBuffer("SELECT * FROM package RIGHT JOIN problempack ON problempack.package_id=package.packageID");
		return packAgeDao.getEntityManager().createNativeQuery(hql.toString(), Package.class).getResultList();
	}

	
	/* (non-Javadoc)
	 * @see com.yc.service.IPackageService#searchPackProblem(java.util.Map)
	 * 问题订单查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Package> searchPackProblem(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer("SELECT * FROM package RIGHT JOIN problempack ON problempack.package_id=package.packageID RIGHT JOIN `user` u  ON problempack.`user_id`=u.`id`  where 1=1 ");
		if (map.get("userName") !=null) {
			hql.append(" and u.userName like '%"+map.get("userName") +"%'");
		}
		if (map.get("phone") !=null) {
			hql.append(" and u.phone = '"+map.get("phone") +"'");
		}
		return packAgeDao.getEntityManager().createNativeQuery(hql.toString(), Package.class).getResultList();
	}
}
