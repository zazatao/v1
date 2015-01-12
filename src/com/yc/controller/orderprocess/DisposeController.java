package com.yc.controller.orderprocess;

import java.io.IOException;
import java.util.List;

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
		return new ModelAndView("orderprocessing/dispose",map);
	}
}
