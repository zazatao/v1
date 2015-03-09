
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

import com.yc.entity.user.Personnel;
import com.yc.service.IPersonnelService;

@Controller
@RequestMapping("/personnel")
public class PersonnelController {

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
}
