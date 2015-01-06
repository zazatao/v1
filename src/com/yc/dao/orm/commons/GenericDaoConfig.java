package com.yc.dao.orm.commons;

import org.springframework.context.annotation.*;

import com.yc.entity.*;

import com.yc.entity.user.User;

@Configuration
public class GenericDaoConfig {

	@Bean
	public GenericDao<User> getUserDao() {
		return new GenericDaoSupport<User>(User.class);
	}

	@Bean
	public GenericDao<UnKnownCommodity> getUnKnownCommodityDao() {
		return new GenericDaoSupport<UnKnownCommodity>(UnKnownCommodity.class);
	}
	
	@Bean
	public GenericDao<Commodity> getCommodityDao() {
		return new GenericDaoSupport<Commodity>(Commodity.class);
	}

	@Bean
	public GenericDao<ImagePath> getImagePathDao() {
		return new GenericDaoSupport<ImagePath>(ImagePath.class);
	}

	@Bean
	public GenericDao<OrderForm> getOrderFormDao() {
		return new GenericDaoSupport<OrderForm>(OrderForm.class);
	}

	@Bean
	public GenericDao<StoreRoom> getStoreRoomDao() {
		return new GenericDaoSupport<StoreRoom>(StoreRoom.class);
	}

}