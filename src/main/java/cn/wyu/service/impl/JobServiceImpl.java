package cn.wyu.service.impl;

import cn.wyu.dao.JobMapper;
import cn.wyu.pojo.Job;
import cn.wyu.pojo.JobExample;
import cn.wyu.service.JobService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JobServiceImpl implements JobService {

    @Autowired
    private JobMapper jobMapper;

    @Override
    public List<Job> findAllJob() {
        List<Job> jobss= new ArrayList<>();
        Job job = new Job();
        job.setId(0);
        job.setName("请选择...");
        jobss.add(job);
        List<Job> jobs = jobMapper.selectByExample(null);
        jobss.addAll(jobs);
        return jobss;
    }

    @Override
    public Map<String,Object> findJobByExample(Job job,String page,String rows) {
        Map<String,Object> map = new HashMap<>();
        PageHelper.startPage(Integer.parseInt(page), Integer.parseInt(rows));
        List<Job> jobs = jobMapper.selectByCondition(job);
        PageInfo pageInfo = new PageInfo(jobs,Integer.parseInt(page));
        map.put("rows",jobs);
        map.put("total",pageInfo.getTotal());
        return map;
    }

    @Override
    public Map<String,Object> findJobById(int id) {

        return null;
    }

    @Override
    public Map<String,Object> addJob(Job job) {
        Map<String,Object> map = new HashMap<>();
        int flag= jobMapper.insertSelective(job);
        if(flag>0){
            map.put("flag","200");
        }else{
            map.put("flag","100");
        }

        return map;
    }

    @Override
    public Map<String,Object> updateJob(Job job) {
        Map<String,Object> map = new HashMap<>();
        int flag = jobMapper.updateByPrimaryKeySelective(job);
        if(flag>0) {
            map.put("flag", "200");
        }else{
            map.put("flag", "100");
        }

        return map;
    }

    @Override
    public Map<String,Object> deleteJobById(String id) {
        Map<String,Object> map = new HashMap<>();
        String[] ids = id.split(",");
        List<Integer> idss = new ArrayList<>();
        for(String i : ids){
            idss.add(Integer.valueOf(i));
        }
        JobExample jobExample = new JobExample();
        JobExample.Criteria criteria = jobExample.createCriteria();
        criteria.andIdIn(idss);
        int count = jobMapper.deleteByExample(jobExample);
        if(count>0){
            map.put("flag","200");
            map.put("count",count);
        }else{
            map.put("flag","100");
        }

        return map;
    }
}
