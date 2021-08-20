package Config;

import entity.Admin;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HandConfig implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        if(url.indexOf("/login") >= 0){
            return true;
        }
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin != null){
            return true;
        }else {
            request.setAttribute("mag",InformationConfig.Permissions);
            request.getRequestDispatcher("/admin/login").forward(request,response);
            return false;
        }
    }
}
