
package com.yc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Brand;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.Specifications;
import com.yc.entity.Surcharges;
import com.yc.entity.user.Personnel;
import com.yc.model.CommdityModel;
import com.yc.model.Products;
import com.yc.service.IBrandService;
import com.yc.service.ICommodityService;
import com.yc.service.IImagePathService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.ISpecificationsService;
import com.yc.service.ISurchargesService;

//首页
@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	IShopCategoryService shopCategService;// 类别
	
	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IShopCommoidtyService shopCommService;
	
	@Autowired
	IImagePathService imagePathService;
	
	@Autowired
	ISpecificationsService specificationService;// 货品规格

	@Autowired
	IBrandService brandService;// 品牌
	
	@Autowired
	ISurchargesService surchargesService;
	
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<ShopCategory> list = shopCategService.getAll();
    	ModelMap mode = new ModelMap();
    	List<CommdityModel> list1 =  commodityService.getAllByShopCategoryID(30);
 		mode.put("list", list1);
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

 	//热销产品查询
  	@RequestMapping(value = "shopComm", method = RequestMethod.GET)
	@ResponseBody
  	public  Map<String, Object>  shopComm(Integer id) throws ServletException, IOException {
  		ModelMap mode = new ModelMap();
  		List<Products> pr = commodityService.getAllByCommdityID(id);
  		mode.put("pr", pr);
		mode.put("success", "true");
  		return mode;
  	}
  	
  	// 更多内容
  	@RequestMapping(value = "shopCommItemone", method = RequestMethod.GET)
  	public ModelAndView shopCommItemsone(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		ModelMap mode = new ModelMap();
		ShopCategory cate = shopCategService.findById(id);
		List<ShopCategory> shopcates = new ArrayList<ShopCategory>();
		mode.put("brands", cate.getBrands());
		mode.put("specifications", cate.getSpecifications());
		String strs = "";
		shopcates.add(cate);
		while (cate.getParentLevel() != null) {
			cate = shopCategService.findById(cate.getParentLevel().getCategoryID());
			if (cate != null) {
				shopcates.add(cate);
			}
		}
		for (int i = shopcates.size() - 1; i >= 0; i--) {
			if (i == shopcates.size() - 1) {
				cate = shopcates.get(i);
			}
			strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getCategory() + "|";
		}
		shopcates = shopCategService.getAll();
		mode.put("shopCategories", shopcates);
		mode.put("cate", cate);
		mode.put("page", "page");
		mode.put("id", id);
		mode.put("nvabar", strs.substring(0, strs.length() - 1));
		List<Products> list = commodityService.getAllByCommdityID(id);
		mode.put("list", list);
  		return new ModelAndView("reception/searchList", mode);
  	}
  	
  	
 	@RequestMapping(value = "homePage", method = RequestMethod.GET)
    public ModelAndView homePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		Personnel personnel = (Personnel)request.getSession().getAttribute("loginPersonnle");
 		if (personnel != null) {
 			return new ModelAndView("homePage", null);
		}else{
			return new ModelAndView("personnel/login", null);
		}
    }
    
    @RequestMapping(value = "personnel", method = RequestMethod.GET)
    public ModelAndView personnel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return new ModelAndView("personnel", null);
    }
    
 // 产品展示
   	@RequestMapping(value = "CommItem", method = RequestMethod.GET)
   	public ModelAndView CommItem(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		ModelMap mode = new ModelMap();
 		ShopCategory cate = shopCategService.findById(id);
 		List<ShopCategory> shopcates = new ArrayList<ShopCategory>();
 		mode.put("brands", cate.getBrands());
 		mode.put("specifications", cate.getSpecifications());
 		String strs = "";
 		shopcates.add(cate);
 		while (cate.getParentLevel() != null) {
 			cate = shopCategService.findById(cate.getParentLevel().getCategoryID());
 			if (cate != null) {
 				shopcates.add(cate);
 			}
 		}
 		for (int i = shopcates.size() - 1; i >= 0; i--) {
 			if (i == shopcates.size() - 1) {
 				cate = shopcates.get(i);
 			}
 			strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getCategory() + "|";
 		}
 		shopcates = shopCategService.getAll();
 		mode.put("shopCategories", shopcates);
 		mode.put("cate", cate);
 		mode.put("id", id);
 		mode.put("nvabar", strs.substring(0, strs.length() - 1));
 		List<Products> list = commodityService.getAllByCommdityID(id);
 		mode.put("list", list);
   		return new ModelAndView("reception/searchList", mode);
   	}
   	
   	@RequestMapping(value = "searchComm", method = RequestMethod.POST)
   	public ModelAndView SeachComm(String content,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("enter search commoidty__________");
		ModelMap mode = new ModelMap();
		List<ShopCommoidty> shopComms = shopCommService.getAll();
		LinkedList<ShopCommoidty> searchComms = new LinkedList<ShopCommoidty>();
		for ( int i = 0; i< shopComms.size(); i++ )
		{
			if ( shopComms.get(i).getCommoidtyName().contains(content) || shopComms.get(i).getShopCategory().getCategory().contains(content)
					|| shopComms.get(i).getBrand().getBrandName().contains(content) ) {
				searchComms.add(shopComms.get(i));
			}
		}
		List<ShopCategory> shopcates = shopCategService.getAll();
		List<Surcharges> surs = surchargesService.getAll();
		List<Specifications> specifications = specificationService.getAll();
		List<Brand> brands = brandService.getAll();
		mode.put("brands", brands);
		mode.put("specifications", specifications);
		mode.put("surs", surs);
		mode.put("shopCategories", shopcates);
		mode.put("page", "search");
		mode.put("nvabar","搜索结果");
		mode.put("list", searchComms);
   		return new ModelAndView("reception/searchList",mode);
   	}
   	
}
