package com.yc.controller.management;

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

import com.yc.entity.Blacklist;
import com.yc.entity.BlacklistType;
import com.yc.entity.Shop;
import com.yc.service.IBlacklistService;
import com.yc.service.IShopService;

//管理
@Controller
@RequestMapping("/management")
public class ManagementTwoController {

	private static final Logger LOG = Logger.getLogger(ManagementTwoController.class);
	
	@Autowired
	IBlacklistService blacklistService;
	
	@Autowired
	IShopService shopService;
	
	@RequestMapping(value = "blacklistStores", method = RequestMethod.GET)
	public ModelAndView blacklist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Blacklist> list = blacklistService.getBlacklistByBlacklistType(BlacklistType.stores);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/blacklistStores",mode);
	}
	
	@RequestMapping(value = "addShopBlackList", method = RequestMethod.GET)
	public ModelAndView addShopBlackList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/searchShop");
	}
	
	@RequestMapping(value = "searchShop", method = RequestMethod.POST)
	public ModelAndView searchShop(String shopName,String juridicalPerson,String phone,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (shopName.equals("")) {
			map.put("shopName", null);
		}else{
			map.put("shopName", shopName);
		}
		if (juridicalPerson.equals("")) {
			map.put("juridicalPerson", null);
		}else{
			map.put("juridicalPerson", juridicalPerson);
		}
		if (phone.equals("")) {
			map.put("phone", null);
		}else{
			map.put("phone", phone);
		}
		List<Shop> list = shopService.getShopByParam(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/searchShop",mode);
	}
	
	@RequestMapping(value = "addBlack", method = RequestMethod.GET)
	public ModelAndView addBlack(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		if (!id.equals("")) {
			mode.put("id", id);
			return new ModelAndView("management/addBlack",mode);
		}else{
			Map<String, Object> map = new HashMap<String, Object>();
			List<Shop> list = shopService.getShopByParam(map);
			mode.put("list", list);
			return new ModelAndView("management/searchShop",mode);
		}
	}
	
	@RequestMapping(value = "addBlacklistForShop", method = RequestMethod.POST)
	public String addBlacklistForShop(Integer id,String reasons,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("id======="+id);
		Shop shop =  shopService.findById(id);
		if (shop != null ) {
			Blacklist black = new Blacklist();
			black.setReasons(reasons);
			black.setBlacklistType(BlacklistType.stores);
			black.setShop(shop);
			black.setAddDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			black = blacklistService.save(black);
			shop.setBlacklist(black);
			shopService.update(shop);
		}
		return "redirect:/management/searchShop";
	}
}
