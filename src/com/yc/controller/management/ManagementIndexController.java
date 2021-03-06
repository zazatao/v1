package com.yc.controller.management;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.ws.security.policy.SPConstants;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Brand;
import com.yc.entity.ImagePath;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.Specifications;
import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.service.IBrandService;
import com.yc.service.IDepartAndPositionsService;
import com.yc.service.IDepartmentService;
import com.yc.service.IPersonnelService;
import com.yc.service.IPositionService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.ISpecificationsService;
import com.yc.service.impl.SpecificationsService;

//管理
@Controller
@RequestMapping("/management")
public class ManagementIndexController {

	private static final Logger LOG = Logger
			.getLogger(ManagementIndexController.class);

	@Autowired
	IDepartmentService departmentService;

	@Autowired
	IPositionService positionService;

	@Autowired
	IPersonnelService personnelService;

	@Autowired
	IShopCategoryService shopCategoryService;

	@Autowired
	IShopCommoidtyService shopCommoidtyService;

	@Autowired
	IBrandService brandService;

	@Autowired
	ISpecificationsService specificationsService;

	@Autowired
	IDepartAndPositionsService depAndPosService;

	// 部门管理
	@RequestMapping(value = "department", method = RequestMethod.GET)
	public ModelAndView department(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<Department> list = departmentService.getDepartmentByParent();
		ModelMap mode = new ModelMap();
		mode.put("treeList1", list);
		return new ModelAndView("management/department", mode);
	}

	@RequestMapping(value = "getDepartment", method = RequestMethod.GET)
	public ModelAndView getDepartment(Integer departmentId, String page,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Department department = departmentService.findById(departmentId);
		List<Department> list = departmentService.getDepartmentByParent();
		ModelMap mode = new ModelMap();
		mode.put("department", department);
		mode.put("treeList1", list);
		if (page.equals("department")) {
			return new ModelAndView("management/department", mode);
		} else if (page.equals("posDivide")) {
			List<DepartAndPositions> depAndPoses = depAndPosService
					.findDepAndPosByDep(department);
			mode.put("treeList2", depAndPoses);
			List<Personnel> personnels = personnelService.getAll();
			mode.put("personnels", personnels);
			return new ModelAndView("management/posDivide", mode);
		} else {
			List<Positions> positions = positionService.getPositionByParent();
			List<DepartAndPositions> depAndPos = depAndPosService
					.findDepAndPosByDep(department);
			System.out.println("depAndPos====================="
					+ depAndPos.size());
			mode.put("depAndPos", depAndPos);
			mode.put("treeList2", positions);
			return new ModelAndView("management/deparDivide", mode);
		}
	}

	@RequestMapping(value = "addOrUpdateDep", method = RequestMethod.POST)
	public String addOrUpdateDep(Integer departmentID, String departmentname,
			String describes, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Department department = departmentService.findById(departmentID);
		Department depart = addDepartment(department, departmentname, describes);
		return "redirect:/management/getDepartment?departmentId="
				+ depart.getDepartmentID() + "&page=department";
	}

	@RequestMapping(value = "updateDepartmen", method = RequestMethod.POST)
	public String updateDepartmen(Integer departmentId, String departmentname,
			String describes, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Department department = departmentService.findById(departmentId);
		Department depart = updateDepartment(department, departmentname,
				describes);
		return "redirect:/management/getDepartment?departmentId="
				+ depart.getDepartmentID() + "&page=department";
	}

	@RequestMapping(value = "deleteDepartmen", method = RequestMethod.POST)
	public String deleteDepartmen(Integer departmentId,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Department department = departmentService.findById(departmentId);
		getNode(department);
		return "redirect:/management/department";
	}

