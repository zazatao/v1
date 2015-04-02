package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.user.Positions;
import com.yc.service.IPositionService;

@Component
public class PositionService extends GenericService<Positions> implements IPositionService {

	@Autowired
	GenericDao<Positions> positionDao;
	
	@Override
	GenericDao<Positions> getDao() {
		return positionDao;
	}

	@Override
	public List<Positions> getPositionByParent() {
		StringBuffer hql = new StringBuffer(" from Positions p where p.parentLevel.positionid is null");
		return positionDao.find(hql.toString(), null, null);
	}
	
	@Override
	public boolean deleteForTree(Positions positions) {
		StringBuffer hql = new StringBuffer("DELETE FROM Positions WHERE positionid = "+positions.getPositionid());
		positionDao.getEntityManager().getTransaction().begin();
		boolean isok = positionDao.getEntityManager().createNativeQuery(hql.toString(), Positions.class).executeUpdate()>0;
		positionDao.getEntityManager().getTransaction().commit();
		positionDao.getEntityManager().clear();
		return isok;
	}
}
