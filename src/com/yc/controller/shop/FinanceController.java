package com.yc.controller.shop;

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

import com.yc.entity.Commodity;
import com.yc.entity.CommoidityStatus;
import com.yc.entity.Currency;
import com.yc.entity.PackageGenre;
import com.yc.entity.PackageSize;
import com.yc.service.ICommodityService;
import com.yc.service.ICurrencyService;
import com.yc.service.IPackageGenreService;
import com.yc.service.IPackageSizeService;

//商店财务
@Controller
@RequestMapping("/shop")
public class FinanceController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(FinanceController.class);

	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IPackageGenreService packageGenreService;
	
	@Autowired
	IPackageSizeService packageSizeService;
	
	@Autowired
	ICurrencyService currencyService;

	// 付账
	@RequestMapping(value = "billPay", method = RequestMethod.GET)
	public ModelAndView billPay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Commodity> list = commodityService.getCommodityByBillPay();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("shop/finance/billPay", mode);
	}

	// 付账搜索
	@RequestMapping(value = "searchBillPay", method = RequestMethod.POST)
	public ModelAndView searchBillPay(Integer orderID, String orderUser, String purchase, String paymentDate, String zazataoPayDate, String currency, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (orderID == null || orderID.equals("")) {
			map.put("orderID", null);
		} else {
			map.put("orderID", orderID);
		}
		if (orderUser == null || orderUser.equals("")) {
			map.put("orderUser", null);
		} else {
			map.put("orderUser", orderUser);
		}
		if (purchase == null || purchase.equals("")) {
			map.put("purchase", null);
		} else {
			map.put("purchase", purchase);
		}
		if (paymentDate == null || paymentDate.equals("")) {
			map.put("paymentDate", null);
		} else {
			map.put("paymentDate", paymentDate);
		}
		if (zazataoPayDate == null || zazataoPayDate.equals("")) {
			map.put("zazataoPayDate", null);
		} else {
			map.put("zazataoPayDate", zazataoPayDate);
		}
		if (currency == null || currency.equals("")) {
			map.put("currency", null);
		} else {
			map.put("currency", currency);
		}
		if (request.getParameter("status") == null || request.getParameter("status").equals("")) {
			map.put("status", null);
		} else {
			map.put("status", request.getParameter("status"));
		}
		List<Commodity> list = commodityService.getCommodityByParam(map);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("shop/finance/billPay", mode);
	}

	// 已经付账
	@RequestMapping(value = "updateCommStatus", method = RequestMethod.GET)
	public ModelAndView updateCommStatus(Integer commID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Commodity comm = commodityService.findById(commID);
		comm.setZazataoPayDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		comm.setZazataoPayTime(new SimpleDateFormat("HH:mm:ss").format(new Date()));
		comm.setStatus(CommoidityStatus.paid);
		commodityService.update(comm);
		List<Commodity> list = commodityService.getCommodityByBillPay();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("shop/finance/billPay", mode);
	}

	// 账簿
	@RequestMapping(value = "accountBook", method = RequestMethod.GET)
	public ModelAndView accountBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Commodity> list = commodityService.getAccountBook();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("shop/finance/accountBook", mode);
	}

	// 账簿搜索
	@RequestMapping(value = "searchAccountBook", method = RequestMethod.POST)
	public ModelAndView searchAccountBook(Integer orderID, String orderUser, String purchase, String paymentDate, String zazataoPayDate, String currency, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (orderID == null || orderID.equals("")) {
			map.put("orderID", null);
		} else {
			map.put("orderID", orderID);
		}
		if (orderUser == null || orderUser.equals("")) {
			map.put("orderUser", null);
		} else {
			map.put("orderUser", orderUser);
		}
		if (purchase == null || purchase.equals("")) {
			map.put("purchase", null);
		} else {
			map.put("purchase", purchase);
		}
		if (paymentDate == null || paymentDate.equals("")) {
			map.put("paymentDate", null);
		} else {
			map.put("paymentDate", paymentDate);
		}
		if (zazataoPayDate == null || zazataoPayDate.equals("")) {
			map.put("zazataoPayDate", null);
		} else {
			map.put("zazataoPayDate", zazataoPayDate);
		}
		if (currency == null || currency.equals("")) {
			map.put("currency", null);
		} else {
			map.put("currency", currency);
		}
		System.out.println("request.getParameter()===="+request.getParameter("status"));
		if (request.getParameter("status") == null ) {
			map.put("status", null);
		} else {
			map.put("status", request.getParameter("status"));
		}
		ModelMap mode = new ModelMap();
		List<Commodity> list = commodityService.getCommodityByParam(map);
		mode.put("list", list);
		return new ModelAndView("shop/finance/accountBook", mode);
	}
	
	// 账簿备注更改
	@RequestMapping(value = "updateNotes", method = RequestMethod.POST)
	public ModelAndView updateNotes(Integer commID, String notes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Commodity commodity = commodityService.findById(commID);
		if (commodity != null) {
			if (notes != null) {
				commodity.setNotes(notes);
				commodityService.update(commodity);
			}
		}
		List<Commodity> list = commodityService.getAccountBook();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return  new ModelAndView("shop/finance/accountBook", mode);
	}
	
	//获得所有材料
	@RequestMapping(value = "material", method = RequestMethod.GET)
	public ModelAndView getAllMaterial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<PackageGenre> materialList = packageGenreService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("materiallist", materialList);
		return new ModelAndView("shop/packageGenre", mode);
	}
		
	//删除材料
	@RequestMapping(value = "deleteMaterial", method = RequestMethod.GET)
	public String deleteMaterial(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		packageGenreService.delete(id);
		return "redirect:/shop/material";
	}
		
	//添加或更新材料
	@RequestMapping(value = "addMaterial", method = RequestMethod.GET)
	public ModelAndView addMaterial(Integer id, String mathed, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<PackageSize> sizes = packageSizeService.getAll();
		if (mathed.equals("add")) {
			if (id != null) {
				mode.put("id", id);
				mode.put("mathed", "add");
				mode.put("page", "material");
				mode.put("sizes", sizes);
				return new ModelAndView("shop/addPackageGenre", mode);
			} else {
				mode.put("mathed", "add");
				mode.put("page", "material");
				mode.put("sizes", sizes);
				return new ModelAndView("shop/addPackageGenre", mode);
			}
		} else {
			PackageGenre material = packageGenreService.findById(id);
			mode.put("material", material);
			mode.put("mathed", "update");
			mode.put("page", "material");
			mode.put("sizes", sizes);
			return new ModelAndView("shop/addPackageGenre", mode);
		}
	}

	//添加或更新材料
	@RequestMapping(value = "addMaterialList", method = RequestMethod.POST)
	public String addMaterialList(Integer id, String attribute, Integer num, Integer price, Integer packageSize_id,
			String mathed, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (mathed.equals("add")) {
			if (page.equals("material")) {
				PackageSize size = packageSizeService.findById(packageSize_id);
				PackageGenre material = new PackageGenre();
				material.setNum(num);
				material.setPrice(price);
				material.setAttribute(attribute);
				material.setPackageSize(size);
				material = packageGenreService.save(material);
			}
		} 
			
		else {
			PackageGenre material = packageGenreService.findById(id);
			material.setNum(num);
			material.setPrice(price);
			material.setAttribute(attribute);
			packageGenreService.update(material);
		}
		return "redirect:/shop/material";
	}
	
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
		return "redirect:/shop/currency";
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
	/*@RequestMapping(value = "addCurrencyList", method = RequestMethod.POST)
	public String addCurrencyList(Currency postCurrency,String mathed, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (mathed.equals("add")) {
			if (page.equals("currency")) {
				System.out.println("enter add____________________________");
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
	}*/
	@RequestMapping(value = "addCurrencyList", method = RequestMethod.POST)
	public String addCurrencyList(Integer id, String type, String abbreviation, String symbol, String mathed, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (mathed.equals("add")) {
			if (page.equals("currency")) {
				Currency currency = new Currency();
				currency.setType(type);
				currency.setAbbreviation(abbreviation);
				currency.setSymbol(symbol);
				currency = currencyService.save(currency);
			}
		} 
					
		else {
			Currency currency = currencyService.findById(id);
			currency.setAbbreviation(abbreviation);
			currency.setSymbol(symbol);
			currencyService.update(currency);
		}
		return "redirect:/shop/currency";
	}
	
	@RequestMapping(value = "surcharges", method = RequestMethod.GET)
	public ModelAndView surcharges(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return null;
	}
}
