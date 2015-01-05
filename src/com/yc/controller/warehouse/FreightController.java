package com.yc.controller.warehouse;

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

import com.yc.entity.Package;
import com.yc.service.IPackageService;

//仓库运费
@Controller
@RequestMapping("/warehouse")
public class FreightController {
	private static final Logger LOG = Logger.getLogger(SendTheParcel.class);

	@Autowired
	IPackageService packageService;

	@RequestMapping(value = "freight", method = RequestMethod.GET)
	public ModelAndView freight(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Package> list = packageService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("warehouse/freight", map);
	}
}
