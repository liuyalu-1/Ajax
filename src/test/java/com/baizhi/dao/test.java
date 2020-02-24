package com.baizhi.dao;

import com.baizhi.entity.User;
import com.baizhi.util.MybatisUtil;
import org.junit.Test;

import java.util.List;

public class test {
    @Test
    public void test1(){
        UserDao dao = (UserDao) MybatisUtil.getMapper(UserDao.class);
        List<User> users = dao.queryAllUser();
        System.out.println(users);
    }
}
