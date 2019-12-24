package cn.wyu.controller;



import cn.wyu.pojo.User;
import cn.wyu.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;



    @RequestMapping("/login")
    @ResponseBody
     public Map login(String number, String password,String verify,HttpServletRequest request) {
        return userService.findUserById(number,password,verify,request);
     }

    @RequestMapping("/exit")
     public String exit(HttpSession session){
            return userService.exit(session);
     }


     //找回密码
    @RequestMapping("/findPassword")
    @ResponseBody
     public Map findPassword(String number,String phone,String verify,HttpServletRequest request){
        return userService.uploadPassword(number, phone, verify, request);
     }


     @RequestMapping("/findUser")
     @ResponseBody
     public Map findUserByCondition(User user,@RequestParam("page")String page,
                           @RequestParam("rows")String rows){
         return userService.findUserByCondition(user,page,rows);
     }

     @RequestMapping("/addUser")
     @ResponseBody
     public Map addUser(User user){
        return userService.addUser(user);
     }


     @RequestMapping("/finNumber")
     @ResponseBody
     public Map findNumber(String number){
        return userService.findUserById(number);
     }

    @RequestMapping("/updateUser")
    @ResponseBody
     public Map updateUser(User user){
         return userService.updateUser(user);
     }

     @RequestMapping(value = "/deleteUser/{ids}",method = RequestMethod.DELETE)
     @ResponseBody
     public Map deleteUser(@PathVariable("ids") String ids){
         return userService.deleteUserById(ids);
     }

    @RequestMapping("/setVerify")
     public void verify(HttpServletRequest request, HttpServletResponse response, String name) throws IOException {
        userService.verify(request,response,name);
     }

}
