package com.yc.service.impl;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.OrderForm;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.ShopReviews;
import com.yc.entity.user.DepartAndPositions;
import com.yc.service.IShopReviewsService;

@Component
public class ShopReviewsService implements IShopReviewsService {
	
	@Autowired
	GenericDao<ShopReviews> shopReviewsDao;

	@Override
	public ShopReviews save(ShopReviews t) {
		
		return null;
	}

	@Override
	public ShopReviews update(ShopReviews t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean delete(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ShopReviews findById(Object id) {
		return shopReviewsDao.findById(id);
	}

	@Override
	public List<ShopReviews> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
    
	@Override
	public boolean saveReviews(ShopReviews t) {
		return shopReviewsDao.save(t);
	}

	@Override
	public List<ShopReviews> getAllBycommCode(Integer commID) {
		StringBuffer hql=new  StringBuffer("SELECT DISTINCT ve.* FROM shopreviews ve LEFT JOIN shopcommoidty  shopco ON ve.shopcomm_id=shopco.commcode WHERE shopco.commcode="+commID);
		shopReviewsDao.getEntityManager().clear();
		Query query = shopReviewsDao.getEntityManager().createNativeQuery(hql.toString(), ShopReviews.class);
		@SuppressWarnings("unchecked")
		List<ShopReviews> list =  query.getResultList();
		return list;
	}

	@Override
	public List<ShopReviews> getReviewsByShop(Integer id) {
		StringBuffer hql=new  StringBuffer("SELECT DISTINCT ve.* FROM shopreviews ve LEFT JOIN shopcommoidty  shopco ON ve.shopcomm_id=shopco.commcode WHERE shopco.shop_id="+id);
		shopReviewsDao.getEntityManager().clear();
		Query query = shopReviewsDao.getEntityManager().createNativeQuery(hql.toString(), ShopReviews.class);
		@SuppressWarnings("unchecked")
		List<ShopReviews> list =  query.getResultList();
		return list;
	}

	@Override
	public boolean updateById(String content,Integer id) {
		StringBuffer hql=new  StringBuffer("UPDATE shopreviews SET businessreply = '"+content+"' WHERE shopreviews.id="+id);
		shopReviewsDao.getEntityManager().getTransaction().begin();
		boolean isok = shopReviewsDao.getEntityManager().createNativeQuery(hql.toString(),ShopReviews.class).executeUpdate()>0;
	    shopReviewsDao.getEntityManager().getTransaction().commit();
		shopReviewsDao.getEntityManager().clear();
	    return isok;
	}

}
