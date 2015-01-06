
package com.yc.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yc.entity.user.User;
import com.yc.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService userService;
    
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String pwd = request.getParameter("password");
        HttpSession session = request.getSession();
        User user = userService.getUser(name);
        if (user == null) {
            request.getSession().setAttribute("message", "nouser");
            return "redirect:/";
        } else {
        	 if(user.getPassword().equals(pwd.trim())){
        		 session.setAttribute("loginUser", user);
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
    	return new ModelAndView("user/register", null);
    }

    @RequestMapping(value = "regist", method = RequestMethod.POST)
    public String registing(User user,HttpServletRequest request, HttpServletResponse response) throws Exception {
        userService.save(user);
        return "redirect:/";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("loginUser");
        return "redirect:/index";
    }
}
