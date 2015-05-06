
package com.yc.controller.orderprocess;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.service.IOrderFormService;
import com.yc.service.IOrderGroupService;

//订单处理订单组
@Controller
@RequestMapping("/orderprocessing")
public class StatisticsController {
	
	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(StatisticsController.class);
	
	@Autowired
	IOrderGroupService orderGroupService;
	
	@Autowired
	IOrderFormService orderFormService;
	
    @RequestMapping(value = "statistics", method = RequestMethod.GET)
    public ModelAndView statistics(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return new ModelAndView("orderprocessing/statistics");
    }
    
}
