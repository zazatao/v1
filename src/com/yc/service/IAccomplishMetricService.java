package com.yc.service;

import com.yc.entity.user.AccomplishMetric;
import com.yc.entity.user.Personnel;

public interface IAccomplishMetricService extends IGenericService<AccomplishMetric> {

	AccomplishMetric getAccomplishByPerAndDate(Personnel personnel, String format);

}
