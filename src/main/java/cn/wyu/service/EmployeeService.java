package cn.wyu.service;

import cn.wyu.pojo.Employee;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

public interface EmployeeService {


    //查询所有员工
    public List<Employee> findAllEmployee();

    //模糊查找员工
    Map<String,Object> findEmployeeByExample(Employee employee,String page,String rows);

    //根据ID查找员工
    Map<String,Object> findEmployeeById(int id);

    //添加员工
    Map<String,Object> addEmployee(Employee employee,String birthday) throws ParseException;

    //修改员工
    Map<String,Object> updateEmployee(Employee employee,String birthday) throws ParseException;

    //根据ID删除员工
    Map<String,Object> deleteEmployeeById(String  id);

}
