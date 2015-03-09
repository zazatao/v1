package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.BuyCat;
import com.yc.service.IBuyCatService;
@Component
public class BuyCatService extends GenericService<BuyCat> implements IBuyCatService {

	@Autowired
	private GenericDao<BuyCat> buyCatDao;
	
	@Override
	GenericDao<BuyCat> getDao() {
		return buyCatDao;
	}

	@Override
	public List<BuyCat> getBuyCatByUser(Integer id) {
		return buyCatDao.getBy("catUser.id", id);
	}
}
