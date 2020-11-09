package com.zdh.web.servlet;

import com.zdh.domain.Project;
import com.zdh.domain.User;
import com.zdh.service.ProjectService;
import com.zdh.service.UserService;
import com.zdh.utils.CommonsUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

public class AddProjectServlet extends BaseServlet {

    public void addProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        //取得项目
        Map<String,String[]> map =  request.getParameterMap();
        Project project = new Project();
        BeanUtils.populate(project,map);
        project.setId(CommonsUtils.getUUID());

        //向数据库存入项目信息
        ProjectService projectService = new ProjectService();
        int r = projectService.addProject(project);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('提交成功！');window.location='"+request.getContextPath()+"/Employee/Form/project.jsp';</script>");
        }else{
            out.print("<script>alert('提交失败！');window.location='"+request.getContextPath()+"/Employee/Form/project.jsp';</script>");
        }
    }


    public void getPeopleInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //取得项目
        UserService service = new UserService();
        List<User> list = service.findAllUser();
        list.remove(0);
        request.setAttribute("userList",list);
        request.getRequestDispatcher("/Employee/Form/project.jsp").forward(request,response);
    }



}