	private void getNode(Department department) {
		Set<Department> list = department.getChildren();
		if (list != null && list.size() > 0) {
			Iterator<Department> iter = list.iterator();
			while (iter.hasNext()) {
				Department dep = iter.next();
				if (dep.getChildren() != null && dep.getChildren().size() > 0) {
					getNode(dep);
				}
				Set<DepartAndPositions> depAndPos = dep.getDepartAndPositions();
				if (depAndPos != null && depAndPos.size() > 0) {
					Iterator<DepartAndPositions> iterator = depAndPos
							.iterator();
					while (iterator.hasNext()) {
						DepartAndPositions depAndPoss = iterator.next();
						List<Personnel> personnels = depAndPoss.getPersonnels();
						if (personnels != null && personnels.size() > 0) {
							for (int k = 0; k < personnels.size(); k++) {
								Personnel personnel = personnels.get(k);
								personnel.setDepartAndPositions(null);
								personnelService.update(personnel);
							}
						}
						depAndPosService.delete(depAndPoss.getId());
					}
				}
				departmentService.deleteForTree(dep);
			}
		}
		Set<DepartAndPositions> depAndPos = department.getDepartAndPositions();
		if (depAndPos != null && depAndPos.size() > 0) {
			Iterator<DepartAndPositions> iterator = depAndPos.iterator();
			while (iterator.hasNext()) {
				DepartAndPositions depAndPoss = iterator.next();
				List<Personnel> personnels = depAndPoss.getPersonnels();
				if (personnels != null && personnels.size() > 0) {
					for (int g = 0; g < personnels.size(); g++) {
						Personnel personnel = personnels.get(g);
						personnel.setDepartAndPositions(null);
						personnelService.update(personnel);
					}
				}
				depAndPosService.delete(iterator.next().getId());
			}
		}
		departmentService.deleteForTree(department);
	}

	private Department updateDepartment(Department department,
			String departmentname, String describes) {
		department.setDepartmentname(departmentname);
		department.setDescribes(describes);
		department = departmentService.update(department);
		return department;
	}

	private Department addDepartment(Department parentDepartment,
			String departmentname, String describes) {
		Department department = new Department();
		department.setParentLevel(parentDepartment);
		department.setDepartmentname(departmentname);
		department.setDescribes(describes);
		department = departmentService.save(department);
		if (parentDepartment != null) {
			parentDepartment.getChildren().add(department);
			departmentService.update(parentDepartment);
		}
		return department;
	}

	// 角色管理
	@RequestMapping(value = "position", method = RequestMethod.GET)
	public ModelAndView position(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<Positions> list = positionService.getPositionByParent();
		ModelMap mode = new ModelMap();
		mode.put("treeList2", list);
		return new ModelAndView("management/position", mode);
	}

	@RequestMapping(value = "getPosition", method = RequestMethod.GET)
	public ModelAndView getPosition(Integer positionID, String page,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Positions position = positionService.findById(positionID);
		List<Positions> list = positionService.getPositionByParent();
		ModelMap mode = new ModelMap();
		mode.put("position", position);
		mode.put("treeList2", list);
		if (page.equals("position")) {
			return new ModelAndView("management/position", mode);
		} else {
			List<Department> departments = departmentService
					.getDepartmentByParent();
			mode.put("treeList1", departments);
			return new ModelAndView("management/deparDivide", mode);
		}
	}

	@RequestMapping(value = "addPosition", method = RequestMethod.POST)
	public String addPosition(Integer positionID, String positionname,
			String significance, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Positions position = positionService.findById(positionID);
		Positions pos = addPosition(position, positionname, significance);
		return "redirect:/management/getPosition?positionID="
				+ pos.getPositionid() + "&page=position";
	}

	@RequestMapping(value = "updatePosition", method = RequestMethod.POST)
	public String updatePosition(Integer positionID, String positionname,
			String significance, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Positions position = positionService.findById(positionID);
		Positions depart = updatePosition(position, positionname, significance);
		return "redirect:/management/getPosition?positionID="
				+ depart.getPositionid() + "&page=position";
	}

	@RequestMapping(value = "deletePosition", method = RequestMethod.GET)
	public String deletePosition(Integer positionID,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Positions positions = positionService.findById(positionID);
		getNodes(positions);
		return "redirect:/management/position";
	}

