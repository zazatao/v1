
package com.yc.controller.shop;

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
import com.yc.entity.Delivery;
import com.yc.entity.ImagePath;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.service.ICommodityService;
import com.yc.service.IImagePathService;
import com.yc.service.IOrderFormService;

//商店订单
@Controller
@RequestMapping("/shop")
public class ShopOrderController {
	
	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(ShopOrderController.class);
	
	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IImagePathService imagePathService;
	
    @RequestMapping(value = "shopOrder", method = RequestMethod.GET)
    public ModelAndView shopOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Commodity> list = commodityService.getAll();
    	ModelMap mode = new ModelMap();
    	mode.put("list", list);
        return new ModelAndView("shop/shopOrder", mode);
    }
    
    @RequestMapping(value = "searchShopOrder", method = RequestMethod.POST)
    public ModelAndView searchShopOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("packageCode").trim().equals("")) {
			map.put("packageCode", null);
		}else{
			map.put("packageCode", request.getParameter("packageCode"));
		}
		if (request.getParameter("transNumForTaobao").trim().equals("")) {
			map.put("transNumForTaobao", null);
		} else {
			map.put("transNumForTaobao", Integer.parseInt(request.getParameter("transNumForTaobao")));
		}
		if (request.getParameter("userName").trim().equals("")) {
			map.put("userName", null);
		}else{
			map.put("userName", request.getParameter("userName"));
		}
		if (request.getParameter("operatorPurchase").trim().equals("")) {
			map.put("operatorPurchase", null);
		}else{
			map.put("operatorPurchase", request.getParameter("operatorPurchase"));
		}
		if (request.getParameter("orderDate").trim().equals("")) {
			map.put("orderDate", null);
		}else{
			map.put("orderDate", request.getParameter("orderDate"));
		}
		if (request.getParameter("paymentDate").trim().equals("")) {
			map.put("paymentDate", null);
		}else{
			map.put("paymentDate", request.getParameter("paymentDate"));
		}
		if (request.getParameter("tpek").trim().equals("")) {
			map.put("tpek", null);
		}else{
			map.put("tpek", request.getParameter("tpek"));
		}
		if (request.getParameter("formStatus").trim().equals("")) {
			map.put("formStatus", null);
		}else{
			map.put("formStatus", OrderStatus.valueOf(request.getParameter("formStatus")));
		}
		List<Commodity> list = commodityService.getAllByParameters(map);
		ModelMap mode = new ModelMap();
    	mode.put("list", list);
        return new ModelAndView("shop/shopOrder", mode);
    }
    
    @RequestMapping(value = "insertShopOrder", method = RequestMethod.POST)
    public ModelAndView insertShopOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	return new ModelAndView("shop/insertShopOrder",null);
    }
    
    @RequestMapping(value = "deleteShopOrder", method = RequestMethod.GET)
    public ModelAndView deleteShopOrder(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Commodity comm =  commodityService.findById(id);
    	List<ImagePath> comms = comm.getImagePaths();
    	for (ImagePath imagePath : comms) {
    		System.out.println("comm.getImagePaths()+++++++++:" + imagePath);
		}
    	System.out.println("comm.getImagePaths()-----------------:" + comm.getImagePaths());
    	if(comm.getImagePaths() == null) {
    		boolean isok = imagePathService.deleteByComm(id);
    		if (isok) {
    			commodityService.delete(id);
    		}
    	}else {
    		System.out.println("~~~~~~~~~~~~~~~~有图片不能删");
    	}
    	return shopOrder(request, response);
    }
    
    @RequestMapping(value = "updateShopOrder", method = RequestMethod.GET)
    public ModelAndView updateShopOrder(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("id+|+|+|+|+|+|+|+|+|+|" + id);
    	Commodity comm =  commodityService.findById(id);
    	ModelMap mode = new ModelMap();
    	mode.put("commodity", comm);
    	return new ModelAndView("shop/updateShopOrder", mode);
    }
}
