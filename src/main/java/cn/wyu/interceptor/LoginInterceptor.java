package cn.wyu.interceptor;

import cn.wyu.pojo.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * 自定义拦截器
 */
public class LoginInterceptor  extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        //System.out.println("session="+user);
        if(user==null){
            response.sendRedirect(request.getContextPath()+"/index.jsp");
            return false;
        }
        return true;
    }
}
