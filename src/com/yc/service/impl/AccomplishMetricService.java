package com.yc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.user.AccomplishMetric;
import com.yc.entity.user.Personnel;
import com.yc.service.IAccomplishMetricService;
@Component
public class AccomplishMetricService extends GenericService<AccomplishMetric> implements IAccomplishMetricService{

	@Autowired
	GenericDao<AccomplishMetric> accomplishMetricDao;
	
	@Override
	GenericDao<AccomplishMetric> getDao() {
		return accomplishMetricDao;
	}

	@Override
	public AccomplishMetric getAccomplishByPerAndDate(Personnel personnel, String format) {
		List<String> keys = new ArrayList<String>();
		keys.add("personnel.id");
		keys.add("accomplishDate");
		List<Object> values = new ArrayList<Object>();
		values.add(personnel.getId());
		values.add(format);
		return accomplishMetricDao.getFirstRecord(keys, values);
	}
}
