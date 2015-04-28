package com.yc.controller.management;

import java.io.IOException;
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

import com.yc.entity.MissionPlan;
import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.service.IDepartAndPositionsService;
import com.yc.service.IMissionPlanService;

//管理
@Controller
@RequestMapping("/management")
public class ManagementThreeController {

	private static final Logger LOG = Logger.getLogger(ManagementThreeController.class);
	
	@Autowired
	IMissionPlanService misPlanService; 
	
	@Autowired
	IDepartAndPositionsService departAndPositionsService;
	
	@RequestMapping(value = "missionPlan", method = RequestMethod.GET)
	public ModelAndView missionPlan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Personnel personnel = (Personnel)request.getSession().getAttribute("loginPersonnle");
		List<MissionPlan> list = misPlanService.getAllByPer(personnel);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/missionPlan",mode);
	}
	
	@RequestMapping(value = "addMissionPlan", method = RequestMethod.GET)
	public ModelAndView addMissionPlan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Personnel personnel = (Personnel)request.getSession().getAttribute("loginPersonnle");
		DepartAndPositions depAndPos = personnel.getDepartAndPositions();
		Department dep = depAndPos.getDepartment();
		ModelMap mode = new ModelMap();
		mode.put("deps", dep);
		return new ModelAndView("management/addMissionPlan",mode);
	}
	
}
