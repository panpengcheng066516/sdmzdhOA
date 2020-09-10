package com.zdh.web.servlet;
import com.zdh.domain.User;
import com.zdh.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserServlet extends BaseServlet{
    //用户登录
    public void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        HttpSession session = request.getSession();

        //获得输入的用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Map<String,String[]> map =  request.getParameterMap();
        User user2 = new User();
        BeanUtils.populate(user2,map);

        //将用户名和密码传递给service层
        UserService service = new UserService();
        User user = null;
        try {
            user = service.login(username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //判断用户是否登录成功 user是否是null
        if(user!=null){
            //登录成功
            String autoLogin = request.getParameter("autoLogin");
            //将user对象存到session中
            session.setAttribute("user", user);
            //重定向到首页
            System.out.println("登陆成功"+user.getPassword()+""+user.getUsername());
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }else{
            request.setAttribute("loginError", "用户名或密码错误");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
