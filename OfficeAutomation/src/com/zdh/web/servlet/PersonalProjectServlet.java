package com.zdh.web.servlet;

import com.zdh.domain.Project;
import com.zdh.domain.User;
import com.zdh.service.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class PersonalProjectServlet extends BaseServlet {

    ProjectService projectService = new ProjectService();

    //前往个人项目查询页面
    public void getAllPersonalProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到userId
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userName = user.getUsername();

        //通过Userid获得projectList
        List<Project> list = projectService.getProjectListByUser(userName);

        request.setAttribute("projectList",list);
        request.getRequestDispatcher("/Employee/Overview/personalProjectOverview.jsp").forward(request, response);
    }
}
