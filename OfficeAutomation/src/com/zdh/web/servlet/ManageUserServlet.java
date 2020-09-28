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
        request.getRequestDispatcher("/root/management.jsp").forward(request,response);
    }

    //用户添加
    public void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        UserService service = new UserService();

        //获得user对象
        User user = new User();
        Map<String, String[]> map = request.getParameterMap();
        BeanUtils.populate(user,map);
        user.setTransfer(0);
        user.setInuse(0);
        String password = request.getParameter("password");
        String password1 = request.getParameter("password1");

        String username = request.getParameter("username");
        boolean b = service.checkUsername(username);
        if(b){
            request.setAttribute("registerError", "用户名已存在！添加失败");
            request.getRequestDispatcher("/root/signup.jsp").forward(request, response);
            return;
        }
        if(!password.equals(password1)){
            request.setAttribute("registerError", "两次密码不一致，请重新填写！");
            request.getRequestDispatcher("/root/signup.jsp").forward(request, response);
            return;
        }

        int i = service.addUser(user);
        if(i>0){
            PrintWriter out = response.getWriter();
            out.print("<script>alert('添加成功！');window.location='"+request.getContextPath()+"/root/signup.jsp';</script>");
        }else{
            PrintWriter out = response.getWriter();
            out.print("<script>alert('添加失败！');window.location='"+request.getContextPath()+"/root/signup.jsp';</script>");
        }
    }


    //用户信息修改
    public void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        UserService service = new UserService();

        User user = new User();
        Map<String, String[]> map = request.getParameterMap();
        BeanUtils.populate(user,map);

        String password = request.getParameter("password");
        String password1 = request.getParameter("password1");

        if(!password.equals(password1)){
            request.setAttribute("updateError", "两次密码不一致，请重新填写！");
            request.getRequestDispatcher("/manageUserServlet?method=findAllUser").forward(request, response);
            return;
        }

        int i = service.updateUser(user);
        if(i>0){
            PrintWriter out = response.getWriter();
            out.print("<script>alert('修改成功！');window.location='"+request.getContextPath()+"/manageUserServlet?method=findAllUser';</script>");
        }else{
            PrintWriter out = response.getWriter();
            out.print("<script>alert('修改失败！');window.location='"+request.getContextPath()+"/manageUserServlet?method=findAllUser';</script>");
        }
    }
}
