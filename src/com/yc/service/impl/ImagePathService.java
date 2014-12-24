package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.ImagePath;
import com.yc.service.IImagePathService;

@Component
public class ImagePathService extends GenericService<ImagePath> implements IImagePathService{
	@Autowired
	GenericDao<ImagePath> imagePathDao;
	@Override
	GenericDao<ImagePath> getDao() {
		return imagePathDao;
	}
	@Override
	public List<ImagePath> getImageByUnkownComm(int parseInt) {
		String hql = " from ImagePath i where i.unKnownComm.code = "+parseInt;
		return imagePathDao.find(hql, null, null);
	}

}
