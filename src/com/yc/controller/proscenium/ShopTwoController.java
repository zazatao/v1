package com.yc.controller.proscenium;

import java.io.IOException;
import java.util.List;

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

import com.yc.entity.ShopCategory;
import com.yc.service.IBrandService;
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
}
