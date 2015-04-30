package com.yc.service;

import java.util.List;

import com.yc.entity.MissionPlan;
import com.yc.entity.user.Personnel;

public interface IMissionPlanService extends IGenericService<MissionPlan> {

	List<MissionPlan> getAllByPer(Personnel personnel);

	List<MissionPlan> getAllByToPer(Personnel personnel);

}
