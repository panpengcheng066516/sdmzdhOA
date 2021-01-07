package com.zdh.web.filter;

import com.zdh.domain.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "RootFilter")
public class RootFilter implements Filter {
    public void destroy() {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        //校验用户是否登录----校验session是否存在user对象
        HttpSession session = request.getSession();

        //		设置编码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        //判断用户是否已经登录 未登录下面代码不执行
        User user = (User) session.getAttribute("user");
        if(user==null){
            //没有登录
            PrintWriter out = resp.getWriter();
            out.print("<script>alert('登录超时，请重新登录！');window.location='"+request.getContextPath()+"/login.jsp';</script>");
            return;
        }else{
            if(user.getPower()!=0){
                PrintWriter out = resp.getWriter();
                out.print("<script>alert('您无权访问！');window.location='"+request.getContextPath()+"/index.jsp';</script>");
                return;
            }
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
