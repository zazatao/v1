package com.yc.controller.warehouse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLEngineResult.Status;
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

import com.yc.entity.CargoGroup;
import com.yc.entity.Delivery;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.entity.Package;
import com.yc.entity.Transit;
import com.yc.service.ICargoGroupService;
import com.yc.service.IOrderFormService;
import com.yc.service.IPackageService;
//仓库货物组
@Controller
@RequestMapping("/warehouse")
public class CargoGroupController {
	
	private static final Logger LOG = Logger.getLogger(CargoGroupController.class);

	@Autowired
	IPackageService packageService;
	
	@Autowired
	ICargoGroupService cargoGroupService;

	@Autowired
	IOrderFormService orderFormService;
	
	@RequestMapping(value = "cargoGroup", method = RequestMethod.GET)
	public ModelAndView cargoGroup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("packageMap");
		List<CargoGroup> list = cargoGroupService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("warehouse/cargoGroup", map);
	}
	
	@RequestMapping(value = "getPackAge", method = RequestMethod.GET)
	public ModelAndView getPackAge(Integer id,Double weight, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Package> packAges = packageService.findByGroupID(id);
		ModelMap map = getSearch(request);
		map.put("packAges", packAges);
		map.put("id", id);
		map.put("weight", weight);
		return new ModelAndView("warehouse/cargoGroup", map);
	}
	
	@RequestMapping(value = "getOrderByPackID", method = RequestMethod.GET)
	public ModelAndView getOrderByPackID(Integer groupID,Integer id,Double weight, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Package> packAges = packageService.findByGroupID(groupID);
		List<OrderForm> orders =  orderFormService.findByPackAgeID(id);
		ModelMap map = getSearch(request);
		map.put("packAges", packAges);
		map.put("orders", orders);
		map.put("weight", weight);
		return new ModelAndView("warehouse/cargoGroup", map);
	}
	
	@RequestMapping(value = "getCargoGroup", method = RequestMethod.GET)
	public ModelAndView getCargoGroup(String transit,String delivery, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Package> packAges = packageService.getAllByTransitAndDelivery(transit,delivery);
		CargoGroup cargoGroup = new CargoGroup();
		cargoGroup.setDelivery(Delivery.valueOf(delivery));
		cargoGroup.setPackAges(packAges);
		cargoGroup.setTransit(Transit.valueOf(transit));
		Double totalWeight = 0.0;
		if (packAges.size()>0) {
			for (Package packAge : packAges) {
				totalWeight = totalWeight +packAge.getTotalWeight();
			}
		}
		cargoGroup.setTotalWeight(totalWeight);
		cargoGroupService.save(cargoGroup);
		return cargoGroup(request, response);
	}
	
	@RequestMapping(value = "searchCargoGroup", method = RequestMethod.POST)
	public ModelAndView searchCargoGroup( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("cargoGroupID").trim().equals("")) {
			map.put("cargoGroupID", null);
		}else{
			map.put("cargoGroupID", Integer.parseInt(request.getParameter("cargoGroupID")));
		}
		if (request.getParameter("formDelivery").trim().equals("")) {
			map.put("formDelivery", null);
		} else {
			map.put("formDelivery", Delivery.valueOf(request.getParameter("formDelivery")));
		}
		if (request.getParameter("formTransit").trim().equals("")) {
			map.put("formTransit", null);
		} else {
			map.put("formTransit", Transit.valueOf(request.getParameter("formTransit")));
		}
		if (request.getParameter("formStatus").trim().equals("")) {
			map.put("formStatus", null);
		} else {
			map.put("formStatus", OrderStatus.valueOf(request.getParameter("formStatus")));
		}
		if (request.getParameter("sendDate").trim().equals("")) {
			map.put("sendDate", null);
		}else{
			map.put("sendDate", request.getParameter("sendDate"));
		}
		List<CargoGroup> list = cargoGroupService.getCargoGroupByParameters(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		request.getSession().setAttribute("packageMap", map);
		return new ModelAndView("warehouse/cargoGroup", mode);
	}
	@SuppressWarnings({ "unused", "unchecked" })
	private ModelMap getSearch ( HttpServletRequest request){
		Map<String, Object> map = (Map<String, Object>)request.getSession().getAttribute("packageMap");
		List<CargoGroup> list =null;
		if (map !=null) {
			list = cargoGroupService.getCargoGroupByParameters(map);
		}else{
			list = cargoGroupService.getAll();
		}
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return mode;
	}
}
