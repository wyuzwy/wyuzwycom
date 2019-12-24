package cn.wyu.controller;

import cn.wyu.pojo.Dept;
import cn.wyu.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;



    @RequestMapping("/allDept")
    @ResponseBody
    public List findAllDept(){
        return deptService.findAllDept();
    }

    @RequestMapping("/addDept")
    @ResponseBody
    public Map addDept(Dept dept){
        return deptService.addDept(dept);
    }



    @RequestMapping("/findDept")
    @ResponseBody
    public Map findDept(Dept dept,@RequestParam("page")String page,
                       @RequestParam("rows")String rows) {
        return deptService.findDeptByExample(dept,page,rows);
    }


    @RequestMapping("/updateDept")
    @ResponseBody
    public Map updateDept(Dept dept){
        return deptService.updateDept(dept);
    }

    @RequestMapping(value = "/deleteDept/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Map deleteDept(@PathVariable("ids") String ids){
        return deptService.deleteDeptById(ids);
    }
}
