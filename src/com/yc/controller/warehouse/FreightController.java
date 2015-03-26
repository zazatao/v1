package com.yc.controller.warehouse;

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
		List<Package> list = packageService.getPackages();
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
		ModelMap mode = new ModelMap();
		request.getSession().setAttribute("packageMap", map);
		if (page.equals("freight")) {
			List<Package> list = packageService.getPackAgeByParameters(map,0);
			mode.put("list", list);
			return new ModelAndView("warehouse/freight", mode);
		}else if (page.equals("batchShipments")) {
			List<Package> list = packageService.getPackAgesByBatchShipments(map);
			mode.put("list", list);
			return new ModelAndView("warehouse/batchShipments", mode);
		}else{
			return null;
		}
	}
	
	@RequestMapping(value = "updateTransportFee", method = RequestMethod.GET)
	public String updateTransportFee(String packAgeTpek,Float transportFee, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Package pack = packageService.getPackAgeByTpek(packAgeTpek);
		pack.setTransportFee(transportFee);
		if (pack.getIsFee()==null) {
			pack.setIsFee(false);
		}
		pack.setIsClearing(true);
		packageService.update(pack);
		return "redirect:/warehouse/freight";
	}
}
