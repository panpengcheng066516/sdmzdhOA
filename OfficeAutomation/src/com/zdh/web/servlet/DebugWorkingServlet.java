package com.zdh.web.servlet;

import com.zdh.domain.*;
import com.zdh.service.*;
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

public class DebugWorkingServlet extends BaseServlet {

    ProjectService projectService = new ProjectService();
    DebugWorkingService debugWorkingService = new DebugWorkingService();


    //得到当前用户的所有的project
    public void getAllProjectByUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到userId
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userName = user.getUsername();
        //通过Userid获得projectList
        List<Project> list = projectService.getProjectListByUser(userName);

//        ProjectService projectService = new ProjectService();
//        List<Project> list = projectService.getAllProject();

        request.setAttribute("projectList",list);
        request.getRequestDispatcher("/Employee/Form/debug.jsp").forward(request, response);
    }

    public void addDebugWorking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //取得项目
        Map<String,String[]> map =  request.getParameterMap();
        DebugWorking debugWorking = new DebugWorking();
        BeanUtils.populate(debugWorking,map);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        debugWorking.setId(CommonsUtils.getUUID());
        debugWorking.setUsername(user.getUsername());
        debugWorking.setYear(CommonsUtils.getCurrentYear());
        debugWorking.setMonth(CommonsUtils.getCurrentMonth());

        //向数据库存入项目信息
        int r = debugWorkingService.addDebugWorking(debugWorking);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('提交成功！');window.location='"+request.getContextPath()+"/debugWorkingServlet?method=getAllProjectByUser';</script>");
        }else{
            out.print("<script>alert('提交失败！');window.location='"+request.getContextPath()+"/debugWorkingServlet?method=getAllProjectByUser';</script>");
        }
    }

    public void updateDebugWorking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        //取得项目
        Map<String,String[]> map =  request.getParameterMap();
        DebugWorking debugWorking = new DebugWorking();
        BeanUtils.populate(debugWorking,map);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        debugWorking.setUsername(user.getUsername());

        //向数据库存入项目信息
        int r = debugWorkingService.updateDebugWorking(debugWorking);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('修改成功！');window.location='"+request.getContextPath()+"/personalSummaryServlet?method=getAllWorkingList';</script>");
        }else{
            out.print("<script>alert('修改失败！');window.location='"+request.getContextPath()+"/personalSummaryServlet?method=getAllWorkingList';</script>");
        }
    }

    //通过id得到design
    public void getProgramingInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到projectList
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userName = user.getUsername();
        //通过Userid获得projectList
        ProjectService projectService = new ProjectService();
        List<Project> list = projectService.getProjectListByUser(userName);
        request.setAttribute("projectList",list);

        //通过id得到design对象
        String debugid = request.getParameter("debugid");
        DebugWorkingService debugWorkingService = new DebugWorkingService();
        DebugWorking debugWorking = debugWorkingService.getDebugWorkingInfo(debugid);
        //通过id得到工程
        Project project = debugWorkingService.getProjectByid(debugid);

        request.setAttribute("debug",debugWorking);
        request.setAttribute("debugproject",project);
        request.getRequestDispatcher("/Employee/Form/debug1.jsp").forward(request, response);
    }

    //通过id删除
    public void deleteByid(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {


        //通过id得到对象
        String id = request.getParameter("debugid");
        int r  = debugWorkingService.deleteDebugWorkingByid(id);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('已删除！');window.location='"+request.getContextPath()+"/personalSummaryServlet?method=getAllWorkingList';</script>");
        }else{
            out.print("<script>alert('删除失败！');window.location='"+request.getContextPath()+"/personalSummaryServlet?method=getAllWorkingList';</script>");
        }
    }
}
