package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.MissionPlan;
import com.yc.entity.user.Personnel;
import com.yc.service.IMissionPlanService;

@Component
public class MissionPlanService  extends GenericService<MissionPlan>  implements  IMissionPlanService{

	@Autowired
	GenericDao<MissionPlan> missionPlanDao;
	
	@Override
	GenericDao<MissionPlan> getDao() {
		return missionPlanDao;
	}

	@Override
	public List<MissionPlan> getAllByPer(Personnel personnel) {
		StringBuffer hql = new StringBuffer(" from MissionPlan  misPlan where misPlan.fromPer.id = "+personnel.getId()+" or misPlan.toPer.id = "+personnel.getId()+" order by id desc");
		return missionPlanDao.find(hql.toString(), null, null);
	}
}
