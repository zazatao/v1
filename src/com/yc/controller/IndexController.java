
package com.yc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Advertisement;
import com.yc.entity.AdvertisementPage;
import com.yc.entity.Brand;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.Specifications;
import com.yc.entity.Surcharges;
import com.yc.entity.user.Personnel;
import com.yc.model.AdvertisementManager;
import com.yc.model.CommdityModel;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAdvertisementService;
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
	
	@Autowired
	IAdvertisementService advertisementService;
	
	@Autowired
	IAdvertisementDistributionService adverDistributionService;
	
	private List<ShopCategory> lists = new ArrayList<ShopCategory>();
	
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(String language, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	if ( language != null ) {
    		if ( language.equals("chinese") ) {
    			session.setAttribute("language", "chinese");
    		} else if ( language.equals("russina") ) {
    			session.setAttribute("language", "russina");
    		}
    	} else {   
    		if ( session.getAttribute("language") == null ) {
    			session.setAttribute("language", "chinese");
    		}	
    	}
 
    	List<ShopCategory> list = shopCategService.getAll();  	
    	List<CommdityModel> list1 =  commodityService.getAllByShopCategoryID(9);
    	String language2 = (String) request.getSession().getAttribute("language");
 		if ( language2.equals("russina") ) {
 			for ( int i = 0; i < list1.size(); i++ ) {
 				list1.get(i).setCategory(shopCategService.findById(list1.get(i).getCategoryID()).getRussinaCategory());
 			}
 		}

    	lists.clear();
    	if ( shopCategService.findById(6) != null) {
    		lists = getNodeForShopCategory(shopCategService.findById(6));  		
    	}
    	
    	List<CommdityModel> allCommodity = new ArrayList<CommdityModel>();
 		List<CommdityModel> topCommodity = new ArrayList<CommdityModel>();
 		for ( int i = 0; i < lists.size(); i++ ) {
 			allCommodity.addAll(commodityService.getAllByCommdityID(lists.get(i).getCategoryID()));
 		}
 		
 		allCommodity.sort(new Comparator<CommdityModel>(){   
            public int compare(CommdityModel object1, CommdityModel object2) {   
                return object1.getSums() - object2.getSums();   
             }   
         }); 
 		
 		for ( int i = 0;i < allCommodity.size(); i++ ) {
 			if ( i < 7 ) {
 				topCommodity.add(allCommodity.get(i));
 			} else {
 				break;
 			}				
 		}

 		ModelMap mode = new ModelMap();
 		AdvertisementManager advertisementManager = new AdvertisementManager();
 		mode.putAll(advertisementManager.getHomePageAdvertisements(adverDistributionService,advertisementService));
 		mode .put("list", list1);
    	mode.put("shopCategories", list);
    	mode.put("lists", allCommodity);
    	
    	return new ModelAndView("index", mode);
    }
        
    // 分类查询
 	@RequestMapping(value = "shopCommItems", method = RequestMethod.GET)
 	@ResponseBody
 	public Map<String, Object> shopCommItems(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		ModelMap mode = new ModelMap(); 	
 		List<CommdityModel> list1 =  commodityService.getAllByShopCategoryID(id);
 		System.out.println("list1=="+list1.size());
 		String language = (String) request.getSession().getAttribute("language");
 		if ( language.equals("russina") ) {
 			for ( int i = 0; i < list1.size(); i++ ) {
 				list1.get(i).setCategory(shopCategService.findById(list1.get(i).getCategoryID()).getRussinaCategory());
 			}
 		}
    	mode.put("list", list1);
    	mode.put("categoryId", id);
    	
 		lists.clear();
 		lists = getNodeForShopCategory(shopCategService.findById(id));
 		List<CommdityModel> allCommodity = new ArrayList<CommdityModel>();
 		List<CommdityModel> topCommodity = new ArrayList<CommdityModel>();
 		for ( int i = 0; i < lists.size(); i++ ) { 			
 			allCommodity.addAll(commodityService.getAllByCommdityID(lists.get(i).getCategoryID()));
 		}
 		
 		allCommodity.sort(new Comparator<CommdityModel>(){   
            public int compare(CommdityModel object1, CommdityModel object2) {   
                return object1.getSums() - object2.getSums();   
             }   
         }); 
 		
 		for ( int i = 0;i < allCommodity.size(); i++ ) {
 			if ( i < 7 ) {
 				topCommodity.add(allCommodity.get(i));
 			} else {
 				break;
 			}				
 		}
 		System.out.println("topCommodity"+topCommodity.size());
 		mode.put("lists", topCommodity);
 		mode.put("success", "true");
 		return mode;
 	}
 	
 	private List<ShopCategory> getNodeForShopCategory(ShopCategory shopCate ) {
		List<ShopCategory> list = shopCate.getChildren();
		
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				getNodeForShopCategory(list.get(i));
			}
		}else{
			lists.add(shopCate);
		}
		return lists;
	}

 	//热销产品查询
  	@RequestMapping(value = "shopComm", method = RequestMethod.GET)
	@ResponseBody
  	public  Map<String, Object>  shopComm(Integer id) throws ServletException, IOException {
  		ModelMap mode = new ModelMap();
  		
  		lists.clear();
 		lists = getNodeForShopCategory(shopCategService.findById(id));
 		List<CommdityModel> allCommodity = new ArrayList<CommdityModel>();
 		List<CommdityModel> topCommodity = new ArrayList<CommdityModel>();
 		for ( int i = 0; i < lists.size(); i++ ) {			
 			allCommodity.addAll(commodityService.getAllByCommdityID(lists.get(i).getCategoryID()));
 		}
 		
 		allCommodity.sort(new Comparator<CommdityModel>(){   
            public int compare(CommdityModel object1, CommdityModel object2) {   
                return object1.getSums() - object2.getSums();   
             }   
         }); 
 		
 		for ( int i = 0;i < allCommodity.size(); i++ ) {
 			if ( i < 7 ) {
 				topCommodity.add(allCommodity.get(i));
 			} else {
 				break;
 			}				
 		}
 		
 		mode.put("pr", topCommodity);
 		mode.put("success", "true");
  		return mode;
  	}
  	
  	// 更多内容
  	@RequestMapping(value = "shopCommItemone", method = RequestMethod.GET)
  	public ModelAndView shopCommItemsone(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		ModelMap mode = new ModelMap();
  		String language = (String) request.getSession().getAttribute("language");
  		AdvertisementManager advertisementManager = new AdvertisementManager();
 		mode.putAll(advertisementManager.getInnerPageAdvertisements(adverDistributionService,advertisementService));
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
			if ( language.equals("chinese") ) {
				strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getCategory() + "|";
			} else if ( language.equals("russina") ) {
				strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getRussinaCategory() + "|";
			}
		}
		
		shopcates = shopCategService.getAll();
		mode.put("shopCategories", shopcates);
		mode.put("cate", cate);
		mode.put("page", "page");
		mode.put("id", id);
		mode.put("nvabar", strs.substring(0, strs.length() - 1));
		
		lists.clear();
 		lists = getNodeForShopCategory(shopCategService.findById(id));
 		List<ShopCommoidty> allCommodity = new ArrayList<ShopCommoidty>();
 		for ( int i = 0; i < lists.size(); i++ ) {
 			allCommodity.addAll(shopCommService.getAllByShopCategoryID(lists.get(i).getCategoryID(), "page"));
 		}
		mode.put("list", allCommodity);
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
   		String language = (String) request.getSession().getAttribute("language");
   		AdvertisementManager advertisementManager = new AdvertisementManager();
 		mode.putAll(advertisementManager.getInnerPageAdvertisements(adverDistributionService,advertisementService));
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
 			
 			if ( language.equals("chinese") ) {
				strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getCategory() + "|";
			} else if ( language.equals("russina") ) {
				strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getRussinaCategory() + "|";
			}
 		}
 		shopcates = shopCategService.getAll();
 		mode.put("shopCategories", shopcates);
 		mode.put("cate", cate);
 		mode.put("id", id);
 		mode.put("nvabar", strs.substring(0, strs.length() - 1));
 		List<CommdityModel> list = commodityService.getAllByCommdityID(id);
 		mode.put("list", list);
 		
 		int position1 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.innerPage, 1).getId(); 
    	List<Advertisement> advertisements = advertisementService.getAll();
    	ArrayList<Advertisement> advertisements1 = new ArrayList<Advertisement>();
    	
    	for ( int i = 0; i < advertisements.size(); i++ ) {
    		if ( advertisements.get(i).getAdverDistribution().getId() == position1 ) {
    			advertisements1.add(advertisements.get(i));
    		} 
    	}
    	mode.put("advertisements1", advertisements1);
    	
   		return new ModelAndView("reception/searchList", mode);
   	}
   	
   	@RequestMapping(value = "searchComm", method = RequestMethod.POST)
   	public ModelAndView SeachComm(String content,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		AdvertisementManager advertisementManager = new AdvertisementManager();
 		mode.putAll(advertisementManager.getInnerPageAdvertisements(adverDistributionService,advertisementService));
		List<ShopCommoidty> searchComms = shopCommService.searchShopComm(content );		
		List<ShopCategory> shopcates = shopCategService.getAll();
		List<Surcharges> surs = surchargesService.getAll();
		List<Specifications> specifications = specificationService.getAll();
		List<Brand> brands = brandService.getAll();
		for (int k = 0; k < brands.size() - 1; k++) {
			for (int j = brands.size() - 1; j > k; j--) {
				if (brands.get(j).getBrandName()	
						.equals(brands.get(k).getBrandName())) {
					brands.remove(j);
				}
			}
		}
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
