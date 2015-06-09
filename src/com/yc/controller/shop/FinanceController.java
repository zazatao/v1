package com.yc.controller.shop;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.yc.entity.Surcharges;
import com.yc.entity.user.Personnel;
import com.yc.model.PersonnelStatistics;
import com.yc.service.ICommodityService;
import com.yc.service.ICurrencyService;
import com.yc.service.IPackageGenreService;
import com.yc.service.IPackageSizeService;
import com.yc.service.IPersonnelService;
import com.yc.service.ISurchargesService;

//商店财务
@Controller
@RequestMapping("/shop")
public class FinanceController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(FinanceController.class);
	private static final int FIRST_DAY = Calendar.MONDAY;
	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IPackageGenreService packageGenreService;
	
	@Autowired
	IPackageSizeService packageSizeService;
	
	@Autowired
	ICurrencyService currencyService;
	
	@Autowired
	ISurchargesService surchargesService;
	
	@Autowired
	IPersonnelService personnelService;

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
	//材料类型
	@RequestMapping(value = "addGenre", method = RequestMethod.GET)
	public ModelAndView addGenre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<PackageSize> genrelist = packageSizeService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("genrelist", genrelist);
		return new ModelAndView("shop/addGenre", mode);
	}
	//材料类型的添加
	@RequestMapping(value = "saveGenre", method = RequestMethod.POST)
	public String saveGenre(PackageSize packagesize,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		packageSizeService.save(packagesize);
		return "redirect:/shop/addGenre";
	}
	@RequestMapping(value = "deleteGenreById", method = RequestMethod.GET)
	public String deleteGenreById(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		packageSizeService.delete(id);
		return "redirect:/shop/addGenre";
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
		List<Surcharges> list = surchargesService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("shop/surcharges", mode);
	}
	
	@RequestMapping(value = "addSurcharges", method = RequestMethod.GET)
	public ModelAndView addSurcharges(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("id======================"+id);
		if(id != null){
			Surcharges sur = surchargesService.findById(id);
			ModelMap mode = new ModelMap();
			mode.put("suercharges", sur);
			return new ModelAndView("shop/addSurcharges",mode);
		}else{
			return new ModelAndView("shop/addSurcharges");
		}
	}
	
	@RequestMapping(value = "addSuercharges", method = RequestMethod.POST)
	public String addSuerchargesP(Integer id,Double fare, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("id============="+id);
		if (id != null && !id.equals("")) {
			Surcharges sur = surchargesService.findById(id);
			sur.setFare(fare);
			surchargesService.update(sur);
		}else{
			Surcharges surs = new Surcharges();
			surs.setFare(fare);
			surchargesService.save(surs);
		}
		return "redirect:/shop/surcharges";
	}
	
	@RequestMapping(value = "deleteSurchargesById", method = RequestMethod.GET)
	public String deleteSurchargesById(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		surchargesService.delete(id);
		return "redirect:/shop/surcharges";
	}
	
	@RequestMapping(value = "accounting", method = RequestMethod.GET)
	public ModelAndView accounting(String startDate, String endDate,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		ModelMap mode = new ModelMap();
		String days = "";
		if (startDate!= null && !startDate.equals("") && endDate!= null && !endDate.equals("")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			days = printMonths(sdf.parse(startDate),sdf.parse(endDate));
		}else{
			days = printWeekdays("week",7);
		}
		List<PersonnelStatistics> arryList = personnelService.getAccounting(days);
		mode.put("statistics", arryList);
		return new ModelAndView("shop/finance/accounting",mode);
	}
	private static String printWeekdays(String week,Integer days) {
    	StringBuffer sb = new StringBuffer();
        Calendar calendar = Calendar.getInstance();
        setToFirstDay(calendar);
        for (int i = 0; i < days; i++) {
        	sb.append("'"+printDay(calendar)+"',");
            calendar.add(Calendar.DATE, 1);
        }
        return sb.substring(0, sb.length()-1);
    }
	private static void setToFirstDay(Calendar calendar) {
        while (calendar.get(Calendar.DAY_OF_WEEK) != FIRST_DAY) {
            calendar.add(Calendar.DATE, -1);
        }
    }
	 private static String printDay(Calendar calendar) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        return dateFormat.format(calendar.getTime());
	    }
	public static String printMonths(Date dBegin, Date dEnd) {  
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        StringBuffer sb = new StringBuffer("'"+dateFormat.format(dBegin)+"',");
        Calendar calBegin = Calendar.getInstance();  
        // 使用给定的 Date 设置此 Calendar 的时间    
        calBegin.setTime(dBegin);  
        Calendar calEnd = Calendar.getInstance();  
        // 使用给定的 Date 设置此 Calendar 的时间    
        calEnd.setTime(dEnd);  
        // 测试此日期是否在指定日期之后    
        while (dEnd.after(calBegin.getTime())) {  
            // 根据日历的规则，为给定的日历字段添加或减去指定的时间量    
            calBegin.add(Calendar.DAY_OF_MONTH, 1);  
            sb.append("'"+dateFormat.format(calBegin.getTime())+"',");  
        }  
        return  sb.substring(0, sb.length()-1);
    }
}
