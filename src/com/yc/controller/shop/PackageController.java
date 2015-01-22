package com.yc.controller.shop;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;
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

import com.yc.entity.Commodity;
import com.yc.entity.OrderForm;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.entity.Package;
import com.yc.service.ICommodityService;
import com.yc.service.IImagePathService;
import com.yc.service.IOrderFormService;
import com.yc.service.IPackageService;
import com.yc.service.IPersonnelService;
import com.yc.service.IUserService;

//商店包裹
@Controller
@RequestMapping("/shop")
public class PackageController {
	

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(PackageController.class);
	
	@Autowired
	IPackageService packageService;
	
	@Autowired
	IPersonnelService personnelService;
	
	@Autowired
	IUserService userService;
	
	@Autowired
	IOrderFormService orderFormService;
	
	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IImagePathService imagePathService;
	
	@RequestMapping(value = "package", method = RequestMethod.GET)
    public ModelAndView packages(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Package> list = packageService.getAll();
    	ModelMap mode = new ModelMap();
    	mode.put("list", list);
		return new ModelAndView("shop/package", mode);
	}
	@RequestMapping(value = "searchPackage", method = RequestMethod.POST)
    public ModelAndView searchPackage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("packageCode").trim().equals("")) {
			map.put("packageCode", null);
		}else{
			map.put("packageCode", request.getParameter("packageCode"));
		}
		if (request.getParameter("transNumForTaobao").trim().equals("")) {
			map.put("transNumForTaobao", null);
		} else {
			map.put("transNumForTaobao", Integer.parseInt(request.getParameter("transNumForTaobao")));
		}
		if (request.getParameter("userName").trim().equals("")) {
			map.put("userName", null);
		}else{
			map.put("userName", request.getParameter("userName"));
		}
		if (request.getParameter("transport").trim().equals("")) {
			map.put("transport", null);
		}else{
			map.put("transport", request.getParameter("transport"));
		}
		if (request.getParameter("orderDate").trim().equals("")) {
			map.put("orderDate", null);
		}else{
			map.put("orderDate", request.getParameter("orderDate"));
		}
		if (request.getParameter("paymentDate").trim().equals("")) {
			map.put("paymentDate", null);
		}else{
			map.put("paymentDate", request.getParameter("paymentDate"));
		}
		if (request.getParameter("tpek").trim().equals("")) {
			map.put("tpek", null);
		}else{
			map.put("tpek", request.getParameter("tpek"));
		}
		if (request.getParameter("formStatus").trim().equals("")) {
			map.put("formStatus", null);
		}else{
			map.put("formStatus", CommoidityStatus.valueOf(request.getParameter("formStatus")));
		}
		List<Package> list = packageService.getPackAgeByParameters(map);
		ModelMap mode = new ModelMap();
    	mode.put("list", list);
        return new ModelAndView("shop/package", mode);
    }
	@RequestMapping(value = "toAddPackage", method = RequestMethod.GET)
    public ModelAndView toAddShopOrder(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getSession().getAttribute("loginUser");
    	ModelMap mode = new ModelMap();
    	mode.put("personel", request.getSession().getAttribute("loginUser"));
    	return new ModelAndView("shop/addpackage",mode);
    }
    
	@RequestMapping(value = "addPackage", method = RequestMethod.POST)
    public ModelAndView addPackage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Commodity c = new Commodity();
		OrderForm of = new OrderForm();
		User u = new User();
		Personnel person = new Personnel();
		Package pk= new Package();
		String transport =request.getParameter("transport");
		pk.setTransport(transport);
		String personnel = request.getParameter("personnel");
		person.setUserName(personnel);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		of.setOrderDate(sdf.format(new Date()));
		String traffic = request.getParameter("traffic");
		pk.setTraffic(traffic);
		Integer orderformid = Integer.parseInt(request.getParameter("orderFormID"));
		of.setOrderFormID(orderformid);
		of.setStoreOperator(person);
		userService.save(u);
		orderFormService.save(of);
		personnelService.save(person);
		packageService.save(pk);
		of.setOrderUser(u);
		c.setOrderNumber(of);
		commodityService.save(c);
    	return packages(request, response);
    }
}
