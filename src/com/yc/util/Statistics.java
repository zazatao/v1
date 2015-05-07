package com.yc.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.model.PersonnelStatistics;
import com.yc.service.IDepartAndPositionsService;
import com.yc.service.IDepartmentService;
import com.yc.service.IPersonnelService;

@Controller
@RequestMapping("/analysis")
public class Statistics {
	private static final int FIRST_DAY = Calendar.MONDAY;
	
	@Autowired
	IDepartAndPositionsService depAndPositionsService;

	@Autowired
	IPersonnelService personnelService;

	@Autowired
	IDepartmentService departmentService;

	@RequestMapping(value = "removecauses", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> removecauses(String param,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Personnel personnel = (Personnel) request.getSession().getAttribute("loginPersonnle");
		ModelMap mode = new ModelMap();
		Map<String, List<PersonnelStatistics>> map  = new HashMap<String, List<PersonnelStatistics>>();
		if (personnel.getDepartAndPositions() != null) {
			List<Personnel> personnels = new ArrayList<Personnel>();
			if (personnel.getDepartAndPositions().getDepartment().getDepartmentID() == 2) {
				if (personnel.getDepartAndPositions().getPositions() != null) {
					Positions posit = personnel.getDepartAndPositions().getPositions();
					Set<Positions> positions = posit.getChildren();
					List<DepartAndPositions> depAndPos = depAndPositionsService.findDepAndPosByDep(personnel.getDepartAndPositions().getDepartment());
					for (DepartAndPositions dep : depAndPos) {
						Positions post = dep.getPositions();
						Iterator<Positions> iter = positions.iterator();
						while (iter.hasNext()) {
							Positions pon = iter.next();
							if (post.getPositionid() == pon.getPositionid()) {
								List<Personnel> personne = personnelService.getAllByDepAndPos(dep);
								personnels.addAll(personne);
							}
						}
					}
					personnels.add(personnel);
				}
			} else {
				Department department = departmentService.findById(2);
				List<DepartAndPositions> depAndPoss = depAndPositionsService.findDepAndPosByDep(department);
				for (DepartAndPositions dep : depAndPoss) {
					List<Personnel> personne = personnelService.getAllByDepAndPos(dep);
					personnels.addAll(personne);
				}
			}
			String days = "";
			if (param!= null && param.equals("week")) {
				days = printWeekdays("week",7);
			}else if (param!= null && param.equals("months")) {
				days = printMonths(getFirstDayOfMonth(new Date()),new Date());
			}else{
				days = printMonths(getFirstDayOfYear(new Date()),new Date());
			}
			List<PersonnelStatistics> arryList = null;
			for (int i = 0; i < personnels.size(); i++) {
				arryList = personnelService.getOrtherByParam(days,personnels.get(i));
				map.put(personnels.get(i).getUserName(), arryList);
			}
			mode.put("statistics", map);
			days = days.replace("'", "");
			mode.put("days", days);
		}
		return mode;
	}
	 
    private static String printWeekdays(String week,Integer days) {
    	StringBuffer sb = new StringBuffer();
        Calendar calendar = Calendar.getInstance();
        setToFirstDay(calendar);
        for (int i = 0; i < days; i++) {
        	sb.append("'"+printDay(calendar)+"',");
            calendar.add(Calendar.DATE, 1);
        }
        return sb.substring(0, sb.length()-1);
    }
 
    private static void setToFirstDay(Calendar calendar) {
        while (calendar.get(Calendar.DAY_OF_WEEK) != FIRST_DAY) {
            calendar.add(Calendar.DATE, -1);
        }
    }
 
    private static String printDay(Calendar calendar) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(calendar.getTime());
    }
    public static String printMonths(Date dBegin, Date dEnd) {  
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        StringBuffer sb = new StringBuffer("'"+dateFormat.format(dBegin)+"',");
        Calendar calBegin = Calendar.getInstance();  
        // 使用给定的 Date 设置此 Calendar 的时间    
        calBegin.setTime(dBegin);  
        Calendar calEnd = Calendar.getInstance();  
        // 使用给定的 Date 设置此 Calendar 的时间    
        calEnd.setTime(dEnd);  
        // 测试此日期是否在指定日期之后    
        while (dEnd.after(calBegin.getTime())) {  
            // 根据日历的规则，为给定的日历字段添加或减去指定的时间量    
            calBegin.add(Calendar.DAY_OF_MONTH, 1);  
            sb.append(dateFormat.format("'"+calBegin.getTime())+"',");  
        }  
        return  sb.substring(0, sb.length()-1);
    }
    /** 
     * 得到本月第一天的日期 
     * @Methods Name getFirstDayOfMonth 
     * @return Date 
     */  
    public Date getFirstDayOfMonth(Date date)   {     
        Calendar cDay = Calendar.getInstance();     
        cDay.setTime(date);  
        cDay.set(Calendar.DAY_OF_MONTH, 1);  
        System.out.println(cDay.getTime());  
        return cDay.getTime();     
    }  
    /** 
     * 得到本年第一天的日期 
     * @Methods Name getFirstDayOfMonth 
     * @return Date 
     */  
    public Date getFirstDayOfYear(Date date)   {     
    	Calendar cDay = Calendar.getInstance();     
    	cDay.setTime(date);  
    	cDay.set(Calendar.DAY_OF_YEAR, 1);  
    	System.out.println(cDay.getTime());  
    	return cDay.getTime();     
    }  
    
}
