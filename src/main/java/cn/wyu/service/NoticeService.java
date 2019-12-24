package cn.wyu.service;

import cn.wyu.pojo.Notice;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

public interface NoticeService {

    //查询某个公告详情
    ModelAndView changePage(int id);

    //模糊查找公告
    Map<String,Object> findNoticeByExample(Notice notice, String page, String rows);

    //根据ID查找公告
    Map<String,Object> findNoticeById(int id);

    //添加公告
    Map<String,Object> addNotice(Notice notice);

    //修改公告
    Map<String,Object> updateNotice(Notice notice);

    //根据ID删除公告
    Map<String,Object> deleteNoticeById(String id);
}
