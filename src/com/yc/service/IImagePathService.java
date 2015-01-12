package com.yc.service;

import java.util.List;

import com.yc.entity.ImagePath;

public interface IImagePathService extends IGenericService<ImagePath> {
	public List<ImagePath> getImageByUnkownComm(int parseInt);
}
