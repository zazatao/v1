
package com.yc.controller.forwarding;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
//转发
@Controller
@RequestMapping("/forwarding")
public class ForwardingIndexController {

    @RequestMapping(value = "sendAndReceive", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return new ModelAndView("forwarding/sendAndReceive", null);
    }
    
    @RequestMapping(value = "transit", method = RequestMethod.GET)
    public ModelAndView transit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return new ModelAndView("forwarding/transit", null);
    }

    @RequestMapping(value = "question", method = RequestMethod.GET)
    public ModelAndView question(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return new ModelAndView("forwarding/question", null);
    }
}
