package com.yc.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.model.PersonnelStatistics;
import com.yc.service.IDepartAndPositionsService;
import com.yc.service.IDepartmentService;
import com.yc.service.IPersonnelService;

@Controller
@RequestMapping("/analysis")
public class Statistics {
	@Autowired
	IPersonnelService perService;

	@Autowired
	IDepartAndPositionsService depAndPositionsService;

	@Autowired
	IPersonnelService personnelService;

	@Autowired
	IDepartmentService departmentService;

	@RequestMapping(value = "removecauses", method = RequestMethod.POST)
	public void removecauses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JsonConfig jsonConfig = new JsonConfig();
		Personnel personnel = (Personnel) request.getSession().getAttribute("loginPersonnle");
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		if (personnel.getDepartAndPositions() != null) {
			List<Personnel> personnels = new ArrayList<Personnel>();
			if (personnel.getDepartAndPositions().getDepartment().getDepartmentID() == 2) {
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
				Department department = departmentService.findById(2);
				List<DepartAndPositions> depAndPoss = depAndPositionsService.findDepAndPosByDep(department);
				for (DepartAndPositions dep : depAndPoss) {
					List<Personnel> personne = personnelService.getAllByDepAndPos(dep);
					personnels.addAll(personne);
				}
			}
			List<PersonnelStatistics> arryList = new ArrayList<PersonnelStatistics>();
			Map<String, List<PersonnelStatistics>> map  = new HashMap<String, List<PersonnelStatistics>>();
			for (int i = 0; i < personnels.size(); i++) {
				PersonnelStatistics comm = new PersonnelStatistics();
				comm.setUserName(personnels.get(i).getUserName());
				comm.setNum(personnels.get(i).getId());
				arryList.add(comm);
			}
			map.put("jiangbo", arryList);
			JSONArray json = JSONArray.fromObject(arryList, jsonConfig);
			System.out.println(json.toString());
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(json);
			out.flush();
			out.close();
		}
	}
}
