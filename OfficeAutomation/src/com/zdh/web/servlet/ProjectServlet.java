package com.zdh.web.servlet;

import com.zdh.domain.Project;
import com.zdh.domain.User;
import com.zdh.service.ProjectService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

public class ProjectServlet extends BaseServlet {

    //得到所有的project
    public void getAllProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        ProjectService projectService = new ProjectService();
        List<Project> list = projectService.getAllProject();
        request.setAttribute("projectList",list);
        response.sendRedirect("");
    }

    //通过user得到项目列表
    public void getProjectListByUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到userId
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userId = user.getId();
        //通过Userid获得projectList
        ProjectService projectService = new ProjectService();
        List<Project> list = projectService.getProjectListByUser(userId);
        request.setAttribute("projectList",list);
        response.sendRedirect("");
    }

    public void addProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        //取得项目
        Map<String,String[]> map =  request.getParameterMap();
        Project project = new Project();
        BeanUtils.populate(project,map);

        //向数据库存入项目信息
        ProjectService projectService = new ProjectService();
        int r = projectService.addProject(project);

        PrintWriter out = response.getWriter();

        if(r>0){
            out.print("<script>alert('添加项目成功');</script>");
        }
        out.print("<script>alert('添加项目失败');</script>");
    }
}
