package com.yc.service;

import java.util.List;

import com.yc.entity.AdvertiseDistribution;
import com.yc.entity.AdvertisementPage;

public interface IAdvertisementDistributionService extends IGenericService<AdvertiseDistribution>{

	public List<AdvertiseDistribution> getAdvertiseDistributionsByWhichPage(AdvertisementPage whichPage);
	
	public AdvertiseDistribution findByWhichPageAndPosition(AdvertisementPage whichPage, Integer position);
	
	public List<AdvertisementPage> getDistinctWhichPage();
}
