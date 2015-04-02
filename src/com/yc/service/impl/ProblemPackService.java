package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.ProblemPack;
import com.yc.service.IProblemPackService;

@Component
public class ProblemPackService extends GenericService<ProblemPack> implements IProblemPackService {

	@Autowired
	GenericDao<ProblemPack> positionDao;
	
	@Override
	GenericDao<ProblemPack> getDao() {
		return positionDao;
	}

	@Override
	public List<ProblemPack> getProblemPackByUser(Integer id) {
		StringBuffer hql = new StringBuffer(" from ProblemPack problem where  problem.user.id = "+id);
		return positionDao.find(hql.toString(), null, null);
	}
}
