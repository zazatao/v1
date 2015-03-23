package com.yc.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.service.IPersonnelService;

@Component
public class PersonnelService extends GenericService<Personnel> implements IPersonnelService {
	@Autowired
	GenericDao<Personnel> personnelDao;

	@Override
	GenericDao<Personnel> getDao() {
		return personnelDao;
	}

	@Override
	public Personnel getPersonnle(String name) {
		return personnelDao.getFirstRecord("loginName", name);
	}
	
	@Override
	public List<Personnel> FindByUserID(Integer id) {
		return personnelDao.getBy("personnel.id", id);
	}

	@Override
	public List<Personnel> getUsersByParameters(String loginName, String userName) {
		StringBuffer hql = new StringBuffer(" from Personnel u where (? is null or u.loginName like ?) and (? is null or u.userName like ?)");
		Object[] paramete =  new Object[4];
		paramete[0] = loginName ;
		paramete[1] = "%"+loginName +"%";
		paramete[2] = userName ;
		paramete[3] = "%"+userName +"%";
		return personnelDao.find(hql.toString(), paramete, -1,-1);
	}

	@Override
	public List<Personnel> getPurchaseByUser(User user) {
		StringBuffer hql = new StringBuffer("SELECT DISTINCT per.* FROM Commodity comm LEFT JOIN OrderForm orders ON orders.orderFormID = comm.orderform_id LEFT JOIN Personnel per ON per.id = orders.purchase_user WHERE comm.status = 'support' AND orders.orderstatus = 'waitDelivery' AND comm.seller_name = 1 AND orders.purchase_user IS NOT NULL AND orders.user_id = "+user.getId());
		Query query = personnelDao.getEntityManager().createNativeQuery(hql.toString(),Personnel.class);
		@SuppressWarnings("unchecked")
		List<Personnel> list =  query.getResultList();
		return list;
	}

}
