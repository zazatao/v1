
package com.yc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.ShopCategory;
import com.yc.model.CommdityModel;
import com.yc.service.ICommodityService;
import com.yc.service.IShopCategoryService;

//首页
@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	IShopCategoryService shopCategService;// 类别
	
	@Autowired
	ICommodityService commodityService;
	
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<ShopCategory> list = shopCategService.getAll();
    	ModelMap mode = new ModelMap();
    	mode.put("shopCategories", list);
    	return new ModelAndView("index", mode);
    }
    
    // 分类查询
 	@RequestMapping(value = "shopCommItems", method = RequestMethod.GET)
 	public ModelAndView shopCommItems(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		ModelMap mode = new ModelMap();
 		List<ShopCategory> shopcates = shopCategService.getAll();
 		List<CommdityModel> list =  commodityService.getAllByShopCategoryID(id);
 		mode.put("list", list);
 		mode.put("shopCategories", shopcates);
 		return new ModelAndView("index", mode);
 	}
    
 	@RequestMapping(value = "homePage", method = RequestMethod.GET)
    public ModelAndView homePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return new ModelAndView("homePage", null);
    }
    
    @RequestMapping(value = "personnel", method = RequestMethod.GET)
    public ModelAndView personnel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return new ModelAndView("personnel", null);
    }
}
