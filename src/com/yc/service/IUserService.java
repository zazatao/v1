
package com.yc.service;

import java.util.List;

import com.yc.entity.user.Role;
import com.yc.entity.user.User;

public interface IUserService {
    User getUser(String name);

    boolean update(User user);

    boolean regist(User user);

    List getAll(Role patient);

    User getUserByID(int parseInt);

   
}
