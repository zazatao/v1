package com.yc.controller.forwarding;

import java.io.IOException;
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

import com.yc.controller.warehouse.WeighingController;
import com.yc.entity.OrderForm;
import com.yc.entity.ProblemPack;
import com.yc.entity.user.User;
import com.yc.service.IOrderFormService;
import com.yc.service.IProblemPackService;
import com.yc.service.IUserService;

//中转问题
@Controller
@RequestMapping("/forwarding")
public class QuestionController {

	private static final Logger LOG = Logger.getLogger(QuestionController.class);

	@Autowired
	IUserService personnelService;

	@Autowired
	IProblemPackService problemPackService;

	@RequestMapping(value = "question", method = RequestMethod.GET)
	public ModelAndView question(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> user = personnelService.getUserForProblemPack();
		ModelMap mode = new ModelMap();
		mode.put("users", user);
		return new ModelAndView("forwarding/question", mode);
	}

	@RequestMapping(value = "searchQuestion", method = RequestMethod.POST)
	public ModelAndView searchQuestion(String phone, String userName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("userName", userName);
		List<User> list = personnelService.getUsersByParameters(map);
		request.getSession().setAttribute("para", map);
		ModelMap mode = new ModelMap();
		mode.put("users", list);
		return new ModelAndView("forwarding/question", mode);
	}

	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "getProblemPackByUser", method = RequestMethod.GET)
	public ModelAndView getProblemPackByUser(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = (Map<String, Object>) request.getSession().getAttribute("para");
		List<User> list = null;
		if (map != null) {
			list = personnelService.getUsersByParameters(map);
		} else {
			list = personnelService.getUserForProblemPack();
		}
		List<ProblemPack> problemPacks = problemPackService.getProblemPackByUser(id);
		ModelMap mode = new ModelMap();
		mode.put("problemPacks", problemPacks);
		mode.put("users", list);
		return new ModelAndView("forwarding/question", mode);
	}

}
