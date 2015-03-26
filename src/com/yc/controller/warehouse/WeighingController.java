package com.yc.controller.warehouse;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.Delivery;
import com.yc.entity.OrderForm;
import com.yc.entity.Package;
import com.yc.entity.PackageGenre;
import com.yc.entity.PackageSize;
import com.yc.service.ICommodityService;
import com.yc.service.IOrderFormService;
import com.yc.service.IPackageGenreService;
import com.yc.service.IPackageService;
import com.yc.service.IPackageSizeService;

//仓库称量
@Controller
@RequestMapping("/warehouse")
public class WeighingController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(WeighingController.class);

	@Autowired
	IPackageService packageService;

	@Autowired
	IOrderFormService formService;
	
	@Autowired
	IPackageSizeService packageSizeService;
	
	@Autowired
	IPackageGenreService genreService;
	
	@Autowired
	ICommodityService commodityService;

	@RequestMapping(value = "weighing", method = RequestMethod.GET)
	public ModelAndView weighing(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().removeAttribute("packageMap");
		List<Package> list = packageService.getWeighing();
		PackageSize size = packageSizeService.findById(1);
		ModelMap map = new ModelMap();
		map.put("list", list);
		map.put("size", size);
		return new ModelAndView("warehouse/weighing", map);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "getOrder", method = RequestMethod.GET)
	public ModelAndView getOrder(Integer id, String page, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = (Map<String, Object>) request.getSession().getAttribute("packageMap");
		List<Package> list = null;
		if (map != null) {
			if (page.equals("weighing")) {
				list = packageService.getPackAgeByParameters(map,0);
			}else{
				list = packageService.getPackAgeByParameters(map,1);
			}
		} else {
			if (page.equals("weighing")) {
				list = packageService.getWeighing();
			}else{
				list = packageService.getPackagesByIsFee();
			}
		}
		Package pack = packageService.findById(id);
		PackageSize size = packageSizeService.findById(1);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		mode.put("packs", pack);
		mode.put("size", size);
		if (page.equals("weighing")) {
			return new ModelAndView("warehouse/weighing", mode);
		} else if (page.equals("sendTheParcel")) {
			return new ModelAndView("warehouse/sendTheParcel", mode);
		} else {
			return null;
		}
	}

	@RequestMapping(value = "searchWeighing", method = RequestMethod.POST)
	public ModelAndView searchWeighing(String page, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		ModelMap mode = new ModelMap();
		PackageSize size = packageSizeService.findById(1);
		mode.put("size", size);
		if (request.getParameter("packageCode").trim().equals("")) {
			map.put("packageCode", null);
		} else {
			map.put("packageCode", request.getParameter("packageCode"));
		}
		if (request.getParameter("formDelivery").trim().equals("")) {
			map.put("formDelivery", null);
		} else {
			map.put("formDelivery", Delivery.valueOf(request.getParameter("formDelivery")));
		}
		if (request.getParameter("userName").trim().equals("")) {
			map.put("userName", null);
		} else {
			map.put("userName", request.getParameter("userName"));
		}
		if (map.get("packageCode") != null || map.get("formDelivery") != null || map.get("userName") !=null) {
			request.getSession().setAttribute("packageMap", map);
			if (page.equals("weighing")) {
				List<Package> list = packageService.getPackAgeByParameters(map,0);
				mode.put("list", list);
				return new ModelAndView("warehouse/weighing", mode);
			} else if (page.equals("sendTheParcel")) {
				List<Package> list = packageService.getPackAgeByParameters(map,1);
				mode.put("list", list);
				return new ModelAndView("warehouse/sendTheParcel", mode);
			} else {
				return null;
			}
		} else {
			if (page.equals("weighing")) {
				List<OrderForm> list = formService.getOrderByStatusAndName(map);
				Map<Float, List<OrderForm>> lists = new HashMap<Float, List<OrderForm>>();
				if (list != null && list.size() > 0) {
					Package package1 = null;
					for (OrderForm orderForm : list) {
						boolean isok = true;
						for (Commodity commodity : orderForm.getCommodities()) {
							if (commodity.getStatus() != CommoidityStatus.inWarehouse && commodity.getStatus() != CommoidityStatus.senToWarehouse && commodity.getStatus() != CommoidityStatus.packing) {
								isok = false;
							}
						}
						if (isok) {
							if (lists.size()>0) {
								for (Float key : lists.keySet()) {
									if (lists.keySet().contains(Float.parseFloat(orderForm.getOrderUser().getId().toString()))) {
										if (key.equals(Float.parseFloat(orderForm.getOrderUser().getId().toString()))) {
											if (lists.get(key).get(0).getDelivery() == orderForm.getDelivery() && lists.get(key).get(0).getAddress().getHandedAddress().equals(orderForm.getAddress().getHandedAddress())) {
												if (lists.get(key).get(0).getAddress().getToName().equals(orderForm.getAddress().getToName()) 
														&& lists.get(key).get(0).getAddress().getPhone().equals(orderForm.getAddress().getPhone())
														&& lists.get(key).get(0).getAddress().getStreet().equals(orderForm.getAddress().getStreet())
														&& lists.get(key).get(0).getAddress().getOrther().equals(orderForm.getAddress().getOrther())
														) {
													lists.get(key).add(orderForm);
												}else{
													List<OrderForm> orders = new ArrayList<OrderForm>();
													orders.add(orderForm);
													lists.put(Float.parseFloat(orderForm.getOrderUser().getId().toString()), orders);
												}
											}else{
												List<OrderForm> orders = new ArrayList<OrderForm>();
												orders.add(orderForm);
												lists.put(Float.parseFloat(orderForm.getOrderUser().getId().toString()), orders);
											}
										}
									}else{
										List<OrderForm> orders = new ArrayList<OrderForm>();
										orders.add(orderForm);
										lists.put(Float.parseFloat(orderForm.getOrderUser().getId().toString()), orders);
									}
								}
							}else{
								List<OrderForm> orders = new ArrayList<OrderForm>();
								orders.add(orderForm);
								lists.put(Float.parseFloat(orderForm.getOrderUser().getId().toString()), orders);
							}
						}
					}
					for (Float key : lists.keySet()) {
						package1 = new Package();
						package1 = packageService.save(package1);
						for (int i = 0; i < lists.get(key).size(); i++) {
							OrderForm orderForm = lists.get(key).get(i);
							package1.setPackageCode(package1.getPackageID()+"&"+lists.get(key).size());
							package1.setPackAgeTpek("a0000psop000"+package1.getPackageID());
							package1.setDelivery(orderForm.getDelivery());
							package1.setOrderForms(lists.get(key));
							package1.setTransit(orderForm.getAddress().getHandedAddress());
							package1 = packageService.update(package1);
							orderForm.setPackAge(package1);
							formService.update(orderForm);
						}
					}
				}
				List<Package> packages = packageService.getWeighing();
				mode.put("list", packages);
				return new ModelAndView("warehouse/weighing", mode);
			}else{
				List<Package> packages = packageService.getPackagesByIsFee();
				mode.put("list", packages);
				return new ModelAndView("warehouse/sendTheParcel", mode);
			}
		}
	}
	
	@RequestMapping(value = "updatePacke", method = RequestMethod.GET)
	public ModelAndView updatePacke(Integer id,Integer genre, Double weight, Double grossWeight,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelMap mode = new ModelMap();
		Package pack= packageService.findById(id);
		pack.setGrossWeight(grossWeight);
		pack.setTotalWeight(grossWeight+weight);
		pack.setPackageCode(pack.getPackageID()+"&"+pack.getOrderForms().size());
		pack.setPackAgeTpek("a0000psop000"+pack.getPackageID());
		pack = packageService.update(pack);
		for (OrderForm orderForm : pack.getOrderForms()) {
			for (int i = 0; i < orderForm.getCommodities().size(); i++) {
				Commodity comm = orderForm.getCommodities().get(i);
				comm.setStatus(CommoidityStatus.packing);
				commodityService.update(comm);
			}
		}
		if (genre != null && !genre.equals("")) {
			PackageGenre packGenre = genreService.findById(genre);
			packGenre.setNum(packGenre.getNum()-1);
			genreService.update(packGenre);
		}
		List<Package> packages = packageService.getWeighing();
		mode.put("list", packages);
		return new ModelAndView("warehouse/weighing", mode);
	}
}
