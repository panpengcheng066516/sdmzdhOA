package com.zdh.web.servlet;

import com.zdh.domain.Jiediao;
import com.zdh.domain.Project;
import com.zdh.domain.User;
import com.zdh.service.JiediaoService;
import com.zdh.service.ProjectService;
import com.zdh.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class JiediaoServlet extends BaseServlet {


    JiediaoService jiediaoService = new JiediaoService();
    UserService userService = new UserService();

    //添加借调
    public void addJiediao(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        //创建借调类
        String transfer = request.getParameter("transfer");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Jiediao jiediao = new Jiediao();
        jiediao.setTransfer(transfer);
        jiediao.setUsername(user.getUsername());
        jiediao.setRatio("无");

        //将借调存入数据库
        int i = jiediaoService.addJiediao(jiediao);
        int j = userService.jiediaouser(jiediao.getUsername());

        PrintWriter out = response.getWriter();
        if(i>0 && j>0){
            out.print("<script>alert('修改借调状态成功！');window.location='"+request.getContextPath()+"/Employee/Form/transfer.jsp';</script>");
        }else{
            out.print("<script>alert('修改借调状态失败！');window.location='"+request.getContextPath()+"/Employee/Form/transfer.jsp';</script>");
        }

    }
}
