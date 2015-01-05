package com.yc.controller.warehouse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.service.IPackageService;

//仓库统计工作人员情况
@Controller
@RequestMapping("/warehouse")
public class StatisticalController {

	private static final Logger LOG = Logger.getLogger(StatisticalController.class);
	
	@Autowired
	IPackageService packageService;
	
	@RequestMapping(value = "statistical", method = RequestMethod.GET)
	public ModelAndView statistical(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
}
