package cn.wyu.service;

import cn.wyu.pojo.Dept;

import java.util.List;
import java.util.Map;

public interface DeptService {

    //查询所有部门
    public List<Dept> findAllDept();

    //模糊查找部门
    Map<String,Object> findDeptByExample(Dept dept,String page,String rows);

    //根据ID查找部门
    Map<String,Object> findDeptById(int id);

    //添加部门
    Map<String,Object> addDept(Dept dept);

    //修改部门
    Map<String,Object> updateDept(Dept dept);

    //根据ID删除部门
    Map<String,Object> deleteDeptById(String id);
}
