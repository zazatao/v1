package com.yc.controller.shop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.PackageGenre;
import com.yc.entity.PackageSize;
import com.yc.service.IPackageGenreService;
import com.yc.service.IPackageSizeService;

//商店材料
@Controller
@RequestMapping("/shop")
public class PackageGenreController {
	
	/*@Autowired
	IPackageGenreService packageGenreService;
	
	@Autowired
	IPackageSizeService packageSizeService;

	//获得所有材料
	@RequestMapping(value = "material", method = RequestMethod.GET)
	public ModelAndView getAllMaterial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<PackageGenre> materialList = packageGenreService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("materiallist", materialList);
		return new ModelAndView("shop/packageGenre", mode);
	}
	
	@RequestMapping(value = "deleteMaterial", method = RequestMethod.GET)
	public String deleteMaterial(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		packageGenreService.delete(id);
		return "redirect:/shop/material";
	}
	
	@RequestMapping(value = "addMaterial", method = RequestMethod.GET)
	public ModelAndView addMaterial(Integer id, String mathed, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<PackageSize> sizes = packageSizeService.getAll();
		if (mathed.equals("add")) {
			if (id != null) {
				mode.put("id", id);
				mode.put("mathed", "add");
				mode.put("page", "material");
				mode.put("sizes", sizes);
				return new ModelAndView("shop/addPackageGenre", mode);
			} else {
				mode.put("mathed", "add");
				mode.put("page", "material");
				mode.put("sizes", sizes);
				return new ModelAndView("shop/addPackageGenre", mode);
			}
		} else {
			PackageGenre material = packageGenreService.findById(id);
			mode.put("material", material);
			mode.put("mathed", "update");
			mode.put("page", "material");
			mode.put("sizes", sizes);
			return new ModelAndView("shop/addPackageGenre", mode);
		}
	}

	@RequestMapping(value = "addMaterialList", method = RequestMethod.POST)
	public String addMaterialList(Integer id, String attribute, Integer num, Integer price, Integer packageSize_id,
			String mathed, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("packageSize_id___________________"+packageSize_id);
		System.out.println("id___________________"+id);
		if (mathed.equals("add")) {
			if (page.equals("material")) {
				PackageSize size = packageSizeService.findById(packageSize_id);
				PackageGenre material = new PackageGenre();
				material.setNum(num);
				material.setPrice(price);
				material.setAttribute(attribute);
				material.setPackageSize(size);
				material = packageGenreService.save(material);
			}
		} 
		
		else {
			PackageGenre material = packageGenreService.findById(id);
			material.setNum(num);
			material.setPrice(price);
			material.setAttribute(attribute);
			packageGenreService.update(material);
		}
		return "redirect:/shop/packageGenre";
	}*/
}
