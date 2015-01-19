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

//仓库在途订单
@Controller
@RequestMapping("/warehouse")
public class OrderOfWayController {
	
	private static final Logger LOG = Logger.getLogger(OrderOfWayController.class);

	@Autowired
	ICommodityService commodityService;

	@Autowired
	IOrderFormService orderFormService;

	@Autowired
	IStoreRoomService storeRoomService;

	@Autowired
	ImagePathService imagePathService;
	
	@RequestMapping(value = "orderOfWay", method = RequestMethod.GET)
	public ModelAndView orderOfWay(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<StoreRoom> rooms = storeRoomService.getCellForFalse();
		ModelMap mode = new ModelMap();
		for (StoreRoom storeRoom : rooms) {
			List<Commodity> list = commodityService.getCommodityByRoom(storeRoom);
			if (list.size()>0) {
				mode.put("commodity", list);
			}
		}
		return new ModelAndView("warehouse/orderOfWay", mode);
	}
	

	@RequestMapping(value = "searchOrderOfWay", method = RequestMethod.POST)
	public ModelAndView searchOrderOfWay(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("transNumForTaobao").equals("")) {
			map.put("transNumForTaobao", null);
		}else{
			map.put("transNumForTaobao", Integer.parseInt(request.getParameter("transNumForTaobao")));
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
		if (request.getParameter("changeStatusDate").equals("")) {
			map.put("changeStatusDate", null);
		} else {
			map.put("changeStatusDate", request.getParameter("changeStatusDate"));
		}
		if (request.getParameter("formStatus").equals("")) {
			map.put("formStatus", null);
		} else {
			map.put("formStatus", OrderStatus.valueOf(request.getParameter("formStatus")));
		}
		List<Commodity> list = commodityService.getAllByParametersForOrder(map);
		ModelMap mode = new ModelMap();
		mode.put("commodity", list);
		return new ModelAndView("warehouse/orderOfWay", mode);
	}
}
