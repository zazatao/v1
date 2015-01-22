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

import com.yc.entity.Delivery;
import com.yc.entity.OrderForm;
import com.yc.entity.CommodityStatus;
import com.yc.entity.Package;
import com.yc.service.IOrderFormService;
import com.yc.service.IPackageService;

//中转接收和发送
@Controller
@RequestMapping("/forwarding")
public class TransitController {
	
	private static final Logger LOG = Logger.getLogger(TransitController.class);
	
	@Autowired
	IPackageService packageService;
	
	@Autowired
	IOrderFormService orderService;
	
	@RequestMapping(value = "transit", method = RequestMethod.GET)
	public ModelAndView transit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("packageMap");
		List<Package> list = packageService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
	    return new ModelAndView("forwarding/transit", mode);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "getOrder", method = RequestMethod.GET)
	public ModelAndView getOrder(Integer id ,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = (Map<String, Object>)request.getSession().getAttribute("packageMap");
		List<Package> list =null;
		if (map!=null) {
			 list = packageService.getPackAgeByParameters(map);
		}else{
			list = packageService.getAll();
		}
		List<OrderForm> orders =  orderService.findByPackAgeID(id);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		mode.put("orders", orders);
	    return new ModelAndView("forwarding/transit", mode);
	}
	
	@RequestMapping(value = "searchTransit", method = RequestMethod.POST)
	public ModelAndView searchTransit(Integer id ,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String packageCode = request.getParameter("packageCode");
		String formDelivery = request.getParameter("formDelivery");
		String formStatus = request.getParameter("formStatus");
		Map<String, Object> map = new HashMap<String, Object>();
		if (packageCode.trim().equals("")) {
			map.put("packageCode", null);
		}else{
			map.put("packageCode", packageCode);
		}
		if (formDelivery.trim().equals("")) {
			map.put("formDelivery", null);
		}else{
			map.put("formDelivery", Delivery.valueOf(formDelivery));
		}
		if (formStatus.trim().equals("")) {
			map.put("formStatus", null);
		}else{
			map.put("formStatus", CommodityStatus.valueOf(formStatus));
		}
		List<Package> list = packageService.getPackAgeByParameters(map);
		request.getSession().setAttribute("packageMap", map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
	    return new ModelAndView("forwarding/transit", mode);
	}
	
}
