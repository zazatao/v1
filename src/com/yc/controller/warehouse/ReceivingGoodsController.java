package com.yc.controller.warehouse;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.ImagePath;
import com.yc.entity.UnKnownCommodity;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.service.ICommodityService;
import com.yc.service.IOrderFormService;
import com.yc.service.IPersonnelService;
import com.yc.service.IStoreRoomService;
import com.yc.service.IUnKnownCommodityService;
import com.yc.service.impl.ImagePathService;

//仓库收货
@Controller
@RequestMapping("/warehouse")
public class ReceivingGoodsController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(ReceivingGoodsController.class);
	@Autowired
	IUnKnownCommodityService unKnownCommService;

	@Autowired
	ICommodityService commodityService;

	@Autowired
	IOrderFormService orderFormService;

	@Autowired
	IStoreRoomService storeRoomService;

	@Autowired
	ImagePathService imagePathService;
	
	@Autowired
	IPersonnelService personnelService;

	@RequestMapping(value = "receiving", method = RequestMethod.GET)
	public ModelAndView receiving(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("warehouse/beginwork", null);
	}

	@RequestMapping(value = "jobAction", method = RequestMethod.GET)
	public ModelAndView jobAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("isTrue") != null && request.getParameter("isTrue").equals("true")) {
			request.getSession().removeAttribute("code");
		}
		ModelMap map = new ModelMap();
		HttpSession session = request.getSession();
		if (session.getAttribute("code") != null) {
			List<ImagePath> images = imagePathService.getImageByUnkownComm(Integer.parseInt(session.getAttribute("code").toString()));
			UnKnownCommodity unKnownComm = unKnownCommService.findById(Integer.parseInt(session.getAttribute("code").toString()));
			map.put("unKnownComm", unKnownComm);
			map.put("images", images);
		}
		return new ModelAndView("warehouse/jobAction", map);
	}

	@RequestMapping(value = "saveUnKnownCommodity", method = RequestMethod.POST)
	public ModelAndView saveUnKnownCommodity(UnKnownCommodity unknownComm, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("code") != null) {
			UnKnownCommodity unKnown = unKnownCommService.findById(Integer.parseInt(session.getAttribute("code").toString()));
			if (unKnown !=null) {
				unknownComm.setOperator((User) session.getAttribute("loginUser"));
				BeanUtils.copyProperties(unknownComm, unKnown);
				unKnownCommService.update(unKnown);
				session.removeAttribute("code");
			}
			return new ModelAndView("warehouse/jobAction", null);
		} else {
			if (unknownComm.getAmountNum() !=null && !unknownComm.getCategory().equals("") && !unknownComm.getComment().equals("")) {
				unknownComm.setOperator((User) session.getAttribute("loginUser"));
				unKnownCommService.save(unknownComm);
			}
			return new ModelAndView("warehouse/jobAction", null);
		}
	}

	@RequestMapping(value = "imageUplode", method = RequestMethod.GET)
	public ModelAndView imageUplode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("warehouse/imageUplode", null);
	}

	@RequestMapping(value = "saveImage", method = RequestMethod.POST)
	public String saveImage(@RequestParam("imageFile") MultipartFile imageFile, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if (imageFile.getSize() > 0) {
			Integer code = null;
			UnKnownCommodity unKnowComm = null;
			if (session.getAttribute("code") == null) {
				UnKnownCommodity unKnownCommodity = new UnKnownCommodity();
				unKnowComm = unKnownCommService.save(unKnownCommodity);
				code = unKnowComm.getCode();
				session.setAttribute("code", code);
			} else {
				code = Integer.parseInt(session.getAttribute("code").toString());
				unKnowComm = unKnownCommService.findById(code);
			}
			if (code != null) {
				String fileName = imageFile.getOriginalFilename();
				String pathDir = "/content/static/img/" + code + "/";
				String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String suffix = fileName.substring(fileName.lastIndexOf("."));
				String name = sdf.format(new Date()) + suffix;
				File file1 = new File(logoRealPathDir);
				if (!file1.exists())
					file1.mkdirs();
				File file = new File(logoRealPathDir, name);
				if (file.getParentFile() == null)
					file.mkdirs();
				imageFile.transferTo(file);
				ImagePath imagePath = new ImagePath();
				imagePath.setPath(pathDir + name);
				imagePath.setUnKnownComm(unKnowComm);
				imagePathService.save(imagePath);
			}
		}
		return "redirect:/warehouse/jobAction";
	}

	@RequestMapping(value = "enterStoreRoom", method = RequestMethod.POST)
	public ModelAndView enterStoreRoom( HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (request.getParameter("orderNum").trim().equals("")) {
			map.put("orderNum", null);
		}else{
			map.put("orderNum", Integer.parseInt(request.getParameter("orderNum")));
		}
		if (request.getParameter("tpek").trim().equals("")) {
			map.put("tpek", null);
		}else{
			map.put("tpek", request.getParameter("tpek").trim());
		}
		if (request.getParameter("transNumForTaobao").trim().equals("")) {
			map.put("transNumForTaobao", null);
		}else{
			map.put("transNumForTaobao", Integer.parseInt(request.getParameter("transNumForTaobao").trim()));
		}
		if (request.getParameter("commItem").trim().equals("")) {
			map.put("commItem", null);
		}else{
			map.put("commItem", request.getParameter("commItem").trim());
		}
		map.put("formStatus", CommoidityStatus.valueOf("paid"));
		List<Commodity> commods = commodityService.getAllByParameters(map);
		Personnel personnel = (Personnel)request.getSession().getAttribute("loginUser");
		Integer num = personnel.getAccomplishNum();
		String msg ="";
		ModelMap mode = new ModelMap();
		if (commods.size()>0) {
			if (commods.size() == 1) {
				for (Commodity commod : commods) {
					commod.setStatus(CommoidityStatus.senToWarehouse);
					commod.getOrderNumber().setStoreOperator(personnel);
					commod.setInStoreRoomDate((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date()));
					commodityService.update(commod);
					msg = "已经查找到货号："+commod.getCommItem()+"，请将它入库！";
				}
				if (num ==null) {
					personnel.setAccomplishNum(1);
				}else{
					personnel.setAccomplishNum(num + 1);
				}
				personnelService.update(personnel);
				mode.put("msg", msg);
				return new ModelAndView("warehouse/jobAction",mode);
			}else{
				mode.put("list", commods);
				request.getSession().setAttribute("map", map);
				return new ModelAndView("warehouse/receivingList",mode);
			}
		}else{
			return new ModelAndView("warehouse/jobAction",null);
		}
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "working", method = RequestMethod.GET)
	public ModelAndView working(Integer commodityID , HttpServletRequest request, HttpServletResponse response) throws Exception {
		Commodity commod = commodityService.findById(commodityID);
		String msg ="";
		Personnel personnel = null;
		ModelMap mode = null;
		if (commod != null) {
			commod.setStatus(CommoidityStatus.senToWarehouse);
			personnel = (Personnel)request.getSession().getAttribute("loginUser");
			commod.getOrderNumber().setStoreOperator(personnel);
			commod.setInStoreRoomDate((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date()));
			commodityService.update(commod);
			msg = "已经查找到货号："+commod.getCommItem()+"，请将它入库！";
			mode =  new ModelMap();
			Integer num = personnel.getAccomplishNum();
			if (num ==null) {
				personnel.setAccomplishNum(1);
			}else{
				personnel.setAccomplishNum(num + 1);
			}
			personnelService.update(personnel);
			mode.put("msg", msg);
		}
		Map<String, Object> map = (Map<String, Object>)request.getSession().getAttribute("map");
		List<Commodity> commods = commodityService.getAllByParameters(map);
		mode.put("list", commods);
		return new ModelAndView("warehouse/receivingList",mode);
	}
	
}
