package com.yc.controller.warehouse;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.service.IDepartAndPositionsService;
import com.yc.service.IDepartmentService;
import com.yc.service.IPackageService;
import com.yc.service.IPersonnelService;

//仓库统计工作人员情况
@Controller
@RequestMapping("/warehouse")
public class StatisticalController {

	private static final Logger LOG = Logger.getLogger(StatisticalController.class);
	
	@Autowired
	IPackageService packageService;
	
	@Autowired
	IDepartAndPositionsService depAndPositionsService;

	@Autowired
	IPersonnelService personnelService;
	
	@Autowired
	IDepartmentService departmentService;
	
	@RequestMapping(value = "statistical", method = RequestMethod.GET)
	public ModelAndView statistical(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Personnel personnel = (Personnel) request.getSession().getAttribute("loginPersonnle");
		ModelMap mode = new ModelMap();
		if (personnel.getDepartAndPositions() != null) {
			List<Personnel> personnels = new ArrayList<Personnel>();
			if (personnel.getDepartAndPositions().getDepartment().getDepartmentID() == 22 || personnel.getDepartAndPositions().getDepartment().getDepartmentID() == 23 || personnel.getDepartAndPositions().getDepartment().getDepartmentID() == 24) {
				if (personnel.getDepartAndPositions().getPositions() != null) {
					Positions posit = personnel.getDepartAndPositions().getPositions();
					Set<Positions> positions = posit.getChildren();
					List<DepartAndPositions> depAndPos = depAndPositionsService.findDepAndPosByDep(personnel.getDepartAndPositions().getDepartment());
					for (DepartAndPositions dep : depAndPos) {
						Positions post = dep.getPositions();
						Iterator<Positions> iter = positions.iterator();
						while (iter.hasNext()) {
							Positions pon = iter.next();
							if (post.getPositionid() == pon.getPositionid()) {
								List<Personnel> personne = personnelService.getAllByDepAndPos(dep);
								personnels.addAll(personne);
							}
						}
					}
					personnels.add(personnel);
				}
			} else {
				Department department = departmentService.findById(22);
				List<DepartAndPositions> depAndPoss23 = depAndPositionsService.findDepAndPosByDep(department);
				for (DepartAndPositions dep : depAndPoss23) {
					List<Personnel> personne = personnelService.getAllByDepAndPos(dep);
					personnels.addAll(personne);
				}
				Set<Department> set = department.getChildren();
				if (set != null && set.size()>0) {
					Iterator<Department> iterator =  set.iterator();
					while (iterator.hasNext()) {
						Department depart = iterator.next();
						List<DepartAndPositions> depAndPoss = depAndPositionsService.findDepAndPosByDep(depart);
						for (DepartAndPositions dep : depAndPoss) {
							List<Personnel> personne = personnelService.getAllByDepAndPos(dep);
							personnels.addAll(personne);
						}
					}
				}
			}
			mode.put("personnels", personnels);
		}
		return new ModelAndView("warehouse/statistical",mode);
	}
}
