
package com.yc.service;

import com.yc.entity.user.User;

public interface IUserService extends IGenericService<User> {

	User getUser(String name);
   
}
