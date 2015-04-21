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
import com.yc.entity.ShopCommoidty;
import com.yc.entity.user.User;
import com.yc.service.IBlacklistService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.IShopService;
import com.yc.service.IUserService;

//管理
@Controller
@RequestMapping("/management")
public class ManagementTwoController {

	private static final Logger LOG = Logger.getLogger(ManagementTwoController.class);
	
	@Autowired
	IBlacklistService blacklistService;
	
	@Autowired
	IShopService shopService;
	
	@Autowired
	IShopCommoidtyService commoidtyService;
	
	@Autowired
	IUserService userService;
	
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
	public ModelAndView addBlack(Integer id,String mathed,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
 		if (mathed.equals("add")) {
			if (!id.equals("")) {
				mode.put("id", id);
				mode.put("mathed", "add");
				mode.put("page", "shop");
				return new ModelAndView("management/addBlack",mode);
			}else{
				Map<String, Object> map = new HashMap<String, Object>();
				List<Shop> list = shopService.getShopByParam(map);
				mode.put("list", list);
				return new ModelAndView("management/searchShop",mode);
			}
		}else{
			Blacklist blacklist = blacklistService.findById(id);
			mode.put("blacklist", blacklist);
			mode.put("mathed", "update");
			mode.put("page", "shop");
			return  new ModelAndView("management/addBlack",mode);
		}
	}
	
	@RequestMapping(value = "addBlacklistForShop", method = RequestMethod.POST)
	public String addBlacklistForShop(Integer id,String reasons,String mathed,String page,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (mathed.equals("add")) {
			if (page.equals("shop")) {
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
			}else{
				ShopCommoidty commoidty = commoidtyService.findById(id);
				if (commoidty != null) {
					Blacklist black = new Blacklist();
					black.setReasons(reasons);
					black.setBlacklistType(BlacklistType.goods);
					black.setCommoidty(commoidty);
					black.setAddDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
					black = blacklistService.save(black);
					commoidty.setBlacklist(black);
					commoidtyService.update(commoidty);
				}
			}
		}else{
			Blacklist blacks = blacklistService.findById(id);
			blacks.setReasons(reasons);
			blacklistService.update(blacks);
		}
		return "redirect:/management/searchShop";
	}
	
	@RequestMapping(value = "blacklistGoods", method = RequestMethod.GET)
	public ModelAndView blacklistGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Blacklist> list = blacklistService.getBlacklistByBlacklistType(BlacklistType.goods);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/blacklistGoods",mode);
	}
	
	@RequestMapping(value = "addGoodsBlackList", method = RequestMethod.GET)
	public ModelAndView addGoodsBlackList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/searchGoods");
	}
	
	@RequestMapping(value = "searchGoods", method = RequestMethod.POST)
	public ModelAndView searchGoods(String commoidtyName, String commItem, String commCode,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (commoidtyName.equals("")) {
			map.put("commoidtyName", null);
		}else{
			map.put("commoidtyName", commoidtyName);
		}
		if (commItem.equals("")) {
			map.put("commItem", null);
		}else{
			map.put("commItem", commItem);
		}
		if (commCode.equals("")) {
			map.put("commCode", null);
		}else{
			map.put("commCode", Integer.parseInt(commCode));
		}
		List<ShopCommoidty> list = commoidtyService.getAllByParamsForBlack(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/searchGoods",mode);
	}
	
	@RequestMapping(value = "addBlackForGoods", method = RequestMethod.GET)
	public ModelAndView addBlackForGoods(Integer id,String mathed,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
 		if (mathed.equals("add")) {
			if (!id.equals("")) {
				mode.put("id", id);
				mode.put("mathed", "add");
				mode.put("page", "goods");		
				return new ModelAndView("management/addBlack",mode);
			}else{
				Map<String, Object> map = new HashMap<String, Object>();
				List<ShopCommoidty> list = commoidtyService.getAllByParamsForBlack(map);
				mode.put("list", list);
				return new ModelAndView("management/searchShop",mode);
			}
		}else{
			Blacklist blacklist = blacklistService.findById(id);
			mode.put("blacklist", blacklist);
			mode.put("mathed", "update");
			mode.put("page", "goods");
			return  new ModelAndView("management/addBlack",mode);
		}
	}
	
	@RequestMapping(value = "deleteBlack", method = RequestMethod.GET)
	public String deleteBlack(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Blacklist blacklist = blacklistService.findById(id);
		if (blacklist.getBlacklistType() == BlacklistType.stores) {
			Shop shop = blacklist.getShop();
			if (shop != null ) {
				shop.setBlacklist(null);
				shopService.update(shop);
			}
			blacklistService.delete(blacklist.getId());
			return "redirect:/management/blacklistStores";
		}else{
			ShopCommoidty commoid =  blacklist.getCommoidty();
			if (commoid != null ) {
				commoid.setBlacklist(null);
				commoidtyService.update(commoid);
			}
			blacklistService.delete(blacklist.getId());
			return "redirect:/management/blacklistGoods";
		}
	}
	
	@RequestMapping(value = "user", method = RequestMethod.GET)
    public ModelAndView user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		List<User> list = userService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
    	return new ModelAndView("management/user", map);
    }
    
	@RequestMapping(value = "updateIsPermit", method = RequestMethod.GET)
    public String updateIsPermit(Integer id,String isPermit, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		User user = userService.findById(id);
		if (user.getShop() != null ) {
			Shop shop = user.getShop();
			shop.setIsPermit(Boolean.valueOf(isPermit));
			shop = shopService.update(shop);
			user.setShop(shop);
			userService.update(user);
		}
		return "redirect:/management/user";
    }

	@RequestMapping(value = "merchantsSettled", method = RequestMethod.GET)
    public ModelAndView merchantsSettled(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		List<Shop> list = shopService.getShopForManage();
		ModelMap map = new ModelMap();
		map.put("list", list);
    	return new ModelAndView("management/merchantsSettled",map );
    }
}
