package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.ShopReviews;
import com.yc.entity.UserSize;
import com.yc.entity.user.User;
import com.yc.service.IUserSizeService;

@Component
public class UserSizeService extends GenericService<UserSize> implements
		IUserSizeService {

	@Autowired
	GenericDao<UserSize> userSizeDao;

	@Override
	GenericDao<UserSize> getDao() {
		return userSizeDao;
	}

	// 查询
	@SuppressWarnings("unchecked")
	@Override
	public List<UserSize> findByUserID(Integer id) {
		StringBuffer hql = new StringBuffer(
				"SELECT * FROM usersize WHERE usersize.user_id=" + id);
		return userSizeDao.getEntityManager()
				.createNativeQuery(hql.toString(), UserSize.class)
				.getResultList();
	}

	// 保存
	@Override
	public boolean saveSizes(UserSize size) {
		return userSizeDao.save(size);
	}

}
