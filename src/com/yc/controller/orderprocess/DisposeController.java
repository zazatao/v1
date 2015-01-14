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

import com.yc.entity.CargoGroup;
import com.yc.entity.Commodity;
import com.yc.entity.Delivery;
import com.yc.entity.DisposeStatus;
import com.yc.entity.OrderStatus;
import com.yc.entity.Transit;
import com.yc.service.ICommodityService;

//订单处理  处理
@Controller
@RequestMapping("/orderprocessing")
public class DisposeController {
	
	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(DisposeController.class);
	
	@Autowired
	ICommodityService commodityService;
	
	@RequestMapping(value = "dispose", method = RequestMethod.GET)
    public ModelAndView dispose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Commodity> list = commodityService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
		request.setAttribute("lists", list);
		return new ModelAndView("orderprocessing/dispose",map);
	}
	
	@RequestMapping(value = "searchWeighing", method = RequestMethod.POST)
	public ModelAndView searchWeighing( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("transNumForTaobao").trim().equals("")) {
			map.put("transNumForTaobao", null);
		}else{
			map.put("transNumForTaobao", Integer.parseInt(request.getParameter("transNumForTaobao")));
		}
		if (request.getParameter("seller").trim().equals("")) {
			map.put("seller", null);
		} else {
			map.put("seller", request.getParameter("seller"));
		}
		if (request.getParameter("sellerDate").trim().equals("")) {
			map.put("sellerDate", null);
		} else {
			map.put("sellerDate", request.getParameter("sellerDate"));
		}
		if (request.getParameter("disposeStatus").trim().equals("")) {
			map.put("disposeStatus", null);
		} else {
			map.put("disposeStatus", DisposeStatus.valueOf(request.getParameter("disposeStatus")));
		}
		List<Commodity> list = commodityService.getDisposeByParameters(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("orderprocessing/dispose", mode);
	}
	
	@RequestMapping(value = "orderItem", method = RequestMethod.GET)
	public ModelAndView orderItem( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Commodity> list = commodityService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		request.setAttribute("lists", list);
		return new ModelAndView("orderprocessing/dispose");
	}
	
}
