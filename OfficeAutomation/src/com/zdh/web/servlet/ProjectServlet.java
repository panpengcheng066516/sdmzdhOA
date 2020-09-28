package com.zdh.web.servlet;

import com.google.gson.Gson;
import com.zdh.domain.Project;
import com.zdh.domain.User;
import com.zdh.service.ProjectService;
import com.zdh.utils.CommonsUtils;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import org.apache.commons.beanutils.BeanUtils;

import javax.json.JsonArray;
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
        request.getRequestDispatcher("/Employee/Overview/projectOverview.jsp").forward(request, response);
    }

    //前往个人项目查询页面
    public void getAllPersonalProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到userId
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userName = user.getUsername();
        //通过Userid获得projectList
        ProjectService projectService = new ProjectService();
        List<Project> list = projectService.getProjectListByUser(userName);
        request.setAttribute("projectList",list);
        request.getRequestDispatcher("/Employee/Overview/personalProjectOverview.jsp").forward(request, response);
    }



    //退出项目
    public void quitProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到userId
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userName = user.getUsername();
        String projectid = request.getParameter("projectid");
        //通过Userid获得projectList
        ProjectService projectService = new ProjectService();
        int r = projectService.quitProject(userName,projectid);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('退出项目成功！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllPersonalProject';</script>");
        }else{
            out.print("<script>alert('退出项目失败！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllPersonalProject';</script>");
        }

    }

    //加入项目
    public void joinProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到userId
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userName = user.getUsername();
        String projectid = request.getParameter("projectid");
        //验证是否已经加入
        ProjectService projectService = new ProjectService();
        int b = projectService.checkJoinProject(userName,projectid);
        int r =0;

        PrintWriter out = response.getWriter();
        if(b>0){
            out.print("<script>alert('不能重复加入项目！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllPersonalProject';</script>");
        }else{
            r = projectService.joinProject(userName,projectid);
            if(r>0){
                out.print("<script>alert('加入项目成功！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllProject';</script>");
            }else{
                out.print("<script>alert('加入项目失败！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllProject';</script>");
            }
        }
    }

    //得到所有的projectInfo
    public void getProjectInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        String projectid = request.getParameter("projectid");
        ProjectService projectService = new ProjectService();
        Project project = projectService.getProjectById(projectid);

        request.setAttribute("project",project);
        request.getRequestDispatcher("/Employee/Form/project1.jsp").forward(request, response);
    }

    //通过user得到项目列表
    public void getProjectListByUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到userId
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userName = user.getUsername();
        //通过Userid获得projectList
        ProjectService projectService = new ProjectService();
        List<Project> list = projectService.getProjectListByUser(userName);
        request.setAttribute("projectList",list);
        response.sendRedirect("");
    }

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

    public void updateProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        //取得项目
        Map<String,String[]> map =  request.getParameterMap();
        Project project = new Project();
        BeanUtils.populate(project,map);

        //向数据库存入项目信息
        ProjectService projectService = new ProjectService();
        int r = projectService.updateProject(project);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('修改成功！');window.location='"+request.getContextPath()+"/Employee/Form/project.jsp';</script>");
        }else{
            out.print("<script>alert('修改失败！');window.location='"+request.getContextPath()+"/Employee/Form/project.jsp';</script>");
        }
    }

    public void getProjectByProgress(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //		设置编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        // 得到参数并查询
        String progress = request.getParameter("progress");
        ProjectService projectService = new ProjectService();
        List<Project> list = projectService.getProjectByProgress(progress);

        //转换为json向前台传输数据
        Gson gson = new Gson();
        String json = gson.toJson(list);

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
    }

    public void getPersonalProjectByProgress(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //		设置编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        // 得到参数并查询
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();
        String progress = request.getParameter("progress");
        ProjectService projectService = new ProjectService();
        List<Project> list = projectService.getPersonalProjectByProgress(username,progress);

        //转换为json向前台传输数据
        Gson gson = new Gson();
        String json = gson.toJson(list);

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
    }
}
