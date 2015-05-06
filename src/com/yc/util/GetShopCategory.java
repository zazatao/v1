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
import com.yc.entity.CarCommoidty;
import com.yc.entity.MissionPlan;
import com.yc.entity.ShopCategory;
import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.entity.user.User;
import com.yc.model.BrandCategory;
import com.yc.model.BuyCatSession;
import com.yc.service.IBuyCatService;
import com.yc.service.ICarCommoidtyService;
import com.yc.service.IDepartAndPositionsService;
import com.yc.service.IMissionPlanService;
import com.yc.service.IPersonnelService;
import com.yc.service.IShopCategoryService;

@Controller
@RequestMapping("/getShopCategory")
public class GetShopCategory {
	
	@Autowired
	IShopCategoryService shopCategService;//类别
	
	@Autowired
	IBuyCatService buyCatService;
	
	@Autowired
	ICarCommoidtyService carCommoidtyService;
	
	@Autowired
	IDepartAndPositionsService departAndPositionsService;
	
	@Autowired
	IPersonnelService personnelService;
	
	@Autowired
	IMissionPlanService planService;
	
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
						CarCommoidty carCommoidty = carCommoidtyService.save(buyCatSession.getShopCommoidty());
						buyCat.setShopCommoidty(carCommoidty);
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
			if (buycats != null && buycats.size()>0) {
				Integer num = buycats.size();
				mode.put("num", num);
			}else{
				mode.put("num", 0);
			}
		}
    	mode.put("success", "true");
    	return mode;
    }
    
    @RequestMapping(value = "getPositions", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getPositions(Integer depID, HttpServletRequest request) throws ServletException, IOException {
    	ModelMap mode = new ModelMap();
        List<DepartAndPositions> list =	departAndPositionsService.getDepByDepID(depID);
        List<Positions> positions = new ArrayList<Positions>();
        for (DepartAndPositions depAndPos : list) {
        	positions.add(depAndPos.getPositions());
		}
    	mode.put("success", "true");
    	mode.put("list", positions);
    	return mode;
    }
    
    @RequestMapping(value = "getPersonnel", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getPersonnel(Integer depID, Integer posID, HttpServletRequest request) throws ServletException, IOException {
    	ModelMap mode = new ModelMap();
    	DepartAndPositions depAndPos =  departAndPositionsService.getAllByDepAndPos(depID, posID);
    	List<Personnel> list = personnelService.getAllByDepAndPos(depAndPos);
    	mode.put("personnels", list);
    	mode.put("success", "true");
    	return mode;
    }
    
    @RequestMapping(value = "getPlanNum", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getPlanNum( HttpServletRequest request) throws ServletException, IOException {
    	ModelMap mode = new ModelMap();
    	Personnel personnel = (Personnel)request.getSession().getAttribute("loginPersonnle");
    	List<MissionPlan> list = planService.getAllByToPer(personnel);
    	if (list != null && list.size()>0) {
			Integer num = list.size();
			mode.put("num", num);
		}else{
			mode.put("num", 0);
		}
    	mode.put("success", "true");
    	return mode;
    }
    
}
