package com.yc.controller.warehouse;

import java.io.IOException;
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
		List<Package> list = packageService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("warehouse/batchShipments", map);
	}

	@RequestMapping(value = "getOrderByPackAgeID", method = RequestMethod.GET)
	public ModelAndView getOrderByPackAgeID(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Package> list = packageService.getAll();
		List<OrderForm> orders =  orderFormService.findByPackAgeID(id);
		ModelMap map = new ModelMap();
		map.put("list", list);
		map.put("orders", orders);
		return new ModelAndView("warehouse/batchShipments", map);
	}
}
