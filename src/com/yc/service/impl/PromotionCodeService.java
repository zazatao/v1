package com.yc.service.impl;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.PromotionCode;
import com.yc.service.IPromotionCodeService;

@Component
public class PromotionCodeService extends GenericService<PromotionCode> implements IPromotionCodeService{

	@Autowired
	GenericDao<PromotionCode> promotionCodeDao;
	
	@Override
	GenericDao<PromotionCode> getDao() {
		return promotionCodeDao;
	}
	
	@Override
	public PromotionCode findByPromotionCodeId(Integer id) {
		return promotionCodeDao.getFirstRecord("promotioncode.id", id);
	}
	
	@Override
	public boolean deleteById(Integer id) {
		boolean isok = false;
		List<PromotionCode> list =  promotionCodeDao.getBy("promotioncode.id", id);
		for (PromotionCode promotionCode : list) {
			isok = promotionCodeDao.deleteById(promotionCode.getId());
		}
		return isok ;
	}
	
	@Override
	public List<PromotionCode> getAllByUser(Integer id) {
		return promotionCodeDao.getBy("user.id", id);
	}

	@Override
	public List<PromotionCode> getUseInfo(Map<String, String> map) {
		
		StringBuffer hql = new StringBuffer(" from PromotionCode promotioncode where (? is null or promotioncode.code like ?)");
		Object[] paramete = new Object[2];
		paramete[0] = map.get("code");
		paramete[1] = "%"+map.get("code")+"%";
		List<PromotionCode> list1  = promotionCodeDao.find(hql.toString(), paramete, -1,-1);
				
		if ( list1 != null ) {
			String use = map.get("use");
			List<PromotionCode> list2 = new LinkedList<PromotionCode>();
			System.out.println("use______________________"+use);
			if (use.equals("info"))
			{
				System.out.println("none______________________"+use);
				list2 = list1;
			}
		
			else if (use.equals("unuse"))
			{		
				System.out.println("unuse______________________"+use);
				for ( int i = 0; i < list1.size(); i++ )
				{
					if ( list1.get(i).getUser() == null )
						list2.add(list1.get(i));
				}
			}
		
			else if(use.equals("use"))
			{
				System.out.println("use______________________");
				for ( int i = 0; i < list1.size(); i++ )
				{
					if ( list1.get(i).getUser() != null )
						list2.add(list1.get(i));
				}
			}
			return list2;
		}
		
		else {
			return list1;
		}
	}
}
