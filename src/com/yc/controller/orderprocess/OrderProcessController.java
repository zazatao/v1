
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.CargoGroup;
import com.yc.entity.Delivery;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderGroup;
import com.yc.entity.OrderGroupStatus;
import com.yc.entity.OrderStatus;
import com.yc.entity.Transit;
import com.yc.service.IOrderFormService;
import com.yc.service.IOrderGroupService;

//订单处理订单组
@Controller
@RequestMapping("/orderprocessing")
public class OrderProcessController {
	
	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(OrderProcessController.class);
	
	@Autowired
	IOrderGroupService orderGroupService;
	
	@Autowired
	IOrderFormService orderFormService;
	
    @RequestMapping(value = "orderGroup", method = RequestMethod.GET)
    public ModelAndView orderGroup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<OrderGroup> list = orderGroupService.getAll();
    	ModelMap mode = new ModelMap();
    	mode.put("list", list);
        return new ModelAndView("orderprocessing/orderGroup", mode);
    }
    
    @RequestMapping(value = "getOrderByOrderGroup", method = RequestMethod.GET)
    public ModelAndView getOrderByOrderGroup(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<OrderGroup> list = orderGroupService.getAll();
    	List<OrderForm> orders = orderFormService.getOrderByOrderGroup(id);
    	ModelMap mode = new ModelMap();
    	mode.put("list", list);
    	mode.put("orders", orders);
    	return new ModelAndView("orderprocessing/orderGroup", mode);
    }
    
    
	@RequestMapping(value = "searchOrderProcess", method = RequestMethod.POST)
	public ModelAndView searchOrderProcess( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("orderGroupID").trim().equals("")) {
			map.put("orderGroupID", null);
		}else{
			map.put("orderGroupID", Integer.parseInt(request.getParameter("orderGroupID")));
		}
		if (request.getParameter("orderStatus").trim().equals("")) {
			map.put("orderStatus", null);
		} else {
			map.put("orderStatus", OrderGroupStatus.valueOf(request.getParameter("orderStatus")));
		}
		if (request.getParameter("taskNumber").trim().equals("")) {
			map.put("taskNumber", null);
		}else{
			map.put("taskNumber", request.getParameter("taskNumber"));
		}
		List<OrderGroup> list = orderGroupService.getOrderGroupByParameters(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		request.getSession().setAttribute("OrderMap", map);
		return new ModelAndView("orderprocessing/orderGroup", mode);
	}
    

}
