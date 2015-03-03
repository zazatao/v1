package com.yc.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.entity.Shop;
import com.yc.entity.user.User;
import com.yc.service.IOrderFormService;

@Component
public class OrderFormService extends GenericService<OrderForm> implements IOrderFormService {

	@Autowired
	GenericDao<OrderForm> orderFormDao;

	@Override
	GenericDao<OrderForm> getDao() {
		return orderFormDao;
	}

	@Override
	public List<OrderForm> findByPackAgeID(Integer id) {
		return orderFormDao.getBy("packAge.packageID", id);
	}

	@Override
	public List<OrderForm> findByUserName(String parameter) {
		return orderFormDao.getBy("orderUser.userName", parameter);
	}

	@Override
	public List<OrderForm> findByUserID(Integer id) {
		return orderFormDao.getBy("orderUser.id", id);
	}

	@Override
	public List<OrderForm> getOrderByOrderGroup(Integer id) {
		return orderFormDao.getBy("orderGroup.orderGroupID", id);
	}
	
	@Override
	public List<OrderForm> getAllByOrderStatus() {
		String hql = " from OrderForm c where c.orderstatus in ('packing')";
		return orderFormDao.find(hql, null, null);
	}

	@Override
	public List<OrderForm> getOrderFormByParameters(Map<String, Object> map) {
		StringBuffer hql = new StringBuffer(" from OrderForm o where (? is null or o.orderstatus = ?) and (? is null or o.orderDate like ?) and (? is null or o.storeOperator.userName = ?)");
		Object[] paramete = new Object[6];
		paramete[0] = map.get("orderstatus");
		paramete[1] = map.get("orderstatus");
		paramete[2] = map.get("orderDate"); 
		paramete[3] = "%"+map.get("orderDate")+"%";
		paramete[4] = map.get("storeOperator");
		paramete[5] = map.get("storeOperator");

		return orderFormDao.find(hql.toString(), paramete, -1, -1);
	}

	@Override
	public List<OrderForm> getAllByParams(Map<String, Object> map, User user) {
		StringBuffer hql = new StringBuffer("select DISTINCT o.* from OrderForm o where o.user_id = "+user.getId());
		if (map.get("orderStatus") != null) {
			if (map.get("orderStatus").equals("wanjie")) {
				hql.append(" and o.orderstatus = '"+OrderStatus.completionTransaction+"'");
			}else{
				hql.append(" and o.orderstatus != '"+OrderStatus.completionTransaction+"'");
			}
		}
		if (map.get("orderDate") != null) {
			if (map.get("orderDate").equals("volvo")) {
				List<String> dates = CalendarDays(5);
				 StringBuilder takeDates = new StringBuilder();
			        for (String date : dates) {
			            if (takeDates.length() > 0) {
			                takeDates.append(",");
			            }
			            takeDates.append("'");
			            takeDates.append(date);
			            takeDates.append("'");
			        }
				hql.append(" and o.orderDate in ("+takeDates.toString()+")"); 
			}else if(map.get("orderDate").equals("saab")){
				Calendar cal = Calendar.getInstance();
				Date d1 = new Date();
				cal.add(Calendar.MONTH, -1);
				Date d2 = cal.getTime();
				long daterange = d1.getTime() - d2.getTime();     
			    long time = 1000*3600*24;
			    List<String> dates = CalendarDays(Integer.parseInt(String.valueOf(daterange/time)));
				 StringBuilder takeDates = new StringBuilder();
			        for (String date : dates) {
			            if (takeDates.length() > 0) {
			                takeDates.append(",");
			            }
			            takeDates.append("'");
			            takeDates.append(date);
			            takeDates.append("'");
			        }
			  hql.append(" and o.orderDate in ("+takeDates.toString()+")"); 
			}else if(map.get("orderDate").equals("fiat")){
				Calendar cal = Calendar.getInstance();
				Date d1 = new Date();
				cal.add(Calendar.MONTH, -3);
				Date d2 = cal.getTime();
				long daterange = d1.getTime() - d2.getTime();     
			    long time = 1000*3600*24;
			    List<String> dates = CalendarDays(Integer.parseInt(String.valueOf(daterange/time)));
				 StringBuilder takeDates = new StringBuilder();
			        for (String date : dates) {
			            if (takeDates.length() > 0) {
			                takeDates.append(",");
			            }
			            takeDates.append("'");
			            takeDates.append(date);
			            takeDates.append("'");
			        }
			   hql.append(" and o.orderDate in ("+takeDates.toString()+")"); 
			}
		}
		orderFormDao.getEntityManager().clear();
		Query query = orderFormDao.getEntityManager().createNativeQuery(hql.toString(), OrderForm.class);
		@SuppressWarnings("unchecked")
		List<OrderForm> list =  query.getResultList();
		return list;
	}
	
	private List<String> CalendarDays(int day) {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        List<String> weekDays = new ArrayList<String>();
        for (int i = 0; i < day; i++) {
            weekDays.add(format.format(cal.getTime()));
            cal.add(Calendar.DATE, -1);
        }
        return weekDays;
    }

	@Override
	public List<OrderForm> getShopOrderByShop(Shop shop) {
		StringBuffer hql = new StringBuffer("select DISTINCT o.* from OrderForm o right join Commodity com on com.orderform_id = o.orderFormID  where com.seller_name = "+shop.getId());
		Calendar cal = Calendar.getInstance();
		Date d1 = new Date();
		cal.add(Calendar.MONTH, -3);
		Date d2 = cal.getTime();
		long daterange = d1.getTime() - d2.getTime();     
	    long time = 1000*3600*24;
	    List<String> dates = CalendarDays(Integer.parseInt(String.valueOf(daterange/time)));
		 StringBuilder takeDates = new StringBuilder();
	        for (String date : dates) {
	            if (takeDates.length() > 0) {
	                takeDates.append(",");
	            }
	            takeDates.append("'");
	            takeDates.append(date);
	            takeDates.append("'");
	        }
	    hql.append(" and o.orderDate in ("+takeDates.toString()+")"); 
	    orderFormDao.getEntityManager().clear();
		Query query = orderFormDao.getEntityManager().createNativeQuery(hql.toString(), OrderForm.class);
		@SuppressWarnings("unchecked")
		List<OrderForm> list =  query.getResultList();
		return list;
	}
}
