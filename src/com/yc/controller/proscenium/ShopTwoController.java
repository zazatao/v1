package com.yc.controller.proscenium;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Address;
import com.yc.entity.Brand;
import com.yc.entity.BuyCat;
import com.yc.entity.CarCommoidty;
import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.Delivery;
import com.yc.entity.DeliveryAddress;
import com.yc.entity.DisposeStatus;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommImage;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.ShopCommoidtySpecs;
import com.yc.entity.StoreRoom;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.model.AdvertisementManager;
import com.yc.model.BuyCatSession;
import com.yc.model.CommdityModel;
import com.yc.service.IAddressService;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAdvertisementService;
import com.yc.service.IBrandService;
import com.yc.service.IBuyCatService;
import com.yc.service.ICarCommoidtyService;
import com.yc.service.ICommodityService;
import com.yc.service.IDeliveryAddressService;
import com.yc.service.IImagePathService;
import com.yc.service.IOrderFormService;
import com.yc.service.IPersonnelService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommImageService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.IShopCommoidtySpecsService;
import com.yc.service.IShopService;
import com.yc.service.ISpecificationsService;
import com.yc.service.IStoreRoomService;
import com.yc.service.IUserService;

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

	@Autowired
	IShopCommoidtySpecsService commoidtySpecsService;

	@Autowired
	IDeliveryAddressService deliveryAddressService;

	@Autowired
	IStoreRoomService roomService;

	@Autowired
	IUserService userService;

	@Autowired
	ICarCommoidtyService carCommoidtyService;

	@Autowired
	IPersonnelService personnelService;

	@Autowired
	IAdvertisementService advertisementService;

	@Autowired
	IAdvertisementDistributionService adverDistributionService;

	// 类别查找
	List<ShopCategory> lists = new ArrayList<ShopCategory>();

	@RequestMapping(value = "categoryOne", method = RequestMethod.GET)
	public ModelAndView categoryOne(Integer id, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		ShopCategory cate = null;
		List<ShopCategory> list = shopCategService.getAll();
		ShopCategory shopCate = shopCategService.findById(id);// 找到父节点
		List<ShopCommoidty> shopcommlist = new ArrayList<ShopCommoidty>();
		lists.clear();
		List<ShopCategory> cateList = getNodeForShopCategory(shopCate);
		System.out.println("cateList.size=====" + cateList.size());
		for (int i = 0; i < cateList.size(); i++) {
			List<ShopCommoidty> comms = cateList.get(i).getShopCommoidties();
			System.out.println("comms========" + cateList.get(i).getCategory());
			if(comms!=null){
				shopcommlist.addAll(comms);
			}
		}
		mode.put("shopcommlist", shopcommlist);
		mode.put("shopCategories", list);
		if (id != null && id > 0) {
			cate = shopCategService.findById(id);
			mode.put("cate", cate);
		}
		return new ModelAndView("reception/categoryOne", mode);
	}

	// 类别子节点
	List<ShopCategory> getNodeForShopCategory(ShopCategory shopCate) {
		List<ShopCategory> list = shopCate.getChildren();

		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				getNodeForShopCategory(list.get(i));
			}
		} else {
			lists.add(shopCate);
		}
		return lists;
	}

	@RequestMapping(value = "categoryLei", method = RequestMethod.GET)
	public ModelAndView categoryLei(Integer id, String page,Integer towID,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		ShopCategory cate = null;
		List<ShopCategory> list = shopCategService.getAll();
		if (id != null && id > 0) {
			cate = shopCategService.findById(id);
			if (towID !=null && !towID.equals("")) {
				cate  = shopCategService.findById(towID);
			}
			mode.put("shopCategories", list);
			mode.put("cate", cate);
			if (page != null && page.equals("electronics")) {
				AdvertisementManager advertisementManager = new AdvertisementManager();
		 		mode.putAll(advertisementManager.getElecProductionPageAdvertisements(adverDistributionService, advertisementService));	
		 		List<ShopCommoidty> shopcommlist = new ArrayList<ShopCommoidty>();
				List<Brand> brandlist = new ArrayList<Brand>();
				lists.clear();
				List<ShopCategory> cateList = getNodeForShopCategory(cate);
				for (int i = 0; i < cateList.size(); i++) {
					List<ShopCommoidty> comms = cateList.get(i)
							.getShopCommoidties();
					List<Brand> brands = cateList.get(i).getBrands();
						    brandlist.addAll(brands);
					shopcommlist.addAll(comms);
				}
				//去除重复数据
				 for ( int k = 0 ; k< brandlist.size() - 1 ;k ++ ) {  
				     for ( int j = brandlist.size() - 1 ; j > k; j -- ) {  
				       if (brandlist.get(j).getBrandName().equals(brandlist.get(k).getBrandName())) {  
				    	   brandlist.remove(j);  
				       }   
				      }   
				    } 
				mode.put("brands",brandlist);
				mode.put("shopcommlist", shopcommlist);
				return new ModelAndView("reception/electronics", mode);
			}else if (page.equals("autoSupplies")) {
				AdvertisementManager advertisementManager = new AdvertisementManager();
		 		mode.putAll(advertisementManager.getCarPageAdvertisements(adverDistributionService, advertisementService));
				List<ShopCommoidty> shopcommlist = new ArrayList<ShopCommoidty>();
				List<CommdityModel> topshopcommlist = new ArrayList<CommdityModel>();
				if(cate.getLevel()!=null&&cate.getLevel()==3){
					           List<ShopCommoidty> comms=cate.getShopCommoidties();
					           List<CommdityModel> topcomms=commodityService.getRankByCommdityID(cate.getCategoryID());
					           shopcommlist.addAll(comms);
							   topshopcommlist.addAll(topcomms);
							  mode.put("shopcommlist", shopcommlist);
							  mode.put("topshopcommlist", topshopcommlist);
				}else if(cate.getLevel()!=null&&cate.getLevel()==2){
					lists.clear();
					List<ShopCategory> cateList = getNodeForShopCategory(cate);
					List<CommdityModel> topcomms=commodityService.getRankTwoByCommdityID(cate.getCategoryID());
					for (int i = 0; i < cateList.size(); i++) {
						List<ShopCommoidty> comms = cateList.get(i).getShopCommoidties();
						shopcommlist.addAll(comms);		
					}	
					topshopcommlist.addAll(topcomms);
					mode.put("shopcommlist", shopcommlist);
					mode.put("topshopcommlist", topshopcommlist);
					mode.put("cateList", cateList);
				}
				return new ModelAndView("reception/autoSupplies", mode);
			}
		}
		if (page != null && page.equals("brand")) {
			AdvertisementManager advertisementManager = new AdvertisementManager();
	 		mode.putAll(advertisementManager.getBrandPageAdvertisements(adverDistributionService, advertisementService));
			List<Brand> brandlist = brandService.getAllunlike();
			mode.put("brands", brandlist);
			System.out.print("brands==========" + brandlist.size());
			if (id != null && id > 0) {
				List<ShopCommoidty> shopcommlist = new ArrayList<ShopCommoidty>();
				lists.clear();
				List<ShopCategory> cateList = getNodeForShopCategory(cate);
				for (int i = 0; i < cateList.size(); i++) {
					List<ShopCommoidty> comms = shopCommService
							.getShopCommByCateAndBrand(cateList.get(i)
									.getCategoryID());
					shopcommlist.addAll(comms);
				}
				mode.put("shopcomlist", shopcommlist);
			} else {
				List<ShopCommoidty> shopcomlist = shopCommService
						.getShopCommByCateAndBrand(id);// id商品类型ID
				mode.put("shopcomlist", shopcomlist);
			}
			mode.put("shopCategories", list);
			return new ModelAndView("reception/brand", mode);
		} else if (page != null && page.equals("special")) {
			Boolean flag = true;
			if (id != null && id > 0) {
				List<ShopCommoidty> shopcommlist = new ArrayList<ShopCommoidty>();
				lists.clear();
				List<ShopCategory> cateList = getNodeForShopCategory(cate);
				for (int i = 0; i < cateList.size(); i++) {
					List<ShopCommoidty> comms = shopCommService
							.getShopCommByCateAndIsspecial(cateList.get(i)
									.getCategoryID(), flag);
					shopcommlist.addAll(comms);
				}
				mode.put("shopcomlist", shopcommlist);
			} else {
				List<ShopCommoidty> shopcomlist = shopCommService
						.getShopCommByCateAndIsspecial(id, flag);
				mode.put("shopcomlist", shopcomlist);
			}
			mode.put("shopCategories", list);
			return new ModelAndView("reception/special", mode);
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "buyCat", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> buyCat(Integer commID, String params,
			Integer buyAmount, Float fare, HttpServletRequest request)
			throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		ShopCommoidty comm = shopCommService.findById(commID);
		if (comm != null) {
			CarCommoidty carcomm = new CarCommoidty();
			carcomm.setCommCode(comm.getCommCode());
			carcomm.setCommoidtyName(comm.getCommoidtyName());
			carcomm.setCommItem(comm.getCommItem());
			carcomm.setSupplier(comm.getSupplier());
			carcomm.setProportion(comm.getProportion());
			carcomm.setUnitPrice(comm.getUnitPrice());
			carcomm.setStock(comm.getStock());
			carcomm.setProbablyWeight(comm.getProbablyWeight());
			carcomm.setShelves(comm.getShelves());
			carcomm.setIsSpecial(comm.getIsSpecial());
			carcomm.setSpecial(comm.getSpecial());
			carcomm.setCurrency(comm.getCurrency());
			carcomm.setIscChoice(comm.getIscChoice());
			carcomm.setAuction(comm.getAuction());
			carcomm.setCarCategory(comm.getShopCategory());
			carcomm.setBrand(comm.getBrand());
			carcomm.setCarbelongTo(comm.getBelongTo());
			carcomm.setDescribes(comm.getDescribes());
			carcomm.setFare(fare);
			carcomm = carCommoidtyService.save(carcomm);
			if (user == null) {
				BuyCatSession buyCat = new BuyCatSession();
				buyCat.setBuyAmount(buyAmount);
				buyCat.setShopCommoidty(carcomm);
				buyCat.setSpecs(params + ",");
				List<BuyCatSession> list = (List<BuyCatSession>) session
						.getAttribute("buyCates");
				if (list != null) {
					for (BuyCatSession buyCatSession : list) {
						boolean isok = true;
						if (buyCatSession.getShopCommoidty().getCommoidtyName()
								.equals(carcomm.getCommoidtyName())) {
							String[] buycat1 = buyCatSession.getSpecs().split(
									",");
							String[] guige = new String[buycat1.length];
							String[] buycat2 = params.split(",");
							for (int i = 0; i < buycat1.length; i++) {
								for (int j = 0; j < buycat2.length; j++) {
									if (buycat1[i].equals(buycat2[j])) {
										guige[i] = "t";
									}
								}
								if (guige[i] == null || guige[i].equals("")) {
									guige[i] = "f";
								}
							}
							for (int i = 0; i < guige.length; i++) {
								if (guige[i].equals("f")) {
									isok = false;
								}
							}
						} else {
							isok = false;
						}
						if (isok) {
							buyCat.setBuyAmount(buyCatSession.getBuyAmount()
									+ buyAmount);
						}
					}
					list.add(buyCat);
				} else {
					list = new ArrayList<BuyCatSession>();
					list.add(buyCat);
				}
				session.setAttribute("buyCates", list);
			} else {
				System.out.println("  carcomm ==" + carcomm);
				BuyCat cat = new BuyCat();
				cat.setBuyAmount(buyAmount);
				cat.setCatUser(user);
				cat.setShopCommoidty(carcomm);
				cat.setSpecs(params + ",");
				List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
				boolean bool = true;
				if (list != null && list.size() > 0) {
					for (BuyCat buyCat : list) {
						boolean isok = true;
						if (buyCat.getShopCommoidty().getCommoidtyName()
								.equals(carcomm.getCommoidtyName())) {
							String[] buycat1 = buyCat.getSpecs().split(",");
							String[] guige = new String[buycat1.length];
							String[] buycat2 = params.split(",");
							for (int i = 0; i < buycat1.length; i++) {
								for (int j = 0; j < buycat2.length; j++) {
									if (buycat1[i].equals(buycat2[j])) {
										guige[i] = "t";
									}
								}
								if (guige[i] == null || guige[i].equals("")) {
									guige[i] = "f";
								}
							}
							for (int i = 0; i < guige.length; i++) {
								if (guige[i].equals("f")) {
									isok = false;
								}
							}
						} else {
							isok = false;
						}
						if (isok) {
							buyCat.setBuyAmount(buyCat.getBuyAmount()
									+ buyAmount);
							buyCatService.update(buyCat);
							bool = false;
						}
					}
					if (bool) {
						buyCatService.save(cat);
					}
				} else {
					buyCatService.save(cat);
				}
			}
		}
		mode.put("success", "true");
		return mode;
	}

	// 购物车
	@RequestMapping(value = "shopcar", method = RequestMethod.GET)
	public ModelAndView shopcar(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		if (user == null) {
			AdvertisementManager advertisementManager = new AdvertisementManager();
			mode.putAll(advertisementManager.getLoginPageAdvertisements(
					adverDistributionService, advertisementService));
			return new ModelAndView("user/login", mode);
		} else {
			@SuppressWarnings("unchecked")
			List<BuyCatSession> buycats = (List<BuyCatSession>) session
					.getAttribute("buyCates");
			if (buycats != null && buycats.size() > 0) {
				List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
				for (BuyCatSession buyCatSession : buycats) {
					boolean bool = true;
					for (BuyCat buyCat : list) {
						boolean isok = true;
						if (buyCatSession
								.getShopCommoidty()
								.getCommoidtyName()
								.equals(buyCat.getShopCommoidty()
										.getCommoidtyName())) {
							String[] buycat1 = buyCatSession.getSpecs().split(
									",");
							String[] guige = new String[buycat1.length];
							String[] buycat2 = buyCat.getSpecs().split(",");
							for (int i = 0; i < buycat1.length; i++) {
								for (int j = 0; j < buycat2.length; j++) {
									if (buycat1[i].equals(buycat2[j])) {
										guige[i] = "t";
									}
								}
								if (guige[i] == null || guige[i].equals("")) {
									guige[i] = "f";
								}
							}
							for (int i = 0; i < guige.length; i++) {
								if (guige[i].equals("f")) {
									isok = false;
								}
							}
						} else {
							isok = false;
						}
						if (isok) {
							buyCat.setBuyAmount(buyCatSession.getBuyAmount()
									+ buyCat.getBuyAmount());
							buyCatService.update(buyCat);
							bool = false;
						}
					}
					if (bool) {
						BuyCat buyCat = new BuyCat();
						buyCat.setBuyAmount(buyCatSession.getBuyAmount());
						buyCat.setCatUser(user);
						buyCat.setShopCommoidty(buyCatSession
								.getShopCommoidty());
						buyCat.setSpecs(buyCatSession.getSpecs());
						buyCatService.save(buyCat);
					}
				}
				session.removeAttribute("buyCates");
			}
			List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
			mode.put("list", list);
		}
		return new ModelAndView("reception/shopcar", mode);
	}

	// 删除购物车产品
	@RequestMapping(value = "deleteShopCar", method = RequestMethod.GET)
	public String deleteShopCar(Integer id, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (id != null && !id.equals("")) {
			BuyCat car = buyCatService.findById(id);
			if (car != null && car.getShopCommoidty() != null) {
				carCommoidtyService.delete(car.getShopCommoidty().getId());
			}
			buyCatService.delete(id);
		}
		return "redirect:/proscenium/shopcar";
	}

	// 交付
	@RequestMapping(value = "shopcardelv", method = RequestMethod.GET)
	public ModelAndView shopcardelv(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<ShopCategory> shopCategories = shopCategService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("shopCategories", shopCategories);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		if (user == null) {
			AdvertisementManager advertisementManager = new AdvertisementManager();
			mode.putAll(advertisementManager.getLoginPageAdvertisements(
					adverDistributionService, advertisementService));
			return new ModelAndView("user/login", mode);
		} else {
			@SuppressWarnings("unchecked")
			List<BuyCatSession> buycats = (List<BuyCatSession>) session
					.getAttribute("buyCates");
			if (buycats != null && buycats.size() > 0) {
				List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
				for (BuyCatSession buyCatSession : buycats) {
					boolean bool = true;
					for (BuyCat buyCat : list) {
						boolean isok = true;
						if (buyCatSession
								.getShopCommoidty()
								.getCommoidtyName()
								.equals(buyCat.getShopCommoidty()
										.getCommoidtyName())) {
							String[] buycat1 = buyCatSession.getSpecs().split(
									",");
							String[] guige = new String[buycat1.length];
							String[] buycat2 = buyCat.getSpecs().split(",");
							for (int i = 0; i < buycat1.length; i++) {
								for (int j = 0; j < buycat2.length; j++) {
									if (buycat1[i].equals(buycat2[j])) {
										guige[i] = "t";
									}
								}
								if (guige[i] == null || guige[i].equals("")) {
									guige[i] = "f";
								}
							}
							for (int i = 0; i < guige.length; i++) {
								if (guige[i].equals("f")) {
									isok = false;
								}
							}
						} else {
							isok = false;
						}
						if (isok) {
							buyCat.setBuyAmount(buyCatSession.getBuyAmount()
									+ buyCat.getBuyAmount());
							buyCatService.update(buyCat);
							bool = false;
						}
					}
					if (bool) {
						BuyCat buyCat = new BuyCat();
						buyCat.setBuyAmount(buyCatSession.getBuyAmount());
						buyCat.setCatUser(user);
						buyCat.setShopCommoidty(buyCatSession
								.getShopCommoidty());
						buyCat.setSpecs(buyCatSession.getSpecs());
						buyCatService.save(buyCat);
					}
				}
				session.removeAttribute("buyCates");
			}
			List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
			List<Address> addresses = addressService.getAllByUser(user.getId());
			mode.put("addresses", addresses);
			mode.put("list", list);
		}
		return new ModelAndView("reception/shopcardelv", mode);
	}

	// 付款
	@RequestMapping(value = "shopcarpro", method = RequestMethod.GET)
	public ModelAndView shopcarpro(Integer addID, String deliveryComm,
			Float deliveryMoney, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		if (user == null) {
			AdvertisementManager advertisementManager = new AdvertisementManager();
			mode.putAll(advertisementManager.getLoginPageAdvertisements(
					adverDistributionService, advertisementService));
			return new ModelAndView("user/login", mode);
		} else {
			@SuppressWarnings("unchecked")
			List<BuyCatSession> buycats = (List<BuyCatSession>) session.getAttribute("buyCates");
			if (buycats != null && buycats.size() > 0) {
				List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
				for (BuyCatSession buyCatSession : buycats) {
					boolean bool = true;
					for (BuyCat buyCat : list) {
						boolean isok = true;
						if (buyCatSession
								.getShopCommoidty()
								.getCommoidtyName()
								.equals(buyCat.getShopCommoidty()
										.getCommoidtyName())) {
							String[] buycat1 = buyCatSession.getSpecs().split(
									",");
							String[] guige = new String[buycat1.length];
							String[] buycat2 = buyCat.getSpecs().split(",");
							for (int i = 0; i < buycat1.length; i++) {
								for (int j = 0; j < buycat2.length; j++) {
									if (buycat1[i].equals(buycat2[j])) {
										guige[i] = "t";
									}
								}
								if (guige[i] == null || guige[i].equals("")) {
									guige[i] = "f";
								}
							}
							for (int i = 0; i < guige.length; i++) {
								if (guige[i].equals("f")) {
									isok = false;
								}
							}
						} else {
							isok = false;
						}
						if (isok) {
							buyCat.setBuyAmount(buyCatSession.getBuyAmount()
									+ buyCat.getBuyAmount());
							buyCatService.update(buyCat);
							bool = false;
						}
					}
					if (bool) {
						BuyCat buyCat = new BuyCat();
						buyCat.setBuyAmount(buyCatSession.getBuyAmount());
						buyCat.setCatUser(user);
						buyCat.setShopCommoidty(buyCatSession
								.getShopCommoidty());
						buyCat.setSpecs(buyCatSession.getSpecs());
						buyCatService.save(buyCat);
					}
				}
				session.removeAttribute("buyCates");
			}
			mode.put("deliveryComm", deliveryComm);
			mode.put("deliveryMoney", deliveryMoney);
			List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
			// 订单生成
			saveOrderForm(addID, deliveryComm, deliveryMoney, request);
			Address address = addressService.findById(addID);
			mode.put("address", address);
			mode.put("list", list);
			// 付款后订单分配
			shareOrder(user);
		}
		return new ModelAndView("reception/shopcarpro", mode);
	}

	private void shareOrder(User user) {
		List<Personnel> list = personnelService.getPurchaseByUser(user);
		if (list != null && list.size() > 0) {
			List<Commodity> commodities = commodityService
					.getOrderByPurchaseAndUser(user);
			if (commodities != null && commodities.size() > 0) {
				for (Commodity comm : commodities) {
					if (comm.getStatus() == CommoidityStatus.support
							&& comm.getSeller().getId() == 1) {
						comm.setPurchase(list.get(0));
						commodityService.update(comm);
					}
				}
			}
		}
	}

	// 订单生成
	private void saveOrderForm(Integer addID, String deliveryComm,
			Float deliveryMoney, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		Address address = addressService.findById(addID);
		List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
		System.out.println("list==="+list.size());
		Map<Integer, List<BuyCat>> map = new HashMap<Integer, List<BuyCat>>();
		List<BuyCat> buycates = null;
		for (int i = 0; i < list.size(); i++) {
			if (i == 0) {
				buycates = new ArrayList<BuyCat>();
				buycates.add(list.get(i));
				map.put(list.get(i).getShopCommoidty().getCarbelongTo().getId(),buycates);
			} else {
				boolean isok = true;
				for (Integer key : map.keySet()) {
					if (list.get(i).getShopCommoidty().getCarbelongTo().getId() == key) {
						map.get(key).add(list.get(i));
						isok = false;
					}
				}
				if (isok) {
					buycates = new ArrayList<BuyCat>();
					buycates.add(list.get(i));
					map.put(list.get(i).getShopCommoidty().getCarbelongTo()
							.getId(), buycates);
				}
			}
			Commodity commodity = null;
			OrderForm orderform = null;
			for (Integer key : map.keySet()) {
				buycates = map.get(key);
				if (buycates != null && buycates.size() > 0) {
					orderform = new OrderForm();
					DeliveryAddress deliveryAddress = new DeliveryAddress();
					BeanUtils.copyProperties(address, deliveryAddress);
					deliveryAddress.setId(null);
					deliveryAddress = deliveryAddressService
							.save(deliveryAddress);
					orderform.setAddress(deliveryAddress);
					orderform.setChangeStatusDate(new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss").format(new Date()));
					orderform.setDelivery(Delivery.valueOf(deliveryComm));
					orderform.setOrderDate(new SimpleDateFormat("yyyy-MM-dd")
							.format(new Date()));
					orderform.setOrderTime(new SimpleDateFormat("HH:mm:ss")
							.format(new Date()));
					orderform.setOrderstatus(OrderStatus.waitDelivery);
					orderform.setOrderUser(user);
					orderform.setPaymentDate(new SimpleDateFormat("yyyy-MM-dd")
							.format(new Date()));
					orderform.setPaymentTime(new SimpleDateFormat("HH:mm:ss")
							.format(new Date()));
					orderform.setDeliveryMoney(deliveryMoney);
					orderform = formService.save(orderform);
					for (BuyCat buyCat : buycates) {
						if (buyCat != null) {
							commodity = new Commodity();
							commodity.setTransNumForTaobao(buyCat
									.getShopCommoidty().getCommCode());
							commodity.setCommItem(buyCat.getShopCommoidty()
									.getCommItem());
							commodity.setQuantity(buyCat.getBuyAmount());
							commodity.setWeight(buyCat.getShopCommoidty()
									.getProbablyWeight()
									* buyCat.getBuyAmount());
							commodity.setNameOfGoods(buyCat.getShopCommoidty()
									.getCommoidtyName());
							commodity.setPrice(buyCat.getShopCommoidty()
									.getUnitPrice()
									* buyCat.getShopCommoidty().getSpecial()
									+ buyCat.getShopCommoidty().getFare()
									* buyCat.getBuyAmount());
							commodity.setMoney(buyCat.getShopCommoidty()
									.getUnitPrice()
									* buyCat.getShopCommoidty().getSpecial()
									* buyCat.getBuyAmount()
									+ buyCat.getShopCommoidty().getFare()
									* buyCat.getBuyAmount());
							commodity.setCurrency(buyCat.getShopCommoidty()
									.getCurrency());
							commodity.setCommSpec(buyCat.getSpecs());
							commodity.setShopcategory(buyCat.getShopCommoidty()
									.getCarCategory());
							commodity.setSeller(buyCat.getShopCommoidty()
									.getCarbelongTo());
							// commodity.setSellerDate(new
							// SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new
							// Date()));//买家付款日期
							ShopCommoidty comm = shopCommService
									.findById(buyCat.getShopCommoidty()
											.getCommCode());
							if (comm == null) {
								commodity.setStatus(CommoidityStatus.support);
							} else {
								commodity.setStatus(CommoidityStatus.paid);
							}
							commodity.setDisposeStatus(DisposeStatus.process);
							commodity.setOrderNumber(orderform);
							commodity.setDescribes(buyCat.getShopCommoidty()
									.getDescribes());
							commodityService.save(commodity);
							if (buyCat.getShopCommoidty() != null) {
								buyCatService.delete(buyCat.getCatID());
								carCommoidtyService.delete(buyCat
										.getShopCommoidty().getId());
							}
						}
					}
					if (orderform != null) {
						if (user.getStoreRoom() == null) {
							StoreRoom storeRoom = roomService
									.getStoreRoomByIsInCell(false);
							if (storeRoom != null) {
								storeRoom.setIsInCell(true);
								storeRoom = roomService.update(storeRoom);
								user.setStoreRoom(storeRoom);
								userService.update(user);
							}
						}
					}
				}
			}
		}
	}

	// 店家添加商家商品
	@RequestMapping(value = "addSupplier", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> addSupplier(Integer commID, Integer category,
			Integer shopID, String commoName, HttpServletRequest request)
			throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		if (user != null) {
			ShopCommoidty shopCommoidty = shopCommService.findById(commID);
			if (shopCommoidty.getBelongTo().getUser() != user
					&& user.getShop().getIsPermit() == true) {
				String supplier = "/proscenium/shopItem?commID=" + commID
						+ "&category=" + category + "&shopID=" + shopID
						+ "&commoName=" + commoName;
				Boolean isok = true;
				List<ShopCommoidty> myShopComms = shopCommService
						.getAllByNameAndShop(commoName, user.getShop().getId());
				for (ShopCommoidty comm : myShopComms) {
					if (comm.getSupplier().equals(supplier)) {
						isok = false;
					}
				}
				if (isok) {
					List<ShopCommoidty> list = shopCommService
							.getAllByNameAndShop(commoName, shopID);
					Map<String, List<String>> map = new HashMap<String, List<String>>();
					List<String> specStrs = null;
					for (ShopCommoidty comm : list) {
						for (ShopCommoidtySpecs spe : comm.getCommsPecs()) {
							String spec = spe.getCommSpec();
							String[] specs = spec.split(",");
							if (specs.length > 0) {
								for (int i = 0; i < specs.length; i++) {
									if (!specs[i].equals("")) {
										if (map.containsKey(specs[i].split("-")[0])) {
											specStrs = map.get(specs[i]
													.split("-")[0]);
											if (!specStrs.contains(specs[i]
													.split("-")[1])) {
												specStrs.add(specs[i]
														.split("-")[1]);
											}
										} else {
											specStrs = new ArrayList<String>();
											specStrs.add(specs[i].split("-")[1]);
											map.put(specs[i].split("-")[0],
													specStrs);
										}
									}
								}
							}
						}
					}
					String strs = ",";
					for (String key : map.keySet()) {
						List<String> valueList = map.get(key);
						for (String string : valueList) {
							strs = strs + key + "-" + string + ",";
						}
					}
					ShopCommoidty commoidty = new ShopCommoidty();
					commoidty
							.setCommoidtyName(shopCommoidty.getCommoidtyName());
					commoidty.setCommItem(shopCommoidty.getCommItem());
					commoidty.setSupplier(supplier);
					commoidty.setProportion(shopCommoidty.getProportion());
					commoidty.setUnitPrice(shopCommoidty.getUnitPrice());
					commoidty.setProbablyWeight(shopCommoidty
							.getProbablyWeight());
					commoidty.setShelves(true);
					commoidty.setIsSpecial(false);
					commoidty.setSpecial(1f);
					commoidty.setCurrency(shopCommoidty.getCurrency());
					commoidty.setShopCategory(shopCommoidty.getShopCategory());
					commoidty.setBrand(shopCommoidty.getBrand());
					commoidty.setBelongTo(user.getShop());
					ShopCommoidty commo = shopCommService.save(commoidty);
					ShopCommoidtySpecs spec = new ShopCommoidtySpecs();
					spec.setCommSpec(strs);
					spec.setShopCommSpecs(commo);
					spec.setStock(9999);
					commoidtySpecsService.save(spec);
					for (ShopCommImage image : shopCommoidty
							.getShopCommImages()) {
						ShopCommImage images = new ShopCommImage();
						images.setImagePath(image.getImagePath());
						images.setShopCommoidty(commo);
						shopCommImageService.save(images);
					}
					mode.put("success", "true");
				} else {
					mode.put("success", "false");
				}
			}
		}
		return mode;
	}
}
