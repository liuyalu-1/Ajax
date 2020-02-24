package com.baizhi.service;


import com.baizhi.entity.User;

import java.util.List;

public interface UserService {
    //检查用户名是否重名
    public User selectAllUser(String username);
    //查询所有
    public List<User> AllUser();
}
