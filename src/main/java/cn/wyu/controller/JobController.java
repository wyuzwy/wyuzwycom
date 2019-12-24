package cn.wyu.controller;

import cn.wyu.pojo.Job;
import cn.wyu.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class JobController {

    @Autowired
    private JobService jobService;

    @RequestMapping("/allJob")
    @ResponseBody
    public List findAllJob(){

        return jobService.findAllJob();
    }

    @RequestMapping("/addJob")
    @ResponseBody
    public Map addJob(Job job){


        return jobService.addJob(job);
    }



    @RequestMapping("/findJob")
    @ResponseBody
    public Map findJob(Job job,@RequestParam("page")String page,
                       @RequestParam("rows")String rows) {
        return jobService.findJobByExample(job,page,rows);
    }


    @RequestMapping("/updateJob")
    @ResponseBody
    public Map updateJob(Job job){

        return jobService.updateJob(job);
    }

    @RequestMapping(value = "/deleteJob/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Map deleteJob(@PathVariable("ids") String ids){

        return jobService.deleteJobById(ids);
    }
}
