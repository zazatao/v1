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

import com.yc.entity.Shop;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.user.User;
import com.yc.service.IAddressService;
import com.yc.service.IBrandService;
import com.yc.service.IBuyCatService;
import com.yc.service.ICommodityService;
import com.yc.service.IImagePathService;
import com.yc.service.IOrderFormService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommImageService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.IShopService;
import com.yc.service.ISpecificationsService;

//前台
@Controller
@RequestMapping("/proscenium")
public class ShopThreeController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(ShopThreeController.class);

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
	IBuyCatService buyCatService;// 购物车

	@Autowired
	IAddressService addressService;

	@Autowired
	ICommodityService commodityService;

	@Autowired
	IOrderFormService formService;

	@Autowired
	IImagePathService imagePathService;

	// 发布商品list
	@RequestMapping(value = "shopTransaction", method = RequestMethod.GET)
	public ModelAndView shopTransaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		if (user != null) {
			Shop shop = user.getShop();
			if (shop != null && shop.getIsPermit()) {
				mode.put("shop", shop);
				return new ModelAndView("reception/shopTransaction", mode);
			} else {
				return new ModelAndView("proscenium/setUpShop",null);
			}
		} else {
			return new ModelAndView("user/login", mode);
		}
	}
}
