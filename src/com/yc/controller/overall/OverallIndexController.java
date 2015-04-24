
package com.yc.controller.overall;

import java.io.IOException;
import java.util.List;

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

import com.yc.entity.OrderForm;
import com.yc.service.IOrderFormService;

//总览
@Controller
@RequestMapping("/overall")
public class OverallIndexController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(OverallIndexController.class);
	
	@Autowired
	IOrderFormService orderFormService;
	
    @RequestMapping(value = "unfinishedOrder", method = RequestMethod.GET)
    public ModelAndView unfinishedOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<OrderForm> list = orderFormService.getAllByStatus();
    	ModelMap mode = new ModelMap();
    	mode.put("list", list);
    	return new ModelAndView("overall/unfinishedOrder", mode);
    }

}
