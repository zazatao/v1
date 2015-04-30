package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.Material;

public interface IMaterialService extends IGenericService<Material>{

	List<Material> getAllByParametersForManage(Map<String, Object> map);

}
