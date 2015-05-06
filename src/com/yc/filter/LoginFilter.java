
package com.yc.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

public class LoginFilter implements Filter {

    @Override
    public void destroy() {}

    private boolean needLogin(HttpServletRequest request) {
        String uri = request.getRequestURI();
        if (uri.endsWith("homePage")) {
            return false;
        }
        if (uri.contains("static")) {
            return false;
        }
        return true;
    }

    private boolean needLoginUser(HttpServletRequest request){
    	String uri = request.getRequestURI();
    	if (uri.contains("/setUpShop/")||uri.contains("/setUpShop/")||uri.contains("/releaseCommoidty/")||uri.contains("/storehouseShopComm/")||uri.contains("/soldShopComm/")||uri.contains("/auctionShopComm/")) {
            return true;
        }
    	if (uri.contains("/specialShopComm/")||uri.contains("/shopTransaction/")||uri.contains("/payMent/")||uri.contains("/orderDelivery/")||uri.contains("/shopOrderSearch/")||uri.contains("/returnGoods/")) {
    		return true;
    	}
    	if (uri.contains("/shopEvaluation/")||uri.contains("/deleteComm/")||uri.contains("/updateState/")||uri.contains("/myoffice/")||uri.contains("/perscentBonuses/")||uri.contains("/introduction/")) {
    		return true;
    	}
    	if (uri.contains("/authentication/")||uri.contains("/shopcar/")||uri.contains("/shopcardelv/")||uri.contains("/shopcarpro/")||uri.contains("/perscentBonuses/")||uri.contains("/introduction/")) {
    		return true;
    	}
    	return false;
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse rsp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        String url = request.getRequestURI();
        HttpSession session = request.getSession();
        if (url.contains("/warehouse/") || url.contains("/forwarding/") || url.contains("/management/") 
        		|| url.contains("/orderprocessing/") || url.contains("/overall/") || url.contains("/shop/") || url.contains("/statistics/")) {
        	if (session.getAttribute("loginPersonnle") == null && needLogin(request)) {
        		HttpServletResponse response = (HttpServletResponse) rsp;
        		response.sendRedirect(request.getContextPath()+"/homePage");
        		return;
        	}
		}
        if (url.contains("/proscenium/")) {
        	if (session.getAttribute("loginUser") == null && needLoginUser(request)) {
        		HttpServletResponse response = (HttpServletResponse) rsp;
        		response.sendRedirect(request.getContextPath()+"/user/login");
        		return;
        	}
        }
        if (url.contains("/user/")) {
        	if (session.getAttribute("loginUser") == null && needLoginUser(request)) {
        		HttpServletResponse response = (HttpServletResponse) rsp;
        		response.sendRedirect(request.getContextPath()+"/user/login");
        		return;
        	}
        }
        chain.doFilter(req, rsp);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

}