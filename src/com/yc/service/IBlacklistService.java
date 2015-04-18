package com.yc.service;

import java.util.List;

import com.yc.entity.Blacklist;
import com.yc.entity.BlacklistType;

public interface IBlacklistService extends IGenericService<Blacklist> {

	List<Blacklist> getBlacklistByBlacklistType(BlacklistType stores);

}
