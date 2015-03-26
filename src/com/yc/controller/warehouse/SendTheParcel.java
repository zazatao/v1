package com.yc.controller.warehouse;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.OrderForm;
import com.yc.entity.Package;
import com.yc.service.ICommodityService;
import com.yc.service.IPackageService;

//仓库发送包裹
@Controller
@RequestMapping("/warehouse")
public class SendTheParcel {
	
	private static final Logger LOG = Logger.getLogger(SendTheParcel.class);
	
	@Autowired
	IPackageService packageService;
	
	@Autowired
	ICommodityService commodityService;
	
	@RequestMapping(value = "sendTheParcel", method = RequestMethod.GET)
	public ModelAndView sendTheParcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().removeAttribute("packageMap");
		List<Package> list = packageService.getPackagesByIsFee();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("warehouse/sendTheParcel", map);
	}
	
	@RequestMapping(value = "sendPack", method = RequestMethod.GET)
	public String sendPack(String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Package page= packageService.getPackAgeByTpek(id);
		for (OrderForm order : page.getOrderForms()) {
			for (int i = 0; i < order.getCommodities().size(); i++) {
				Commodity commodity = null;
				if (order.getAddress().getHandedAddress() == null) {
					commodity = order.getCommodities().get(i);
					commodity.setStatus(CommoidityStatus.sendOut);
				}else{
					commodity = order.getCommodities().get(i);
					commodity.setStatus(CommoidityStatus.inForwarding);
				}
				commodityService.update(commodity);
			}
		}
		page.setSendDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		packageService.update(page);
		return "redirect:/warehouse/sendTheParcel";
	}
}
