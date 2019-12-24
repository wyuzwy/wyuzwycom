package cn.wyu.service;

import cn.wyu.pojo.Job;

import java.util.List;
import java.util.Map;

public interface JobService {

    //查询所有职位
     List<Job> findAllJob();

    //模糊查找职位
    Map<String,Object> findJobByExample(Job job,String page,String row);

    //根据ID查找职位
    Map<String,Object> findJobById(int id);

    //添加职位
    Map<String,Object> addJob(Job job);

    //修改职位
    Map<String,Object> updateJob(Job job);

    //根据ID删除职位
    Map<String,Object> deleteJobById(String id);
}
