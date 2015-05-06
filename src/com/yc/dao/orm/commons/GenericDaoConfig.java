package com.yc.dao.orm.commons;

import org.springframework.context.annotation.*;

import com.yc.entity.*;
import com.yc.entity.Package;
import com.yc.entity.user.AccomplishMetric;
import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.entity.user.Positions;

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
	public GenericDao<Positions> getPositionDao() {
		return new GenericDaoSupport<Positions>(Positions.class);
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
	@Bean
	public GenericDao<PackageSize> getPackageSizeDao() {
		return new GenericDaoSupport<PackageSize>(PackageSize.class);	
	}
	@Bean
	public GenericDao<PackageGenre> getPackageGenreDao() {
		return new GenericDaoSupport<PackageGenre>(PackageGenre.class);	
	}
	@Bean
	public GenericDao<TransitSite> getTransitSiteDao() {
		return new GenericDaoSupport<TransitSite>(TransitSite.class);	
	}
	@Bean
	public GenericDao<ProblemPack> getProblemPackDao() {
		return new GenericDaoSupport<ProblemPack>(ProblemPack.class);	
	}
	@Bean
	public GenericDao<Blacklist> getBlacklistDao() {
		return new GenericDaoSupport<Blacklist>(Blacklist.class);	
	}
	@Bean
	public GenericDao<Ticket> getTicketDao() {
		return new GenericDaoSupport<Ticket>(Ticket.class);	
	}
	@Bean
	public GenericDao<DepartAndPositions> getDepartAndPositionsDao() {
		return new GenericDaoSupport<DepartAndPositions>(DepartAndPositions.class);	
	}
	
	@Bean
	public GenericDao<PromotionCode> getPromotionCodeDao() {
		return new GenericDaoSupport<PromotionCode>(PromotionCode.class);	
	}
	
	@Bean
	public GenericDao<MissionPlan> getMissionPlanDao() {
		return new GenericDaoSupport<MissionPlan>(MissionPlan.class);	
	}
	@Bean
	public GenericDao<Surcharges> getSurchargesDao() {
		return new GenericDaoSupport<Surcharges>(Surcharges.class);	
	}
	
	@Bean
	public GenericDao<Currency> getCurrencyDao() {
		return new GenericDaoSupport<Currency>(Currency.class);	
	}
	@Bean
	public GenericDao<Collection> getCollectionDao() {
		return new GenericDaoSupport<Collection>(Collection.class);	
	}
	@Bean
	public GenericDao<AccomplishMetric> getAccomplishMetricDao() {
		return new GenericDaoSupport<AccomplishMetric>(AccomplishMetric.class);	
	}
	
}
