package com.yc.service;

import com.yc.entity.PackageSize;

public interface IPackageSizeService extends IGenericService<PackageSize> {
    //模糊查询
	PackageSize findByName();
               
	        
} 
