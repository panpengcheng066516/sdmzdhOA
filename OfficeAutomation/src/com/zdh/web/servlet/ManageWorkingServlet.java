package com.zdh.web.servlet;

import com.zdh.domain.DebugWorking;
import com.zdh.domain.ManageWorking;
import com.zdh.domain.Project;
import com.zdh.domain.User;
import com.zdh.service.DebugWorkingService;
import com.zdh.service.ManageWorkingService;
import com.zdh.service.ProjectService;
import com.zdh.utils.CommonsUtils;
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

public class ManageWorkingServlet extends BaseServlet {
    //得到当前用户的所有的project
    public void getAllProjectByUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
//        //得到userId
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//        String userName = user.getUsername();
//        //通过Userid获得projectList
//        ProjectService projectService = new ProjectService();
//        List<Project> list = projectService.getProjectListByUser(userName);

        ProjectService projectService = new ProjectService();
        List<Project> list = projectService.getAllProject();

        request.setAttribute("projectList",list);
        request.getRequestDispatcher("/Employee/Form/manage.jsp").forward(request, response);
    }

    public void addManageWorking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //取得项目
        Map<String,String[]> map =  request.getParameterMap();
        ManageWorking manageWorking = new ManageWorking();
        BeanUtils.populate(manageWorking,map);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        manageWorking.setId(CommonsUtils.getUUID());
        manageWorking.setUsername(user.getUsername());
        manageWorking.setYear(CommonsUtils.getCurrentYear());
        manageWorking.setMonth(CommonsUtils.getCurrentMonth());

        //向数据库存入项目信息
        ManageWorkingService manageWorkingService = new ManageWorkingService();
        int r = manageWorkingService.addManageWorking(manageWorking);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('提交成功！');window.location='"+request.getContextPath()+"/manageWorkingServlet?method=getAllProjectByUser';</script>");
        }else{
            out.print("<script>alert('提交失败！');window.location='"+request.getContextPath()+"/manageWorkingServlet?method=getAllProjectByUser';</script>");
        }
    }
}