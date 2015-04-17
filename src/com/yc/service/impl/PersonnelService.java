package com.yc.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.user.Department;
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

	@Override
	public List<Personnel> getAllByParametersForManage(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from Personnel u where (? is null or u.department.departmentID = ?) and (? is null or u.userName like ?) and (? is null or u.positions.positionid = ?)");
		Object[] paramete =  new Object[6];
		paramete[0] = map.get("departmentName") ;
		paramete[1] = map.get("departmentName");
		paramete[2] = map.get("userName") ;
		paramete[3] = "%"+map.get("userName") +"%";
		paramete[4] = map.get("positions") ;
		paramete[5] = map.get("positions");
		return personnelDao.find(hql.toString(), paramete, -1,-1);
	}

	@Override
	public List<Personnel> getPersonnelByDepAndPos(Department department, Integer positionid) {
		List<String> keys = new ArrayList<String>();
        keys.add("department.departmentID");
        keys.add("positions.positionid");
        List<Object> values = new ArrayList<Object>();
        values.add(department.getDepartmentID());
        values.add(positionid);
		return personnelDao.getBy(keys,values );
	}
}
