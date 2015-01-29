
package com.yc.controller.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yc.entity.Commodity;
import com.yc.entity.OrderForm;
import com.yc.entity.Package;
import com.yc.entity.user.Personnel;
import com.yc.service.IPersonnelService;

@Controller
@RequestMapping("/personnel")
public class PersonnelController {
	
	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(PersonnelController.class);

    @Autowired
    IPersonnelService personnelService;
   
    
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String pwd = request.getParameter("password");
        HttpSession session = request.getSession();
        Personnel personnel = personnelService.getUser(name);
        if (personnel == null) {
            request.getSession().setAttribute("message", "nouser");
            return "redirect:/";
        } else {
        	 if(personnel.getPassword().equals(pwd.trim())){
        		 session.setAttribute("loginUser", personnel);
        		  return "redirect:/homePage";
            } else {
                System.out.println("密码错误！！");
                request.getSession().setAttribute("message", "nouser");
                return "redirect:/";
            }
        }
    }
    @RequestMapping(value = "regist", method = RequestMethod.GET)
    public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	return new ModelAndView("personnel/register", null);
    }

    @RequestMapping(value = "regist", method = RequestMethod.POST)
    public String registing(Personnel personnel,HttpServletRequest request, HttpServletResponse response) throws Exception {
    	personnelService.save(personnel);
        return "redirect:/";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("loginUser");
        return "redirect:/index";
    }
    
    @RequestMapping(value = "personnel", method = RequestMethod.GET)
    public ModelAndView packages(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Personnel> list = personnelService.getAll();
    	ModelMap mode = new ModelMap();
    	mode.put("list", list);
		return new ModelAndView("personnel/personnel", mode);
	}
    @RequestMapping(value = "toAddPersonnel", method = RequestMethod.GET)
    public ModelAndView toAddShopOrder(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getSession().getAttribute("loginUser");
    	ModelMap mode = new ModelMap();
    	mode.put("personel", request.getSession().getAttribute("loginUser"));
    	return new ModelAndView("personnel/addpersonnel",mode);
    }
    
	@RequestMapping(value = "addPersonnel", method = RequestMethod.POST)
    public ModelAndView addPackage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Commodity c = new Commodity();
		OrderForm of = new OrderForm();
		Personnel person = new Personnel();
		Package pk= new Package();
		String transport =request.getParameter("transport");
		pk.setTransport(transport);
		String personnel = request.getParameter("personnel");
		person.setUserName(personnel);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		of.setOrderDate(sdf.format(new Date()));
		String traffic = request.getParameter("traffic");
		pk.setTraffic(traffic);
		Integer orderformid = Integer.parseInt(request.getParameter("orderFormID"));
		of.setOrderFormID(orderformid);
		of.setStoreOperator(person);
		Personnel p = personnelService.save(person);
		of.setOrderUser(p);
		c.setOrderNumber(of);
    	return packages(request, response);
    }
}
