package com.yc.controller.proscenium;

import java.io.IOException;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.entity.Shop;
import com.yc.entity.ShopCategory;
import com.yc.entity.user.User;
import com.yc.model.ShopOrderSearch;
import com.yc.service.IAddressService;
import com.yc.service.IBrandService;
import com.yc.service.IBuyCatService;
import com.yc.service.ICommodityService;
import com.yc.service.IImagePathService;
import com.yc.service.IOrderFormService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommImageService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.IShopService;
import com.yc.service.ISpecificationsService;

//前台
@Controller
@RequestMapping("/proscenium")
public class ShopThreeController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(ShopThreeController.class);

	@Autowired
	IShopService shopService;// 商店

	@Autowired
	IShopCommoidtyService shopCommService;// 商品

	@Autowired
	IShopCategoryService shopCategService;// 类别

	@Autowired
	ISpecificationsService specificationService;// 货品规格

	@Autowired
	IBrandService brandService;// 品牌
	
	@Autowired
	IShopCommImageService shopCommImageService;

	@Autowired
	IBuyCatService buyCatService;// 购物车

	@Autowired
	IAddressService addressService;

	@Autowired
	ICommodityService commodityService;

	@Autowired
	IOrderFormService formService;

	@Autowired
	IImagePathService imagePathService;
	
	//后台交易管理
	@RequestMapping(value = "shopTransaction", method = RequestMethod.GET)
	public ModelAndView shopTransaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		if (user != null) {
			Shop shop = user.getShop();
			if (shop != null && shop.getIsPermit()) {
				mode.put("shop", shop);
				List<OrderForm> orders = formService.getShopOrderByShop(shop);
				mode.put("list", orders);
				return new ModelAndView("reception/shopTransaction", mode);
			} else {
				return new ModelAndView("proscenium/setUpShop",null);
			}
		} else {
			return new ModelAndView("user/login", mode);
		}
	}
	
	//后台评价管理
	@RequestMapping(value = "shopEvaluation", method = RequestMethod.GET)
	public ModelAndView shopEvaluation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		if (user != null) {
			Shop shop = user.getShop();
			if (shop != null && shop.getIsPermit()) {
				mode.put("shop", shop);
				return new ModelAndView("reception/shopEvaluation", mode);
			} else {
				return new ModelAndView("proscenium/setUpShop",null);
			}
		} else {
			return new ModelAndView("user/login", mode);
		}
	}
	
	@RequestMapping(value = "payMent", method = RequestMethod.GET)
	public ModelAndView payMent(String ids,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		if (user != null) {
			Shop shop = user.getShop();
			if (shop != null && shop.getIsPermit()) {
				String[] id = ids.split("-");
				for (int i = 0; i < id.length; i++) {
					if (!id[i].equals("")) {
						OrderForm orderForm =  formService.findById(Integer.parseInt(id[i]));
						orderForm.setDeliveryMoney(0f);
						formService.update(orderForm);
					}
				}
				mode.put("shop", shop);
				List<OrderForm> orders = formService.getShopOrderByShop(shop);
				mode.put("list", orders);
				return new ModelAndView("reception/shopTransaction", mode);
			} else {
				return new ModelAndView("proscenium/setUpShop",null);
			}
		} else {
			return new ModelAndView("user/login", mode);
		}
	}
	
	@RequestMapping(value = "orderDelivery", method = RequestMethod.GET)
	public ModelAndView orderDelivery(String ids,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		if (user != null) {
			Shop shop = user.getShop();
			if (shop != null && shop.getIsPermit()) {
				String[] id = ids.split("-");
				for (int i = 0; i < id.length; i++) {
					if (!id[i].equals("")) {
						OrderForm orderForm =  formService.findById(Integer.parseInt(id[i]));
						for (Commodity comm : orderForm.getCommodities()) {
							comm.setStatus(CommoidityStatus.sendOut);
							commodityService.update(comm);
						}
						orderForm.setOrderstatus(OrderStatus.transitGoods);
						formService.update(orderForm);
					}
				}
				mode.put("shop", shop);
				List<OrderForm> orders = formService.getShopOrderByShop(shop);
				mode.put("list", orders);
				return new ModelAndView("reception/shopTransaction", mode);
			} else {
				return new ModelAndView("proscenium/setUpShop",null);
			}
		} else {
			return new ModelAndView("user/login", mode);
		}
	}
	
	@RequestMapping(value = "shopOrderSearch", method = RequestMethod.POST)
	public ModelAndView shopOrderSearch(ShopOrderSearch orderSearch, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		if (user != null) {
			Shop shop = user.getShop();
			if (shop != null && shop.getIsPermit()) {
				mode.put("shop", shop);
				Map<String, Object> map = new HashMap<String, Object>();
				if (orderSearch.getNameOfGoods().equals("")) {
					map.put("nameOfGoods", null);
				}else{
					map.put("nameOfGoods", orderSearch.getNameOfGoods());
				}
				if (orderSearch.getOrderFormID().equals("")) {
					map.put("orderFormID", null);
				}else{
					map.put("orderFormID", orderSearch.getOrderFormID());
				}
				if (orderSearch.getOrderStatusFrom().equals("")) {
					map.put("orderStatusFrom", null);
				}else{
					map.put("orderStatusFrom", orderSearch.getOrderStatusFrom());
				}
				if (orderSearch.getOrderUserName().equals("")) {
					map.put("orderUserName", null);
				}else{
					map.put("orderUserName", orderSearch.getOrderUserName());
				}
				if (orderSearch.getPaymentDateLeft().equals("")) {
					map.put("paymentDateLeft", null);
				}else{
					map.put("paymentDateLeft", orderSearch.getPaymentDateLeft());
				}
				if (orderSearch.getPaymentDateRight().equals("")) {
					map.put("paymentDateRight", null);
				}else{
					map.put("paymentDateRight", orderSearch.getPaymentDateRight());
				}
				List<OrderForm> orders = formService.getShopOrderByParam(map,shop);
				mode.put("list", orders);
				mode.put("shopOrderSearch", "true");
				return new ModelAndView("reception/shopTransaction", mode);
			} else {
				return new ModelAndView("proscenium/setUpShop",null);
			}
		} else {
			return new ModelAndView("user/login", mode);
		}
	}
	
	@RequestMapping(value = "returnGoods", method = RequestMethod.GET)
	public ModelAndView returnGoods( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		if (user != null) {
			Shop shop = user.getShop();
			if (shop != null && shop.getIsPermit()) {
				mode.put("shop", shop);
				List<Commodity> orders = commodityService.getShopCommodityByStatus(CommoidityStatus.refuse,CommoidityStatus.cancel,CommoidityStatus.delete,CommoidityStatus.marriage,shop);
				mode.put("list", orders);
				return new ModelAndView("reception/returnGoods", mode);
			} else {
				return new ModelAndView("proscenium/setUpShop",null);
			}
		} else {
			return new ModelAndView("user/login", mode);
		}
	}
	
	@RequestMapping(value = "updateCommStatus", method = RequestMethod.GET)
	public ModelAndView updateCommStatus(String status,Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		if (user != null) {
			Shop shop = user.getShop();
			if (shop != null && shop.getIsPermit()) {
				mode.put("shop", shop);
				Commodity comm = commodityService.findById(id);
				comm.setStatus(CommoidityStatus.valueOf(status));
				commodityService.update(comm);
				List<Commodity> orders = commodityService.getShopCommodityByStatus(CommoidityStatus.refuse,CommoidityStatus.cancel,CommoidityStatus.delete,CommoidityStatus.marriage,shop);
				mode.put("list", orders);
				return new ModelAndView("reception/returnGoods", mode);
			} else {
				return new ModelAndView("proscenium/setUpShop",null);
			}
		} else {
			return new ModelAndView("user/login", mode);
		}
	}
	
	@RequestMapping(value = "getShopCommSpeces", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getShopCommSpeces(Integer id ,String speces) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<String> list = shopCommService.getShopCommBySpecesAndCommID(id,speces);
		List<String> strs = new ArrayList<String>();
		if (list != null && list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				strs.add(list.get(i).replace(",", "@"));
			}
		}
		mode.put("mySpeces", strs);
		mode.put("elemnt", speces);
		return mode;
	}
}
