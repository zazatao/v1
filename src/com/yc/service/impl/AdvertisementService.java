package com.yc.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Advertisement;
import com.yc.entity.AdvertisementPage;
import com.yc.service.IAdvertisementService;

@Component
public class AdvertisementService extends GenericService<Advertisement> implements IAdvertisementService{

	@Autowired
	GenericDao<Advertisement> advertisementDao;
	
	@Override
	GenericDao<Advertisement> getDao() {
		return advertisementDao;
	}
	
	@Override
	public Integer getAdvertiseBywhichPageAndPostion(AdvertisementPage whichPage, Integer position) {
		StringBuffer hql = new StringBuffer("select COUNT(DISTINCT a.id) from Advertisement a right join AdvertiseDistribution ad on ad.adverDisId = a.adverDistribution_id  where ad.whichPage = '" + whichPage + "' and ad.position = " + position);
		Query query =  advertisementDao.getEntityManager().createNativeQuery(hql.toString());
		return Integer.parseInt(query.getSingleResult().toString());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Advertisement> getAdvertiseBywhichPageAndPostions(AdvertisementPage whichPage, Integer position) {
		StringBuffer hql = new StringBuffer(" select * from Advertisement a right join AdvertiseDistribution ad on ad.adverDisId = a.adverDistribution_id  where ad.whichPage = '" + whichPage + "' and ad.position = " + position);
		Query query =  advertisementDao.getEntityManager().createNativeQuery(hql.toString());
		return query.getResultList();
	}

}
