package com.yc.controller.management;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.yc.entity.Blacklist;
import com.yc.entity.BlacklistType;
import com.yc.entity.PromotionCode;
import com.yc.entity.Shop;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.Ticket;
import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Sex;
import com.yc.entity.user.User;
import com.yc.service.IBlacklistService;
import com.yc.service.IDepartAndPositionsService;
import com.yc.service.IDepartmentService;
import com.yc.service.IPersonnelService;
import com.yc.service.IPromotionCodeService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.IShopService;
import com.yc.service.ITicketService;
import com.yc.service.IUserService;

//绠＄悊
@Controller
@RequestMapping("/management")
public class ManagementTwoController {

	private static final Logger LOG = Logger.getLogger(ManagementTwoController.class);

	@Autowired
	IBlacklistService blacklistService;

	@Autowired
	IShopService shopService;

	@Autowired
	IShopCommoidtyService commoidtyService;

	@Autowired
	IUserService userService;

	@Autowired
	ITicketService ticketService;

	@Autowired
	IDepartAndPositionsService departAndPositionsService;

	@Autowired
	IPromotionCodeService promotionCodeService;

	@Autowired
	IPersonnelService personnelService;
	
	@Autowired
	IDepartAndPositionsService depAndPosService;
	
	@Autowired
	IDepartmentService departmentService;
	
	
	@RequestMapping(value = "blacklistStores", method = RequestMethod.GET)
	public ModelAndView blacklist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Blacklist> list = blacklistService.getBlacklistByBlacklistType(BlacklistType.stores);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/blacklistStores", mode);
	}

	@RequestMapping(value = "addShopBlackList", method = RequestMethod.GET)
	public ModelAndView addShopBlackList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/searchShop");
	}

	@RequestMapping(value = "searchShop", method = RequestMethod.POST)
	public ModelAndView searchShop(String shopName, String juridicalPerson, String phone, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (shopName.equals("")) {
			map.put("shopName", null);
		} else {
			map.put("shopName", shopName);
		}
		if (juridicalPerson.equals("")) {
			map.put("juridicalPerson", null);
		} else {
			map.put("juridicalPerson", juridicalPerson);
		}
		if (phone.equals("")) {
			map.put("phone", null);
		} else {
			map.put("phone", phone);
		}
		List<Shop> list = shopService.getShopByParam(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/searchShop", mode);
	}

	@RequestMapping(value = "addBlack", method = RequestMethod.GET)
	public ModelAndView addBlack(Integer id, String mathed, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		if (mathed.equals("add")) {
			if (!id.equals("")) {
				mode.put("id", id);
				mode.put("mathed", "add");
				mode.put("page", "shop");
				return new ModelAndView("management/addBlack", mode);
			} else {
				Map<String, Object> map = new HashMap<String, Object>();
				List<Shop> list = shopService.getShopByParam(map);
				mode.put("list", list);
				return new ModelAndView("management/searchShop", mode);
			}
		} else {
			Blacklist blacklist = blacklistService.findById(id);
			mode.put("blacklist", blacklist);
			mode.put("mathed", "update");
			mode.put("page", "shop");
			return new ModelAndView("management/addBlack", mode);
		}
	}

	@RequestMapping(value = "addBlacklistForShop", method = RequestMethod.POST)
	public String addBlacklistForShop(Integer id, String reasons, String mathed, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (mathed.equals("add")) {
			if (page.equals("shop")) {
				Shop shop = shopService.findById(id);
				if (shop != null) {
					Blacklist black = new Blacklist();
					black.setReasons(reasons);
					black.setBlacklistType(BlacklistType.stores);
					black.setShop(shop);
					black.setAddDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
					black = blacklistService.save(black);
					shop.setBlacklist(black);
					shopService.update(shop);
				}
			} else {
				ShopCommoidty commoidty = commoidtyService.findById(id);
				if (commoidty != null) {
					Blacklist black = new Blacklist();
					black.setReasons(reasons);
					black.setBlacklistType(BlacklistType.goods);
					black.setCommoidty(commoidty);
					black.setAddDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
					black = blacklistService.save(black);
					commoidty.setBlacklist(black);
					commoidtyService.update(commoidty);
				}
			}
		} else {
			Blacklist blacks = blacklistService.findById(id);
			blacks.setReasons(reasons);
			blacklistService.update(blacks);
		}
		return "redirect:/management/searchShop";
	}

	@RequestMapping(value = "blacklistGoods", method = RequestMethod.GET)
	public ModelAndView blacklistGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Blacklist> list = blacklistService.getBlacklistByBlacklistType(BlacklistType.goods);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/blacklistGoods", mode);
	}

	@RequestMapping(value = "addGoodsBlackList", method = RequestMethod.GET)
	public ModelAndView addGoodsBlackList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/searchGoods");
	}

	@RequestMapping(value = "searchGoods", method = RequestMethod.POST)
	public ModelAndView searchGoods(String commoidtyName, String commItem, String commCode, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (commoidtyName.equals("")) {
			map.put("commoidtyName", null);
		} else {
			map.put("commoidtyName", commoidtyName);
		}
		if (commItem.equals("")) {
			map.put("commItem", null);
		} else {
			map.put("commItem", commItem);
		}
		if (commCode.equals("")) {
			map.put("commCode", null);
		} else {
			map.put("commCode", Integer.parseInt(commCode));
		}
		List<ShopCommoidty> list = commoidtyService.getAllByParamsForBlack(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/searchGoods", mode);
	}

	@RequestMapping(value = "addBlackForGoods", method = RequestMethod.GET)
	public ModelAndView addBlackForGoods(Integer id, String mathed, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		if (mathed.equals("add")) {
			if (!id.equals("")) {
				mode.put("id", id);
				mode.put("mathed", "add");
				mode.put("page", "goods");
				return new ModelAndView("management/addBlack", mode);
			} else {
				Map<String, Object> map = new HashMap<String, Object>();
				List<ShopCommoidty> list = commoidtyService.getAllByParamsForBlack(map);
				mode.put("list", list);
				return new ModelAndView("management/searchShop", mode);
			}
		} else {
			Blacklist blacklist = blacklistService.findById(id);
			mode.put("blacklist", blacklist);
			mode.put("mathed", "update");
			mode.put("page", "goods");
			return new ModelAndView("management/addBlack", mode);
		}
	}

	@RequestMapping(value = "deleteBlack", method = RequestMethod.GET)
	public String deleteBlack(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Blacklist blacklist = blacklistService.findById(id);
		if (blacklist.getBlacklistType() == BlacklistType.stores) {
			Shop shop = blacklist.getShop();
			if (shop != null) {
				shop.setBlacklist(null);
				shopService.update(shop);
			}
			blacklistService.delete(blacklist.getId());
			return "redirect:/management/blacklistStores";
		} else {
			ShopCommoidty commoid = blacklist.getCommoidty();
			if (commoid != null) {
				commoid.setBlacklist(null);
				commoidtyService.update(commoid);
			}
			blacklistService.delete(blacklist.getId());
			return "redirect:/management/blacklistGoods";
		}
	}

	@RequestMapping(value = "user", method = RequestMethod.GET)
	public ModelAndView user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> list = userService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("management/user", map);
	}

	@RequestMapping(value = "updateIsPermit", method = RequestMethod.GET)
	public String updateIsPermit(Integer id, String isPermit, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = userService.findById(id);
		if (user.getShop() != null) {
			Shop shop = user.getShop();
			shop.setIsPermit(Boolean.valueOf(isPermit));
			shop = shopService.update(shop);
			user.setShop(shop);
			userService.update(user);
		}
		return "redirect:/management/user";
	}

	@RequestMapping(value = "merchantsSettled", method = RequestMethod.GET)
	public ModelAndView merchantsSettled(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Shop> list = shopService.getShopForManage();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("management/merchantsSettled", map);
	}

	@RequestMapping(value = "ticket", method = RequestMethod.GET)
	public ModelAndView ticket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Ticket> list = ticketService.getAll();
		ModelMap map = new ModelMap();
		map.put("list", list);
		return new ModelAndView("management/ticket", map);
	}

	@RequestMapping(value = "updateTicket", method = RequestMethod.GET)
	public ModelAndView updateTicket(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Ticket ticket = ticketService.findById(id);
		ModelMap map = new ModelMap();
		map.put("ticket", ticket);
		return new ModelAndView("management/updateTicket", map);
	}

	@RequestMapping(value = "addTicket", method = RequestMethod.GET)
	public ModelAndView addTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/updateTicket");
	}

	@RequestMapping(value = "addOrUpTicket", method = RequestMethod.POST)
	public String addOrUpTicket(Integer id, String ticketName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (id != null && !id.equals("")) {
			Ticket ticket = ticketService.findById(id);
			ticket.setTicketName(ticketName);
			ticket = ticketService.update(ticket);
		} else {
			if (!ticketName.equals("")) {
				Ticket ticket = new Ticket();
				ticket.setTicketName(ticketName);
				ticketService.save(ticket);
			}
		}
		return "redirect:/management/ticket";
	}

	@RequestMapping(value = "posAndTicket", method = RequestMethod.GET)
	public ModelAndView posAndTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<DepartAndPositions> list = departAndPositionsService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/posAndTicket",mode);
	}
	
	@RequestMapping(value = "updatePosAndTicket", method = RequestMethod.GET)
	public ModelAndView updatePosAndTicket(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DepartAndPositions depAndPos = departAndPositionsService.findById(id);
		List<Ticket> list = ticketService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("depAndPos", depAndPos);
		mode.put("list", list);
		return  new ModelAndView("management/updatePosAndTicket",mode);
	}
	
	@RequestMapping(value = "addPosAndTicket", method = RequestMethod.POST)
	public ModelAndView addPosAndTicket(Integer id,Integer ticketID,Double wage,Integer rules,Double saleCut, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DepartAndPositions depAndPos = departAndPositionsService.findById(id);
		Ticket ticket = ticketService.findById(ticketID);
		if (ticket != null ) {
			depAndPos.setWage(wage);
			depAndPos.setTicket(ticket);
			depAndPos.setRules(rules);
			depAndPos.setSaleCut(saleCut);
			departAndPositionsService.update(depAndPos);
		}
		return null;
	}
	
	@RequestMapping(value = "promotionCode", method = RequestMethod.GET)
	public ModelAndView getAllPromotionCode() throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<PromotionCode> promotionCodeList = promotionCodeService.getAll();
		mode.put("promotioncodelist", promotionCodeList);
		return new ModelAndView("management/promotionCode", mode);
	}

	@RequestMapping(value = "addPromotionCode", method = RequestMethod.GET)
	public ModelAndView addPromotionCode(Integer id, String mathed, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		if (mathed.equals("add")) {
			if (id != null) {
				mode.put("id", id);
				mode.put("mathed", "add");
				mode.put("page", "promotionCode");
				return new ModelAndView("management/addPromotionCode", mode);
			} else {
				mode.put("mathed", "add");
				mode.put("page", "promotionCode");
				return new ModelAndView("management/addPromotionCode", mode);
			}
		} else {
			PromotionCode promotionCode = promotionCodeService.findById(id);
			mode.put("promotionCode", promotionCode);
			mode.put("mathed", "update");
			mode.put("page", "promotionCode");
			return new ModelAndView("management/addPromotionCode", mode);
		}
	}

	@RequestMapping(value = "addPromotionCodeList", method = RequestMethod.POST)
	public String addPromotionCodeList(Integer id, String code, String description, String mathed, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (mathed.equals("add")) {
			if (page.equals("promotionCode")) {
				PromotionCode promotionCode = new PromotionCode();
				promotionCode.setCode(code);
				promotionCode.setDescription(description);
				promotionCode = promotionCodeService.save(promotionCode);
			}
		} else {
			PromotionCode promotionCode = promotionCodeService.findById(id);
			promotionCode.setDescription(description);
			promotionCodeService.update(promotionCode);
		}
		return "redirect:/management/promotionCode";
	}

	@RequestMapping(value = "deletePromotionCode", method = RequestMethod.GET)
	public String deletePromotionCode(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		promotionCodeService.delete(id);
		return "redirect:/management/promotionCode";
	}

	@RequestMapping(value = "searchPromotionCodeResult", method = RequestMethod.POST)
	public ModelAndView searchPromotionCodeResult(String code, String use, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> map = new HashMap<String, String>();
		if (code.equals("")) {
			map.put("code", null);
		} else {
			map.put("code", code);
		}
		map.put("use", use);

		List<PromotionCode> list = promotionCodeService.getUseInfo(map);
		ModelMap mode = new ModelMap();
		mode.put("promotioncodelist", list);
		return new ModelAndView("management/promotionCode", mode);
	}
	
	@RequestMapping(value = "personnel", method = RequestMethod.GET)
	public ModelAndView getAllPersonnel() throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<Personnel> personnelList = personnelService.getAll();
		List<Department> departmentList = departmentService.getAll();
		mode.put("departmentlist", departmentList);
		mode.put("personnellist", personnelList);

		return new ModelAndView("management/personnel", mode);
	}
	
	@RequestMapping(value = "addPersonnel", method = RequestMethod.GET)
	public ModelAndView addPersonnel(Integer id,String mathed,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<Department> departmentList = departmentService.getAll();
 		if (mathed.equals("add")) {		
			if (id != null) {
				mode.put("id", id);
				mode.put("mathed", "add");
				mode.put("page", "personnel");	
				mode.put("departmentlist", departmentList);
				return new ModelAndView("management/addPersonnel",mode);
			}else{
				mode.put("mathed", "add");
				mode.put("page", "personnel");	
				mode.put("departmentlist", departmentList);
				return new ModelAndView("management/addPersonnel",mode);
			}
		}else{
			Personnel personnel = personnelService.findById(id);
			mode.put("personnel", personnel);
			mode.put("mathed", "update");
			mode.put("page", "personnel");
			mode.put("departmentlist", departmentList);
			return  new ModelAndView("management/addPersonnel",mode);
		}
	}
	
	@RequestMapping(value = "addPersonnelList", method = RequestMethod.POST)
	public String addPersonnelList(Integer id,String loginName, String password, String sex, String userName,Integer position_id, 
			Integer department_id,String phone, String email, Integer accomplishNum, String mathed,String page,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Sex sex1 = null;
		if (sex != null)
		{
			if (sex.equals("女"))
				sex1 = Sex.Female;
			else
				sex1 = Sex.Male;
		}
		
		if (mathed.equals("add")) {
			if (page.equals("personnel")) {
				DepartAndPositions depAndPos = depAndPosService.getAllByDepAndPos(department_id, position_id);
				Personnel personnel = new Personnel();
				personnel.setLoginName(loginName);
				personnel.setPassword(password);
				personnel.setUserName(userName);
				personnel.setSex(sex1);
				personnel.setPhone(phone);
				personnel.setEmail(email);
				personnel.setAccomplishNum(accomplishNum);			
				personnel.setDepartAndPositions(depAndPos);
				personnelService.save(personnel);
			}
		}else{
			DepartAndPositions depAndPos = depAndPosService.getAllByDepAndPos(department_id, position_id);
			Personnel personnel = personnelService.findById(id);
			personnel.setPhone(phone);
			personnel.setEmail(email);
			personnel.setAccomplishNum(accomplishNum);
			personnel.setDepartAndPositions(depAndPos);
			personnelService.update(personnel);	
		}
		return "redirect:/management/personnel";
	}
	@RequestMapping(value = "forbiddenPersonnel", method = RequestMethod.GET)
	public String forbiddenPersonnel(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Personnel personnel = personnelService.findById(id);
		if( personnel.getForbidden() != null )
		{
			personnel.setForbidden(null);
		}
		
		else
		{
			personnel.setForbidden("已禁用");
		}
		personnelService.update(personnel);
		return "redirect:/management/personnel";
	}
	
	@RequestMapping(value = "searchPersonnelResult", method = RequestMethod.POST)
	public ModelAndView searchPersonnelResult(String userName,Integer position_id,Integer department_id,
				String forbidden, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (userName.equals("")) {
			map.put("userName", null);
		}else{
			map.put("userName", userName);
		}
		
		if (position_id == 0 ) {
			map.put("positionid", null);
		} else {
			map.put("positionid", position_id);
		}
		
		if (department_id == 0 ) {
			map.put("departmentID", null);
		} else {
			map.put("departmentID", department_id);
		}
		
		if ( forbidden.equals("info") ) {
			map.put("forbidden", null);
		} else {
			map.put("forbidden", forbidden);
		}
		
		List<Personnel> list = personnelService.getAllByParametersForManage(map);	
		List<Department> departmentList = departmentService.getAll();
		
		ModelMap mode = new ModelMap();
		mode.put("personnellist", list);
		mode.put("departmentlist", departmentList);
		return new ModelAndView("management/personnel",mode);
	}
}
