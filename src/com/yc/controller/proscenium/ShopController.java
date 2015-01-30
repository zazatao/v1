package com.yc.controller.proscenium;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.controller.shop.ShopOrderController;

//前台
@Controller
@RequestMapping("/proscenium")
public class ShopController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(ShopController.class);
	
	@RequestMapping(value = "setUpShop", method = RequestMethod.GET)
    public ModelAndView setUpShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("reception/setUpShop",null);
	}
}
