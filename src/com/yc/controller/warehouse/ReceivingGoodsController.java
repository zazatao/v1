package com.yc.controller.warehouse;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import com.yc.entity.OrderStatus;
import com.yc.entity.ImagePath;
import com.yc.entity.OrderForm;
import com.yc.entity.StoreRoom;
import com.yc.entity.UnKnownCommodity;
import com.yc.entity.user.User;
import com.yc.service.ICommodityService;
import com.yc.service.IOrderFormService;
import com.yc.service.IStoreRoomService;
import com.yc.service.IUnKnownCommodityService;
import com.yc.service.impl.ImagePathService;

//仓库收货
@Controller
@RequestMapping("/warehouse")
public class ReceivingGoodsController {

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
			unknownComm.setOperator((User) session.getAttribute("loginUser"));
			BeanUtils.copyProperties(unknownComm, unKnown);
			unKnownCommService.update(unKnown);
			session.removeAttribute("code");
			return new ModelAndView("warehouse/receiving", null);
		} else {
			unknownComm.setOperator((User) session.getAttribute("loginUser"));
			unKnownCommService.save(unknownComm);
			return new ModelAndView("warehouse/receiving", null);
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
	public ModelAndView enterStoreRoom(Commodity commodity, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String orderNum = request.getParameter("orderNum");
		OrderForm orderForm = orderFormService.findById(Integer.parseInt(orderNum));
		String msg = "";
		ModelMap map = new ModelMap();
		if (orderForm != null) {
			for (Commodity commod : orderForm.getCommodities()) {
				if (commod.getTransNumForTaobao().equals(commodity.getTransNumForTaobao()) && commod.getTpek().equals(commodity.getTpek()) && commod.getCommItem().equals(commodity.getCommItem())) {
					commod.setStatus(OrderStatus.senToWarehouse);
					commod.setStoreOperator((User)request.getSession().getAttribute("loginUser"));
					Commodity comm = commodityService.update(commod);
					StoreRoom room = comm.getStoreRoom();
					room.setInStoreRoomDate((new SimpleDateFormat("yyyy-MM-dd")).format(new Date()));
					storeRoomService.update(room);
					msg = "找到货物，并已入库！！";
					break;
				}
			}
		}
		map.put("msg", msg);
		return new ModelAndView("warehouse/jobAction",map);
	}
}
