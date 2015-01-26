
package com.yc.controller.shop;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.yc.entity.ImagePath;
import com.yc.entity.OrderForm;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.OrderStatus;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.service.ICommodityService;
import com.yc.service.IImagePathService;
import com.yc.service.IOrderFormService;
import com.yc.service.IPersonnelService;
import com.yc.service.IUserService;
import com.yc.service.impl.OrderFormService;

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
	
	@Autowired
	IUserService userService;
	
	@Autowired
	IPersonnelService personnelService;
	
	@Autowired
	IOrderFormService orderFormService;
	
    @RequestMapping(value = "shopOrder", method = RequestMethod.GET)
    public ModelAndView shopOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<OrderForm> list = orderFormService.getAll();
    	ModelMap mode = new ModelMap();
    	mode.put("list", list);
        return new ModelAndView("shop/shopOrder", mode);
    }
    
    @RequestMapping(value = "searchShopOrder", method = RequestMethod.POST)
    public ModelAndView searchShopOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("orderDate").trim().equals("")) {
			map.put("orderDate", null);
		}else{
			map.put("orderDate", request.getParameter("orderDate"));
		}
		if (request.getParameter("orderstatus").trim().equals("")) {
			map.put("orderstatus", null);
		}else{
			map.put("orderstatus", OrderStatus.valueOf(request.getParameter("orderstatus")));
		}
		if (request.getParameter("storeOperator").trim().equals("")) {
			map.put("storeOperator", null);
		}else{
			map.put("storeOperator", request.getParameter("storeOperator"));
		}
		if (request.getParameter("transNumForTaobao").trim().equals("")) {
			map.put("transNumForTaobao", null);
		}else{
			map.put("transNumForTaobao", request.getParameter("transNumForTaobao"));
		}
		List<OrderForm> list = orderFormService.getOrderFormByParameters(map);
		ModelMap mode = new ModelMap();
    	mode.put("list", list);
        return new ModelAndView("shop/shopOrder", mode);
    }
    
    @RequestMapping(value = "insertShopOrder", method = RequestMethod.POST)
    public ModelAndView insertShopOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	return new ModelAndView("shop/insertShopOrder",null);
    }
    
    @RequestMapping(value = "deleteShopOrder", method = RequestMethod.GET)
    public String deleteShopOrder(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	OrderForm comm =  orderFormService.findById(id);
    	List<ImagePath> comms = comm.getImagePaths();
    	if (comms.size()>0) {
    		boolean isok = imagePathService.deleteByComm(id);
    		if (isok != true) {
    			orderFormService.delete(id);
    		}
		}else{
			orderFormService.delete(id);
		}
    	return "redirect:/shop/shopOrder";
    }
    
    @RequestMapping(value = "updateShopOrder", method = RequestMethod.GET)
    public ModelAndView updateShopOrder(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Commodity comm =  commodityService.findById(id);
    	ModelMap mode = new ModelMap();
    	mode.put("commodity", comm);
    	return new ModelAndView("shop/updateShopOrder", mode);
    }
    
    @RequestMapping(value = "editShopOrder", method = RequestMethod.POST)
    public String editShopOrder(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Commodity comm =  commodityService.findById(id); 
    	OrderForm of = comm.getOrderNumber();
    	of.setOrderstatus(OrderStatus.valueOf(request.getParameter("orderstatus")));
		User u =  userService.findById(comm.getOrderNumber().getOrderUser().getId()); 
		String user = request.getParameter("customer");
		u.setUserName(user);
		String phone = request.getParameter("phone");
		u.setPhone(phone);
		String email = request.getParameter("email");
		u.setEmail(email);
		u = userService.update(u);
		of.setOrderUser(u);
		of = orderFormService.update(of);
		comm.setOrderNumber(of);
		commodityService.update(comm);
    	return "redirect:/shop/shopOrder";
    }
    
    @RequestMapping(value = "toAddShopOrder", method = RequestMethod.GET)
    public ModelAndView toAddShopOrder(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getSession().getAttribute("loginUser");
    	ModelMap mode = new ModelMap();
    	mode.put("personel", request.getSession().getAttribute("loginUser"));
    	return new ModelAndView("shop/addShopOrder",mode);
    }
    
	@RequestMapping(value = "addShopOrder", method = RequestMethod.POST)
    public ModelAndView addShopOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Commodity c = new Commodity();
		OrderForm of = new OrderForm();
		User u = new User();
		Personnel person = new Personnel();
		of.setOrderstatus(OrderStatus.valueOf(request.getParameter("orderstatus")));
		String commItem = request.getParameter("commItem");
		c.setCommItem(commItem);
		Integer transNumForTaobao = Integer.parseInt(request.getParameter("transNumForTaobao"));
		c.setTransNumForTaobao(transNumForTaobao);
		String user = request.getParameter("orderUser");
		u.setUserName(user);
		String personnel = request.getParameter("personnel");
		person.setUserName(personnel);
		String email = request.getParameter("email");
		u.setEmail(email);
		String phone = request.getParameter("phone");
		u.setPhone(phone);
		String tpek = request.getParameter("tpek");
		c.setTpek(tpek);
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));
		c.setQuantity(quantity);
		Float money = Float.parseFloat(request.getParameter("money"));
		c.setMoney(money);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		of.setOrderDate(sdf.format(new Date()));
		String currency = request.getParameter("currency");
		c.setCurrency(currency);
		c.setOrderNumber(of);
		orderFormService.save(of);
		userService.save(u);
		personnelService.save(person);
		of.setStoreOperator(person);
		commodityService.save(c);
    	return shopOrder(request, response);
    }
}