	private void getNodes(Positions position) {
		Set<Positions> list = position.getChildren();
		Iterator<Positions> iter = list.iterator();
		if (list != null && list.size() > 0) {
			while (iter.hasNext()) {
				Positions pos = iter.next();
				if (pos.getChildren() != null && pos.getChildren().size() > 0) {
					getNodes(pos);
				}
				Set<DepartAndPositions> depAndPos = pos.getDepartAndPositions();
				if (depAndPos != null && depAndPos.size() > 0) {
					Iterator<DepartAndPositions> iterator = depAndPos
							.iterator();
					while (iterator.hasNext()) {
						DepartAndPositions depAndPoss = iterator.next();
						List<Personnel> personnels = depAndPoss.getPersonnels();
						if (personnels != null && personnels.size() > 0) {
							for (int k = 0; k < personnels.size(); k++) {
								Personnel personnel = personnels.get(k);
								personnel.setDepartAndPositions(null);
								personnelService.update(personnel);
							}
						}
						depAndPosService.delete(iterator.next().getId());
					}
				}
				positionService.deleteForTree(pos);
			}
		}
		Set<DepartAndPositions> depAndPos = position.getDepartAndPositions();
		if (depAndPos != null && depAndPos.size() > 0) {
			Iterator<DepartAndPositions> iterator = depAndPos.iterator();
			while (iterator.hasNext()) {
				DepartAndPositions depAndPoss = iterator.next();
				List<Personnel> personnels = depAndPoss.getPersonnels();
				if (personnels != null && personnels.size() > 0) {
					for (int g = 0; g < personnels.size(); g++) {
						Personnel personnel = personnels.get(g);
						personnel.setDepartAndPositions(null);
						personnelService.update(personnel);
					}
				}
				depAndPosService.delete(iterator.next().getId());
			}
		}
		positionService.deleteForTree(position);
	}

	private Positions updatePosition(Positions parentPosition,
			String positionname, String significance) {
		parentPosition.setPositionname(positionname);
		parentPosition.setSignificance(significance);
		parentPosition = positionService.update(parentPosition);
		return parentPosition;
	}

	private Positions addPosition(Positions parentPosition,
			String positionname, String significance) {
		Positions position = new Positions();
		position.setParentLevel(parentPosition);
		position.setPositionname(positionname);
		position.setSignificance(significance);
		position = positionService.save(position);
		if (parentPosition != null) {
			parentPosition.getChildren().add(position);
			positionService.update(parentPosition);
		}
		return position;
	}

	// 部门角色分配
	@RequestMapping(value = "deparDivide", method = RequestMethod.GET)
	public ModelAndView deparDivide(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<Department> list = departmentService.getDepartmentByParent();
		ModelMap mode = new ModelMap();
		mode.put("treeList1", list);
		List<Positions> positions = positionService.getPositionByParent();
		mode.put("treeList2", positions);
		return new ModelAndView("management/deparDivide", mode);
	}

