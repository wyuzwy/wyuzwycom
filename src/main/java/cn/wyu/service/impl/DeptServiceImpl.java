package cn.wyu.service.impl;

import cn.wyu.dao.DeptMapper;
import cn.wyu.pojo.Dept;
import cn.wyu.pojo.DeptExample;
import cn.wyu.service.DeptService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DeptServiceImpl implements DeptService {


    @Autowired
    private DeptMapper deptMapper;


    @Override
    public List<Dept> findAllDept() {
        List<Dept> depts = new ArrayList<>();
        Dept dept = new Dept();
        dept.setId(0);
        dept.setName("请选择...");
        depts.add(dept);
        List<Dept> depts1=deptMapper.selectByExample(null);
        depts.addAll(depts1);
        return depts;
    }

    @Override
    public Map<String, Object> findDeptByExample(Dept dept, String page, String rows) {
        Map<String,Object> map = new HashMap<>();
        PageHelper.startPage(Integer.parseInt(page), Integer.parseInt(rows));
        List<Dept> depts = deptMapper.selectByCondition(dept);
        PageInfo pageInfo = new PageInfo(depts,Integer.parseInt(page));
        map.put("rows",depts);
        map.put("total",pageInfo.getTotal());


        return map;
    }

    @Override
    public Map<String, Object> findDeptById(int id) {
        return null;
    }

    @Override
    public Map<String, Object> addDept(Dept dept) {
        Map<String,Object> map = new HashMap<>();
        System.out.println(dept);
        int flag= deptMapper.insertSelective(dept);
        System.out.println(flag);
        if(flag>0){
            map.put("flag","200");
        }else{
            map.put("flag","100");
        }
        return map;
    }

    @Override
    public Map<String, Object> updateDept(Dept dept) {
        Map<String,Object> map = new HashMap<>();
        int flag = deptMapper.updateByPrimaryKeySelective(dept);
        if(flag>0){
            map.put("flag","200");
        }else{
            map.put("flag","100");
        }
        return map;
    }

    @Override
    public Map<String, Object> deleteDeptById(String id) {
        Map<String,Object> map = new HashMap<>();
        String[] ids = id.split(",");
        List<Integer> idss = new ArrayList<>();
        for(String i : ids){
            idss.add(Integer.valueOf(i));
        }
        DeptExample deptExample = new DeptExample();
        DeptExample.Criteria criteria = deptExample.createCriteria();
        criteria.andIdIn(idss);
        int count = deptMapper.deleteByExample(deptExample);
        if(count>0){
            map.put("flag","200");
            map.put("count",count);
        }else{
            map.put("flag","100");
        }
        return map;
    }
}
