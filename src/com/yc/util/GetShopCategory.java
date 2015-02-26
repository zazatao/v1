package com.yc.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.entity.BuyCat;
import com.yc.entity.ShopCategory;
import com.yc.entity.user.User;
import com.yc.model.BrandCategory;
import com.yc.model.BuyCatSession;
import com.yc.service.IBuyCatService;
import com.yc.service.IShopCategoryService;

@Controller
@RequestMapping("/getShopCategory")
public class GetShopCategory {
	
	@Autowired
	IShopCategoryService shopCategService;//类别
	
	@Autowired
	IBuyCatService buyCatService;
	
	@RequestMapping(value = "shopCategoryAll", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getShopCategoryAll() throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		mode = getShopCategory(mode);
		return mode;
	}
	
	@RequestMapping(value = "shopCategoryBrand", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getShopCategoryBrand() throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = shopCategService.getAllForBrand();
		List<BrandCategory> shopCategories = new ArrayList<BrandCategory>();
		Map<String, String> map = new HashMap<String, String>();
		if (list.size()>0) {
			for (ShopCategory shopCategory : list) {
				String cateName = "";
				if (shopCategory !=null) {
					ShopCategory cate = shopCategService.findById(shopCategory.getParentLevel().getCategoryID());
					if (map.containsKey(cate.getCategory())) {
						cateName = map.get(cate.getCategory()) + shopCategory.getCategoryID()+"-"+shopCategory.getCategory()+"|";
						map.put(cate.getCategory(), cateName);
					}else{
						map.put(cate.getCategory(), shopCategory.getCategoryID()+"-"+shopCategory.getCategory()+"|");
					}
				}
			}
		}
		BrandCategory brand = null;
		for (String key : map.keySet()) {
			brand = new BrandCategory();
			brand.setCategory(key);
			brand.setBrandStr(map.get(key).substring(0,map.get(key).length()-1));
			shopCategories.add(brand);
		}
		mode.put("shopCategories", shopCategories);
		mode.put("success", "true");
		return mode;
	}
	
	@RequestMapping(value = "shopCategoryIsSpecial", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> shopCategoryIsSpecial() throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = shopCategService.getAllForSpecial();
		List<BrandCategory> shopCategories = new ArrayList<BrandCategory>();
		Map<String, String> map = new HashMap<String, String>();
		if (list.size()>0) {
			for (ShopCategory shopCategory : list) {
				String cateName = "";
				if (shopCategory !=null) {
					ShopCategory cate = shopCategService.findById(shopCategory.getParentLevel().getCategoryID());
					if (map.containsKey(cate.getCategory())) {
						cateName = map.get(cate.getCategory()) + shopCategory.getCategoryID()+"-"+shopCategory.getCategory()+"|";
						map.put(cate.getCategory(), cateName);
					}else{
						map.put(cate.getCategory(), shopCategory.getCategoryID()+"-"+shopCategory.getCategory()+"|");
					}
				}
			}
		}
		BrandCategory brand = null;
		for (String key : map.keySet()) {
			brand = new BrandCategory();
			brand.setCategory(key);
			brand.setBrandStr(map.get(key).substring(0,map.get(key).length()-1));
			shopCategories.add(brand);
		}
		mode.put("shopCategories", shopCategories);
		mode.put("success", "true");
		return mode;
	}
	
    private ModelMap getShopCategory(ModelMap mode){
		List<ShopCategory> list = shopCategService.getAll();
		mode.put("shopCategories", list);
		mode.put("success", "true");
		return mode;
	}
    
    @RequestMapping(value = "getBuyCatNum", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getBuyCatNum(HttpServletRequest request) throws ServletException, IOException {
    	ModelMap mode = new ModelMap();
    	HttpSession session = request.getSession();
    	User user = (User)session.getAttribute("loginUser");
    	if (user != null) {
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
			Integer num = buyCatService.getBuyCatByUser(user.getId()).size();
			mode.put("num", num);
		}else{
			@SuppressWarnings("unchecked")
			List<BuyCatSession> buycats = (List<BuyCatSession>)session.getAttribute("buyCates");
			Integer num = buycats.size();
			mode.put("num", num);
		}
    	mode.put("success", "true");
    	return mode;
    }
}
