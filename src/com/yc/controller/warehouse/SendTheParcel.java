package com.yc.controller.warehouse;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Package;
import com.yc.service.IPackageService;

//仓库发送包裹
@Controller
@RequestMapping("/warehouse")
public class SendTheParcel {
	private static final Logger LOG = Logger.getLogger(SendTheParcel.class);
	
	@Autowired
	IPackageService packageService;
	
	@RequestMapping(value = "sendTheParcel", method = RequestMethod.GET)
	public ModelAndView sendTheParcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Package> list = packageService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("warehouse/sendTheParcel", map);
	}
}
