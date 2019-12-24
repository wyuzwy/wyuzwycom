package cn.wyu.service.impl;

import cn.wyu.dao.EmployeeMapper;
import cn.wyu.pojo.Employee;
import cn.wyu.pojo.EmployeeExample;
import cn.wyu.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;



    @Override
    public List<Employee> findAllEmployee() {
        return null;
    }

    @Override
    public Map<String, Object> findEmployeeByExample(Employee employee, String page, String rows) {
        Map<String,Object> map = new HashMap<>();

        if(employee.getDeptId()==null){
            employee.setDeptId(0);
        }
        if(employee.getSex()==null){
            employee.setSex(0);
        }
        if(employee.getJobId()==null){
            employee.setJobId(0);
        }
        PageHelper.startPage(Integer.parseInt(page), Integer.parseInt(rows));
        List<Employee> employees = employeeMapper.selectWithExample(employee);
        PageInfo pageInfo = new PageInfo(employees,Integer.parseInt(page));
        map.put("rows",employees);
        map.put("total",pageInfo.getTotal());


        return map;
    }

    @Override
    public Map<String, Object> findEmployeeById(int id) {
        return null;
    }

    @Override
    public Map<String, Object> addEmployee(Employee employee,String birthday) throws ParseException {
        Map<String,Object> map = new HashMap<>();
        SimpleDateFormat df = new SimpleDateFormat("yyy-MM-dd");
        Date dt = df.parse(birthday);
        employee.setBrithday(dt);
        int flag = employeeMapper.insertSelective(employee);
        if(flag>0){
            map.put("flag","200");
        }else{
            map.put("flag","100");
        }
        return map;
    }

    @Override
    public Map<String, Object> updateEmployee(Employee employee,String birthday) throws ParseException {
        Map<String,Object> map = new HashMap<>();
        SimpleDateFormat df = new SimpleDateFormat("yyy-MM-dd");
        Date dt = df.parse(birthday);
        employee.setBrithday(dt);
        int flag = employeeMapper.updateByPrimaryKeySelective(employee);
        if(flag>0){
            map.put("flag","200");
        }else {
            map.put("flag", "100");
        }

        return map;
    }

    @Override
    public Map<String, Object> deleteEmployeeById(String id) {
        Map<String,Object> map = new HashMap<>();
        String[] ids = id.split(",");
        List<Integer> idss = new ArrayList<>();
        for(String i : ids){
            idss.add(Integer.valueOf(i));
        }
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andIdIn(idss);
        int count = employeeMapper.deleteByExample(employeeExample);
        if(count>0){
            map.put("flag","200");
            map.put("count",count);
        }else{
            map.put("flag","100");
        }
        return map;
    }
}
