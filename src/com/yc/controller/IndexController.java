
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
import com.yc.service.IShopCategoryService;

//首页
@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	IShopCategoryService shopCategService;//类别
	
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ModelMap mode = new ModelMap();
    	mode = getShopCategory(mode);
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
    
    private ModelMap getShopCategory(ModelMap mode){
		List<ShopCategory> list = shopCategService.getAll();
		mode.put("shopCategories", list);
		return mode;
	}
}
