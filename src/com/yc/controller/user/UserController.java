
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

import com.yc.entity.Address;
import com.yc.entity.Commodity;
import com.yc.entity.OrderForm;
import com.yc.entity.Package;
import com.yc.entity.user.User;
import com.yc.service.IAddressService;
import com.yc.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(UserController.class);

    @Autowired
    IUserService userService;
    
    @Autowired
    IAddressService addressService;
   
    
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String pwd = request.getParameter("password");
        HttpSession session = request.getSession();
        User personnel = userService.getUser(name);
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
    	return new ModelAndView("reception/register", null);
    }
    
    @RequestMapping(value = "myoffice", method = RequestMethod.GET)
    public ModelAndView myoffice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	return new ModelAndView("reception/myoffice", null);
    }
    
    @RequestMapping(value = "introduction", method = RequestMethod.GET)
    public ModelAndView introduction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	return new ModelAndView("reception/introduction", null);
    }
    
    @RequestMapping(value="updateUser",method = RequestMethod.POST)
    public String updateUser(Integer id, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
    	User u = userService.findById(id);
    	String password = request.getParameter("password");
    	System.out.println("======="+password);
    	u.setPassword(password);
    	return "redirect:/introduction";
    }
    
    @RequestMapping(value="editUser",method = RequestMethod.POST)
    public String user(Integer id,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
    	User u = userService.findById(id);
    	String name = request.getParameter("name");
    	u.setUserName(name);
    	String password = request.getParameter("password");
    	u.setPassword(password);
    	String email = request.getParameter("email");
    	u.setEmail(email);
    	String phone = request.getParameter("phone");
    	u.setPhone(phone);
    	String sex = request.getParameter("sex");
    	u.setSex(sex);
    	return "redirect:/introduction";
    }

    @RequestMapping(value = "regist", method = RequestMethod.POST)
    public String registing(User personnel,HttpServletRequest request, HttpServletResponse response) throws Exception {
    	userService.save(personnel);
        return "redirect:/index";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("loginUser");
        return "redirect:/index";
    }
    
    @RequestMapping(value = "personnel", method = RequestMethod.GET)
    public ModelAndView packages(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> list = userService.getAll();
    	ModelMap mode = new ModelMap();
    	mode.put("list", list);
		return new ModelAndView("index", mode);
	}
    @RequestMapping(value = "toAddUser", method = RequestMethod.GET)
    public ModelAndView toAddUser(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getSession().getAttribute("loginUser");
    	ModelMap mode = new ModelMap();
    	mode.put("personel", request.getSession().getAttribute("loginUser"));
    	return new ModelAndView("user/adduser",mode);
    }
    
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
    public String addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {;
		User person = new User();
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
		return "redirect:/index";
    }
}
