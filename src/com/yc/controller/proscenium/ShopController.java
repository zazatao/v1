package com.yc.controller.proscenium;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	IShopService shopService;//商店

	@Autowired
	IShopCommoidtyService shopCommService;//商品

	@Autowired
	IShopCategoryService shopCategService;//类别

	@Autowired
	ISpecificationsService specificationService;//货品规格

	@Autowired
	IBrandService brandService;//品牌
	@Autowired
	IShopCommImageService shopCommImageService;

	@RequestMapping(value = "setUpShop", method = RequestMethod.GET)
	public ModelAndView setUpShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		mode = getShopCategory(mode);
		String shopName = request.getParameter("shopName");
		if (user == null) {
			return new ModelAndView("user/login", mode);
		} else {
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop != null) {
				if (shopName != null && !shopName.equals("")) {
					shop.setShopName(shopName);
					shop.setCreateDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
					shopService.update(shop);
				}
				if (shop.getIsPermit()) {
					mode.put("shop", shop);
					return new ModelAndView("reception/myShop", mode);
				}
				return new ModelAndView("reception/setUpShop", mode);
			} else {
				if (null != shopName && !shopName.equals("")) {
					shop = new Shop();
					shop.setShopName(shopName);
					shop.setUser(user);
					shopService.save(shop);
				}else{
					shop = new Shop();
					shop.setUser(user);
					shopService.save(shop);
				}
				return new ModelAndView("reception/setUpShop", mode);
			}
		}
	}

	@RequestMapping(value = "authentication", method = RequestMethod.GET)
	public ModelAndView authentication(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		mode = getShopCategory(mode);
		return new ModelAndView("reception/authentication", mode);
	}

	@RequestMapping(value = "authentication", method = RequestMethod.POST)
	public ModelAndView authentications(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		String password = request.getParameter("password");
		ModelMap mode = new ModelMap();
		mode = getShopCategory(mode);
		Shop shop = null;
		if (user != null) {
			if (password.trim().equals(user.getPassword())) {
				String payPwd = request.getParameter("payPwd");
				String juridicalPerson = request.getParameter("juridicalPerson");
				String idCard = request.getParameter("idCard");
				if (!payPwd.trim().equals("") && !juridicalPerson.trim().equals("") && !idCard.trim().equals("")) {
					shop = shopService.getShopByUser(user.getId());
					if (shop != null) {
						shop.setPayPwd(payPwd);
						shop.setJuridicalPerson(juridicalPerson);
						shop.setIdCard(idCard);
						shop.setCreateDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
						shopService.update(shop);
					} else {
						shop = new Shop();
						shop.setPayPwd(payPwd);
						shop.setJuridicalPerson(juridicalPerson);
						shop.setIdCard(idCard);
						shop.setUser(user);
						shop.setCreateDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
						shopService.save(shop);
					}
					return new ModelAndView("reception/setUpShop", mode);
				} else {
					session.setAttribute("msg", "必填字段输入不正确");
					return new ModelAndView("reception/authentication", mode);
				}
			} else {
				session.setAttribute("msg", "密码输入错误");
				return new ModelAndView("reception/authentication", mode);
			}
		} else {
			return new ModelAndView("user/login", mode);
		}
	}

	// 开店
	@RequestMapping(value = "openShop", method = RequestMethod.GET)
	public String openShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String possessions = request.getParameter("possessions");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		Shop shop = null;
		if (user != null) {
			shop = shopService.getShopByUser(user.getId());
			if (shop != null && shop.getIsPermit()) {
				shop.setShopType(ShopType.valueOf(type));
				shop.setPossession(Possession.valueOf(possessions));
				shop.setCreateDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
				shopService.update(shop);
			} else {
				shop = new Shop();
				shop.setShopType(ShopType.valueOf(type));
				shop.setPossession(Possession.valueOf(possessions));
				shop.setCreateDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
				shop.setUser(user);
				shopService.save(shop);
			}
			return "redirect:/";
		} else {
			return "redirect:/user/login";
		}
	}

	// 发布商品list
	@RequestMapping(value = "release", method = RequestMethod.GET)
	public ModelAndView release(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		mode = getShopCategory(mode);
		if (user != null) {
			Shop shop = user.getShop();
			if (shop != null && shop.getIsPermit()) {
				List<ShopCommoidty> list = shopCommService.getAllByShop(shop.getId());
				mode.put("shopComms", list);
				mode.put("shop", shop);
				return new ModelAndView("reception/releaseList", mode);
			} else {
				return setUpShop(request, response);
			}
		} else {
			return new ModelAndView("user/login", mode);
		}
	}

	// 发布商品list添加
	@RequestMapping(value = "releaseCommoidty", method = RequestMethod.GET)
	public ModelAndView releaseCommoidty(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		mode = getShopCategory(mode);
		if (user == null) {
			return new ModelAndView("user/login", mode);
		} else {
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop != null && shop.getIsPermit()) {
				List<ShopCategory> list = shopCategService.getAll();
				mode.put("shopCategory", list);
				mode.put("shop", shop);
				return new ModelAndView("reception/releaseCommoidty", mode);
			} else {
				return setUpShop(request, response);
			}
		}

	}

	@RequestMapping(value = "getSpecific", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getSpecific(@RequestParam(value = "ids", required = true) Integer ids) throws ServletException, IOException {
		ShopCategory shopCate = shopCategService.findById(ids);
		List<Specifications> spec = specificationService.getAllByShopCateg(shopCate);
		ModelMap mode = new ModelMap();
		mode.put("spec", spec);
		mode.put("success", "true");
		return mode;
	}

	// 新商品添加保存
	@RequestMapping(value = "saveCommoidty", method = RequestMethod.POST)
	public String saveCommoidty(ShopCommoidty shopCommoidty, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		if (user != null) {
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop != null && shop.getIsPermit()) {
				String fenlei = request.getParameter("fenlei");
				if (fenlei != null && !fenlei.equals("-1")) {
					String guige = request.getParameter("guige");// 规格
					shopCommoidty.setCommSpec(guige + ",");
					shopCommoidty.setBelongTo(shop);
					if (shopCommoidty.getSpecial()!=null && shopCommoidty.getSpecial()>=0) {
						shopCommoidty.setSpecial(shopCommoidty.getSpecial()*0.1f);
					}
					ShopCategory category = shopCategService.findById(Integer.parseInt(fenlei));
					shopCommoidty.setShopCategory(category);
					String brandid = request.getParameter("brandid");
					if (brandid != null && !brandid.equals("")) {
						Brand brand = brandService.findById(Integer.parseInt(brandid));
						shopCommoidty.setBrand(brand);
					}
					ShopCommoidty shopcomm = shopCommService.save(shopCommoidty);
					List<ShopCommImage> images = new ArrayList<ShopCommImage>();
					CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
					if (multipartResolver.isMultipart(request)) {
						String pathDir = "/content/static/img/" + shop.getId() + "/";
						MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
						// 取得request中的所有文件名
						Iterator<String> iter = multiRequest.getFileNames();
						while (iter.hasNext()) {
							// 取得上传文件
							MultipartFile file = multiRequest.getFile(iter.next());
							if (file != null) {
								// 取得当前上传文件的文件名称
								String myFileName = file.getOriginalFilename();
								// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
								if (myFileName.trim() != "") {
									System.out.println(myFileName);
									// 重命名上传后的文件名
									String fileName = file.getOriginalFilename();
									// 定义上传路径
									String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
									File file1 = new File(logoRealPathDir);
									if (!file1.exists())
										file1.mkdirs();
									File file2 = new File(logoRealPathDir, fileName);
									if (file2.getParentFile() == null)
										file2.mkdirs();
									file.transferTo(file2);
									ShopCommImage image = new ShopCommImage();
									image.setImagePath(pathDir + fileName);
									image.setShopCommoidty(shopcomm);
									image = shopCommImageService.save(image);
									images.add(image);
								}
							}
						}
					}
					shopcomm.setShopCommImages(images);
					shopCommService.update(shopcomm);
					return "redirect:/proscenium/release";
				} else {
					return "redirect:/proscenium/releaseCommoidty";
				}
			} else {
				return "redirect:/proscenium/setUpShop";
			}
		} else {
			return "redirect:/user/login";
		}
	}
	//删除商品
	@RequestMapping(value = "deleteComm", method = RequestMethod.GET)
	public String deleteComm(String ids,String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		if (user != null) {
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop != null && shop.getIsPermit()) {
				if (ids != null && !ids.equals("")) {
					String[] commIDs = ids.substring(1).split("-");
					for (int i = 0; i < commIDs.length; i++) {
						ShopCommoidty shopComm = shopCommService.findById(Integer.parseInt(commIDs[i]));
						List<ShopCommImage> list = shopComm.getShopCommImages();
						if (list != null && list.size() > 0) {
							for (ShopCommImage shopCommImage : list) {
								String logoRealPathDir = request.getSession().getServletContext().getRealPath(shopCommImage.getImagePath());
								File file = new File(logoRealPathDir);
								if (file.exists()) {
									file.delete();
									if (file.getParentFile().isDirectory()) {
										File[] childs = file.getParentFile().listFiles();
										if (childs == null || childs.length == 0) {
											file.getParentFile().delete();
										}
									}
								}
								shopCommImageService.delete(shopCommImage.getImageID());
							}
						}
						shopCommService.delete(shopComm.getCommCode());
					}
				}
			}
		}
		return "redirect:/proscenium/"+page;
	}
	//仓库中商品自己商店的
	@RequestMapping(value = "storehouseShopComm", method = RequestMethod.GET)
	public ModelAndView storehouseShopComm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		mode = getShopCategory(mode);
		if (user != null) {
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop != null && shop.getIsPermit()) {
				List<ShopCommoidty> list = shopCommService.getAllByCondition("shelves", false,shop.getId());
				mode.put("shopComms", list);
				mode.put("shop", shop);
				return new ModelAndView("reception/sthoseShopComm", mode);
			}else{
				return setUpShop(request, response);
			}
		}else{
			return new ModelAndView("user/login",mode);
		}
	}
	//更改商品状态上架，下架，折扣。。
	@RequestMapping(value = "updateState", method = RequestMethod.GET)
	public String updateState(Integer id,String page,String param,boolean isTrue,Float num, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		if (user != null) {
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop != null && shop.getIsPermit()) {
				ShopCommoidty shopCommoidty = shopCommService.findById(id);
				if (shopCommoidty !=null) {
					if (param !=null && !param.equals("") && param.equals("isSpecial")) {
						if(num !=null && num>0){
							shopCommoidty.setSpecial(num*0.1f);
						}
						shopCommoidty.setIsSpecial(isTrue);
					}
					System.out.println(id+page+param+isTrue);
					if (param !=null && !param.equals("") && param.equals("auction")) {
						shopCommoidty.setAuction(isTrue);
					}
					if (param !=null && !param.equals("") && param.equals("shelves")) {
						shopCommoidty.setShelves(isTrue);
					}
					if (param !=null && !param.equals("") && param.equals("shelves") && !isTrue) {
						shopCommoidty.setShelves(isTrue);
						shopCommoidty.setIsSpecial(false);
						shopCommoidty.setAuction(false);
					}
					shopCommService.update(shopCommoidty);
				}
				return "redirect:/proscenium/"+page;
			}else{
				return "redirect:/proscenium/setUpShop";
			}
		}else{
			return "redirect:/user/login";
		}
	}
	//在售商品，本店
	@RequestMapping(value = "soldShopComm", method = RequestMethod.GET)
	public ModelAndView soldShopComm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		mode = getShopCategory(mode);
		if (user != null) {
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop != null && shop.getIsPermit()) {
				List<ShopCommoidty> list = shopCommService.getAllByCondition("shelves", true,shop.getId());
				mode.put("shopComms", list);
				mode.put("shop", shop);
				return new ModelAndView("reception/soldShopComm", mode);
			}else{
				return setUpShop(request, response);
			}
		}else{
			return new ModelAndView("user/login",mode);
		}
	}
	//拍卖的商品，本店
	@RequestMapping(value = "auctionShopComm", method = RequestMethod.GET)
	public ModelAndView auctionShopComm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		ModelMap mode = new ModelMap();
		mode = getShopCategory(mode);
		if (user != null) {
			Shop shop = shopService.getShopByUser(user.getId());
			if (shop != null && shop.getIsPermit()) {
				List<ShopCommoidty> list = shopCommService.getAllByCondition("auction", true,shop.getId());
				mode.put("shopComms", list);
				mode.put("shop", shop);
				return new ModelAndView("reception/auctionShopComm", mode);
			}else{
				return setUpShop(request, response);
			}
		}else{
			return new ModelAndView("user/login",mode);
		}
	}
	
	private ModelMap getShopCategory(ModelMap mode){
		List<ShopCategory> list = shopCategService.getAll();
		mode.put("shopCategories", list);
		return mode;
	}
}
