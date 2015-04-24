package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.PromotionCode;

public interface IPromotionCodeService extends IGenericService<PromotionCode>{

	PromotionCode findByPromotionCodeId(Integer id);
	
	public boolean deleteById(Integer id);
	
	List<PromotionCode> getAllByUser(Integer id);
	
	List<PromotionCode> getUseInfo(Map<String, String> map);
}
