package com.yc.service;

import java.util.List;

import com.yc.entity.Advertisement;
import com.yc.entity.AdvertisementPage;

public interface IAdvertisementService extends IGenericService<Advertisement>{

	public Integer getAdvertiseBywhichPageAndPostion(AdvertisementPage whichPage, Integer position);
	
	public List<Advertisement> getAdvertiseBywhichPageAndPostions(AdvertisementPage whichPage, Integer position);
}
