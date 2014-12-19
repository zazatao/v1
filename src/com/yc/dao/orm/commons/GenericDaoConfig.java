
package com.yc.dao.orm.commons;

import org.springframework.context.annotation.*;

import com.yc.entity.*;
import com.yc.entity.user.Admin;
import com.yc.entity.user.User;

@Configuration
public class GenericDaoConfig {

    @Bean
    public GenericDao<User> getUserDao() {
        return new GenericDaoSupport<User>(User.class);
    }


}
