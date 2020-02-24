package com.baizhi.action;


import com.alibaba.fastjson.JSON;
import com.baizhi.entity.User;
import com.baizhi.serviceImpl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class UserAction extends ActionSupport {
    //接收用户名
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String queryAllUser(){
        System.out.println("++++++++++");
        //调用业务
        UserServiceImpl userService = new UserServiceImpl();

        User user = userService.selectAllUser(username);
        //获取response

        HttpServletResponse response = ServletActionContext.getResponse();
        //设置响应时的编码
        response.setCharacterEncoding("UTF-8");
        try{
            PrintWriter out=response.getWriter();
            //判断user是否为null
            if(user!=null){
                //说明已经注册过
                out.print("用户名已经被注册不可用");
            }else{
                //说明尚未注册
                out.print("用户名尚未注册 可用");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    //查询所有
    public String AllUser(){
        System.out.println("11111111111");
        UserServiceImpl userService = new UserServiceImpl();
        List<User> users = userService.AllUser();
        System.out.println(users);
        //把集合转换为json协议串
        String jsonString = JSON.toJSONString(users);
        //通过输出流响应JSON协议串
        HttpServletResponse response = ServletActionContext.getResponse();
        //转换编码，jsp里是UTF-8的
        response.setCharacterEncoding("UTF-8");

        try {
            PrintWriter writer = response.getWriter();
            writer.print(jsonString);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
