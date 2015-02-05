package com.yc.controller.proscenium;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Brand;
import com.yc.entity.Possession;
import com.yc.entity.Shop;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommImage;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.ShopType;
import com.yc.entity.Specifications;
import com.yc.entity.user.User;
import com.yc.service.IBrandService;
import com.yc.service.ICargoGroupService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommImageService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.IShopService;
import com.yc.service.ISpecificationsService;

//前台
@Controller
@RequestMapping("/proscenium")
public class ShopController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(ShopController.class);
	
	@Autowired
	IShopService shopService;
	
	@Autowired
	IShopCommoidtyService shopCommService;
	
	@Autowired
	IShopCategoryService shopCategService;
	
	@Autowired
	ISpecificationsService specificationService;
	
	@Autowired
	IBrandService brandService;
	@Autowired
	IShopCommImageService shopCommImageService;
	
	@RequestMapping(value = "setUpShop", method = RequestMethod.GET)
    public ModelAndView setUpShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("loginUser");
		String shopName  = request.getParameter("shopName");
		System.out.println("shopName=============="+shopName);
		if (user == null) {
			return new ModelAndView("user/login",null);
		}else{
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop != null) {
				if (shopName != null && !shopName.equals("")) {
					shop.setShopName(shopName);
					shopService.update(shop);
				}
				if (shop.getIsPermit()) {
					return new ModelAndView("reception/myShop",null);
				}
				return new ModelAndView("reception/setUpShop",null);
			}else{
				if (null != shopName && !shopName.equals("")) {
					shop = new Shop();
					shop.setShopName(shopName);
					shopService.save(shop);
				}
				return new ModelAndView("reception/setUpShop",null);
			}
		}
	}
	
	@RequestMapping(value = "authentication", method = RequestMethod.GET)
    public ModelAndView authentication(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("reception/authentication",null);
	}
	
	@RequestMapping(value = "authentication", method = RequestMethod.POST)
    public ModelAndView authentications(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		String password = request.getParameter("password");
		Shop shop = null;
		if (user != null) {
			if (password.trim().equals(user.getPassword())) {
				String payPwd = request.getParameter("payPwd");
				String juridicalPerson = request.getParameter("juridicalPerson");
				String idCard = request.getParameter("idCard");
				if (!payPwd.trim().equals("")&&!juridicalPerson.trim().equals("")&&!idCard.trim().equals("")) {
					shop = shopService.getShopByUser(user.getId());
					if (shop != null ) {
						shop.setPayPwd(payPwd);
						shop.setJuridicalPerson(juridicalPerson);
						shop.setIdCard(idCard);
						shopService.update(shop);
					}else{
						shop = new Shop();
						shop.setPayPwd(payPwd);
						shop.setJuridicalPerson(juridicalPerson);
						shop.setIdCard(idCard);
						shop.setUser(user);
						shopService.save(shop);
					}
					return new ModelAndView("reception/setUpShop",null);
				}else{
					session.setAttribute("msg", "必填字段输入不正确");
					return new ModelAndView("reception/authentication",null);
				}
			}else{
				session.setAttribute("msg", "密码输入错误");
				return new ModelAndView("reception/authentication",null);
			}
		}else{
			return new ModelAndView("user/login",null);
		}
	}
	//开店
	@RequestMapping(value = "openShop", method = RequestMethod.GET)
    public String openShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String possessions = request.getParameter("possessions");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		Shop shop = null;
		if (user != null) {
			shop = shopService.getShopByUser(user.getId());
			if (shop != null && shop.getIsPermit()) {
				shop.setShopType(ShopType.valueOf(type));
				shop.setPossession(Possession.valueOf(possessions));
				shopService.update(shop);
			}else{
				shop = new Shop();
				shop.setShopType(ShopType.valueOf(type));
				shop.setPossession(Possession.valueOf(possessions));
				shop.setUser(user);
				shopService.save(shop);
			}
			return "redirect:/";
		}else{
			return "redirect:/user/login";
		}
	}
	//发布商品list
	@RequestMapping(value = "release", method = RequestMethod.GET)
    public ModelAndView release(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("loginUser");
		if (user != null ) {
			 Shop shop = user.getShop();
			 if (shop != null && shop.getIsPermit()) {
				 List<ShopCommoidty> list = shopCommService.getAllByShop(shop.getId());
				 ModelMap mode = new ModelMap();
				 mode.put("shopComms", list);
				return new ModelAndView("reception/releaseList",mode);
			}else{
				return setUpShop(request, response);
			}
		}else{
			return new ModelAndView("user/login",null);
		}
	}
	//发布商品list添加
	@RequestMapping(value = "releaseCommoidty", method = RequestMethod.GET)
    public ModelAndView releaseCommoidty(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("loginUser");
		if (user == null) {
			return new ModelAndView("user/login",null);
		}else{
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop !=null && shop.getIsPermit()) {
				List<ShopCategory> list = shopCategService.getAll();
				ModelMap mode = new ModelMap();
				mode.put("shopCategory", list);
				return new ModelAndView("reception/releaseCommoidty",mode);
			}else{
				return setUpShop(request, response);
			}
		}
		
	}
	
	@RequestMapping(value = "getSpecific", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getSpecific(@RequestParam(value = "ids", required = true) Integer ids ) throws ServletException, IOException {
		ShopCategory shopCate = shopCategService.findById(ids);
		List<Specifications> spec = specificationService.getAllByShopCateg(shopCate);
		ModelMap mode = new ModelMap(); 
		mode.put("spec", spec);
		mode.put("success", "true");
		return mode;
	}
	//新商品添加保存
	@RequestMapping(value = "saveCommoidty", method = RequestMethod.POST)
    public String saveCommoidty(ShopCommoidty shopCommoidty, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("loginUser");
		if (user != null) {
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop != null && shop.getIsPermit()) {
				String fenlei = request.getParameter("fenlei");
				if (fenlei != null && !fenlei.equals("")) {
					String guige = request.getParameter("guige");//规格
					shopCommoidty.setCommSpec(guige+",");
					shopCommoidty.setBelongTo(shop);
					ShopCategory category = shopCategService.findById(Integer.parseInt(fenlei));
					shopCommoidty.setShopCategory(category);
					String  brandid = request.getParameter("brandid");
					if (brandid !=null && !brandid.equals("")) {
						Brand brand = brandService.findById(Integer.parseInt(brandid));
						shopCommoidty.setBrand(brand);
					}
					ShopCommoidty shopcomm = shopCommService.save(shopCommoidty);
					CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext()); 
					if(multipartResolver.isMultipart(request)){
						String pathDir = "/content/static/img/"+shop.getId()+"/"; 
						 MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;  
				            //取得request中的所有文件名  
				            Iterator<String> iter = multiRequest.getFileNames();  
				            while(iter.hasNext()){   
				                //取得上传文件  
				                MultipartFile file = multiRequest.getFile(iter.next());  
				                if(file != null){  
				                    //取得当前上传文件的文件名称  
				                    String myFileName = file.getOriginalFilename();  
				                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
				                    if(myFileName.trim() !=""){  
				                        System.out.println(myFileName);  
				                        //重命名上传后的文件名  
				                        String fileName = file.getOriginalFilename();  
				                        //定义上传路径  
				                        String logoRealPathDir =request.getSession().getServletContext().getRealPath(pathDir);  
				                        File file1 = new File(logoRealPathDir);
					           			 if (!file1.exists()) file1.mkdirs();
					           			 File file2 = new File(logoRealPathDir,fileName);
					           			 if(file2.getParentFile()==null) file2.mkdirs();
					           			 file.transferTo(file2);
					           			 ShopCommImage image = new ShopCommImage();
					           			 image.setImagePath(pathDir+fileName);
					           			 image.setShopCommoidty(shopcomm);
					           			 image = shopCommImageService.save(image);
					           			 
				                    }  
				                }  
				            }  
						}
					return "redirect:/proscenium/release";
				}else{
					return "redirect:/proscenium/releaseCommoidty";
				}
			}else{
				return "redirect:/proscenium/setUpShop";
			}
		}else{
			return "redirect:/user/login";
		}
	}
}
