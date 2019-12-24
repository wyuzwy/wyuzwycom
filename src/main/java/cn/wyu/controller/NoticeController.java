package cn.wyu.controller;

import cn.wyu.pojo.Notice;
import cn.wyu.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.Map;

@Controller
public class NoticeController {


    @Autowired
    private NoticeService noticeService;



    /**
     * 添加公告
     * @param notice
     * @return
     */
    @RequestMapping("/addNotice")
    @ResponseBody
    public Map addNotice(Notice notice){
        return noticeService.addNotice(notice);
    }

    /**
     * 查询某公告的详情
     * @param id
     * @return
     * @throws IOException
     */
    @RequestMapping("/noticeDetailsById")
    public ModelAndView changePage(Integer id) {
        return noticeService.changePage(id);
    }

    /**
     * 更新公告
     * @param notice
     * @return
     */
    @RequestMapping("/updateNotice")
    @ResponseBody
    public Map updateNotice(Notice notice){
        return noticeService.updateNotice(notice);
    }

    /**
     * 查询所有(支持模糊查询)
     * @param notice
     * @return
     * @throws IOException
     */
    @RequestMapping("/findNotice")
    @ResponseBody
    public Map findNotice(Notice notice,@RequestParam("page")String page,
                          @RequestParam("rows")String rows) {
        return noticeService.findNoticeByExample(notice,page,rows);
    }


    /**
     * 用于修改业务的查询
     * @param id
     * @return
     * @throws IOException
     */
    @RequestMapping("/getNoticeById")
    @ResponseBody
    public Map findNoticeById(Integer id) {

        return noticeService.findNoticeById(id);
    }

    @RequestMapping(value = "/deleteNotice/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Map deleteNotice(@PathVariable("ids") String ids){
        return noticeService.deleteNoticeById(ids);
    }
}
