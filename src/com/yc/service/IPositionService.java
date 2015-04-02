package com.yc.service;

import java.util.List;

import com.yc.entity.user.Positions;

public interface IPositionService extends IGenericService<Positions> {

	List<Positions> getPositionByParent();

	boolean deleteForTree(Positions positions);

}
