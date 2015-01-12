
package com.yc.controller.orderprocess;

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
import com.yc.entity.OrderGroup;
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
	@ResponseBody
	public Map<String, Object> getOrderByOrderGroup(@RequestParam(value = "id", required = true) Integer id ) throws ServletException, IOException {
		List<OrderForm> orders = orderFormService.getOrderByOrderGroup(id);
		ModelMap map = new ModelMap();
		map.put("orders", orders);
		map.put("success", "true");
		return  map;
    }

}
