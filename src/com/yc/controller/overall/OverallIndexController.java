
package com.yc.controller.overall;

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

import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.entity.Package;
import com.yc.entity.UnKnownCommodity;
import com.yc.service.IOrderFormService;
import com.yc.service.IPackageService;
import com.yc.service.IUnKnownCommodityService;

//总览
@Controller
@RequestMapping("/overall")
public class OverallIndexController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(OverallIndexController.class);
	
	@Autowired
	IOrderFormService orderFormService;
	
	@Autowired
	IPackageService packageservice ;
	
	@Autowired
	IUnKnownCommodityService unknowncommodityservice;
	
    @RequestMapping(value = "unfinishedOrder", method = RequestMethod.GET)
    public ModelAndView unfinishedOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<OrderForm> list = orderFormService.getAllByStatus();
    	ModelMap mode = new ModelMap();
    	mode.put("list", list);
    	return new ModelAndView("overall/unfinishedOrder", mode);
    }
    //订单问题
    @RequestMapping(value = "questionOrder", method = RequestMethod.GET)
    public ModelAndView questionOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Package> packages=packageservice.getPackByProblem();
    	ModelMap mode = new ModelMap();
    	mode.put("packages", packages);
    	return new ModelAndView("overall/orderqusetion", mode);
    }
    //问题订单查询
    @RequestMapping(value = "searchQuestionOrder", method = RequestMethod.POST)
    public ModelAndView searchQuestionOrder(String phone, String userName,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("userName", userName);
		List<Package> packages=packageservice.searchPackProblem(map);
		ModelMap mode = new ModelMap();
    	mode.put("packages", packages);
    	return new ModelAndView("overall/orderqusetion", mode);
        
    }
    //不明货品
    @RequestMapping(value = "unknownCommList", method = RequestMethod.GET)
    public ModelAndView unknownCommList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<UnKnownCommodity> uncommlist=unknowncommodityservice.getAll();
    	ModelMap mode = new ModelMap();
    	mode.put("uncommlist", uncommlist);
    	return new ModelAndView("overall/unknowncomm", mode);
    }

    @RequestMapping(value = "searchShopOrder", method = RequestMethod.POST)
    public ModelAndView searchShopOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("orderDate").trim().equals("")) {
			map.put("orderDate", null);
		}else{
			map.put("orderDate", request.getParameter("orderDate"));
		}
		if (request.getParameter("shopName").trim().equals("")) {
			map.put("shopName", null);
		}else{
			map.put("shopName", request.getParameter("shopName"));
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
		if (request.getParameter("orderID").trim().equals("")) {
			map.put("orderID", null);
		}else{
			map.put("orderID", request.getParameter("orderID"));
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
		if (request.getParameter("orderUser").trim().equals("")) {
			map.put("orderUser", null);
		}else{
			map.put("orderUser", request.getParameter("orderUser"));
		}
		List<OrderForm> list = orderFormService.getOrderFormByParameters(map);
		ModelMap mode = new ModelMap();
    	mode.put("list", list);
        return new ModelAndView("overall/unfinishedOrder", mode);
    }
}
