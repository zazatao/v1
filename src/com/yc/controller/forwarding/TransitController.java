package com.yc.controller.forwarding;

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
import com.yc.entity.CommoidityStatus;
import com.yc.entity.Delivery;
import com.yc.entity.OrderForm;
import com.yc.entity.Package;
import com.yc.entity.ProblemPack;
import com.yc.entity.TransitSite;
import com.yc.entity.user.Personnel;
import com.yc.service.ICargoGroupService;
import com.yc.service.ICommodityService;
import com.yc.service.IOrderFormService;
import com.yc.service.IPackageService;
import com.yc.service.IProblemPackService;
import com.yc.service.ITransitSiteService;

//中转接收和发送
@Controller
@RequestMapping("/forwarding")
public class TransitController {
	
	private static final Logger LOG = Logger.getLogger(TransitController.class);
	
	@Autowired
	IPackageService packageService;
	
	@Autowired
	IOrderFormService orderService;
	
	@Autowired
	ICargoGroupService cargoGroupService;
	
	@Autowired
	ITransitSiteService transitSiteService;
	
	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IProblemPackService problemPackService;
	
	@RequestMapping(value = "transit", method = RequestMethod.GET)
	public ModelAndView transit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("packageMap");
		request.getSession().removeAttribute("cargoGroupID");
		Personnel personnel = (Personnel)request.getSession().getAttribute("loginPersonnle");
		List<CargoGroup> list = cargoGroupService.getCargoGroupByForTransit(personnel);
		List<Package> packages = packageService.getPackAgesForTransit(personnel);
		ModelMap mode = new ModelMap();
		mode.put("packAges", packages);
		mode.put("list", list);
	    return new ModelAndView("forwarding/transit", mode);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "getPackAge", method = RequestMethod.GET)
	public ModelAndView getOrder(Integer id ,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("cargoGroupID");
		Map<String, Object> map = (Map<String, Object>)request.getSession().getAttribute("packageMap");
		Personnel personnel = (Personnel)request.getSession().getAttribute("loginPersonnle");
		List<Package> packages = packageService.getPackAgesForTransit(personnel);
		List<CargoGroup> list = null;
		if (map != null) {
			list = cargoGroupService.getCargoGroupParameters(map,personnel);
		}else{
			list = cargoGroupService.getCargoGroupByForTransit(personnel);
		}
		CargoGroup cargoGroup = cargoGroupService.findById(id);
		request.getSession().setAttribute("cargoGroupID", id);
		ModelMap mode = new ModelMap();
		mode.put("packAges", packages);
		mode.put("list", list);
		mode.put("cargoGroup", cargoGroup);
	    return new ModelAndView("forwarding/transit", mode);
	}
	
	@RequestMapping(value = "searchTransit", method = RequestMethod.POST)
	public ModelAndView searchTransit(Integer id ,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tpekCargoGroup = request.getParameter("tpekCargoGroup");
		String formDelivery = request.getParameter("formDelivery");
		String receiveDate = request.getParameter("receiveDate");
		Personnel personnel = (Personnel)request.getSession().getAttribute("loginPersonnle");
		Map<String, Object> map = new HashMap<String, Object>();
		if (tpekCargoGroup.trim().equals("")) {
			map.put("tpekCargoGroup", null);
		}else{
			map.put("tpekCargoGroup", tpekCargoGroup);
		}
		if (formDelivery.trim().equals("")) {
			map.put("formDelivery", null);
		}else{
			map.put("formDelivery", Delivery.valueOf(formDelivery));
		}
		if (receiveDate.trim().equals("")) {
			map.put("receiveDate", null);
		}else{
			map.put("receiveDate", receiveDate);
		}
		List<CargoGroup> list = cargoGroupService.getCargoGroupParameters(map,personnel);
		request.getSession().setAttribute("packageMap", map);
		List<Package> packages = packageService.getPackAgesForTransit(personnel);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		mode.put("packAges", packages);
	    return new ModelAndView("forwarding/transit", mode);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "packOrder", method = RequestMethod.GET)
	public ModelAndView packOrder(Integer cargoGroupID, Integer packageID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = (Map<String, Object>)request.getSession().getAttribute("packageMap");
		Personnel personnel = (Personnel)request.getSession().getAttribute("loginPersonnle");
		List<Package> packages = packageService.getPackAgesForTransit(personnel);
		List<CargoGroup> list = null;
		if (map != null) {
			list = cargoGroupService.getCargoGroupParameters(map,personnel);
		}else{
			list = cargoGroupService.getCargoGroupByForTransit(personnel);
		}
		if (cargoGroupID == null && request.getSession().getAttribute("cargoGroupID") != null ) {
			cargoGroupID = Integer.parseInt(request.getSession().getAttribute("cargoGroupID").toString());
		}
		CargoGroup cargoGroup = cargoGroupService.findById(cargoGroupID);
		Package pack = packageService.findById(packageID);
		ModelMap mode = new ModelMap();
		mode.put("packAges", packages);
		mode.put("list", list);
		mode.put("cargoGroup", cargoGroup);
		mode.put("pack", pack);
		return  new ModelAndView("forwarding/transit", mode);
	}
	
	@RequestMapping(value = "sendCargoGroup", method = RequestMethod.GET)
	public String sendCargoGroup(Integer transitID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TransitSite transitSite =  transitSiteService.findById(transitID);
		for (int i = 0; i < transitSite.getCargoGroups().size(); i++) {
			CargoGroup cargo = transitSite.getCargoGroups().get(i);
			for (Package pack : cargo.getPackAges()) {
				for (OrderForm order : pack.getOrderForms()) {
					for (int j = 0; j < order.getCommodities().size(); j++) {
						Commodity comm = order.getCommodities().get(j);
						comm.setStatus(CommoidityStatus.sendOut);
						commodityService.update(comm);
					}
				}
			}
			cargo.setStatus(CommoidityStatus.sendOut);
			cargoGroupService.update(cargo);
		}
		transitSite.setSendDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));;
		transitSiteService.update(transitSite);
		return "redirect:/forwarding/transit";
	}
	
	@RequestMapping(value = "distributedPackAge", method = RequestMethod.GET)
	public String distributedPackAge(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Package pack = packageService.findById(id);
		if (pack.getTransitSte() == null && pack.getCargoGroup() != null) {
			for (OrderForm order : pack.getOrderForms()) {
				for (int i = 0; i < order.getCommodities().size(); i++) {
					Commodity comm = order.getCommodities().get(i);
					comm.setStatus(CommoidityStatus.sendOut);
					commodityService.update(comm);
				}
			}
		}else{
			TransitSite transitSite = pack.getTransitSte();
			if (transitSite != null) {
				for (OrderForm order : pack.getOrderForms()) {
					for (int i = 0; i < order.getCommodities().size(); i++) {
						Commodity comm = order.getCommodities().get(i);
						comm.setStatus(CommoidityStatus.sendOut);
						commodityService.update(comm);
					}
				}
				transitSite.setSendDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				transitSiteService.update(transitSite);
			}
		}
		return "redirect:/forwarding/transit";
	}
	
	@RequestMapping(value = "problemPack", method = RequestMethod.GET)
	public String problemPack(Integer packID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Package pack = packageService.findById(packID);
		ProblemPack problemPack = new ProblemPack();
		problemPack.setPackage1(pack);
		problemPack.setUser(pack.getOrderForms().get(0).getOrderUser());
	    problemPack = problemPackService.save(problemPack);
	    pack.setProblemPack(problemPack);
	    packageService.update(pack);
		return "redirect:/forwarding/transit";
	}
}
