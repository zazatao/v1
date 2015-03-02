package com.yc.controller.proscenium;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	IBuyCatService buyCatService;//购物车
	
	@Autowired
	IAddressService addressService;
	
	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IOrderFormService formService;
	
	@Autowired
	IImagePathService imagePathService;
}
