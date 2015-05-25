package com.yc.service;

import java.util.List;

import com.yc.entity.UserSize;

public interface IUserSizeService extends IGenericService<UserSize> {
              List<UserSize> findByUserID(Integer id);
              boolean saveSizes(UserSize size);
}
