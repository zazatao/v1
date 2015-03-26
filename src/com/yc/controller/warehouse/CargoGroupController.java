package com.yc.controller.warehouse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.yc.entity.CargoGroup;
import com.yc.entity.Commodity;
import com.yc.entity.Delivery;
import com.yc.entity.OrderForm;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.Package;
import com.yc.entity.Transit;
import com.yc.service.ICargoGroupService;
import com.yc.service.ICommodityService;
import com.yc.service.IOrderFormService;
import com.yc.service.IPackageService;
//仓库货物组
@Controller
@RequestMapping("/warehouse")
public class CargoGroupController {
	
	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(CargoGroupController.class);

	@Autowired
	IPackageService packageService;
	
	@Autowired
	ICargoGroupService cargoGroupService;

	@Autowired
	IOrderFormService orderFormService;
	
	@Autowired
	ICommodityService commodityService;
	
	@RequestMapping(value = "cargoGroup", method = RequestMethod.GET)
	public ModelAndView cargoGroup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("packageMap");
		List<CargoGroup> list = cargoGroupService.getCarGroupByStatus();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("warehouse/cargoGroup", map);
	}
	
	@RequestMapping(value = "getPackAge", method = RequestMethod.GET)
	public ModelAndView getPackAge(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CargoGroup> list = cargoGroupService.getCarGroupByStatus();
		List<Package> packAges = packageService.findByGroupID(id);
		CargoGroup cargoGroup = cargoGroupService.findById(id);
		ModelMap map = getSearch(request);
		map.put("list", list);
		map.put("packAges", packAges);
		map.put("cargoGroup", cargoGroup);
		return new ModelAndView("warehouse/cargoGroup", map);
	}
	
	@RequestMapping(value = "getOrderByPackID", method = RequestMethod.GET)
	public ModelAndView getOrderByPackID(Integer groupID,Integer id,Double weight, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CargoGroup> list = cargoGroupService.getCarGroupByStatus();
		List<Package> packAges = packageService.findByGroupID(groupID);
		CargoGroup cargoGroup = cargoGroupService.findById(groupID);
		List<OrderForm> orders =  orderFormService.findByPackAgeID(id);
		ModelMap map = getSearch(request);
		map.put("packAges", packAges);
		map.put("orders", orders);
		map.put("cargoGroup", cargoGroup);
		map.put("list", list);
		return new ModelAndView("warehouse/cargoGroup", map);
	}
	
	@RequestMapping(value = "getCargoGroup", method = RequestMethod.GET)
	public String getCargoGroup(String transit,String delivery, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Package> packAges = packageService.getAllByTransitAndDelivery(transit,delivery);
		if (packAges.size()>0) {
			CargoGroup cargoGroup = new CargoGroup();
			cargoGroup.setDelivery(Delivery.valueOf(delivery));
			cargoGroup.setPackAges(packAges);
			cargoGroup.setTransit(Transit.valueOf(transit));
			cargoGroup.setStatus(CommoidityStatus.packing);
			cargoGroup.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			cargoGroup.setTpekCargoGroup("cargoGroup0021"+packAges.size());
			cargoGroup = cargoGroupService.save(cargoGroup);
			Double totalWeight = 0.0;
			if (packAges.size()>0) {
				for (Package packAge : packAges) {
					packAge.setCargoGroup(cargoGroup);
					if (packAge.getTotalWeight() != null) {
						totalWeight = totalWeight +packAge.getTotalWeight();
					}
					packageService.update(packAge);
				}
			}
			cargoGroup.setTotalWeight(totalWeight);
			cargoGroupService.update(cargoGroup);
		}
		return "redirect:/warehouse/cargoGroup";
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
	
	@RequestMapping(value = "sendCargoGroup", method = RequestMethod.POST)
	public String sendCargoGroup(Float fee,Integer cargoGroupID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CargoGroup cargoGroup = cargoGroupService.findById(cargoGroupID);
		float f =0;
		if (fee != null) {
			if (cargoGroup.getPackAges().size()>0) {
				f = fee/cargoGroup.getPackAges().size();
			}
		}
		for (int i = 0; i < cargoGroup.getPackAges().size(); i++) {
			Package pack = cargoGroup.getPackAges().get(i);
			pack.setTransportFee(pack.getTransportFee()+f);
			for (int j = 0; j < pack.getOrderForms().size(); j++) {
				OrderForm order =  pack.getOrderForms().get(j);
				if (order.getAddress().getHandedAddress() != null) {
					for (int k = 0; k < order.getCommodities().size(); k++) {
						Commodity comm = order.getCommodities().get(k);
						comm.setStatus(CommoidityStatus.inForwarding);
						commodityService.update(comm);
					}
				}else{
					for (int k = 0; k < order.getCommodities().size(); k++) {
						Commodity comm = order.getCommodities().get(k);
						comm.setStatus(CommoidityStatus.sendOut);
						commodityService.update(comm);
					}
				}
			}
			pack.setSendDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			packageService.update(pack);
		}
		if (cargoGroup.getTransit() != null) {
			cargoGroup.setStatus(CommoidityStatus.inForwarding);
		}else{
			cargoGroup.setStatus(CommoidityStatus.sendOut);
		}
		cargoGroup.setSendDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		cargoGroupService.update(cargoGroup);
		return "redirect:/warehouse/cargoGroup";
	}
}
