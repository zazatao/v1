package com.yc.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.entity.Brand;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommoidty;
import com.yc.model.BrandCategory;
import com.yc.service.IShopCategoryService;

@Controller
@RequestMapping("/getShopCategory")
public class GetShopCategory {
	
	@Autowired
	IShopCategoryService shopCategService;//类别
	
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
		BrandCategory brandCategory =null;
		List<BrandCategory> shopCategories = new ArrayList<BrandCategory>();
		if (list.size()>0) {
			for (ShopCategory shopCategory : list) {
				brandCategory = new BrandCategory();
				String str = "";
				brandCategory.setCategory(shopCategory.getCategory());
				if(shopCategory.getBrands().size()>0){
					for (Brand brand : shopCategory.getBrands()) {
						str = str +brand.getBrandID() +"-"+brand.getBrandName()+"|";
					}
					str = str.substring(0,str.length()-1);
					brandCategory.setBrandStr(str);
				}
				shopCategories.add(brandCategory);
			}
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
				ShopCategory cate = shopCategService.findById(shopCategory.getParentLevel());
				if (map.containsKey(cate.getCategory())) {
					cateName = map.get(cate.getCategory()) + shopCategory.getCategoryID()+"-"+shopCategory.getCategory()+"|";
					map.put(cate.getCategory(), cateName);
				}else{
					map.put(cate.getCategory(), shopCategory.getCategoryID()+"-"+shopCategory.getCategory()+"|");
				}
			}
		}
		BrandCategory brand = null;
		for (String key : map.keySet()) {
			System.out.println(key+"         ==        "+map.get(key));
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
}
