package com.yc.controller.orderprocess;

import java.io.IOException;
import java.util.ArrayList;
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

import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.DisposeStatus;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.service.ICommodityService;
import com.yc.service.IPersonnelService;

//订单处理  处理
@Controller
@RequestMapping("/orderprocessing")
public class DisposeController {
	
	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(DisposeController.class);
	
	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IPersonnelService personnelService;
	
	@RequestMapping(value = "dispose", method = RequestMethod.GET)
    public ModelAndView dispose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Personnel personnel =(Personnel)request.getSession().getAttribute("loginPersonnle");
		ModelMap map = new ModelMap();
//		if (personnel.getDepartment() !=null) {
//			if (personnel.getDepartment().getDepartmentID() == 2) {
//				if (personnel.getPositions() != null) {
//					List<Personnel> personnels = new ArrayList<Personnel>();
//					List<Positions> positions =  personnel.getPositions().getChildren();
//					List<Positions> pons = personnel.getDepartment().getPositions();
//					for (Positions post : positions) {
//						for (Positions pon : pons) {
//							if (post.getPositionid() == pon.getPositionid()) {
//								List<Personnel> personne = personnelService.getPersonnelByDepAndPos(personnel.getDepartment(),post.getPositionid());
//								personnels.addAll(personne);
//							}
//						}
//					}
//					personnels.add(personnel);
//					String ids = "";
//					for (Personnel person : personnels) {
//						ids = ids + person.getId() + ",";
//					}
//					ids = ids.substring(0, ids.length()-1);
//					List<Commodity> list = commodityService.getCommodityByPurchase(ids);
//					map.put("list", list);
//				}
//			}else{
//				List<Commodity> list = commodityService.getAllByPurchase();
//				map.put("list", list);
//			}
//		}
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
		if (request.getParameter("orderUserName").trim().equals("")) {
			map.put("orderUserName", null);
		} else {
			map.put("orderUserName", request.getParameter("orderUserName"));
		}
		if (request.getParameter("paymentDate").trim().equals("")) {
			map.put("paymentDate", null);
		} else {
			map.put("paymentDate", request.getParameter("paymentDate"));
		}
		if (request.getParameter("disposeStatus").trim().equals("")) {
			map.put("disposeStatus", null);
		} else {
			map.put("disposeStatus", DisposeStatus.valueOf(request.getParameter("disposeStatus")));
		}
		Personnel personnel =(Personnel)request.getSession().getAttribute("loginPersonnle");
//		if (personnel.getDepartment() !=null) {
//			if (personnel.getDepartment().getDepartmentID() == 2) {
//				if (personnel.getPositions() != null) {
//					List<Personnel> personnels = new ArrayList<Personnel>();
//					List<Positions> positions =  personnel.getPositions().getChildren();
//					List<Positions> pons = personnel.getDepartment().getPositions();
//					for (Positions post : positions) {
//						for (Positions pon : pons) {
//							if (post.getPositionid() == pon.getPositionid()) {
//								List<Personnel> personne = personnelService.getPersonnelByDepAndPos(personnel.getDepartment(),post.getPositionid());
//								personnels.addAll(personne);
//							}
//						}
//					}
//					personnels.add(personnel);
//					String ids = "";
//					for (Personnel person : personnels) {
//						ids = ids + person.getId() + ",";
//					}
//					ids = ids.substring(0, ids.length()-1);
//					map.put("personnel", personnel.getId());
//				}
//			}else{
//				map.put("personnel", "总经理");
//			}
//		}
		List<Commodity> list = commodityService.getDisposeByParameters(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("orderprocessing/dispose", mode);
	}
	
	@RequestMapping(value = "orderItem", method = RequestMethod.GET)
	public ModelAndView orderItem(Integer orderid, Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Personnel personnel =(Personnel)request.getSession().getAttribute("loginPersonnle");
		ModelMap map = new ModelMap();
//		if (personnel.getDepartment() !=null) {
//			if (personnel.getDepartment().getDepartmentID() == 2) {
//				if (personnel.getPositions() != null) {
//					List<Personnel> personnels = new ArrayList<Personnel>();
//					List<Positions> positions =  personnel.getPositions().getChildren();
//					List<Positions> pons = personnel.getDepartment().getPositions();
//					for (Positions post : positions) {
//						for (Positions pon : pons) {
//							if (post.getPositionid() == pon.getPositionid()) {
//								List<Personnel> personne = personnelService.getPersonnelByDepAndPos(personnel.getDepartment(),post.getPositionid());
//								personnels.addAll(personne);
//							}
//						}
//					}
//					personnels.add(personnel);
//					String ids = "";
//					for (Personnel person : personnels) {
//						ids = ids + person.getId() + ",";
//					}
//					ids = ids.substring(0, ids.length()-1);
//					List<Commodity> list = commodityService.getCommodityByPurchase(ids);
//					map.put("list", list);
//				}
//			}else{
//				List<Commodity> list = commodityService.getAllByPurchase();
//				map.put("list", list);
//			}
//		}
		Commodity commodity = commodityService.getCommByOrderIDAndCommCode(orderid,id);
		map.put("commodity", commodity);
    	return new ModelAndView("orderprocessing/dispose",map);
	}
	
	@RequestMapping(value = "onProcessing", method = RequestMethod.GET)
	public ModelAndView onProcessing(String dispose,Integer num,Integer orderID,Integer commID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap map = new ModelMap();
		Commodity commodity = commodityService.getCommByOrderIDAndCommCode(orderID,commID);
		commodity.setStatus(CommoidityStatus.inAuctionlose);
		if (!dispose.equals("quantity")) {
			commodity.setDisposeStatus(DisposeStatus.valueOf(dispose));
		}
		commodityService.update(commodity);
		Personnel personnel =(Personnel)request.getSession().getAttribute("loginPersonnle");
//		if (personnel.getDepartment() !=null) {
//			if (personnel.getDepartment().getDepartmentID() == 2) {
//				if (personnel.getPositions() != null) {
//					List<Personnel> personnels = new ArrayList<Personnel>();
//					List<Positions> positions =  personnel.getPositions().getChildren();
//					List<Positions> pons = personnel.getDepartment().getPositions();
//					for (Positions post : positions) {
//						for (Positions pon : pons) {
//							if (post.getPositionid() == pon.getPositionid()) {
//								List<Personnel> personne = personnelService.getPersonnelByDepAndPos(personnel.getDepartment(),post.getPositionid());
//								personnels.addAll(personne);
//							}
//						}
//					}
//					personnels.add(personnel);
//					String ids = "";
//					for (Personnel person : personnels) {
//						ids = ids + person.getId() + ",";
//					}
//					ids = ids.substring(0, ids.length()-1);
//					List<Commodity> list = commodityService.getCommodityByPurchase(ids);
//					map.put("list", list);
//				}
//			}else{
//				List<Commodity> list = commodityService.getAllByPurchase();
//				map.put("list", list);
//			}
//		}
		return  new ModelAndView("orderprocessing/dispose",map);
	}
	
}
