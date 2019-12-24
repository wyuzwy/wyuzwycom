package cn.wyu.filter;

import cn.wyu.pojo.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * jsp页面过滤器
 */
public class UrlFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //对全栈的url进行过滤
        //将servletRequest和servletResponse对象强转为http类型
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        //获取访问的地址
        String url = request.getRequestURI();
        System.out.println(url);

//        String[] urls = {"/login","/index",".js",".css",".ico",".jpg",".png",".gif"};
//
//        boolean flag = true;
//        for (String str : urls) {
//            if (url.indexOf(str) != -1) {
//                flag =false;
//                break;
//            }
//        }
        //获取session中的对象判断是否登录
        //拦截所有的jsp页面但不包含index.jsp和login请求
        //因为jsp文件没有放到WEN-INF下，所以需要过滤，而且还需要过滤掉除登录的请求外的其他请求
        if(!url.contains("login")&&!url.contains("index")&&!url.contains("easyui")&&!url.contains("login_style")&&
                !url.contains("static")&&!url.contains("setVerify")&&!url.contains("findPassword")){
//        if(!url.contains("login")&&!url.contains("index")){
            //获取session
            HttpSession session = request.getSession();
            //获取session域的user对象
            User user = (User)session.getAttribute("user");
            //System.out.println(user);
            if(user==null){//若对象为空，
                //则重定向回登录界面index.jsp
                //System.out.println("要重定向了！！！");
                response.sendRedirect("/index.jsp");
                //结束
                return;
            }
        }
        //继续执行过滤连的剩余部分
        filterChain.doFilter(request,response);


    }

    @Override
    public void destroy() {

    }
}
