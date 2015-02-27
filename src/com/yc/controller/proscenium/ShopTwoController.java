package com.yc.controller.proscenium;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Address;
import com.yc.entity.BuyCat;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.user.User;
import com.yc.model.BuyCatSession;
import com.yc.service.IAddressService;
import com.yc.service.IBrandService;
import com.yc.service.IBuyCatService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommImageService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.IShopService;
import com.yc.service.ISpecificationsService;

//前台
@Controller
@RequestMapping("/proscenium")
public class ShopTwoController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(ShopTwoController.class);

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
	IBuyCatService buyCatService;//购物车
	
	@Autowired
	IAddressService addressService;

	@RequestMapping(value = "categoryOne", method = RequestMethod.GET)
	public ModelAndView categoryOne(Integer id ,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		ShopCategory cate = null;
		if (id >0) {
			cate = shopCategService.findById(id);
			List<ShopCategory> list = shopCategService.getAll();
			mode.put("shopCategories", list);
			mode.put("cate", cate);
		}
		return new ModelAndView("reception/categoryOne",mode);
	}
	
	@RequestMapping(value = "categoryLei", method = RequestMethod.GET)
	public ModelAndView categoryLei(Integer id ,String page,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		ShopCategory cate = null;
		List<ShopCategory> list = shopCategService.getAll();
		if (id >0) {
			cate = shopCategService.findById(id);
			mode.put("shopCategories", list);
			mode.put("cate", cate);
			if (page.equals("electronics")) {
				return new ModelAndView("reception/electronics",mode);
			}else if(page.equals("autoSupplies")){
				return new ModelAndView("reception/autoSupplies",mode);
			}
		}
		if (page.equals("brand")) {
			mode.put("shopCategories", list);
			return new ModelAndView("reception/brand",mode);
		}else if (page.equals("special")) {
			mode.put("shopCategories", list);
			return new ModelAndView("reception/special",mode);
		}else{
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "buyCat", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> buyCat(Integer commID ,String params, Integer buyAmount, HttpServletRequest request) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		ShopCommoidty commoidty = shopCommService.findById(commID);
		if (user == null) {
			BuyCatSession buyCat = new BuyCatSession();
			buyCat.setBuyAmount(buyAmount);
			buyCat.setShopCommoidty(commoidty);
			buyCat.setSpecs(params+",");
			List<BuyCatSession> list = (List<BuyCatSession>)session.getAttribute("buyCates");
			if (list != null ) {
				for (BuyCatSession buyCatSession : list) {
					boolean isok = true;
					if (buyCatSession.getShopCommoidty().getCommoidtyName().equals(commoidty.getCommoidtyName())) {
						String[] buycat1 = buyCatSession.getSpecs().split(",");
						String[] guige = new String[buycat1.length];
						String[] buycat2 = params.split(",");
						for (int i = 0; i < buycat1.length; i++) {
							for (int j = 0; j < buycat2.length; j++) {
								if (buycat1[i].equals(buycat2[j])) {
									guige[i] = "t";
								}
							}
							if (guige[i] == null ||guige[i].equals("")) {
								guige[i] = "f";
							}
						}
						for (int i = 0; i < guige.length; i++) {
							if (guige[i].equals("f")) {
								isok = false;
							}
						}
					}else{
						isok = false;
					}
					if (isok) {
						buyCat.setBuyAmount(buyCatSession.getBuyAmount()+buyAmount);
					}
				}
				list.add(buyCat);
			}else{
				list = new ArrayList<BuyCatSession>();
				list.add(buyCat);
			}
			session.setAttribute("buyCates", list);
		}else{
			BuyCat cat = new BuyCat();
			cat.setBuyAmount(buyAmount);
			cat.setCatUser(user);
			cat.setShopCommoidty(commoidty);
			cat.setSpecs(params+",");
			List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
			boolean bool = true;
			if (list !=null && list.size()>0) {
				for (BuyCat buyCat : list) {
					boolean isok = true;
					if (buyCat.getShopCommoidty().getCommoidtyName().equals(commoidty.getCommoidtyName())) {
						String[] buycat1 = buyCat.getSpecs().split(",");
						String[] guige = new String[buycat1.length];
						String[] buycat2 = params.split(",");
						for (int i = 0; i < buycat1.length; i++) {
							for (int j = 0; j < buycat2.length; j++) {
								if (buycat1[i].equals(buycat2[j])) {
									guige[i] = "t";
								}
							}
							if (guige[i] == null ||guige[i].equals("")) {
								guige[i] = "f";
							}
						}
						for (int i = 0; i < guige.length; i++) {
							if (guige[i].equals("f")) {
								isok = false;
							}
						}
					}else{
						isok = false;
					}
					if (isok) {
						buyCat.setBuyAmount(buyCat.getBuyAmount()+buyAmount);
						buyCatService.update(buyCat);
						bool = false;
					}
					System.out.println("buyCat.getBuyAmount()======="+buyCat.getBuyAmount());
				}
				if (bool) {
					buyCatService.save(cat);
				}
			}else{
				buyCatService.save(cat);
			}
		}
		mode.put("success", "true");
		return mode;
	}
	
	@RequestMapping(value = "shopcar", method = RequestMethod.GET)
	public ModelAndView shopcar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		if (user == null) {
			return new ModelAndView("user/login",null);
		}else{
			@SuppressWarnings("unchecked")
			List<BuyCatSession> buycats = (List<BuyCatSession>)session.getAttribute("buyCates");
			if (buycats != null && buycats.size()>0) {
				List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
				for (BuyCatSession buyCatSession : buycats) {
					boolean bool = true;
					for (BuyCat buyCat : list) {
						boolean isok = true;
						if (buyCatSession.getShopCommoidty().getCommoidtyName().equals(buyCat.getShopCommoidty().getCommoidtyName())) {
							String[] buycat1 = buyCatSession.getSpecs().split(",");
							String[] guige = new String[buycat1.length];
							String[] buycat2 = buyCat.getSpecs().split(",");
							for (int i = 0; i < buycat1.length; i++) {
								for (int j = 0; j < buycat2.length; j++) {
									if (buycat1[i].equals(buycat2[j])) {
										guige[i] = "t";
									}
								}
								if (guige[i] == null ||guige[i].equals("")) {
									guige[i] = "f";
								}
							}
							for (int i = 0; i < guige.length; i++) {
								if (guige[i].equals("f")) {
									isok = false;
								}
							}
						}else{
							isok = false;
						}
						if (isok) {
							buyCat.setBuyAmount(buyCatSession.getBuyAmount()+buyCat.getBuyAmount());
							buyCatService.update(buyCat);
							bool = false;
						}
					}
					if (bool) {
						BuyCat buyCat = new BuyCat();
						buyCat.setBuyAmount(buyCatSession.getBuyAmount());
						buyCat.setCatUser(user);
						buyCat.setShopCommoidty(buyCatSession.getShopCommoidty());
						buyCat.setSpecs(buyCatSession.getSpecs());
						buyCatService.save(buyCat);
					}
				}
				session.removeAttribute("buyCates");
			}
			List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
			mode.put("list", list);
		}
		mode.put("shopCategories", shopCategories);
		return new ModelAndView("reception/shopcar",mode);
	}
	
	@RequestMapping(value = "deleteShopCar", method = RequestMethod.GET)
	public String deleteShopCar(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (id != null && !id.equals("")) {
			buyCatService.delete(id);
		}
		return "redirect:/proscenium/shopcar";
	}
	
	@RequestMapping(value = "shopcardelv", method = RequestMethod.GET)
	public ModelAndView shopcardelv(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ShopCategory> shopCategories = shopCategService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("shopCategories", shopCategories);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		if (user == null) {
			return new ModelAndView("user/login",null);
		}else{
			@SuppressWarnings("unchecked")
			List<BuyCatSession> buycats = (List<BuyCatSession>)session.getAttribute("buyCates");
			if (buycats != null && buycats.size()>0) {
				List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
				for (BuyCatSession buyCatSession : buycats) {
					boolean bool = true;
					for (BuyCat buyCat : list) {
						boolean isok = true;
						if (buyCatSession.getShopCommoidty().getCommoidtyName().equals(buyCat.getShopCommoidty().getCommoidtyName())) {
							String[] buycat1 = buyCatSession.getSpecs().split(",");
							String[] guige = new String[buycat1.length];
							String[] buycat2 = buyCat.getSpecs().split(",");
							for (int i = 0; i < buycat1.length; i++) {
								for (int j = 0; j < buycat2.length; j++) {
									if (buycat1[i].equals(buycat2[j])) {
										guige[i] = "t";
									}
								}
								if (guige[i] == null ||guige[i].equals("")) {
									guige[i] = "f";
								}
							}
							for (int i = 0; i < guige.length; i++) {
								if (guige[i].equals("f")) {
									isok = false;
								}
							}
						}else{
							isok = false;
						}
						if (isok) {
							buyCat.setBuyAmount(buyCatSession.getBuyAmount()+buyCat.getBuyAmount());
							buyCatService.update(buyCat);
							bool = false;
						}
					}
					if (bool) {
						BuyCat buyCat = new BuyCat();
						buyCat.setBuyAmount(buyCatSession.getBuyAmount());
						buyCat.setCatUser(user);
						buyCat.setShopCommoidty(buyCatSession.getShopCommoidty());
						buyCat.setSpecs(buyCatSession.getSpecs());
						buyCatService.save(buyCat);
					}
				}
				session.removeAttribute("buyCates");
			}
			List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
			List<Address> addresses = addressService.getAllByUser(user.getId());
			mode.put("addresses", addresses);
			mode.put("list", list);
		}
		return  new ModelAndView("reception/shopcardelv",mode);
	}
}
