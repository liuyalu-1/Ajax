package com.baizhi.dao;

import com.baizhi.entity.User;

import java.util.List;

public interface UserDao {
    //检查是否重名
    public User selectAll(String username);
    //展示所有
    public List<User> queryAllUser();
}
