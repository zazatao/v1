package com.yc.controller.forwarding;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.yc.controller.warehouse.WeighingController;
import com.yc.entity.OrderForm;
import com.yc.entity.user.Personnel;
import com.yc.service.IOrderFormService;
import com.yc.service.IPersonnelService;

//中转问题
@Controller
@RequestMapping("/forwarding")
public class QuestionController {
	
	private static final Logger LOG = Logger.getLogger(QuestionController.class);
	
	@Autowired
	IOrderFormService orderService;
	
	@Autowired
	IPersonnelService personnelService;
	
	@RequestMapping(value = "question", method = RequestMethod.GET)
	public ModelAndView question(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Personnel> list = personnelService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("forwarding/question", mode);
	}
	
	@RequestMapping(value = "searchQuestion", method = RequestMethod.POST)
	public ModelAndView searchQuestion(String loginName ,String userName,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Personnel> list = personnelService.getUsersByParameters(loginName,userName);
		Map<String, String> map = new HashMap<String, String>();
		map.put("loginName", loginName);
		map.put("userName", userName);
		request.getSession().setAttribute("para", map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("forwarding/question", mode);
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "getOrders", method = RequestMethod.GET)
	public ModelAndView getOrders(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> map = (Map<String, String>)request.getSession().getAttribute("para");
		List<Personnel> list = null;
		if (map !=null) {
			list = personnelService.getUsersByParameters(map.get("loginName"),map.get("userName"));
		}else{
			list = personnelService.getAll();
		}
		List<OrderForm> orders = orderService.findByUserID(id);
		ModelMap mode = new ModelMap();
		mode.put("orders", orders);	
		mode.put("list", list);
		return new ModelAndView("forwarding/question", mode);
	}
	
}
