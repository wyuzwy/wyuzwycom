package cn.wyu.controller;

import cn.wyu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class RoleController {

    @Autowired
    private RoleService roleService;


    @RequestMapping("/allRole")
    @ResponseBody
    public List findAllRole(){
        return roleService.findAllRole();
    }
}
