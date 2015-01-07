package com.yc.controller.warehouse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.yc.entity.OrderStatus;
import com.yc.entity.StoreRoom;
import com.yc.service.ICommodityService;
import com.yc.service.IOrderFormService;
import com.yc.service.IStoreRoomService;
import com.yc.service.impl.ImagePathService;

//仓库验货
@Controller
@RequestMapping("/warehouse")
public class InspectionController {
	
	private static final Logger LOG = Logger.getLogger(InspectionController.class);

	@Autowired
	ICommodityService commodityService;

	@Autowired
	IOrderFormService orderFormService;

	@Autowired
	IStoreRoomService storeRoomService;

	@Autowired
	ImagePathService imagePathService;
	
	@RequestMapping(value = "inspection", method = RequestMethod.GET)
	public ModelAndView inspection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<StoreRoom> rooms = storeRoomService.getCellForTrue();
		Map<String, List<Commodity>> map = new HashMap<String, List<Commodity>>();
		for (StoreRoom storeRoom : rooms) {
			List<Commodity> list = commodityService.getAllByRoomForHave(storeRoom.getCellID(),true);
			if (list.size()>0) {
				map.put(storeRoom.getCellStr(), list);
			}
		}
		ModelMap mode = new ModelMap();
		mode.put("commodity", map);
		return new ModelAndView("warehouse/inspection", mode);
	}
	
	@RequestMapping(value = "searchInspection", method = RequestMethod.POST)
	public ModelAndView searchInspection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("packageCode").equals("")) {
			map.put("packageCode", null);
		}else{
			map.put("packageCode", request.getParameter("packageCode"));
		}
		if (request.getParameter("orderFormID").equals("")) {
			map.put("orderFormID", null);
		}else{
			map.put("orderFormID", Integer.parseInt(request.getParameter("orderFormID")));
		}
		if (request.getParameter("userName").equals("")) {
			map.put("userName", null);
		} else {
			map.put("userName", request.getParameter("userName"));
		}
		if (request.getParameter("tpek").equals("")) {
			map.put("tpek", null);
		}else{
			map.put("tpek", request.getParameter("tpek"));
		}
		if (request.getParameter("cellDate").equals("")) {
			map.put("cellDate", null);
		} else {
			map.put("cellDate", request.getParameter("cellDate"));
		}
		if (request.getParameter("inStoreRoomDate").equals("")) {
			map.put("inStoreRoomDate", null);
		} else {
			map.put("inStoreRoomDate", request.getParameter("inStoreRoomDate"));
		}
		if (request.getParameter("formStatus").equals("")) {
			map.put("formStatus", null);
		} else {
			map.put("formStatus", OrderStatus.valueOf(request.getParameter("formStatus")));
		}
		Map<String, List<Commodity>> maps = new HashMap<String, List<Commodity>>();
		if (request.getParameter("cellStr").equals("")) {
			List<StoreRoom> rooms = storeRoomService.getCellForTrue();
			for (StoreRoom storeRoom : rooms) {
				map.put("cellStr", storeRoom.getCellStr());
				List<Commodity> list = commodityService.getAllByParameters(map,true);
				if (list.size()>0) {
					maps.put(storeRoom.getCellStr(), list);
				}
			}
		}else{
			map.put("cellStr", request.getParameter("cellStr"));
			List<Commodity> list = commodityService.getAllByParameters(map,true);
			if (list.size()>0) {
				maps.put(request.getParameter("cellStr"), list);
			}
		}
		ModelMap mode = new ModelMap();
		mode.put("commodity", maps);
		return new ModelAndView("warehouse/inspection", mode);
	}
}
