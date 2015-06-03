package com.yc.service.impl;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.model.PersonnelStatistics;
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
		StringBuffer hql = new StringBuffer("SELECT DISTINCT per.* FROM Commodity comm LEFT JOIN OrderForm orders ON orders.orderFormID = comm.orderform_id LEFT JOIN Personnel per ON per.id = comm.purchase_user WHERE comm.status = 'support' AND orders.orderstatus = 'waitDelivery' AND comm.seller_name = 1 AND comm.purchase_user IS NOT NULL AND orders.user_id = "+user.getId());
		Query query = personnelDao.getEntityManager().createNativeQuery(hql.toString(),Personnel.class);
		@SuppressWarnings("unchecked")
		List<Personnel> list =  query.getResultList();
		return list;
	}

	@Override
	public List<Personnel> getAllByParametersForManage(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from Personnel u where (? is null or u.departAndPositions.department.departmentID = ?) and (? is null or u.userName like ?) and (? is null or u.departAndPositions.positions.positionid = ?)");
		Object[] paramete =  new Object[6];
		paramete[0] = map.get("departmentID") ;
		paramete[1] = map.get("departmentID");
		paramete[2] = map.get("userName") ;
		paramete[3] = "%"+map.get("userName") +"%";
		paramete[4] = map.get("positionid") ;
		paramete[5] = map.get("positionid");

		List<Personnel> list = personnelDao.find(hql.toString(), paramete, -1,-1);
		
		if ( map.get("forbidden") != null)
		{
			List<Personnel> list2 = new LinkedList<Personnel>();
			for ( int i = 0; i < list.size(); i++ )
			{
				if ( map.get("forbidden").equals("no")) 
				{
					if ( list.get(i).getForbidden() == null )
					{									
						list2.add(list.get(i));
					}
				}
				
				else
				{
					if ( list.get(i).getForbidden() != null )
					{
						list2.add(list.get(i));
					}
				}
			}
			return list2;
		}
		return list;
	}

	@Override
	public List<Personnel> getAllByDepAndPos(DepartAndPositions depAndPos) {
		return personnelDao.getBy("departAndPositions.id", depAndPos.getId());
	}

	@Override
	public List<PersonnelStatistics> getOrtherByParam(String days, Personnel personnel) {
		StringBuffer hql = new StringBuffer("SELECT distinct acc.accomplishNum,per.userName,acc.accomplishDate,dap.rules,dap.wage,dap.saleCut FROM personnel "
						+ "per LEFT JOIN accomplishmetric acc ON acc.personnel_id  = per.id LEFT JOIN departandpositions dap "
						+ "ON dap.id = per.depAndPos_id  WHERE per.id = "+personnel.getId()+" AND acc.accomplishDate IN ("+days+") "
						+ "GROUP BY per.id,acc.accomplishDate");
		Query query = personnelDao.getEntityManager().createNativeQuery(hql.toString());
		@SuppressWarnings("rawtypes")
		List objecArraytList = query.getResultList();
		List<PersonnelStatistics> list = new ArrayList<PersonnelStatistics>();
		PersonnelStatistics statistics = null;
		if (objecArraytList != null && objecArraytList.size() > 0) {
			for (int i = 0; i < objecArraytList.size(); i++) {
				statistics = new PersonnelStatistics();
				Object[] obj = (Object[]) objecArraytList.get(i);
				statistics.setAccomplishNum(Integer.parseInt(obj[0].toString()));
				statistics.setUserName(obj[1].toString());
				statistics.setAccomplishDate(obj[2].toString());
				statistics.setRules(Integer.parseInt(obj[3].toString()));
				statistics.setWage(Double.parseDouble(obj[4].toString()));
				statistics.setSaleCut(Double.parseDouble(obj[5].toString()));
				list.add(statistics);
			}
		}
		return list;
	}
	
	@Override
	public List<PersonnelStatistics> getAccounting(String days) {
		StringBuffer hql = new StringBuffer("SELECT DISTINCT SUM(acc.accomplishNum),per.userName,dap.rules,dap.wage,dap.saleCut,"
				+ "pos.positionname,parment.departmentname FROM personnel per  LEFT JOIN departandpositions dap ON dap.id = per.depAndPos_id  "
				+ "LEFT JOIN department parment ON parment.departmentID = dap.departments_id LEFT JOIN positions pos ON pos.positionid = "
				+ "dap.positions_id  LEFT  JOIN accomplishmetric acc ON acc.personnel_id  = per.id WHERE acc.accomplishDate IN ("+days+")  GROUP BY per.id");
		Query query = personnelDao.getEntityManager().createNativeQuery(hql.toString());
		@SuppressWarnings("rawtypes")
		List objecArraytList = query.getResultList();
		List<PersonnelStatistics> list = new ArrayList<PersonnelStatistics>();
		PersonnelStatistics statistics = null;
		if (objecArraytList != null && objecArraytList.size() > 0) {
			for (int i = 0; i < objecArraytList.size(); i++) {
				statistics = new PersonnelStatistics();
				Object[] obj = (Object[]) objecArraytList.get(i);
				statistics.setAccomplishNum(Integer.parseInt(obj[0].toString()));
				statistics.setUserName(obj[1].toString());
				if (obj[2] != null) {
					statistics.setRules(Integer.parseInt(obj[2].toString()));
				}else{
					statistics.setRules(null);
				}
				if (obj[3] != null) {
					statistics.setWage(Double.parseDouble(obj[3].toString()));
				}else{
					statistics.setWage(null);
				}
				if (obj[4] != null) {
					statistics.setSaleCut(Double.parseDouble(obj[4].toString()));
				}else{
					statistics.setSaleCut(null);
				}
				statistics.setPos(obj[5].toString());
				statistics.setDepart(obj[6].toString());
				list.add(statistics);
			}
		}
		return list;
	}
}
