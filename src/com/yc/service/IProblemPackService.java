package com.yc.service;

import java.util.List;

import com.yc.entity.ProblemPack;

public interface IProblemPackService extends IGenericService<ProblemPack> {

	List<ProblemPack> getProblemPackByUser(Integer id);

}
