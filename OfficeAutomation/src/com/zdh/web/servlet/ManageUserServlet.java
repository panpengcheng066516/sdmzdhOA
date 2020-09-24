package com.zdh.web.servlet;

import com.zdh.domain.User;
import com.zdh.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

public class ManageUserServlet extends BaseServlet {
    //用户列表
    public void findAllUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        UserService service = new UserService();
        List<User> list = service.findAllUser();
        request.setAttribute("userList",list);
        request.getRequestDispatcher("").forward(request,response);
    }

    //用户添加
    public void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        UserService service = new UserService();

        User user = new User();
        Map<String, String[]> map = request.getParameterMap();
        BeanUtils.populate(user,map);

        String username = request.getParameter("username");
        boolean b = service.checkUsername(username);
        if(b){
            PrintWriter out = response.getWriter();
            out.print("<script>alert('用户名已存在！添加失败');window.location='"+request.getContextPath()+"/login.jsp';</script>");
            return;
        }
        int i = service.addUser(user);
        if(i>0){
            PrintWriter out = response.getWriter();
            out.print("<script>alert('添加成功！');window.location='"+request.getContextPath()+"/login.jsp';</script>");
        }else{
            PrintWriter out = response.getWriter();
            out.print("<script>alert('添加失败！');window.location='"+request.getContextPath()+"/login.jsp';</script>");
        }
    }


    //用户信息修改
    public void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        UserService service = new UserService();

        User user = new User();
        Map<String, String[]> map = request.getParameterMap();
        BeanUtils.populate(user,map);

        String username = request.getParameter("username");

        int i = service.updateUser(user);
        if(i>0){
            PrintWriter out = response.getWriter();
            out.print("<script>alert('修改成功！');window.location='"+request.getContextPath()+"/login.jsp';</script>");
        }else{
            PrintWriter out = response.getWriter();
            out.print("<script>alert('修改失败！');window.location='"+request.getContextPath()+"/login.jsp';</script>");
        }
    }
}
