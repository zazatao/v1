package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.TransitSite;
import com.yc.entity.user.Personnel;

public interface ITransitSiteService extends IGenericService<TransitSite> {

	List<TransitSite> getTransitSiteByUser(Personnel personnel);

	List<TransitSite> getTransportByParam(Map<String, Object> map);

}
