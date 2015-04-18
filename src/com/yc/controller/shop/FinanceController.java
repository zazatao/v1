package com.yc.controller.shop;

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

import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.service.ICommodityService;

//商店财务
@Controller
@RequestMapping("/shop")
public class FinanceController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(FinanceController.class);

	@Autowired
	ICommodityService commodityService;

	// 付账
	@RequestMapping(value = "billPay", method = RequestMethod.GET)
	public ModelAndView billPay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Commodity> list = commodityService.getCommodityByBillPay();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("shop/finance/billPay", mode);
	}

	// 付账搜索
	@RequestMapping(value = "searchBillPay", method = RequestMethod.POST)
	public ModelAndView searchBillPay(Integer orderID, String orderUser, String purchase, String paymentDate, String zazataoPayDate, String currency, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (orderID == null || orderID.equals("")) {
			map.put("orderID", null);
		} else {
			map.put("orderID", orderID);
		}
		if (orderUser == null || orderUser.equals("")) {
			map.put("orderUser", null);
		} else {
			map.put("orderUser", orderUser);
		}
		if (purchase == null || purchase.equals("")) {
			map.put("purchase", null);
		} else {
			map.put("purchase", purchase);
		}
		if (paymentDate == null || paymentDate.equals("")) {
			map.put("paymentDate", null);
		} else {
			map.put("paymentDate", paymentDate);
		}
		if (zazataoPayDate == null || zazataoPayDate.equals("")) {
			map.put("zazataoPayDate", null);
		} else {
			map.put("zazataoPayDate", zazataoPayDate);
		}
		if (currency == null || currency.equals("")) {
			map.put("currency", null);
		} else {
			map.put("currency", currency);
		}
		if (request.getParameter("status") == null || request.getParameter("status").equals("")) {
			map.put("status", null);
		} else {
			map.put("status", request.getParameter("status"));
		}
		List<Commodity> list = commodityService.getCommodityByParam(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("shop/finance/billPay", mode);
	}

	// 已经付账
	@RequestMapping(value = "updateCommStatus", method = RequestMethod.GET)
	public ModelAndView updateCommStatus(Integer commID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Commodity comm = commodityService.findById(commID);
		comm.setZazataoPayDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		comm.setZazataoPayTime(new SimpleDateFormat("HH:mm:ss").format(new Date()));
		comm.setStatus(CommoidityStatus.paid);
		commodityService.update(comm);
		List<Commodity> list = commodityService.getCommodityByBillPay();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("shop/finance/billPay", mode);
	}

	// 账簿
	@RequestMapping(value = "accountBook", method = RequestMethod.GET)
	public ModelAndView accountBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Commodity> list = commodityService.getAccountBook();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("shop/finance/accountBook", mode);
	}

	// 账簿搜索
	@RequestMapping(value = "searchAccountBook", method = RequestMethod.POST)
	public ModelAndView searchAccountBook(Integer orderID, String orderUser, String purchase, String paymentDate, String zazataoPayDate, String currency, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (orderID == null || orderID.equals("")) {
			map.put("orderID", null);
		} else {
			map.put("orderID", orderID);
		}
		if (orderUser == null || orderUser.equals("")) {
			map.put("orderUser", null);
		} else {
			map.put("orderUser", orderUser);
		}
		if (purchase == null || purchase.equals("")) {
			map.put("purchase", null);
		} else {
			map.put("purchase", purchase);
		}
		if (paymentDate == null || paymentDate.equals("")) {
			map.put("paymentDate", null);
		} else {
			map.put("paymentDate", paymentDate);
		}
		if (zazataoPayDate == null || zazataoPayDate.equals("")) {
			map.put("zazataoPayDate", null);
		} else {
			map.put("zazataoPayDate", zazataoPayDate);
		}
		if (currency == null || currency.equals("")) {
			map.put("currency", null);
		} else {
			map.put("currency", currency);
		}
		System.out.println("request.getParameter()===="+request.getParameter("status"));
		if (request.getParameter("status") == null ) {
			map.put("status", null);
		} else {
			map.put("status", request.getParameter("status"));
		}
		ModelMap mode = new ModelMap();
		List<Commodity> list = commodityService.getCommodityByParam(map);
		mode.put("list", list);
		return new ModelAndView("shop/finance/accountBook", mode);
	}
	
	// 账簿备注更改
	@RequestMapping(value = "updateNotes", method = RequestMethod.POST)
	public ModelAndView updateNotes(Integer commID, String notes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Commodity commodity = commodityService.findById(commID);
		if (commodity != null) {
			if (notes != null) {
				commodity.setNotes(notes);
				commodityService.update(commodity);
			}
		}
		List<Commodity> list = commodityService.getAccountBook();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return  new ModelAndView("shop/finance/accountBook", mode);
	}
	
}