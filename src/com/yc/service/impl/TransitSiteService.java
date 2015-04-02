package com.yc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.TransitSite;
import com.yc.entity.user.Personnel;
import com.yc.service.ITransitSiteService;

@Component
public class TransitSiteService extends GenericService<TransitSite> implements ITransitSiteService {

	@Autowired
	GenericDao<TransitSite> transitSiteDao; 
	
	@Override
	GenericDao<TransitSite> getDao() {
		return transitSiteDao;
	}

	@Override
	public List<TransitSite> getTransitSiteByUser(Personnel personnel) {
		StringBuffer hql = new StringBuffer(" from TransitSite tran where tran.personnel.id = "+personnel.getId());
		return transitSiteDao.find(hql.toString(), null, null);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TransitSite> getTransportByParam(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer("SELECT DISTINCT tran.* FROM transitsite tran LEFT JOIN Package pack"
				+ " ON pack.transitSiteID = tran.transitSiteID LEFT JOIN CargoGroup cargo ON cargo.transitSiteID"
				+ " = tran.transitSiteID LEFT JOIN Personnel per ON tran.store_user = per.id WHERE per.id = "+((Personnel)map.get("person")).getId());
		if (map.get("formTransit") != null) {
			hql.append(" AND (pack.transit = '"+map.get("formTransit")+"' OR cargo.transit = '"+map.get("formTransit")+"')");
		}
		if (map.get("formDelivery") != null) {
			hql.append(" AND (pack.delivery = '"+map.get("formDelivery")+"' OR cargo.delivery = '"+map.get("formDelivery")+"') ");
		}
		if (map.get("packTpek") != null) {
			hql.append(" AND (pack.packAgeTpek = '"+map.get("packTpek")+"' OR cargo.tpekCargoGroup = '"+map.get("packTpek")+"') ");
		}
		if (map.get("receiveDate") != null) {
			hql.append(" AND tran.receiveDate LIKE '"+map.get("receiveDate")+"%'");
		}
		if (map.get("sendDate") != null) {
			hql.append(" AND tran.sendDate LIKE '"+map.get("sendDate")+"%'");
		}
		return transitSiteDao.getEntityManager().createNativeQuery(hql.toString(), TransitSite.class).getResultList();
	}

}
