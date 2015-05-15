package com.yc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.AdvertiseDistribution;
import com.yc.entity.AdvertisementPage;
import com.yc.service.IAdvertisementDistributionService;

@Component
public class AdvertisementDistributionService extends GenericService<AdvertiseDistribution> implements IAdvertisementDistributionService{

	@Autowired
	GenericDao<AdvertiseDistribution> advertiseDistributionDao;
	
	@Override
	GenericDao<AdvertiseDistribution> getDao() {
		return advertiseDistributionDao;
	}

	@Override
	public List<AdvertiseDistribution> getAdvertiseDistributionsByWhichPage(AdvertisementPage whichPage) {
		StringBuffer hql = new StringBuffer(" from AdvertiseDistribution ad where ad.whichPage = '" + whichPage + "'");
		return advertiseDistributionDao.find(hql.toString(), null, null);
	}

	@Override
	public AdvertiseDistribution findByWhichPageAndPosition(AdvertisementPage whichPage, Integer position) {
		List<String> keys = new ArrayList<String>();
		keys.add("whichPage");
		keys.add("position");
		List<Object> values = new ArrayList<Object>();
		values.add(whichPage);
		values.add(position);

		return  advertiseDistributionDao.getFirstRecord(keys, values);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AdvertisementPage> getDistinctWhichPage() {
		StringBuffer hql = new StringBuffer("select distinct whichPage from AdvertiseDistribution ad");
		Query query =  advertiseDistributionDao.getEntityManager().createNativeQuery(hql.toString());
		return query.getResultList();
	}

}
