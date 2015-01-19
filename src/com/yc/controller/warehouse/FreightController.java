package com.yc.controller.warehouse;

import java.io.IOException;
import java.util.ArrayList;
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
import com.yc.entity.Package;
import com.yc.service.IPackageService;

//仓库运费
@Controller
@RequestMapping("/warehouse")
public class FreightController {
	private static final Logger LOG = Logger.getLogger(SendTheParcel.class);

	@Autowired
	IPackageService packageService;

	@RequestMapping(value = "freight", method = RequestMethod.GET)
	public ModelAndView freight(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Package> list = packageService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("warehouse/freight", map);
	}
	
	@RequestMapping(value = "searchFreight", method = RequestMethod.POST)
	public ModelAndView searchFreight(String page,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("packageCode").trim().equals("")) {
			map.put("packageCode", null);
		}else{
			map.put("packageCode", request.getParameter("packageCode"));
		}
		if (request.getParameter("formDelivery").trim().equals("")) {
			map.put("formDelivery", null);
		} else {
			map.put("formDelivery", Delivery.valueOf(request.getParameter("formDelivery")));
		}
		if (request.getParameter("userName").trim().equals("")) {
			map.put("userName", null);
		}else{
			map.put("userName", request.getParameter("userName"));
		}
		if (request.getParameter("sendDate").trim().equals("")) {
			map.put("sendDate", null);
		}else{
			map.put("sendDate", request.getParameter("sendDate"));
		}
		List<Package> list = packageService.getPackAgeByParameters(map);
		if (map.get("userName")!=null) {
			List<Package> packages = new ArrayList<Package>();
			if (list.size()>0) {
				for (Package package1 : list) {
					for (OrderForm order : package1.getOrderForms()) {
						if (order.getOrderUser().getUserName().contains(map.get("userName").toString())) {
							packages.add(package1);
						}
					}
				}
				list = packages;
			}
		}
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		request.getSession().setAttribute("packageMap", map);
		if (page.equals("freight")) {
			return new ModelAndView("warehouse/freight", mode);
		}else if (page.equals("batchShipments")) {
			return new ModelAndView("warehouse/batchShipments", mode);
		}else{
			return null;
		}
		
	}
}
