package cn.wyu.controller;

import cn.wyu.pojo.Employee;
import cn.wyu.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.text.ParseException;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;


    @RequestMapping("/findEmp")
    @ResponseBody
    public Map findEmployee(Employee employee,@RequestParam("page")String page,
                            @RequestParam("rows")String rows) throws IOException {
        return employeeService.findEmployeeByExample(employee,page,rows);
    }


    @RequestMapping("/addEmp")
    @ResponseBody
    public Map addEmp(Employee employee,@RequestParam("birthday")String birthday) throws ParseException {

        return employeeService.addEmployee(employee,birthday);
    }


    @RequestMapping("/updateEmp")
    @ResponseBody
    public Map updateEmp(Employee employee,@RequestParam("birthday")String birthday) throws ParseException {
        return employeeService.updateEmployee(employee,birthday);
    }

    @RequestMapping(value = "/deleteEmp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Map deleteUser(@PathVariable("ids") String ids){
        return employeeService.deleteEmployeeById(ids);
    }
}
