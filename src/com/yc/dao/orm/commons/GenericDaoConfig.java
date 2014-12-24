
package com.yc.dao.orm.commons;

import org.springframework.context.annotation.*;

import com.yc.entity.*;
import com.yc.entity.user.User;

@Configuration
public class GenericDaoConfig {

    @Bean
    public GenericDao<User> getUserDao() {
        return new GenericDaoSupport<User>(User.class);
    }

    @Bean
    public GenericDao<UnKnownCommodity> getUnKnownCommodityDao() {
        return new GenericDaoSupport<UnKnownCommodity>(UnKnownCommodity.class);
    }
    
    @Bean
    public GenericDao<ImagePath> getImagePathDao() {
        return new GenericDaoSupport<ImagePath>(ImagePath.class);
    }
}