	@RequestMapping(value = "divideRole", method = RequestMethod.POST)
	public String divideRole(Integer departmentID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Department department = departmentService.findById(departmentID);
		List<Positions> list = null;
		String[] ids = request.getParameterValues("positionCheck");
		if (department != null) {
			list = new ArrayList<Positions>();
			List<DepartAndPositions> depss = depAndPosService.findDepAndPosByDep(department);
			if (depss != null && depss.size() > 0) {
				for (int i = 0; i < depss.size(); i++) {
					DepartAndPositions positions = depss.get(i);
					boolean isoks = true;
					for (String id : ids) {
						if (positions.getPositions().getPositionid() == Integer.parseInt(id)) {
							isoks = false;
						}
					}
					if (isoks) {
						List<Personnel> pers = positions.getPersonnels();
						if (pers != null && pers.size()>0) {
							for (int j = 0; j < pers.size(); j++) {
								Personnel personnel = positions.getPersonnels().get(j);
								personnel.setDepartAndPositions(null);
								personnelService.update(personnel);
							}
						}
						 depAndPosService.deleteDepAndPosByID(positions.getId());
					}
				}
				for (int i = 0; i < ids.length; i++) {
					boolean isok = true;
					List<DepartAndPositions> deps = depAndPosService.findDepAndPosByDep(department);
					for (int j = 0; j < deps.size(); j++) {
						DepartAndPositions depAndPos = deps.get(j);
						Positions positions = depAndPos.getPositions();
						if (Integer.parseInt(ids[i]) == positions.getPositionid()) {
							isok = false;
						}
					}
					if (isok) {
						Positions post = positionService.findById(Integer.parseInt(ids[i]));
						list.add(post);
					}
				}
		      for (int i = 0; i < list.size(); i++) {
					DepartAndPositions depAndPos = new DepartAndPositions();
					depAndPos.setDepartment(department);
					depAndPos.setTicket(null);
					depAndPos.setPositions(list.get(i));
					depAndPosService.save(depAndPos);
		      }
			} else {
				for (int i = 0; i < ids.length; i++) {
					Positions post = positionService.findById(Integer.parseInt(ids[i]));
					DepartAndPositions depAndPos = new DepartAndPositions();
					depAndPos.setDepartment(department);
					depAndPos.setTicket(null);
					depAndPos.setPositions(post);
					depAndPosService.save(depAndPos);
				}
			}
		}
		return "redirect:/management/deparDivide";
	}

	// 角色员工分配
	@RequestMapping(value = "posDivide", method = RequestMethod.GET)
	public ModelAndView posDivide(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<Department> list = departmentService.getDepartmentByParent();
		List<Department> departments = departmentService.getAll();
		List<Positions> positions = positionService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("treeList1", list);
		mode.put("departments", departments);
		mode.put("positions", positions);
		List<Personnel> personnels = personnelService.getAll();
		mode.put("personnels", personnels);
		return new ModelAndView("management/posDivide", mode);
	}

	// 规格
	@RequestMapping(value = "specification", method = RequestMethod.GET)
	public ModelAndView specification(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<Specifications> specifications = specificationsService.getAll();
		ModelMap mode = new ModelMap();
		System.out.println("specifications===" + specifications.size());
		mode.put("specifications", specifications);
		return new ModelAndView("management/addSpecification", mode);
	}

	// 添加规格
	@RequestMapping(value = "addspecification", method = RequestMethod.POST)
	public String addspecification(Specifications specification,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		specificationsService.save(specification);
		return "redirect:/management/specification";
	}

	// 商品品牌
	@RequestMapping(value = "brand", method = RequestMethod.GET)
	public ModelAndView brand(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<Brand> brands = brandService.getAll();
		for (int k = 0; k < brands.size() - 1; k++) {
			for (int j = brands.size() - 1; j > k; j--) {
				if (brands.get(j).getBrandName()
						.equals(brands.get(k).getBrandName())) {
					brands.remove(j);
				}
			}
		}
		ModelMap mode = new ModelMap();
		mode.put("brands", brands);
		return new ModelAndView("management/addbrand", mode);
	}

	// 添加商品品牌
	@RequestMapping(value = "addBrand", method = RequestMethod.POST)
	public String addBrand(@RequestParam("imageFile") MultipartFile imageFile,
			String brandName, String website, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String fileName = imageFile.getOriginalFilename();
		String pathDir = "content/static/img/brand/";
		String logoRealPathDir = request.getSession().getServletContext()
				.getRealPath(pathDir);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String suffix = fileName.substring(fileName.lastIndexOf("."));
		String name = sdf.format(new Date()) + suffix;
		File file1 = new File(logoRealPathDir);
		if (!file1.exists())
			file1.mkdirs();
		File file = new File(logoRealPathDir, name);
		if (file.getParentFile() == null)
			file.mkdirs();
		imageFile.transferTo(file);
		Brand brand = new Brand();
		brand.setLogo(pathDir + name);
		brand.setBrandName(brandName);
		brand.setWebsite(website);
		brandService.save(brand);
		return "redirect:/management/brand";
	}

