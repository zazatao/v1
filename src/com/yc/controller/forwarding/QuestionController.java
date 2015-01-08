package com.yc.controller.forwarding;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//中转问题
@Controller
@RequestMapping("/forwarding")
public class QuestionController {

	@RequestMapping(value = "question", method = RequestMethod.GET)
	public ModelAndView question(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("forwarding/question", null);
	}
}
