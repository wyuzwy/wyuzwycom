package cn.wyu.service;

import cn.wyu.pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface UserService {




   //获取验证码
   void verify(HttpServletRequest request, HttpServletResponse response,String name) throws IOException;

    //查询所有用户
//   List<User> findAllUser();

   //模糊查找用户(包括查询所有用户）
    Map<String,Object> findUserByCondition(User user,String page,String row);

   //根据ID查找用户
   Map<String,Object> findUserById(String number);

   //登录功能
   Map<String,Object> findUserById(String number, String password,String verify, HttpServletRequest request);

   //找回密码
   Map<String,Object>uploadPassword(String number, String phone,String verify, HttpServletRequest request);


   //退出登录
   String exit(HttpSession session);

   //添加用户
   Map<String,Object> addUser(User user);

   //修改用户
   Map<String,Object> updateUser(User user);

   //根据ID删除用户(可进行批量删除）
   Map<String,Object> deleteUserById(String number);

}
