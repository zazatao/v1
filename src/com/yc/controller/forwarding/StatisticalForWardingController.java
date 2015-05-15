package com.yc.controller.forwarding;

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

import com.yc.entity.Package;
import com.yc.entity.user.Personnel;
import com.yc.service.IPackageService;

//中转计算统计
@Controller
@RequestMapping("/forwarding")
public class StatisticalForWardingController {

	private static final Logger LOG = Logger.getLogger(StatisticalForWardingController.class);
	
	@Autowired
	IPackageService packageService;
	
	@RequestMapping(value = "forStatistical", method = RequestMethod.GET)
	public ModelAndView statistical(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Personnel personnel = (Personnel)request.getSession().getAttribute("loginPersonnle");
		ModelMap mode = new ModelMap();
		if (personnel != null && personnel.getDepartAndPositions().getDepartment().getDepartmentID() == 4) {
			List<Package> packages = packageService.getPackAgesForTransit(personnel);
			mode.put("packages", packages);
		}else{
			List<Package> packages = packageService.getAll();
			mode.put("packages", packages);
		}
		return new ModelAndView("forwarding/statistical",mode);
	}
}
