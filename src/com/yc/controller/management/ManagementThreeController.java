package com.yc.controller.management;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.AdvState;
import com.yc.entity.MissionPlan;
import com.yc.entity.Period;
import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.service.IDepartAndPositionsService;
import com.yc.service.IDepartmentService;
import com.yc.service.IMissionPlanService;
import com.yc.service.IPersonnelService;
import com.yc.service.ITicketService;

//管理
@Controller
@RequestMapping("/management")
public class ManagementThreeController {

	private static final Logger LOG = Logger.getLogger(ManagementThreeController.class);

	@Autowired
	IMissionPlanService misPlanService;

	@Autowired
	IDepartAndPositionsService departAndPositionsService;

	@Autowired
	ITicketService ticketService;

	@Autowired
	IDepartmentService departmentService;

	@Autowired
	IPersonnelService personnelService;

	@RequestMapping(value = "missionPlan", method = RequestMethod.GET)
	public ModelAndView missionPlan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		Personnel personnel = (Personnel) request.getSession().getAttribute("loginPersonnle");
		List<MissionPlan> list = misPlanService.getAllByPer(personnel);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = new Date();
		if (list != null && list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				MissionPlan plan = list.get(i);
				if (plan.getAdvState() == AdvState.InProgress ) {
					Date enddate = sdf.parse(plan.getEndDate());
					long day= enddate.getTime()-nowDate.getTime();
					if (day<0) {
						plan.setAdvState(AdvState.Unfinished);
						misPlanService.update(plan);
					}
				}
			}
		}
		List<MissionPlan> list1 = misPlanService.getAllByPer(personnel);
		ModelMap mode = new ModelMap();
		mode.put("list", list1);
		return new ModelAndView("management/missionPlan", mode);
	}

	@RequestMapping(value = "addMissionPlan", method = RequestMethod.GET)
	public ModelAndView addMissionPlan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Personnel personnel = (Personnel) request.getSession().getAttribute("loginPersonnle");
		DepartAndPositions depAndPos = personnel.getDepartAndPositions();
		Department dep = depAndPos.getDepartment();
		ModelMap mode = new ModelMap();
		mode.put("deps", dep);
		return new ModelAndView("management/addMissionPlan", mode);
	}

	@RequestMapping(value = "planAcitve", method = RequestMethod.POST)
	public ModelAndView planAcitve(Integer id, MissionPlan plan,String advStates, String periods, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] persNames = request.getParameterValues("persName");
		Personnel fromPer = (Personnel)request.getSession().getAttribute("loginPersonnle");
		String[] accelerates = request.getParameterValues("accelerate");
		boolean accelerate = false;
		if (accelerates != null && accelerates.length>0) {
			accelerate = Boolean.valueOf(accelerates[0]);
		}
		MissionPlan miss = null;
		ModelMap mode = new ModelMap();
		if (id != null ) {
			 miss = misPlanService.findById(id);
			 if (miss != null) {
				 if (persNames != null && persNames.length>0) {
						for (int i = 0; i < persNames.length; i++) {
							Personnel toPer = personnelService.findById(Integer.parseInt(persNames[i]));
							miss.setEndDate(plan.getEndDate());
							miss.setMissionName(plan.getMissionName());
							miss.setRemarks(plan.getRemarks());
							miss.setUsingTime(plan.getUsingTime());
							miss.setToPer(toPer);
							if(plan.getPositiveOrNo() != null){
								miss.setPositiveOrNo(plan.getPositiveOrNo());
							}
							if (periods != null ) {
								miss.setPeriod(Period.valueOf(periods));
							}
							if (advStates != null) {
								miss.setAdvState(AdvState.valueOf(advStates));
							}
							miss.setAccelerate(accelerate);
							if (plan.getCompLine() != null) {
								miss.setCompLine(plan.getCompLine());
							}
							misPlanService.update(miss);
							mode.put("msage", "计划修改成功");
						}
				 }
			}
		}else{
			if (persNames != null && persNames.length>0) {
				for (int i = 0; i < persNames.length; i++) {
					Personnel toPer = personnelService.findById(Integer.parseInt(persNames[i]));
					miss = new MissionPlan();
					miss.setEndDate(plan.getEndDate());
					miss.setCompLine(plan.getCompLine());
					miss.setMissionName(plan.getMissionName());
					miss.setRemarks(plan.getRemarks());
					miss.setUsingTime(plan.getUsingTime());
					miss.setToPer(toPer);
					miss.setFromPer(fromPer);
					miss.setPeriod(Period.valueOf(periods));
					miss.setAdvState(AdvState.InProgress);
					miss.setAccelerate(accelerate);
					miss.setCompLine("0");
					misPlanService.save(miss);
					mode.put("msage", "计划添加成功");
				}
			}
		}
		return  new ModelAndView("management/success",mode);
	}

	@RequestMapping(value = "deleteMissionPlan", method = RequestMethod.GET)
	public ModelAndView deleteMissionPlan(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		misPlanService.delete(id);
		ModelMap mode = new ModelMap();
		mode.put("msage", "计划删除成功");
		return new ModelAndView("management/success", mode);
	}

	@RequestMapping(value = "updateMissionPlan", method = RequestMethod.GET)
	public ModelAndView updateMissionPlan(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		MissionPlan miss = misPlanService.findById(id);
		Personnel personnel = (Personnel) request.getSession().getAttribute("loginPersonnle");
		DepartAndPositions depAndPos = personnel.getDepartAndPositions();
		Department dep = depAndPos.getDepartment();
		mode.put("deps", dep);
		mode.put("missionPlan", miss);
		return new ModelAndView("management/addMissionPlan", mode);
	}

}
