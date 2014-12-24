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

import com.yc.entity.ImagePath;
import com.yc.entity.UnKnownCommodity;
import com.yc.entity.user.User;
import com.yc.service.IUnKnownCommodityService;
import com.yc.service.impl.ImagePathService;

//仓库
@Controller
@RequestMapping("/warehouse")
public class WarehouseIndexController {

	private static final Logger LOG = Logger.getLogger(WarehouseIndexController.class);
	@Autowired
	IUnKnownCommodityService unKnownCommService;

	@Autowired
	ImagePathService imagePathService;

	@RequestMapping(value = "receiving", method = RequestMethod.GET)
	public ModelAndView receiving(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("warehouse/beginwork", null);
	}

	@RequestMapping(value = "jobAction", method = RequestMethod.GET)
	public ModelAndView jobAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("isTrue")!=null && request.getParameter("isTrue").equals("true")) {
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
	
	@RequestMapping(value = "warehousing", method = RequestMethod.POST)
	public String warehousing( HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
}
