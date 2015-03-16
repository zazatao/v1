package com.yc.controller.proscenium;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Address;
import com.yc.entity.BuyCat;
import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.Delivery;
import com.yc.entity.DisposeStatus;
import com.yc.entity.ImagePath;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommImage;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.ShopCommoidtySpecs;
import com.yc.entity.user.User;
import com.yc.model.BuyCatSession;
import com.yc.service.IAddressService;
import com.yc.service.IBrandService;
import com.yc.service.IBuyCatService;
import com.yc.service.ICommodityService;
import com.yc.service.IImagePathService;
import com.yc.service.IOrderFormService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommImageService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.IShopCommoidtySpecsService;
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
	
	@Autowired
	IShopCommoidtySpecsService commoidtySpecsService;

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
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "buyCat", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> buyCat(Integer commID ,String params, Integer buyAmount, HttpServletRequest request) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		ShopCommoidty commoidty = shopCommService.findById(commID);
		if (user == null) {
			BuyCatSession buyCat = new BuyCatSession();
			buyCat.setBuyAmount(buyAmount);
			buyCat.setShopCommoidty(commoidty);
			buyCat.setSpecs(params+",");
			List<BuyCatSession> list = (List<BuyCatSession>)session.getAttribute("buyCates");
			if (list != null ) {
				for (BuyCatSession buyCatSession : list) {
					boolean isok = true;
					if (buyCatSession.getShopCommoidty().getCommoidtyName().equals(commoidty.getCommoidtyName())) {
						String[] buycat1 = buyCatSession.getSpecs().split(",");
						String[] guige = new String[buycat1.length];
						String[] buycat2 = params.split(",");
						for (int i = 0; i < buycat1.length; i++) {
							for (int j = 0; j < buycat2.length; j++) {
								if (buycat1[i].equals(buycat2[j])) {
									guige[i] = "t";
								}
							}
							if (guige[i] == null ||guige[i].equals("")) {
								guige[i] = "f";
							}
						}
						for (int i = 0; i < guige.length; i++) {
							if (guige[i].equals("f")) {
								isok = false;
							}
						}
					}else{
						isok = false;
					}
					if (isok) {
						buyCat.setBuyAmount(buyCatSession.getBuyAmount()+buyAmount);
					}
				}
				list.add(buyCat);
			}else{
				list = new ArrayList<BuyCatSession>();
				list.add(buyCat);
			}
			session.setAttribute("buyCates", list);
		}else{
			BuyCat cat = new BuyCat();
			cat.setBuyAmount(buyAmount);
			cat.setCatUser(user);
			cat.setShopCommoidty(commoidty);
			cat.setSpecs(params+",");
			List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
			boolean bool = true;
			if (list !=null && list.size()>0) {
				for (BuyCat buyCat : list) {
					boolean isok = true;
					if (buyCat.getShopCommoidty().getCommoidtyName().equals(commoidty.getCommoidtyName())) {
						String[] buycat1 = buyCat.getSpecs().split(",");
						String[] guige = new String[buycat1.length];
						String[] buycat2 = params.split(",");
						for (int i = 0; i < buycat1.length; i++) {
							for (int j = 0; j < buycat2.length; j++) {
								if (buycat1[i].equals(buycat2[j])) {
									guige[i] = "t";
								}
							}
							if (guige[i] == null ||guige[i].equals("")) {
								guige[i] = "f";
							}
						}
						for (int i = 0; i < guige.length; i++) {
							if (guige[i].equals("f")) {
								isok = false;
							}
						}
					}else{
						isok = false;
					}
					if (isok) {
						buyCat.setBuyAmount(buyCat.getBuyAmount()+buyAmount);
						buyCatService.update(buyCat);
						bool = false;
					}
					System.out.println("buyCat.getBuyAmount()======="+buyCat.getBuyAmount());
				}
				if (bool) {
					buyCatService.save(cat);
				}
			}else{
				buyCatService.save(cat);
			}
		}
		mode.put("success", "true");
		return mode;
	}
	
	@RequestMapping(value = "shopcar", method = RequestMethod.GET)
	public ModelAndView shopcar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		if (user == null) {
			return new ModelAndView("user/login",mode);
		}else{
			@SuppressWarnings("unchecked")
			List<BuyCatSession> buycats = (List<BuyCatSession>)session.getAttribute("buyCates");
			if (buycats != null && buycats.size()>0) {
				List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
				for (BuyCatSession buyCatSession : buycats) {
					boolean bool = true;
					for (BuyCat buyCat : list) {
						boolean isok = true;
						if (buyCatSession.getShopCommoidty().getCommoidtyName().equals(buyCat.getShopCommoidty().getCommoidtyName())) {
							String[] buycat1 = buyCatSession.getSpecs().split(",");
							String[] guige = new String[buycat1.length];
							String[] buycat2 = buyCat.getSpecs().split(",");
							for (int i = 0; i < buycat1.length; i++) {
								for (int j = 0; j < buycat2.length; j++) {
									if (buycat1[i].equals(buycat2[j])) {
										guige[i] = "t";
									}
								}
								if (guige[i] == null ||guige[i].equals("")) {
									guige[i] = "f";
								}
							}
							for (int i = 0; i < guige.length; i++) {
								if (guige[i].equals("f")) {
									isok = false;
								}
							}
						}else{
							isok = false;
						}
						if (isok) {
							buyCat.setBuyAmount(buyCatSession.getBuyAmount()+buyCat.getBuyAmount());
							buyCatService.update(buyCat);
							bool = false;
						}
					}
					if (bool) {
						BuyCat buyCat = new BuyCat();
						buyCat.setBuyAmount(buyCatSession.getBuyAmount());
						buyCat.setCatUser(user);
						buyCat.setShopCommoidty(buyCatSession.getShopCommoidty());
						buyCat.setSpecs(buyCatSession.getSpecs());
						buyCatService.save(buyCat);
					}
				}
				session.removeAttribute("buyCates");
			}
			List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
			mode.put("list", list);
		}
		return new ModelAndView("reception/shopcar",mode);
	}
	
	@RequestMapping(value = "deleteShopCar", method = RequestMethod.GET)
	public String deleteShopCar(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (id != null && !id.equals("")) {
			buyCatService.delete(id);
		}
		return "redirect:/proscenium/shopcar";
	}
	
	@RequestMapping(value = "shopcardelv", method = RequestMethod.GET)
	public ModelAndView shopcardelv(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ShopCategory> shopCategories = shopCategService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("shopCategories", shopCategories);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		if (user == null) {
			return new ModelAndView("user/login",mode);
		}else{
			@SuppressWarnings("unchecked")
			List<BuyCatSession> buycats = (List<BuyCatSession>)session.getAttribute("buyCates");
			if (buycats != null && buycats.size()>0) {
				List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
				for (BuyCatSession buyCatSession : buycats) {
					boolean bool = true;
					for (BuyCat buyCat : list) {
						boolean isok = true;
						if (buyCatSession.getShopCommoidty().getCommoidtyName().equals(buyCat.getShopCommoidty().getCommoidtyName())) {
							String[] buycat1 = buyCatSession.getSpecs().split(",");
							String[] guige = new String[buycat1.length];
							String[] buycat2 = buyCat.getSpecs().split(",");
							for (int i = 0; i < buycat1.length; i++) {
								for (int j = 0; j < buycat2.length; j++) {
									if (buycat1[i].equals(buycat2[j])) {
										guige[i] = "t";
									}
								}
								if (guige[i] == null ||guige[i].equals("")) {
									guige[i] = "f";
								}
							}
							for (int i = 0; i < guige.length; i++) {
								if (guige[i].equals("f")) {
									isok = false;
								}
							}
						}else{
							isok = false;
						}
						if (isok) {
							buyCat.setBuyAmount(buyCatSession.getBuyAmount()+buyCat.getBuyAmount());
							buyCatService.update(buyCat);
							bool = false;
						}
					}
					if (bool) {
						BuyCat buyCat = new BuyCat();
						buyCat.setBuyAmount(buyCatSession.getBuyAmount());
						buyCat.setCatUser(user);
						buyCat.setShopCommoidty(buyCatSession.getShopCommoidty());
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
		return  new ModelAndView("reception/shopcardelv",mode);
	}
	
	@RequestMapping(value = "shopcarpro", method = RequestMethod.GET)
	public ModelAndView shopcarpro(Integer addID,String deliveryComm, Float deliveryMoney, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> shopCategories = shopCategService.getAll();
		mode.put("shopCategories", shopCategories);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		if (user == null) {
			return new ModelAndView("user/login",mode);
		}else{
			@SuppressWarnings("unchecked")
			List<BuyCatSession> buycats = (List<BuyCatSession>)session.getAttribute("buyCates");
			if (buycats != null && buycats.size()>0) {
				List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
				for (BuyCatSession buyCatSession : buycats) {
					boolean bool = true;
					for (BuyCat buyCat : list) {
						boolean isok = true;
						if (buyCatSession.getShopCommoidty().getCommoidtyName().equals(buyCat.getShopCommoidty().getCommoidtyName())) {
							String[] buycat1 = buyCatSession.getSpecs().split(",");
							String[] guige = new String[buycat1.length];
							String[] buycat2 = buyCat.getSpecs().split(",");
							for (int i = 0; i < buycat1.length; i++) {
								for (int j = 0; j < buycat2.length; j++) {
									if (buycat1[i].equals(buycat2[j])) {
										guige[i] = "t";
									}
								}
								if (guige[i] == null ||guige[i].equals("")) {
									guige[i] = "f";
								}
							}
							for (int i = 0; i < guige.length; i++) {
								if (guige[i].equals("f")) {
									isok = false;
								}
							}
						}else{
							isok = false;
						}
						if (isok) {
							buyCat.setBuyAmount(buyCatSession.getBuyAmount()+buyCat.getBuyAmount());
							buyCatService.update(buyCat);
							bool = false;
						}
					}
					if (bool) {
						BuyCat buyCat = new BuyCat();
						buyCat.setBuyAmount(buyCatSession.getBuyAmount());
						buyCat.setCatUser(user);
						buyCat.setShopCommoidty(buyCatSession.getShopCommoidty());
						buyCat.setSpecs(buyCatSession.getSpecs());
						buyCatService.save(buyCat);
					}
				}
				session.removeAttribute("buyCates");
			}
			mode.put("deliveryComm", deliveryComm);
			mode.put("deliveryMoney", deliveryMoney);
			List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
			saveOrderForm(addID,deliveryComm,deliveryMoney,request);
			Address address = addressService.findById(addID);
			mode.put("address", address);
			mode.put("list", list);
		}
		return  new ModelAndView("reception/shopcarpro",mode);
	}
	
	private void saveOrderForm (Integer addID,String deliveryComm, Float deliveryMoney, HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		Address address = addressService.findById(addID);
		List<BuyCat> list = buyCatService.getBuyCatByUser(user.getId());
		Map<Integer, List<BuyCat>> map = new HashMap<Integer, List<BuyCat>>();
		 List<BuyCat> buycates =null;
		for (int i = 0; i < list.size(); i++) {
			if (i==0) {
				buycates = new ArrayList<BuyCat>();
				buycates.add(list.get(i));
				map.put(list.get(i).getShopCommoidty().getBelongTo().getId(), buycates);
			}else{
				boolean isok = true;
				for (Integer key : map.keySet()) {
					if (list.get(i).getShopCommoidty().getBelongTo().getId() == key ) {
						map.get(key).add(list.get(i));
						isok = false;
					}
				}
				if (isok) {
					buycates = new ArrayList<BuyCat>();
					buycates.add(list.get(i));
					map.put(list.get(i).getShopCommoidty().getBelongTo().getId(), buycates);
				}
			}
		}
		Commodity commodity = null;
		OrderForm orderform = null;
		for (Integer key : map.keySet()) {
			buycates = map.get(key);
			if (buycates != null && buycates.size()>0) {
				orderform = new OrderForm();
				orderform.setAddress(address);
				orderform.setChangeStatusDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				orderform.setDelivery(Delivery.valueOf(deliveryComm));
				orderform.setOrderDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
				orderform.setOrderTime(new SimpleDateFormat("HH:mm:ss").format(new Date()));
				orderform.setOrderstatus(OrderStatus.waitDelivery);
				orderform.setOrderUser(user);
				orderform.setPaymentDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
				orderform.setPaymentTime(new SimpleDateFormat("HH:mm:ss").format(new Date()));
				orderform.setDeliveryMoney(deliveryMoney);
				orderform = formService.save(orderform);
				for (BuyCat buyCat : buycates) {
					commodity = new Commodity();
					commodity.setCommItem(buyCat.getShopCommoidty().getCommItem());
					commodity.setQuantity(buyCat.getBuyAmount());
					commodity.setWeight(buyCat.getShopCommoidty().getProbablyWeight());
					commodity.setNameOfGoods(buyCat.getShopCommoidty().getCommoidtyName());
					commodity.setPrice(buyCat.getShopCommoidty().getUnitPrice() * buyCat.getShopCommoidty().getSpecial());
					commodity.setMoney(buyCat.getShopCommoidty().getUnitPrice() * buyCat.getShopCommoidty().getSpecial() * buyCat.getBuyAmount());
					commodity.setCurrency(buyCat.getShopCommoidty().getCurrency());
					commodity.setCommSpec(buyCat.getSpecs());
					commodity.setShopcategory(buyCat.getShopCommoidty().getShopCategory());
					commodity.setSeller(buyCat.getShopCommoidty().getBelongTo());
//					commodity.setSellerDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));//买家付款日期
					commodity.setStatus(CommoidityStatus.paid);
					commodity.setDisposeStatus(DisposeStatus.process);
					commodity.setOrderNumber(orderform);
					Commodity comm = commodityService.save(commodity);
					for (ShopCommImage imagePath : buyCat.getShopCommoidty().getShopCommImages()) {
						ImagePath image = new ImagePath();
						image.setCommodity(comm);
						image.setOrderform(orderform);
						image.setPath(imagePath.getImagePath());
						imagePathService.save(image);
					}
				}
			}
		}
	}
	
	//添加商家商品
	@RequestMapping(value = "addSupplier", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> addSupplier(Integer commID,Integer category,Integer shopID,String commoName,HttpServletRequest request) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		if (user != null) {
			ShopCommoidty shopCommoidty = shopCommService.findById(commID);
			if (shopCommoidty.getBelongTo().getUser() != user && user.getShop().getIsPermit() == true) {
				String supplier = "/proscenium/shopItem?commID="+commID+"&category="+category+"&shopID="+shopID+"&commoName="+commoName;
				Boolean isok = true;
				List<ShopCommoidty> myShopComms =shopCommService.getAllByNameAndShop(commoName,user.getShop().getId());
				for (ShopCommoidty comm : myShopComms) {
					if (comm.getSupplier().equals(supplier)) {
						isok = false;
					}
				}
				if (isok) {
					List<ShopCommoidty> list =shopCommService.getAllByNameAndShop(commoName,shopID);
					Map<String, List<String>> map = new HashMap<String, List<String>>();
					List<String> specStrs = null;
					for (ShopCommoidty comm : list) {
						for (ShopCommoidtySpecs spe : comm.getCommsPecs()) {
						String spec = spe.getCommSpec();
						String[] specs = spec.split(",");
						if (specs.length>0) {
							for (int i = 0; i < specs.length; i++) {
								if (!specs[i].equals("")) {
									if (map.containsKey(specs[i].split("-")[0])) {
										specStrs = map.get(specs[i].split("-")[0]);
										if (!specStrs.contains(specs[i].split("-")[1])) {
											specStrs.add(specs[i].split("-")[1]);
										}
									}else{
										specStrs = new ArrayList<String>();
										specStrs.add(specs[i].split("-")[1]);
										map.put(specs[i].split("-")[0], specStrs);
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
							strs = strs +key +"-"+ string + ",";
						}
					}
					ShopCommoidty commoidty = new ShopCommoidty();
					commoidty.setCommoidtyName(shopCommoidty.getCommoidtyName());
					commoidty.setCommItem(shopCommoidty.getCommItem());
					commoidty.setSupplier(supplier);
					commoidty.setProportion(shopCommoidty.getProportion());
					commoidty.setUnitPrice(shopCommoidty.getUnitPrice());
					commoidty.setProbablyWeight(shopCommoidty.getProbablyWeight());
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
					for (ShopCommImage image : shopCommoidty.getShopCommImages()) {
						ShopCommImage images = new ShopCommImage();
						images.setImagePath(image.getImagePath());
						images.setShopCommoidty(commo);
						shopCommImageService.save(images);
					}
					mode.put("success", "true");
				}else{
					mode.put("success", "false");
				}
			}
		}
		return mode;
	}
}
