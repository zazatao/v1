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
//仓库称量
@Controller
@RequestMapping("/warehouse")
public class WeighingController {
	
	private static final Logger LOG = Logger.getLogger(WeighingController.class);
	
	@Autowired
	IPackageService packageService;
	
	@RequestMapping(value = "weighing", method = RequestMethod.GET)
	public ModelAndView weighing(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Package> list = packageService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("warehouse/weighing", map);
	}
	
	@RequestMapping(value = "getOrder", method = RequestMethod.GET)
	public ModelAndView getOrder(Integer id,String page,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Package pack = packageService.findById(id);
		List<Package> list = packageService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
		map.put("packs", pack);
		if (page.equals("weighing")) {
			return new ModelAndView("warehouse/weighing", map);
		}else if(page.equals("sendTheParcel")){
			return new ModelAndView("warehouse/sendTheParcel", map);
		}else{
			return null;
		}
	}
	
}
