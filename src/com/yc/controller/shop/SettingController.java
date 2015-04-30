package com.yc.controller.shop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Currency;
import com.yc.service.ICurrencyService;

public class SettingController {
	
	@Autowired
	ICurrencyService currencyService;
	
	//获得所有币种
	@RequestMapping(value = "currency", method = RequestMethod.GET)
	public ModelAndView getAllCurrency(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Currency> currencyList = currencyService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("currencylist", currencyList);
		return new ModelAndView("shop/currency", mode);
	}
			
	//删除币种
	@RequestMapping(value = "deleteCurrency", method = RequestMethod.GET)
	public String deleteCurrency(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		currencyService.delete(id);
		return "redirect:/shop/Currency";
	}
			
	//添加或更新币种
	@RequestMapping(value = "addCurrency", method = RequestMethod.GET)
	public ModelAndView addCurrency(Integer id, String mathed, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
			if (mathed.equals("add")) {
				if (id != null) {
					mode.put("id", id);
					mode.put("mathed", "add");
					mode.put("page", "currency");
					return new ModelAndView("shop/addCurrency", mode);
				} else {
					mode.put("mathed", "add");
					mode.put("page", "currency");
					return new ModelAndView("shop/addCurrency", mode);
				}
			} else {
				Currency currency = currencyService.findById(id);
				mode.put("currency", currency);
				mode.put("mathed", "update");
				mode.put("page", "currency");
				return new ModelAndView("shop/addCurrency", mode);
			}
		}

		//添加或更新币种
		@RequestMapping(value = "addCurrencyList", method = RequestMethod.POST)
		public String addCurrencyList(Currency postCurrency,String mathed, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			if (mathed.equals("add")) {
				if (page.equals("currency")) {
					Currency currency = new Currency();
					currency.setType(postCurrency.getType());
					currency.setAbbreviation(postCurrency.getAbbreviation());
					currency.setSymbol(postCurrency.getSymbol());
					currency = currencyService.save(currency);
				}
			} 
				
			else {
				Currency currency = currencyService.findById(postCurrency.getId());
				currency.setAbbreviation(postCurrency.getAbbreviation());
				currency.setSymbol(postCurrency.getSymbol());
				currencyService.update(currency);
			}
			return "redirect:/shop/currency";
		}
}
