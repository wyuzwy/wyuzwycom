package cn.wyu.service.impl;

import cn.wyu.dao.NoticeMapper;
import cn.wyu.pojo.Notice;
import cn.wyu.pojo.NoticeExample;
import cn.wyu.service.NoticeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public ModelAndView changePage(int id) {
        ModelAndView mv = new ModelAndView();
        Notice notice=noticeMapper.selectByPrimaryKey(id);
        mv.addObject("notice",notice);
        mv.setViewName("showNotice");
        return mv;
    }

    //查询所有公告
    @Override
    public Map<String, Object> findNoticeByExample(Notice notice, String page, String rows) {
        Map<String,Object> map = new HashMap<>();
        PageHelper.startPage(Integer.parseInt(page), Integer.parseInt(rows));
        List<Notice> notices = noticeMapper.selectByCondition(notice);
        PageInfo pageInfo = new PageInfo(notices,Integer.parseInt(page));
        map.put("rows",notices);
        map.put("total",pageInfo.getTotal());
        return map;
    }


    /**
     * 用于修改业务的查询
     * @param id
     * @return
     */
    @Override
    public Map<String, Object> findNoticeById(int id) {
        Map<String,Object> map = new HashMap<>();
        Notice notice=noticeMapper.selectByPrimaryKey(id);
        map.put("row",notice);
        map.put("flag","200");
        return map;
    }

    @Override
    public Map<String, Object> addNotice(Notice notice) {
        Map<String,Object> map = new HashMap<>();
        Date time = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String date = format.format(time);
        notice.setRemark(date);
        int flag = noticeMapper.insertSelective(notice);
        if(flag>0){
            map.put("flag","200");
        }else{
            map.put("flag","100");
        }
        return map;
    }

    @Override
    public Map<String, Object> updateNotice(Notice notice) {
        Map<String,Object> map = new HashMap<>();
        Date time = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String date = format.format(time);
        notice.setRemark(date);
        int flag=noticeMapper.updateByPrimaryKeySelective(notice);
        if(flag>0){
            map.put("flag","200");
        }else {
            map.put("flag", "100");
        }
        return map;
    }

    @Override
    public Map<String, Object> deleteNoticeById(String id) {
        Map<String,Object> map = new HashMap<>();
        String[] ids = id.split(",");
        List<Integer> idss = new ArrayList<>();
        for(String i : ids){
            idss.add(Integer.valueOf(i));
        }
        NoticeExample noticeExample = new NoticeExample();
        NoticeExample.Criteria criteria = noticeExample.createCriteria();
        criteria.andIdIn(idss);
        int count = noticeMapper.deleteByExample(noticeExample);
        if(count>0){
            map.put("flag","200");
            map.put("count",count);
        }else{
            map.put("flag","100");
        }

        return map;
    }
}
