package com.yc.controller.orderprocess;

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

import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.DisposeStatus;
import com.yc.entity.OrderStatus;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.service.ICommodityService;
import com.yc.service.IOrderFormService;
import com.yc.service.IPersonnelService;

//订单处理  订单池
@Controller
@RequestMapping("/orderprocessing")
public class OrderPoolController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(OrderPoolController.class);
	
	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IOrderFormService formService;
	
	@Autowired
	IPersonnelService personnelService;
	
	@RequestMapping(value = "orderPool", method = RequestMethod.GET)
    public ModelAndView orderPool(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Commodity> list = commodityService.getAllByCommStatusAndOrderStatus(CommoidityStatus.support,OrderStatus.waitDelivery);
		ModelMap map = new ModelMap();
		map.put("list", list);
		Personnel personnel =(Personnel) request.getSession().getAttribute("loginPersonnle");
		map.put("personnel", personnel);
		return new ModelAndView("orderprocessing/orderPool",map);
	}
	
	@RequestMapping(value = "searchOrderPool", method = RequestMethod.POST)
    public ModelAndView searchOrderPool(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String transNumForTaobao = request.getParameter("transNumForTaobao");
		Map<String, Object> map = new HashMap<String, Object>();
		if (transNumForTaobao != null && !transNumForTaobao.equals("")) {
			map.put("transNumForTaobao", Integer.parseInt(transNumForTaobao));
		}else{
			map.put("transNumForTaobao", null);
		}
		String orderUserName = request.getParameter("orderUserName");
		if (orderUserName != null && !orderUserName.equals("")) {
			map.put("orderUserName", orderUserName);
		}else{
			map.put("orderUserName", null);
		}
		String paymentDate = request.getParameter("paymentDate");
		if (paymentDate != null && !paymentDate.equals("")) {
			map.put("paymentDate", paymentDate);
		}else{
			map.put("paymentDate", null);
		}
		String disposeStatus = request.getParameter("disposeStatus");
		if (disposeStatus != null && !disposeStatus.equals("")) {
			map.put("disposeStatus", DisposeStatus.valueOf(disposeStatus));
		}else{
			map.put("disposeStatus", null);
		}
		List<Commodity> list = commodityService.getOrderPollByParam(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("orderprocessing/orderPool",mode);
	}
	
	@RequestMapping(value = "orderPoolItem", method = RequestMethod.GET)
    public ModelAndView orderPoolItem(Integer orderid,Integer commCode,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Commodity> list = commodityService.getAllByCommStatusAndOrderStatus(CommoidityStatus.support,OrderStatus.waitDelivery);
		ModelMap map = new ModelMap();
		map.put("list", list);
		Commodity commodity = commodityService.getCommByOrderIDAndCommCode(orderid,commCode);
		map.put("commodity", commodity);
		return new ModelAndView("orderprocessing/orderPool",map);
	}
	
	@RequestMapping(value = "processing", method = RequestMethod.GET)
    public String processing(String dispose,Integer num,Integer orderID,Integer commID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Commodity commodity = commodityService.getCommByOrderIDAndCommCode(orderID,commID);
		if (commodity != null) {
			Personnel purchase = (Personnel)request.getSession().getAttribute("loginPersonnle");
			commodity.setPurchase(purchase);
			commodity = commodityService.update(commodity);
			//付款后订单分配
			shareOrder(commodity.getOrderNumber().getOrderUser(),purchase);
		}
		return "redirect:/orderprocessing/orderItem?id="+commodity.getTransNumForTaobao()+"&orderid="+commodity.getOrderNumber().getOrderFormID();
	}
	
	private void shareOrder(User user,Personnel purchase) {
		List<Commodity> commodities = commodityService.getOrderByPurchaseAndUser(user);
		if (commodities != null && commodities.size()>0) {
			for (Commodity comm : commodities) {
				if (comm.getStatus() == CommoidityStatus.support && comm.getSeller().getId() == 1) {
					comm.setPurchase(purchase);
					commodityService.update(comm);
				}
			}
		}
	}
}
