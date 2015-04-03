package com.yc.controller.management;

import java.io.IOException;
import java.util.ArrayList;
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

import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.service.IDepartmentService;
import com.yc.service.IPersonnelService;
import com.yc.service.IPositionService;

//管理
@Controller
@RequestMapping("/management")
public class ManagementIndexController {

	private static final Logger LOG = Logger.getLogger(ManagementIndexController.class);

	@Autowired
	IDepartmentService departmentService;

	@Autowired
	IPositionService positionService;

	@Autowired
	IPersonnelService personnelService;

	// 部门管理
	@RequestMapping(value = "department", method = RequestMethod.GET)
	public ModelAndView department(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Department> list = departmentService.getDepartmentByParent();
		ModelMap mode = new ModelMap();
		mode.put("treeList1", list);
		return new ModelAndView("management/department", mode);
	}

	@RequestMapping(value = "getDepartment", method = RequestMethod.GET)
	public ModelAndView getDepartment(Integer departmentId, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Department department = departmentService.findById(departmentId);
		List<Department> list = departmentService.getDepartmentByParent();
		ModelMap mode = new ModelMap();
		mode.put("department", department);
		mode.put("treeList1", list);
		if (page.equals("department")) {
			return new ModelAndView("management/department", mode);
		} else if (page.equals("posDivide")) {
			List<Positions> positions = department.getPositions();
			mode.put("treeList2", positions);
			List<Personnel> personnels = personnelService.getAll();
			mode.put("personnels", personnels);
			return new ModelAndView("management/posDivide", mode);
		} else {
			List<Positions> positions = positionService.getPositionByParent();
			mode.put("treeList2", positions);
			return new ModelAndView("management/deparDivide", mode);
		}
	}

	@RequestMapping(value = "addOrUpdateDep", method = RequestMethod.POST)
	public String addOrUpdateDep(Integer departmentID, String departmentname, String describes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Department department = departmentService.findById(departmentID);
		Department depart = addDepartment(department, departmentname, describes);
		return "redirect:/management/getDepartment?departmentId=" + depart.getDepartmentID()+"&page=department";
	}

	@RequestMapping(value = "updateDepartmen", method = RequestMethod.POST)
	public String updateDepartmen(Integer departmentId, String departmentname, String describes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Department department = departmentService.findById(departmentId);
		Department depart = updateDepartment(department, departmentname, describes);
		return "redirect:/management/getDepartment?departmentId=" + depart.getDepartmentID()+"&page=department";
	}

	@RequestMapping(value = "deleteDepartmen", method = RequestMethod.POST)
	public String deleteDepartmen(Integer departmentId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Department department = departmentService.findById(departmentId);
		getNode(department);
		return "redirect:/management/department";
	}

	private void getNode(Department department) {
		List<Department> list = department.getChildren();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getChildren() != null && list.get(i).getChildren().size() > 0) {
					getNode(list.get(i));
				}
				departmentService.deleteForTree(list.get(i));
			}
		}
		departmentService.deleteForTree(department);
	}

	private Department updateDepartment(Department department, String departmentname, String describes) {
		department.setDepartmentname(departmentname);
		department.setDescribes(describes);
		department = departmentService.update(department);
		return department;
	}

	private Department addDepartment(Department parentDepartment, String departmentname, String describes) {
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
	public ModelAndView position(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Positions> list = positionService.getPositionByParent();
		ModelMap mode = new ModelMap();
		mode.put("treeList2", list);
		return new ModelAndView("management/position", mode);
	}

	@RequestMapping(value = "getPosition", method = RequestMethod.GET)
	public ModelAndView getPosition(Integer positionID, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Positions position = positionService.findById(positionID);
		List<Positions> list = positionService.getPositionByParent();
		ModelMap mode = new ModelMap();
		mode.put("position", position);
		mode.put("treeList2", list);
		if (page.equals("position")) {
			return new ModelAndView("management/position", mode);
		} else {
			List<Department> departments = departmentService.getDepartmentByParent();
			mode.put("treeList1", departments);
			return new ModelAndView("management/deparDivide", mode);
		}
	}

	@RequestMapping(value = "addPosition", method = RequestMethod.POST)
	public String addPosition(Integer positionID, String positionname, String significance, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Positions position = positionService.findById(positionID);
		Positions pos = addPosition(position, positionname, significance);
		return "redirect:/management/getPosition?positionID=" + pos.getPositionid()+"&page=position";
	}

	@RequestMapping(value = "updatePosition", method = RequestMethod.GET)
	public String updatePosition(Integer positionID, String positionname, String significance, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Positions position = positionService.findById(positionID);
		Positions depart = updatePosition(position, positionname, significance);
		return "redirect:/management/getPosition?positionID=" + depart.getPositionid()+"&page=position";
	}

	@RequestMapping(value = "deletePosition", method = RequestMethod.GET)
	public String deletePosition(Integer positionID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Positions positions = positionService.findById(positionID);
		getNodes(positions);
		return "redirect:/management/position";
	}

	private void getNodes(Positions position) {
		List<Positions> list = position.getChildren();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getChildren() != null && list.get(i).getChildren().size() > 0) {
					getNodes(list.get(i));
				}
				positionService.deleteForTree(list.get(i));
			}
		}
		positionService.deleteForTree(position);
	}

	private Positions updatePosition(Positions parentPosition, String positionname, String significance) {
		parentPosition.setPositionname(positionname);
		parentPosition.setSignificance(significance);
		parentPosition = positionService.update(parentPosition);
		return parentPosition;
	}

	private Positions addPosition(Positions parentPosition, String positionname, String significance) {
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
	public ModelAndView deparDivide(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			if (department.getPositions() != null && department.getPositions().size() > 0) {
				for (int j = 0; j < department.getPositions().size(); j++) {
					Positions positions = department.getPositions().get(j);
					boolean isok = true;
					for (String id : ids) {
						if (positions.getPositionid() == Integer.parseInt(id)) {
							isok = false;
						}
					}
					if (isok) {
						Personnel personnel = null;
						for (int i = 0; i < positions.getPersonnels().size(); i++) {
							personnel = positions.getPersonnels().get(i);
							if (personnel != null) {
								personnel.getPositions().remove(positions);
								personnelService.update(personnel);
								positions.getPersonnels().remove(personnel);
								positionService.update(positions);
							}
						}
						department.getPositions().remove(positions);
						departmentService.update(department);
						positions.getDepartments().remove(department);
						personnelService.update(personnel);
					}
				}
				for (int i = 0; i < ids.length; i++) {
					boolean isok = true;
					for (Positions positions : department.getPositions()) {
						if (Integer.parseInt(ids[i]) == positions.getPositionid()) {
							list.add(positions);
							isok = false;
						}
					}
					if (isok) {
						Positions post = positionService.findById(Integer.parseInt(ids[i]));
						list.add(post);
					}
				}
				department.setPositions(list);
				departmentService.update(department);
			} else {
				for (int i = 0; i < ids.length; i++) {
					Positions post = positionService.findById(Integer.parseInt(ids[i]));
					list.add(post);
				}
				department.setPositions(list);
				departmentService.save(department);
			}
		}
		return "redirect:/management/deparDivide";
	}

	@RequestMapping(value = "posDivide", method = RequestMethod.GET)
	public ModelAndView posDivide(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Department> list = departmentService.getDepartmentByParent();
		ModelMap mode = new ModelMap();
		mode.put("treeList1", list);
		List<Personnel> personnels = personnelService.getAll();
		mode.put("personnels", personnels);
		return new ModelAndView("management/posDivide", mode);
	}
}