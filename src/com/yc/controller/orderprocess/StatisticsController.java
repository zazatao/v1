
package com.yc.controller.orderprocess;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.model.PersonnelStatistics;
import com.yc.service.IDepartAndPositionsService;
import com.yc.service.IDepartmentService;
import com.yc.service.IOrderFormService;
import com.yc.service.IOrderGroupService;
import com.yc.service.IPersonnelService;

//订单处理订单组
@Controller
@RequestMapping("/orderprocessing")
public class StatisticsController {
	
	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(StatisticsController.class);
	
	@Autowired
	IOrderGroupService orderGroupService;
	
	@Autowired
	IOrderFormService orderFormService;
	
	@Autowired
	IDepartAndPositionsService depAndPositionsService;

	@Autowired
	IPersonnelService personnelService;

	@Autowired
	IDepartmentService departmentService;
	
    @RequestMapping(value = "statistics", method = RequestMethod.GET)
    public ModelAndView statistics(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return new ModelAndView("orderprocessing/statistics");
    }
    
}
