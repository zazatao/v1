package com.yc.controller.warehouse;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.OrderForm;
import com.yc.entity.Package;
import com.yc.service.IOrderFormService;
import com.yc.service.IPackageService;

//仓库成批发货
@Controller
@RequestMapping("/warehouse")
public class BatchShipmentsController {
	private static final Logger LOG = Logger.getLogger(BatchShipmentsController.class);

	@Autowired
	IPackageService packageService;
	@Autowired
	IOrderFormService orderFormService;

	@RequestMapping(value = "batchShipments", method = RequestMethod.GET)
	public ModelAndView batchShipments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("packageMap");
		List<Package> list = packageService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("warehouse/batchShipments", map);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "getOrderByPackAgeID", method = RequestMethod.GET)
	public ModelAndView getOrderByPackAgeID(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = (Map<String, Object>)request.getSession().getAttribute("packageMap");
		List<Package> list =null;
		if (map!=null) {
			list = packageService.getPackAgeByParameters(map);
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
		}else{
			list = packageService.getAll();
		}
		List<OrderForm> orders =  orderFormService.findByPackAgeID(id);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		mode.put("orders", orders);
		return new ModelAndView("warehouse/batchShipments", mode);
	}
}
