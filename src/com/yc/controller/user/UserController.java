package com.yc.controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yc.entity.Address;
import com.yc.entity.Collection;
import com.yc.entity.Commodity;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.entity.ShopCategory;
import com.yc.entity.Transit;
import com.yc.entity.UserSize;
import com.yc.entity.user.Sex;
import com.yc.entity.user.User;
import com.yc.model.AdvertisementManager;
import com.yc.service.IAddressService;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAdvertisementService;
import com.yc.service.ICollectionService;
import com.yc.service.ICommodityService;
import com.yc.service.IOrderFormService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IUserService;
import com.yc.service.IUserSizeService;

@Controller
@RequestMapping("/user")
public class UserController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(UserController.class);

	@Autowired
	IUserService userService;
	
	@Autowired
	IUserSizeService userSizeService;

	@Autowired
	IShopCategoryService ShopCategoryService;

	@Autowired
	IAddressService addressService;
	
	@Autowired
	IOrderFormService orderFormService;
		
	@Autowired
	ICollectionService collectionService;
	
	@Autowired
	IAdvertisementService advertisementService;
	
	@Autowired
	IAdvertisementDistributionService adverDistributionService;
	
	@Autowired
	ICommodityService  commodityService;
	
	@RequestMapping(value = "introductions", method = RequestMethod.GET)
	public ModelAndView user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> list = userService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("reception/introduction", mode);
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("message");
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = ShopCategoryService.getAll();
		mode.put("shopCategories", list);
		AdvertisementManager advertisementManager = new AdvertisementManager();
 		mode.putAll(advertisementManager.getLoginPageAdvertisements(adverDistributionService,advertisementService));
		return new ModelAndView("user/login", mode);
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("loginName");
		String pwd = request.getParameter("password");
		HttpSession session = request.getSession();
		User personnel = userService.getUser(name);
		if (personnel == null) {
			request.getSession().setAttribute("message", "nouser");
			return "redirect:/user/login";
		} else {
			if (personnel.getPassword().equals(pwd.trim())) {
				session.setAttribute("loginUser", personnel);
				return "redirect:/index";
			} else {
				System.out.println("密码错误！！");
				request.getSession().setAttribute("message", "nouser");
				return "redirect:/user/login";
			}
		}
	}

	@RequestMapping(value = "serachUser", method = RequestMethod.POST)
	public ModelAndView serachUser(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("userName").trim().equals("")) {
			map.put("userName", null);
		} else {
			map.put("userName", request.getParameter("userName"));
		}
		if (request.getParameter("email").trim().equals("")) {
			map.put("email", null);
		} else {
			map.put("email", request.getParameter("email"));
		}
		if (request.getParameter("phone").trim().equals("")) {
			map.put("phone", null);
		} else {
			map.put("phone", request.getParameter("phone"));
		}
		if (request.getParameter("sex").trim().equals("")) {
			map.put("sex", null);
		} else {
			map.put("sex", request.getParameter("sex"));
		}
		List<User> list = userService.getAllByParameters(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("reception/introduction", mode);
	}

	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = ShopCategoryService.getAll();
		mode.put("shopCategories", list);
		AdvertisementManager advertisementManager = new AdvertisementManager();
 		mode.putAll(advertisementManager.getLoginPageAdvertisements(adverDistributionService,advertisementService));		
 		return new ModelAndView("user/register", mode);
	}

	@RequestMapping(value = "myoffice", method = RequestMethod.GET)
	public ModelAndView myoffice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		List<ShopCategory> list = ShopCategoryService.getAll();
		ModelMap map = new ModelMap();
		map.put("shopCategories", list);
		if (user == null) {
	    	AdvertisementManager advertisementManager = new AdvertisementManager();
	 		map.putAll(advertisementManager.getLoginPageAdvertisements(adverDistributionService,advertisementService));
			return new ModelAndView("user/login", map);
		}
		List<ShopCategory> shopCates = ShopCategoryService.getAllByLevel(2);
		map.put("shopCates", shopCates);
		map.put("user", user);
		
    	AdvertisementManager advertisementManager = new AdvertisementManager();
    	map.putAll(advertisementManager.getMyOfficePageAdvertisements(adverDistributionService,advertisementService));
		return new ModelAndView("reception/myoffice", map);
	}

	@RequestMapping(value = "introduction", method = RequestMethod.GET)
	public ModelAndView introduction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		if (user != null) {
			ModelMap map = new ModelMap();
			List<ShopCategory> list = ShopCategoryService.getAll();
			List<ShopCategory> shopCates = ShopCategoryService.getAllByLevel(2);
			map.put("shopCates", shopCates);
			map.put("user", user);
			map.put("shopCategories", list);
			return new ModelAndView("reception/introduction", map);
		} else {
			return login(request, response);
		}

	}

	@RequestMapping(value = "updateUser", method = RequestMethod.GET)
	public ModelAndView updateUser(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = userService.findById(id);
		ModelMap mode = new ModelMap();
		mode.put("user", u);
		return new ModelAndView("reception/introduction", mode);
	}

	@RequestMapping(value = "editUser", method = RequestMethod.POST)
	public String editUser(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = userService.findById(id);
		u.setSex(Sex.valueOf(request.getParameter("sex")));
		String userName = request.getParameter("userName");
		u.setUserName(userName);
		String email = request.getParameter("email");
		u.setEmail(email);
		String phone = request.getParameter("phone");
		u.setPhone(phone);
		String birthday = request.getParameter("birthday");
		u.setBirthday(birthday);
		userService.update(u);
		return "redirect:/user/introduction";
	}

	@RequestMapping(value = "editUserpwd", method = RequestMethod.POST)
	public String editUserpwd(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = userService.findById(id);
		String password1 = request.getParameter("password1");	
		if (password1.equals(user.getPassword())) {
			String pwd = request.getParameter("password");
			user.setPassword(pwd);
			userService.update(user);
		}
		return "redirect:/user/introduction";
	}

	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String registing(User personnel, HttpServletRequest request, HttpServletResponse response) throws Exception {
		userService.save(personnel);
		return "redirect:/index";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("loginUser");
		return "redirect:/index";
	}

	@RequestMapping(value = "personnel", method = RequestMethod.GET)
	public ModelAndView packages(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> list = userService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("index", mode);
	}

	@RequestMapping(value = "toAddUser", method = RequestMethod.GET)
	public ModelAndView toAddUser(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		mode.put("personel", request.getSession().getAttribute("loginUser"));
		return new ModelAndView("user/adduser", mode);
	}

	// 地址添加
	@RequestMapping(value = "Address", method = RequestMethod.POST)
	public String Address(Integer num,Address address,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean theDefault = false;
		User user =(User)request.getSession().getAttribute("loginUser");
		Address as = new Address();
		String toName = request.getParameter("toName");
		as.setToName(toName);
		String phone = request.getParameter("phone");
		as.setPhone(phone);
		String toEmail = request.getParameter("toEmail");
		as.setToEmail(toEmail);
		String country = request.getParameter("country");
		as.setCountry(country);
		String city = request.getParameter("city");
		as.setCity(city);
		String street = request.getParameter("street");
		as.setStreet(street);
		String district = request.getParameter("district");
		as.setDistrict(district);
		String handedAddress = request.getParameter("handedAddress");
		as.setHandedAddress(Transit.valueOf(handedAddress));
		String indexNum = request.getParameter("indexNum");
		as.setIndexNum(indexNum);
		as.setUser(user);
		if(num == 0){ theDefault = false; } else { theDefault = true; }
		as.setTheDefault(theDefault);
		Address address1 =  addressService.save(as);
		user.getAddresses().add(address1);
		userService.update(user);
		return "redirect:/user/introduction";
	}
    //保存地址
	@RequestMapping(value = "saveNewAddress", method = RequestMethod.POST)
	public String saveNewAddress(Address address,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user =(User)request.getSession().getAttribute("loginUser");
		address.setUser(user);
		addressService.save(address);
		return "redirect:/proscenium/shopcardelv";
	}
	// 修改地址
	@RequestMapping(value = "editaddress", method = RequestMethod.POST)
	public String editaddress(Integer id,Integer num,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Address ad = addressService.findById(id);
		String toName = request.getParameter("toNamea");
		ad.setToName(toName);
		String toEmail = request.getParameter("toEmaila");
		ad.setToEmail(toEmail);
		String phone = request.getParameter("phonea");
		ad.setPhone(phone);
		String country = request.getParameter("countrya");
		ad.setCountry(country);
		String provience = request.getParameter("proviencea");
		ad.setProvience(provience);
		String city = request.getParameter("citya");
		ad.setCity(city);
		String street = request.getParameter("streeta");
		ad.setStreet(street);
		String district = request.getParameter("districta");
		ad.setDistrict(district);
		String handedAddress = request.getParameter("handedAddressa");
		ad.setHandedAddress(Transit.valueOf(handedAddress));
		String indexNum = request.getParameter("indexNuma");
		ad.setIndexNum(indexNum);
		if(num == 0){ } else { }
		addressService.update(ad);
		return "redirect:/user/introduction";
	}

	// 删除地址
	@RequestMapping(value = "deleteaddress", method = RequestMethod.POST)
	public String deleteaddress(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User ad = (User) request.getSession().getAttribute("loginUser");
		ad = userService.findById(id);
		List<Address> as = ad.getAddresses();//error
		if (as.size() > 0) {
			boolean isok = addressService.deleteByadd(id);
			if (isok != false) {
				addressService.delete(id);
			}
		} else {
				addressService.delete(id);
		}
		return "redirect:/user/introduction";
	}

	// 添加新地址
	@RequestMapping(value = "toNewAddress", method = RequestMethod.GET)
	public ModelAndView toNewAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = ShopCategoryService.getAll();
		mode.put("shopCategories", list);
		return new ModelAndView("reception/toNewAddress",mode);
	}
	//查询我的尺寸
	@RequestMapping(value = "skipmysize", method =  RequestMethod.GET)
	public ModelAndView skipmysize(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    User user = (User) request.getSession().getAttribute("loginUser");
	    ModelMap mode = new ModelMap();
		if(user!=null){
			 List<UserSize> sizelist=userSizeService.findByUserID(user.getId());
			 mode.put("sizelist", sizelist);
			 System.out.println("sizelist==="+sizelist.size());
		}
		List<ShopCategory> list = ShopCategoryService.getAll();
		mode.put("shopCategories", list);
		return new ModelAndView("reception/mysize",mode);
	}
	 // 类别查找
 	List<ShopCategory> lists = new ArrayList<ShopCategory>();
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
 	//查询当前类型
 	@RequestMapping(value = "chooseCate", method =  RequestMethod.GET)
 	public ModelAndView chooseCate(Integer id,String sex,String fname,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 	    User user = (User) request.getSession().getAttribute("loginUser");
 	    ModelMap mode = new ModelMap();
 	    ShopCategory cate=ShopCategoryService.findById(id);
 		if(user!=null){
 	        lists.clear();
 			List<ShopCategory> catelist=getNodeForShopCategory(cate);
 			mode.put("catelist", catelist);
 			mode.put("sex", sex);
 			mode.put("fname", fname);
 			System.out.println("fname==="+fname);
 		}
 		return new ModelAndView("reception/creatsize",mode);
 	}
	//删除我的尺寸
	@RequestMapping(value = "deletemysize", method =  RequestMethod.GET)
	public String deletemysize(Integer code,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("code==="+code);
		System.out.println("userSizeService==="+userSizeService);
		boolean flag=userSizeService.delete(code);
		System.out.println("flag===="+flag);
		return "redirect:/user/skipmysize";
	}
	//添加我的尺寸
	@RequestMapping(value = "addsize", method =  RequestMethod.GET)
	public ModelAndView addsize(String filename,String size,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("reception/creatsize",null);
	}
	//添加我的尺寸
	@RequestMapping(value = "mysize", method =  RequestMethod.POST)
	public String mysize(String filename,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     User user = (User) request.getSession().getAttribute("loginUser");
	 if(user!=null){
		 UserSize usersize=new UserSize();
		 usersize.setUser(user);
		String sex=request.getParameter("zise");
		String cates=request.getParameter("cates");
		String sizes=request.getParameter("sizes");
		if(sex!=null){
			usersize.setSex(Sex.valueOf(sex));
		}
		String [] isorno=request.getParameterValues("isdefault");
		if(isorno!=null&&isorno.length>0){
			usersize.setIsdefault(true);
		}else{
			usersize.setIsdefault(false);
		}
		usersize.setCategory(cates);
		usersize.setFilename(filename);
		usersize.setSize(sizes);
		userSizeService.saveSizes(usersize);
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = ShopCategoryService.getAll();
		mode.put("shopCategories", list);
		return "redirect:/user/skipmysize";
	  }else{
		return "redirect:/user/login";
	  }
	}
	//订单
	@RequestMapping(value = "perscentBonuses", method =  RequestMethod.GET)
	public ModelAndView perscentBonuses(String orderDate,String orderStatus, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = ShopCategoryService.getAll();
		mode.put("shopCategories", list);
	    User user =	(User)request.getSession().getAttribute("loginUser");
	    if (user == null ) {
	    	AdvertisementManager advertisementManager = new AdvertisementManager();
	 		mode.putAll(advertisementManager.getLoginPageAdvertisements(adverDistributionService,advertisementService));
			return new ModelAndView("user/login", mode);
		}else{
			Map<String, Object> map = new HashMap<String, Object>();
			if (orderDate.equals("") || orderDate.equals("-1")) {
				map.put("orderDate", null);
			}else{
				map.put("orderDate", orderDate);
			}
			if (orderStatus.equals("") || orderStatus.equals("-1")) {
				map.put("orderStatus", null);
			}else{	
				map.put("orderStatus", orderStatus);
			}
			List<OrderForm> orders = orderFormService.getAllByParams(map,user);
			List<Commodity> comms=new ArrayList<Commodity>();
			for (int i = 0; i < orders.size(); i++) {
				 List<Commodity> cms = commodityService.getCommByOrderId(orders.get(i).getOrderFormID()) ;
				 comms.addAll(cms);
			}
			mode.put("comms",comms);
			mode.put("orderForms", orders);
			mode.put("orderDate", orderDate);	
			mode.put("orderStatus", orderStatus);
			return new ModelAndView("reception/perscentBonuses",mode);	
		}	
	}
	//退款订单
	@RequestMapping(value = "updatRefund", method =  RequestMethod.GET)
	public ModelAndView updatRefund(Integer id,String status,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ModelMap mode = new ModelMap();
	    User user =	(User)request.getSession().getAttribute("loginUser");
	    if (user!= null ) {
	    	  OrderForm orderform=orderFormService.findById(id);
	    	  orderform.setOrderstatus(OrderStatus.valueOf(status));
	    	  orderFormService.save(orderform);
	    	  return new ModelAndView("reception/refundsuccess", null);
	    }else{
	    	return new ModelAndView("reception/login", null);
	    }
	}
	//所有收藏
	@RequestMapping(value = "collection", method = RequestMethod.GET)
	public ModelAndView getAllCollection(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		ModelMap mode = new ModelMap();
		User user = (User) request.getSession().getAttribute("loginUser");
		List<Collection> collections = collectionService.getAll();
		List<ShopCategory> list = ShopCategoryService.getAll();		
		if ( user == null ) {
			mode.put("collections", null);
			mode.put("user", null);
			mode.put("shopCategories", list);
		}
		
		else {
			List<Collection> collections2 = new LinkedList<Collection>();
			for ( int i = 0; i < collections.size(); i++ )
			{
				if ( collections.get(i).getUser().getId() == user.getId() ) {
					collections2.add(collections.get(i));
				}
			}
			mode.put("collections", collections2);
			mode.put("user", user);
			mode.put("shopCategories", list);
		}		
		return new ModelAndView("reception/collection", mode);
	}
	
	//删除收藏
  	@RequestMapping(value = "deleteCollection", method = RequestMethod.GET)
  	public String deleteCollection(Integer collectionID,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		collectionService.delete(collectionID);
  		return "redirect:/user/collection";
  	}
}
