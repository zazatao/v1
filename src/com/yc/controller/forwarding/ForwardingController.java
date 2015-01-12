
package com.yc.controller.forwarding;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//中转中转
@Controller
@RequestMapping("/forwarding")
public class ForwardingController {
	
	private static final Logger LOG = Logger.getLogger(ForwardingController.class);
	
    @RequestMapping(value = "sendAndReceive", method = RequestMethod.GET)
    public ModelAndView sendAndReceive(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return new ModelAndView("forwarding/sendAndReceive", null);
    }
    
}
