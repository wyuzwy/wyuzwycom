package cn.wyu.service.impl;

import cn.wyu.utils.VerifyCode;
import cn.wyu.dao.UserMapper;
import cn.wyu.pojo.User;
import cn.wyu.pojo.UserExample;
import cn.wyu.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    //获取验证码
    @Override
    public void verify(HttpServletRequest request, HttpServletResponse response,String name) throws IOException {
        VerifyCode vc = new VerifyCode();//创建验证码类
        BufferedImage image  = vc.getImage();//创建验证码图片
        request.getSession().setAttribute("code", vc.getText());//获取验证码文本,并将其放到session域中
        VerifyCode.output(image, response.getOutputStream());//输出图片到页面

    }

    @Override
    public Map<String,Object> findUserByCondition(User user, String page, String rows) {
        if(user.getStatus()==null){
            user.setStatus(0);
        }
        Map<String, Object> map = new HashMap<>();
        PageHelper.startPage(Integer.parseInt(page), Integer.parseInt(rows));
        List<User> users = userMapper.selectByExampleWithRole(user);
//        System.out.println(users.size()+" "+users.toString());
        PageInfo pageInfo = new PageInfo(users,Integer.parseInt(page));
        map.put("rows",users);
        map.put("total",pageInfo.getTotal());
        return map;
    }

    @Override
    public Map<String,Object> findUserById(String number) {
        Map<String,Object> map = new HashMap<>();
        User user = userMapper.selectByPrimaryKey(number);
        if(user==null){
            map.put("flag","200");
        }else {
            map.put("user",user);
            map.put("flag","100");
        }
        return map;
    }

    /**
     * 登录业务层
     * @param number
     * @param password
     * @param request
     * @return
     */
    @Override
    public Map<String,Object> findUserById(String number, String password,String verify, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        //获取session
        HttpSession session = request.getSession();
        //获取session域的code，用于验证码校验
        String code= (String)session.getAttribute("code");
        if(!verify.equalsIgnoreCase(code)){
            map.put("flag","100");
            map.put("msg","验证码不正确！！！");
            return map;
        }
        User user = userMapper.selectByPrimaryKey(number);
        if(user!=null) {
            //System.out.println("账号正确！");
            if(user.getPassword().equals(password)) {
                //System.out.println("密码也正确，实现跳转！");
                HttpSession httpSession = request.getSession();
                user.setCreatedate(null);
                user.setPassword(null);
                user.setPhone(null);
                user.setRemark(null);
                httpSession.setAttribute("user", user);
                map.put("flag","200");
                map.put("data","http://localhost:8080/main.jsp");
            }else{
                //System.out.println("密码不正确！！！");
                map.put("flag","100");
                map.put("msg","账号或密码不正确！");
            }

        }else{
            //System.out.println("账号不正确！");
            map.put("flag","100");
            map.put("msg","该用户不存在！！");
        }
        return map;
    }

    @Override
    public Map<String, Object> uploadPassword(String number, String phone, String verify, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        //获取session
        HttpSession session = request.getSession();
        //获取session域的code，用于验证码校验
        String code= (String)session.getAttribute("code");
        if(!verify.equalsIgnoreCase(code)){
            map.put("flag","100");
            map.put("msg","验证码不正确！！！");
            return map;
        }
        User user = userMapper.selectByPrimaryKey(number);
        if(user==null){
            map.put("flag","100");
            map.put("msg","该用户不存在，请重试！！！");
            return map;
        }else{
            if(!phone.equals(user.getPhone())){
                map.put("flag","100");
                map.put("msg","手机号码不正确，请重试！！！");
                return map;
            }else{
                String password = "123456";
                user.setPassword(password);
                int flag = userMapper.updateByPrimaryKeySelective(user);
                if(flag>0){
                    map.put("flag","200");
                    map.put("msg","密码为："+password);
                }else {
                    map.put("flag","100");
                    map.put("msg","服务器出错，请稍后再试！！！");
                }
            }
        }

        return map;
    }

    @Override
    public String exit(HttpSession session) {
        session.invalidate();
        return "redirect:/index.jsp";
    }


    @Override
    public Map<String,Object> addUser(User user) {
        Map<String,Object> map = new HashMap<>();
        user.setCreatedate(new Date());
        int flag=userMapper.insert(user);
        if(flag>0){
            map.put("flag","200");
        }else{
            map.put("flag","100");
        }
        return map;
    }

    @Override
    public Map<String,Object> updateUser(User user) {
        Map<String,Object> map = new HashMap<>();
        int flag = userMapper.updateByPrimaryKeySelective(user);
        if(flag>0){
            map.put("flag","200");
        }else {
            map.put("flag","100");
        }
        return map;
    }

    @Override
    public Map<String,Object> deleteUserById(String number) {
        Map<String,Object> map = new HashMap<>();
        String[] num = number.split(",");
        List<String> numbers =Arrays.asList(num);
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andNumberIn(numbers);
        int count = userMapper.deleteByExample(userExample);
        if(count>0){
            map.put("flag","200");
            map.put("count",count);
        }else{
            map.put("flag","100");
        }
        return map;
    }
}
