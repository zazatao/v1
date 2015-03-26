
package com.yc.controller.forwarding;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.yc.entity.CommoidityStatus;
import com.yc.entity.Package;
import com.yc.entity.TransitSite;
import com.yc.entity.user.Personnel;
import com.yc.service.ICargoGroupService;
import com.yc.service.IPackageService;
import com.yc.service.ITransitSiteService;

//中转中转
@Controller
@RequestMapping("/forwarding")
public class ForwardingController {
	
	private static final Logger LOG = Logger.getLogger(ForwardingController.class);
	
	@Autowired
	IPackageService packageService; 
	
	@Autowired
	ICargoGroupService cargoGroupService;
	
	@Autowired
	ITransitSiteService transitSiteService;
	
    @RequestMapping(value = "sendAndReceive", method = RequestMethod.GET)
    public ModelAndView sendAndReceive(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return new ModelAndView("forwarding/sendAndReceive", null);
    }
    
    @RequestMapping(value = "sendOrReceive", method = RequestMethod.POST)
    public ModelAndView sendOrReceive(String Tpek, String sendOrReceive, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	TransitSite transitSite = null;
    	String msg = "";
    	if (Tpek != null && !Tpek.equals("")) {
    		Package pack = packageService.getPackAgeByTpek(Tpek);
    		if (pack == null) {
    			CargoGroup cargoGroup = cargoGroupService.getCargoGroupByTpek(Tpek);
    			if (cargoGroup != null) {
    				if (cargoGroup.getStatus() == CommoidityStatus.inForwarding) {
        				if (cargoGroup.getTransitSte() == null) {
        					if (sendOrReceive.equals("receive")) {
        						transitSite = new TransitSite();
        						transitSite.setReceiveDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        						transitSite.setPersonnel((Personnel)request.getSession().getAttribute("loginPersonnle"));
        						transitSite = transitSiteService.save(transitSite);
        						cargoGroup.setTransitSte(transitSite);
        						cargoGroupService.update(cargoGroup);
        						msg = "接收包裹成功！！！";
    						}
    					}else{
    						if (sendOrReceive.equals("send")) {
    							transitSite = cargoGroup.getTransitSte();
    							if (transitSite != null) {
    								transitSite.setSendDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
    								transitSiteService.update(transitSite);
    								msg = "发送包裹成功！！！";
    							}
    						}
    					}
    				}
				}else{
					msg = "没有找到包裹！！！";
				}
			}else{
				if (pack.getTransitSte() == null) {
					if (sendOrReceive.equals("receive")) {
						transitSite = new TransitSite();
						transitSite.setReceiveDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
						transitSite.setPersonnel((Personnel)request.getSession().getAttribute("loginPersonnle"));
						transitSite = transitSiteService.save(transitSite);
						pack.setTransitSte(transitSite);
						packageService.update(pack);
						msg = "接收包裹成功！！！";
					}
				}else{
					if (sendOrReceive.equals("send")) {
						transitSite = pack.getTransitSte();
						if (transitSite != null) {
							transitSite.setSendDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
							transitSiteService.update(transitSite);
							msg = "发送包裹成功！！！";
						}
					}
				}
			}
		}else{
			msg = "请输入包裹追踪号！！！";
		}
    	ModelMap mode = new ModelMap();
    	mode.put("msg", msg);
    	return new ModelAndView("forwarding/sendAndReceive", mode);
    }
}
