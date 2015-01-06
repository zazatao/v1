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
	public ModelAndView warehousing(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
}
