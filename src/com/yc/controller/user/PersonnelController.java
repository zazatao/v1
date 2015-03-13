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
        Personnel personnel = personnelService.getPersonnle(name);
        if (personnel == null) {
            request.getSession().setAttribute("message", "noPersonnle");
            return "redirect:/personnel";
        } else {
        	 if(personnel.getPassword().equals(pwd.trim())){
        		 session.setAttribute("loginPersonnle", personnel);
        		  return "redirect:/homePage";
            } else {
                System.out.println("密码错误！！");
                request.getSession().setAttribute("message", "noPersonnle");
                return "redirect:/personnel";
            }
        }
    }
    @RequestMapping(value = "regist", method = RequestMethod.GET)
    public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	return new ModelAndView("personnel/register", null);
    }

    @RequestMapping(value = "regist", method = RequestMethod.POST)
    public String registing(Personnel personnel,HttpServletRequest request, HttpServletResponse response) throws Exception {
    	if (!personnel.getLoginName().equals("") && !personnel.getPassword().equals("")) {
    		personnelService.save(personnel);
		}
        return "redirect:/homePage";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("loginPersonnle");
        return "redirect:/homePage";
    }
  
    @RequestMapping(value = "toAddPersonnle", method = RequestMethod.GET)
    public ModelAndView toAddPersonnle(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getSession().getAttribute("loginPersonnle");
    	ModelMap mode = new ModelMap();
    	mode.put("personel", request.getSession().getAttribute("loginPersonnle"));
    	return new ModelAndView("Personnle/addPersonnle",mode);
    }
    
	@RequestMapping(value = "addPersonnle", method = RequestMethod.POST)
    public String addPersonnle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Commodity c = new Commodity();
		OrderForm of = new OrderForm();
		Personnel person = new Personnel();
		String name =request.getParameter("name");
		person.setUserName(name);
		String password = request.getParameter("password");
		person.setPassword(password);
		String phone = request.getParameter("phone");
		person.setPhone(phone);
		String email = request.getParameter("email");
		person.setEmail(email);
		String sex = request.getParameter("sex");
		person.setSex(sex);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		of.setOrderDate(sdf.format(new Date()));
		of.setStoreOperator(person);
		Personnel p = personnelService.save(person);
		of.setPurchase(p);
		c.setOrderNumber(of);
		return "redirect:/index";
    }
}
