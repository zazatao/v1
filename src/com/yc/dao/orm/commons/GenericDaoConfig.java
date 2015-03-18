package com.yc.dao.orm.commons;

import org.springframework.context.annotation.*;

import com.yc.entity.*;
import com.yc.entity.Package;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.entity.user.Position;

@Configuration
public class GenericDaoConfig {

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

	@Bean
	public GenericDao<Package> getPackageDao() {
		return new GenericDaoSupport<Package>(Package.class);
	}

	@Bean
	public GenericDao<CargoGroup> getCargoGroupDao() {
		return new GenericDaoSupport<CargoGroup>(CargoGroup.class);
	}

	@Bean
	public GenericDao<Personnel> getPersonnelDao() {
		return new GenericDaoSupport<Personnel>(Personnel.class);
	}
	
	@Bean
	public GenericDao<User> getUserDao() {
		return new GenericDaoSupport<User>(User.class);
	}
	
	@Bean
	public GenericDao<OrderGroup> getOrderGroupDao() {
		return new GenericDaoSupport<OrderGroup>(OrderGroup.class);
	}
	@Bean
	public GenericDao<Position> getPositionDao() {
		return new GenericDaoSupport<Position>(Position.class);
	}

	@Bean
	public GenericDao<Department> getDepartmentDao() {
		return new GenericDaoSupport<Department>(Department.class);
	}
	@Bean
	public GenericDao<Address> getAddressDao() {
		return new GenericDaoSupport<Address>(Address.class);
	}
	@Bean
	public GenericDao<Brand> getBrandDao() {
		return new GenericDaoSupport<Brand>(Brand.class);
	}
	@Bean
	public GenericDao<Shop> getShopDao() {
		return new GenericDaoSupport<Shop>(Shop.class);
	}
	@Bean
	public GenericDao<ShopCategory> getShopCategoryDao() {
		return new GenericDaoSupport<ShopCategory>(ShopCategory.class);
	}
	@Bean
	public GenericDao<ShopCommoidty> getShopCommoidtyDao() {
		return new GenericDaoSupport<ShopCommoidty>(ShopCommoidty.class);
	}
	@Bean
	public GenericDao<Specifications> getSpecificationsDao() {
		return new GenericDaoSupport<Specifications>(Specifications.class);
	}
	@Bean
	public GenericDao<ShopCommImage> getShopCommImageDao() {
		return new GenericDaoSupport<ShopCommImage>(ShopCommImage.class);
	}
	@Bean
	public GenericDao<BuyCat> getBuyCatDao() {
		return new GenericDaoSupport<BuyCat>(BuyCat.class);
	}
	@Bean
	public GenericDao<ShopCommoidtySpecs> getShopCommoidtySpecsDao() {
		return new GenericDaoSupport<ShopCommoidtySpecs>(ShopCommoidtySpecs.class);	
	}
	@Bean
	public GenericDao<DeliveryAddress> getDeliveryAddressDao() {
		return new GenericDaoSupport<DeliveryAddress>(DeliveryAddress.class);	
	}
	@Bean
	public GenericDao<CarCommoidty> getCarCommoidtyDao() {
		return new GenericDaoSupport<CarCommoidty>(CarCommoidty.class);	
	}
}
