package com.baizhi.serviceImpl;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.util.MybatisUtil;

import java.util.List;

public class UserServiceImpl implements UserService {
    @Override
    //检查用户名是否重名
    public User selectAllUser(String username) {
        UserDao dao = (UserDao) MybatisUtil.getMapper(UserDao.class);

        User user = dao.selectAll(username);
        MybatisUtil.close();
        return user;
    }

    @Override
    //查询所有
    public List<User> AllUser() {
        UserDao dao = (UserDao) MybatisUtil.getMapper(UserDao.class);
        List<User> users = dao.queryAllUser();
        MybatisUtil.close();
        return users;
    }
}
