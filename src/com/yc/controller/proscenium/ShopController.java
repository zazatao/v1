package com.yc.controller.proscenium;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Possession;
import com.yc.entity.Shop;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.ShopType;
import com.yc.entity.Specifications;
import com.yc.entity.user.User;
import com.yc.service.ICargoGroupService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.IShopService;
import com.yc.service.ISpecificationsService;

//前台
@Controller
@RequestMapping("/proscenium")
public class ShopController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(ShopController.class);
	
	@Autowired
	IShopService shopService;
	
	@Autowired
	IShopCommoidtyService shopCommService;
	
	@Autowired
	IShopCategoryService shopCategService;
	
	@Autowired
	ISpecificationsService specificationService;
	
	@RequestMapping(value = "setUpShop", method = RequestMethod.GET)
    public ModelAndView setUpShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("loginUser");
		String shopName  = request.getParameter("shopName");
		if (user == null) {
			return new ModelAndView("user/login",null);
		}else{
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop != null) {
				shop.setShopName(shopName);
				shopService.update(shop);
				return new ModelAndView("reception/myShop",null);
			}else{
				if (null != shopName && !shopName.equals("")) {
					shop = new Shop();
					shop.setShopName(shopName);
					shopService.save(shop);
				}
				return new ModelAndView("reception/setUpShop",null);
			}
		}
	}
	
	@RequestMapping(value = "authentication", method = RequestMethod.GET)
    public ModelAndView authentication(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("reception/authentication",null);
	}
	
	@RequestMapping(value = "authentication", method = RequestMethod.POST)
    public ModelAndView authentications(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		String password = request.getParameter("password");
		Shop shop = null;
		if (user != null) {
			if (password.trim().equals(user.getPassword())) {
				String payPwd = request.getParameter("payPwd");
				String juridicalPerson = request.getParameter("juridicalPerson");
				String idCard = request.getParameter("idCard");
				if (!payPwd.trim().equals("")&&!juridicalPerson.trim().equals("")&&!idCard.trim().equals("")) {
					shop = shopService.getShopByUser(user.getId());
					if (shop != null) {
						shop.setPayPwd(payPwd);
						shop.setJuridicalPerson(juridicalPerson);
						shop.setIdCard(idCard);
						shopService.update(shop);
					}else{
						shop = new Shop();
						shop.setPayPwd(payPwd);
						shop.setJuridicalPerson(juridicalPerson);
						shop.setIdCard(idCard);
						shop.setUser(user);
						shopService.save(shop);
					}
					return new ModelAndView("reception/setUpShop",null);
				}else{
					session.setAttribute("msg", "必填字段输入不正确");
					return new ModelAndView("reception/authentication",null);
				}
			}else{
				session.setAttribute("msg", "密码输入错误");
				return new ModelAndView("reception/authentication",null);
			}
		}else{
			return new ModelAndView("user/login",null);
		}
	}
	
	@RequestMapping(value = "openShop", method = RequestMethod.GET)
    public String openShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String possessions = request.getParameter("possessions");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		Shop shop = null;
		if (user != null) {
			shop = shopService.getShopByUser(user.getId());
			if (shop != null) {
				shop.setShopType(ShopType.valueOf(type));
				shop.setPossession(Possession.valueOf(possessions));
				shopService.update(shop);
			}else{
				shop = new Shop();
				shop.setShopType(ShopType.valueOf(type));
				shop.setPossession(Possession.valueOf(possessions));
				shop.setUser(user);
				shopService.save(shop);
			}
			return "redirect:/";
		}else{
			return "redirect:/user/login";
		}
	}
	
	@RequestMapping(value = "release", method = RequestMethod.GET)
    public ModelAndView release(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("loginUser");
		if (user != null) {
			 Shop shop = user.getShop();
			 if (shop != null) {
				 List<ShopCommoidty> list = shopCommService.getAllByShop(shop.getId());
				 ModelMap mode = new ModelMap();
				 mode.put("shopComms", list);
				return new ModelAndView("reception/releaseList",mode);
			}else{
				return setUpShop(request, response);
			}
		}else{
			return new ModelAndView("user/login",null);
		}
	}
	
	@RequestMapping(value = "releaseCommoidty", method = RequestMethod.GET)
    public ModelAndView releaseCommoidty(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("loginUser");
		if (user == null) {
			return new ModelAndView("user/login",null);
		}
		List<ShopCategory> list = shopCategService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("shopCategory", list);
		return new ModelAndView("reception/releaseCommoidty",mode);
	}
	
	@RequestMapping(value = "getSpecific", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getSpecific(@RequestParam(value = "ids", required = true) Integer ids ) throws ServletException, IOException {
		ShopCategory shopCate = shopCategService.findById(ids);
		List<Specifications> spec = specificationService.getAllByShopCateg(shopCate);
		ModelMap mode = new ModelMap(); 
		mode.put("spec", spec);
		mode.put("success", "true");
		return mode;
	}
}