	@RequestMapping(value = "posRoleDivide", method = RequestMethod.POST)
	public String posRoleDivide(Integer departID, Integer pos,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] checkIDs = request.getParameterValues("checkID");
		Positions positions = positionService.findById(pos);
		Department department = departmentService.findById(departID);
		if (positions != null && department != null && checkIDs != null
				&& checkIDs.length > 0) {
			for (int i = 0; i < checkIDs.length; i++) {
				Integer checkID = Integer.parseInt(checkIDs[i]);
				Personnel personnel = personnelService.findById(checkID);
				if (personnel != null) {
					DepartAndPositions depAndPos = personnel
							.getDepartAndPositions();
					if (depAndPos != null) {
						if (depAndPos.getDepartment() == department) {
							if (depAndPos.getPositions() != positions) {
								DepartAndPositions dep = depAndPosService
										.getAllByDepAndPos(
												department.getDepartmentID(),
												positions.getPositionid());
								personnel.setDepartAndPositions(dep);
								personnel = personnelService.update(personnel);
								dep.getPersonnels().add(personnel);
								depAndPosService.update(dep);
							}
						} else {
							DepartAndPositions dep = depAndPosService
									.getAllByDepAndPos(
											department.getDepartmentID(),
											positions.getPositionid());
							personnel.setDepartAndPositions(dep);
							personnel = personnelService.update(personnel);
							dep.getPersonnels().add(personnel);
							depAndPosService.update(dep);
						}
					} else {
						DepartAndPositions dep = depAndPosService
								.getAllByDepAndPos(
										department.getDepartmentID(),
										positions.getPositionid());
						System.out.println("dep====" + dep);
						personnel.setDepartAndPositions(dep);
						personnel = personnelService.update(personnel);
						System.out.println("personnel===" + personnel);
						dep.getPersonnels().add(personnel);
						System.out.println("dep.getPersonnels()===="
								+ dep.getPersonnels());
						depAndPosService.update(dep);
					}
				}
			}
		}
		return "redirect:/management/getDepartment?departmentId=" + departID
				+ "&page=posDivide";
	}

	@RequestMapping(value = "searchPersonnel", method = RequestMethod.GET)
	public ModelAndView searchPersonnel(String userName, String departmentName,
			String positions, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (departmentName.equals("")) {
			map.put("departmentName", null);
		} else {
			map.put("departmentName", Integer.parseInt(departmentName));
		}
		if (positions.equals("")) {
			map.put("positions", null);
		} else {
			map.put("positions", Integer.parseInt(positions));
		}
		if (userName.equals("")) {
			map.put("userName", null);
		} else {
			map.put("userName", userName);
		}
		List<Personnel> personnels = personnelService
				.getAllByParametersForManage(map);
		List<Department> list = departmentService.getDepartmentByParent();
		List<Department> departments = departmentService.getAll();
		List<Positions> position = positionService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("treeList1", list);
		mode.put("departments", departments);
		mode.put("positions", position);
		mode.put("personnels", personnels);
		return new ModelAndView("management/posDivide", mode);
	}

	@RequestMapping(value = "shopCategory", method = RequestMethod.GET)
	public ModelAndView shopCategory(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<ShopCategory> list = shopCategoryService.getAllByLevel(1);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/shopCategory", mode);
	}

	// 商品类别管理
	@RequestMapping(value = "getShopCategory", method = RequestMethod.GET)
	public ModelAndView getShopCategory(Integer categoryID,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<ShopCategory> list = shopCategoryService.getAllByLevel(1);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		ShopCategory category = shopCategoryService.findById(categoryID);
		mode.put("category", category);
		return new ModelAndView("management/shopCategory", mode);
	}

	// 商品类别品牌管理
	@RequestMapping(value = "getCate", method = RequestMethod.GET)
	public ModelAndView getCate(Integer categoryID, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<ShopCategory> list = shopCategoryService.getAllByLevel(1);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		ShopCategory category = shopCategoryService.findById(categoryID);
		mode.put("category", category);
		List<Brand> brands = brandService.getAllunlike();
		mode.put("brands", brands);
		List<Specifications> specifications = specificationsService.getAll();
		mode.put("specifications", specifications);
		return new ModelAndView("management/cateAndbrand", mode);
	}


	// 商品类型品牌分配保存
	@RequestMapping(value = "saveBrandAndCate", method = RequestMethod.POST)
	public String saveBrandAndCate(Integer categoryID,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String[] brands=request.getParameterValues("brand");
		    String[] specs =request.getParameterValues("specification");
		    ShopCategory cate  = shopCategoryService.findById(categoryID);
		    List<Specifications> cateSpec = cate.getSpecifications();
			if (cateSpec == null || cateSpec.size() == 0) {
				notCateAdd(cate, specs);
			}else{
				List<Specifications> specss = specificationsService.getAll();
				if(specs != null && specs.length >0){
					haveCateOrther(cate, cateSpec, specs, specss);
				}else{
					haveCateDel(cate, specss);
				}
			}
			
//		    if(brands!=null&&brands.length>0){
//		    	 for (int i = 0; i < brands.length; i++) {
//				    	Brand brand = brandService.findById(Integer.parseInt(brands[i]));
//				    	if(brand.getShopCateg()==null){
//				    		brand.setShopCateg(cate);		
//					        brandService.update(brand);
//				    	}else{
//				    		Brand nBrand=new Brand();
//				    		nBrand.setBrandName(brand.getBrandName());
//				    		nBrand.setLogo(brand.getLogo());
//				    		nBrand.setWebsite(brand.getWebsite());
//				    		nBrand.setShopCateg(cate);
//				    		brandService.save(nBrand);
//				    	}
//					}
//		    }
	
			    	 return "redirect:/management/getCate?categoryID="+categoryID; 
	}
	
	private void haveCateDel(ShopCategory cate, List<Specifications> specss) {
		boolean isok = specss.removeAll(cate.getSpecifications());
		for (int i = 0; i < specss.size(); i++) {
			Specifications spe = specss.get(i);
			List<ShopCategory> cates = spe.getShopCategories();
			for (int j = 0; j < cates.size(); j++) {
				if(cates.get(j).getCategoryID() == cate.getCategoryID()){
					cates.remove(cates.get(j));
				}
			}
			specificationsService.update(spe);
		}
		cate.setSpecifications(null);
		cate = shopCategoryService.update(cate);
	}

	private void haveCateOrther(ShopCategory cate, List<Specifications> cateSpec, String[] specs, List<Specifications> specss) {
		List<Specifications> cateSpec2 = new ArrayList<Specifications>();
		for ( int m = 0; m<cateSpec.size(); m++){
			   cateSpec2.add(cateSpec.get(m));
		}
		for (int i = 0; i < cateSpec2.size(); i++) {
			boolean isok = true;
			for (int j = 0; j < specs.length; j++) {
				Specifications spec = specificationsService.findById(Integer.parseInt(specs[j]));
				if (spec != null) {
					if(cateSpec2.get(i).getId() == spec.getId()){
						isok = false;
					}
				}
			}
			if (isok) {
				for (int j = 0; j < specss.size(); j++) {
					if(specss.get(j).getId() == cateSpec2.get(i).getId()){
						Specifications spe = specss.get(j);
						List<ShopCategory> specate = spe.getShopCategories();
						for (int k = 0; k < specate.size(); k++) {
							if(specate.get(k).getCategoryID() == cate.getCategoryID()){
								specate.remove(specate.get(k));
							}
						}  
						specificationsService.update(spe);
					}
				}
				cate.getSpecifications().remove(cateSpec2.get(i)); 
				cate = shopCategoryService.update(cate);
			}
		}
		for (int j = 0; j < specs.length; j++) {
			Specifications spec = specificationsService.findById(Integer.parseInt(specs[j]));
			if (spec != null) {
				boolean isok = true;
				for (int i = 0; i < cateSpec.size(); i++) {
					if(spec.getId() == cateSpec.get(i).getId()){
						isok = false;
					}
				}
				if (isok) {
					List<ShopCategory> catespe = spec.getShopCategories();
					if (catespe !=null && catespe.size()>0) {
						catespe.add(cate);
					}else{
						catespe = new ArrayList<ShopCategory>();
						catespe.add(cate);
						spec.setShopCategories(catespe);
					}
					specificationsService.update(spec);
					cate.getSpecifications().add(spec);
					shopCategoryService.update(cate);
				}
			}
		}
	}
   //类型规格为空
	private void notCateAdd(ShopCategory cate, String[] specs) {
		List<Specifications> specList;
		List<ShopCategory> cateList;
		if (specs != null && specs.length >0) {
			specList = new ArrayList<Specifications>();
			for (int i = 0; i < specs.length; i++) {
				 Specifications spec = specificationsService.findById(Integer.parseInt(specs[i]));//尺码
				 if (spec.getShopCategories().size()>0) {
					 cateList = spec.getShopCategories();//尺码的类型
				 }else{
					 cateList = new ArrayList<ShopCategory>();
				 }
				 cateList.add(cate);
				 spec.setShopCategories(cateList);
				 spec = specificationsService.update(spec);//报错
				 specList.add(spec); 
			}
			cate.setSpecifications(specList);
			cate = shopCategoryService.update(cate);
		}
	}

	@RequestMapping(value = "addOrUpdateCate", method = RequestMethod.POST)
	public ModelAndView addOrUpdateCate(Integer categoryID, String category,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShopCategory shopCategory = shopCategoryService.findById(categoryID);
		System.out.println("categoryID============" + shopCategory);
		ModelMap mode = new ModelMap();
		if (shopCategory == null) {
			List<ShopCategory> list = shopCategoryService.getAllByLevel(1);
			if (list.size() < 9) {
				ShopCategory shopCate = new ShopCategory();
				shopCate.setParentLevel(shopCategory);
				shopCate.setCategory(category);
				shopCate.setLevel(1);
				shopCate = shopCategoryService.save(shopCate);
				System.out
						.println("shopCate=========" + shopCate.getCategory());
			}
		} else {
			ShopCategory shopCate = new ShopCategory();
			shopCate.setParentLevel(shopCategory);
			shopCate.setCategory(category);
			shopCate.setLevel(shopCategory.getLevel() + 1);
			shopCate = shopCategoryService.save(shopCate);
			shopCategory.getChildren().add(shopCate);
			shopCategoryService.update(shopCategory);
			mode.put("category", shopCate);
		}
		List<ShopCategory> list = shopCategoryService.getAllByLevel(1);
		mode.put("list", list);
		return new ModelAndView("management/shopCategory", mode);
	}

	@RequestMapping(value = "deleteShopCategory", method = RequestMethod.POST)
	public String deleteShopCategory(Integer categoryID,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShopCategory shopCate = shopCategoryService.findById(categoryID);
		if (shopCate != null) {
			getNodeForShopCategory(shopCate);
		}
		return "redirect:/management/getShopCategory";
	}

	private void getNodeForShopCategory(ShopCategory shopCate) {
		List<ShopCategory> list = shopCate.getChildren();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getChildren() != null
						&& list.get(i).getChildren().size() > 0) {
					getNodeForShopCategory(list.get(i));
				} else {
					if (list.get(i).getShopCommoidties() != null
							&& list.get(i).getShopCommoidties().size() > 0) {
						List<ShopCommoidty> shopCommoidties = list.get(i)
								.getShopCommoidties();
						for (int j = 0; j < shopCommoidties.size(); j++) {
							shopCommoidties.get(j).setShopCategory(null);
							shopCommoidtyService.update(shopCommoidties.get(j));
						}
					}
					shopCategoryService.deleteShopCategory(list.get(i)
							.getCategoryID());
				}
			}
		}
		shopCategoryService.deleteShopCategory(shopCate.getCategoryID());
	}

	@RequestMapping(value = "updateShopCategory", method = RequestMethod.POST)
	public String updateShopCategory(Integer categoryID, String category,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShopCategory shopcate = shopCategoryService.findById(categoryID);
		shopcate.setCategory(category);
		return "redirect:/management/getShopCategory";
	}
}