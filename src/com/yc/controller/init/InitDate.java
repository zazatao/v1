package com.yc.controller.init;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.service.IDepartAndPositionsService;
import com.yc.service.IDepartmentService;
import com.yc.service.IPersonnelService;
import com.yc.service.IPositionService;


/**
 * @author Administrator
 *
 */
@Repository
public class InitDate implements ApplicationListener{
	
	@Resource
	 IDepartmentService departmentService;
	@Resource
	IPersonnelService personnelService;
	@Resource
	IPositionService positionService ;
	@Resource
	IDepartAndPositionsService departAndPositionsService; 
	
	@Override
	public void onApplicationEvent(ApplicationEvent arg0) {
		initArticleDeparment();
		initArticlePositions();
		initArticleDepartAndPositions();
		initArticleAdministrator();
	}

	/**
	 * 初始化部门信息
	 */
	private void initArticleDeparment() {
                     Department dept=departmentService.findById(1);
                     if (dept==null) {
                    	 String[] list=new String[]{"ZAZATAO,网上商城,null","采购部,负责采购,1","中转部,中转包裹,1","仓储物流部,仓储物流,1","财务部,公司财务,1","网站维护部,网站维护,1","客服部,客户维护,1","仓储部,仓储物流,4","包裹包装部,包裹包装,4"};
                               for (int i = 0; i < list.length; i++) {
								       String str=list[i];
								       String[] nStr = str.split(",");
								       Department ndept=new Department();
								       ndept.setDepartmentname(nStr[0]);
								       ndept.setDescribes(nStr[1]);
								       if(i==0){
								    	   ndept.setParentLevel(null);
								       }else{
								    	   Department fDept=departmentService.findById(nStr[2]);
								    	   ndept.setParentLevel(fDept);
								       }
								       departmentService.save(ndept);
							}
                     
                     }
	}
	
	/**
	 * 初始化职位
	 */
	private void initArticlePositions() {
		      List<Positions> positionsList=positionService.getAll();
		      if(positionsList.size()<=0){
		    	        String[] strs=new String[]{"总经理,null","部门经理,1","部门主管,2","员工,3"};
		    	        for (int i = 0; i < strs.length; i++) {
							   String[] str=strs[i].split(",");
							   Positions nposition=new Positions();
							   nposition.setPositionname(str[0]);
							   if(i==0){
								   nposition.setParentLevel(null);
							   }else{
								   Positions fposition=positionService.findById(str[1]);
								   nposition.setParentLevel(fposition);
							   }
							   positionService.save(nposition);
						}
		      }
		
	}
	
	/**
	 * 初始化DepartAndPositions
	 */
	private void initArticleDepartAndPositions() {
		List<DepartAndPositions> dpsList=departAndPositionsService.getAll();
		if(dpsList.size()<=0){
			DepartAndPositions dps=new DepartAndPositions();
			Department dept=departmentService.findById(1);
			Positions pst=positionService.findById(1);
			dps.setDepartment(dept);
			dps.setPositions(pst);
			departAndPositionsService.save(dps);
		}
	}
	  
	
	/**
	 * 初始化administrator
	 */
	private void initArticleAdministrator() {
		             List<Personnel> personnels=personnelService.getAll();
		             if(personnels.size()<=0){
		            	 Personnel npersonnel=new Personnel();
		            	 npersonnel.setLoginName("administrator");
		            	 npersonnel.setPassword("000000");
		            	 npersonnel.setForbidden(null);
		            	 DepartAndPositions dpps=departAndPositionsService.findById(1);
		            	 npersonnel.setDepartAndPositions(dpps);
		            	 personnelService.save(npersonnel);
		             }
	}
   
	
	
	
}
