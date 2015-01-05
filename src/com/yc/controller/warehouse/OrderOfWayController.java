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

import com.yc.entity.Commodity;
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
}
