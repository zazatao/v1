package com.yc.controller.forwarding;

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
import com.yc.entity.Delivery;
import com.yc.entity.Transit;
import com.yc.entity.TransitSite;
import com.yc.entity.user.Personnel;
import com.yc.service.ICargoGroupService;
import com.yc.service.ITransitSiteService;

//中转运期晚点
@Controller
@RequestMapping("/forwarding")
public class TransportLateController {

	
	private static final Logger LOG = Logger.getLogger(TransportLateController.class);
	
	@Autowired
	ICargoGroupService cargoGroupService;
	
	@Autowired
	ITransitSiteService transitSiteService;
	
	@RequestMapping(value = "transportLate", method = RequestMethod.GET)
	public ModelAndView transportLate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Personnel personnel = (Personnel)request.getSession().getAttribute("loginPersonnle");
		List<TransitSite> list = transitSiteService.getTransitSiteByUser(personnel);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("forwarding/transportLate",mode);
	}
	
	@RequestMapping(value = "searchTransportLate", method = RequestMethod.POST)
	public ModelAndView searchTransportLate(String packTpek,String transit,String delivery,String sendDate,String receiveDate, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (packTpek.trim().equals("")) {
			map.put("packTpek", null);
		}else{
			map.put("packTpek", packTpek);
		}
		if (delivery.trim().equals("")) {
			map.put("formDelivery", null);
		} else {
			map.put("formDelivery", Delivery.valueOf(delivery));
		}
		if (transit.trim().equals("")) {
			map.put("formTransit", null);
		} else {
			map.put("formTransit", Transit.valueOf(transit));
		}
		if (sendDate.trim().equals("")) {
			map.put("sendDate", null);
		} else {
			map.put("sendDate", sendDate);
		}
		if (receiveDate.trim().equals("")) {
			map.put("receiveDate", null);
		} else {
			map.put("receiveDate", receiveDate);
		}
		Personnel personnel = (Personnel)request.getSession().getAttribute("loginPersonnle");
		map.put("person", personnel);
		ModelMap mode = new ModelMap();
		List<TransitSite> list = transitSiteService.getTransportByParam(map);
		mode.put("list", list);
		return new ModelAndView("forwarding/transportLate",mode);
	}
	
}
