package com.yc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Material;
import com.yc.service.IMaterialService;

@Component
public class MaterialService extends GenericService<Material> implements IMaterialService{

	@Autowired
	GenericDao<Material> materialDao;
	
	@Override
	GenericDao<Material> getDao() {
		return materialDao;
	}

	@Override
	public List<Material> getAllByParametersForManage(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from Material material where (? is null or material.type like ?) and (? is null or material.standard like ?)");
		Object[] paramete = new Object[4];
		paramete[0] = map.get("type");
		paramete[1] = "%"+map.get("type")+"%";
		paramete[2] = map.get("standard");
		paramete[3] = "%"+map.get("standard")+"%";
		return materialDao.find(hql.toString(), paramete, -1,-1);
	}
}
