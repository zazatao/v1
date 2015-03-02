package com.yc.controller.user;

import java.io.IOException;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yc.entity.Address;
import com.yc.entity.OrderForm;
import com.yc.entity.ShopCategory;
import com.yc.entity.user.User;
import com.yc.service.IAddressService;
import com.yc.service.IOrderFormService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(UserController.class);

	@Autowired
	IUserService userService;

	@Autowired
	IShopCategoryService ShopCategoryService;

	@Autowired
	IAddressService addressService;
	
	@Autowired
	IOrderFormService orderFormService;

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
		return new ModelAndView("reception/register", mode);
	}

	@RequestMapping(value = "myoffice", method = RequestMethod.GET)
	public ModelAndView myoffice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		List<ShopCategory> list = ShopCategoryService.getAll();
		ModelMap map = new ModelMap();
		map.put("shopCategories", list);
		if (user == null) {
			return new ModelAndView("user/login", map);
		}
		List<ShopCategory> shopCates = ShopCategoryService.getAllByLevel(2);
		map.put("shopCates", shopCates);
		map.put("user", user);
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
		String userName = request.getParameter("userName");
		u.setUserName(userName);
		String email = request.getParameter("email");
		u.setEmail(email);
		String phone = request.getParameter("phone");
		u.setPhone(phone);
		String sex = request.getParameter("sex");
		u.setSex(sex);
		String birthday = request.getParameter("birthday");
		u.setBirthday(birthday);
		userService.update(u);
		return "redirect:/reception/introduction";
	}

	@RequestMapping(value = "editUserpwd", method = RequestMethod.POST)
	public String editUserpwd(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = userService.findById(id);
		String password1 = request.getParameter("password1");
		String pwd = request.getParameter("password");
		user.setPassword(pwd);
		userService.update(user);
		return "redirect:/reception/introduction";
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

	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		;
		User person = new User();
		String name = request.getParameter("name");
		person.setUserName(name);
		String password = request.getParameter("password");
		person.setPassword(password);
		String phone = request.getParameter("phone");
		person.setPhone(phone);
		String email = request.getParameter("email");
		person.setEmail(email);
		String sex = request.getParameter("sex");
		person.setSex(sex);
		userService.save(person);
		return "redirect:/index";
	}

	// 地址添加
	@RequestMapping(value = "Address", method = RequestMethod.POST)
	public String Address(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		as.setHandedAddress(handedAddress);
		String indexNum = request.getParameter("indexNum");
		as.setIndexNum(indexNum);
		addressService.save(as);
		return "redirect:/user/introduction";
	}

	// 修改地址
	@RequestMapping(value = "editaddress", method = RequestMethod.POST)
	public String editaddress(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = userService.findById(id);
		String userName = request.getParameter("userName");
		u.setUserName(userName);
		String email = request.getParameter("email");
		u.setEmail(email);
		String phone = request.getParameter("phone");
		u.setPhone(phone);
		String sex = request.getParameter("sex");
		u.setSex(sex);
		String birthday = request.getParameter("birthday");
		u.setBirthday(birthday);
		userService.update(u);
		return "redirect:/reception/introduction";
	}

	// 删除地址
	@RequestMapping(value = "deleteaddress", method = RequestMethod.POST)
	public String deleteaddress(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User ad = userService.findById(id);
		List<Address> as = ad.getAddresses();
		if (as.size() > 0) {
			boolean isok = addressService.deleteByadd(id);
			if (isok != true) {
				addressService.delete(id);
			}
		} else {
			addressService.delete(id);
		}
		return "redirect:/reception/introduction";
	}

	// 添加新地址
	@RequestMapping(value = "toNewAddress", method = RequestMethod.GET)
	public ModelAndView toNewAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = ShopCategoryService.getAll();
		mode.put("shopCategories", list);
		return new ModelAndView("reception/toNewAddress",mode);
	}
	
	//订单
	@RequestMapping(value = "perscentBonuses", method =  RequestMethod.GET)
	public ModelAndView perscentBonuses(String orderDate,String orderStatus, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = ShopCategoryService.getAll();
		mode.put("shopCategories", list);
	    User user =	(User)request.getSession().getAttribute("loginUser");
	    if (user == null ) {
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
			mode.put("orderForms", orders);
			mode.put("orderDate", orderDate);
			mode.put("orderStatus", orderStatus);
			return new ModelAndView("reception/perscentBonuses",mode);
		}
	}
}
