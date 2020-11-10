package com.zdh.web.servlet;

import com.google.gson.Gson;
import com.zdh.domain.Project;
import com.zdh.domain.User;
import com.zdh.service.ProjectService;
import com.zdh.service.UserService;
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

    ProjectService projectService = new ProjectService();
    UserService userservice = new UserService();


    //得到所有的project
    public void getAllProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        List<Project> list = projectService.getAllProject();
        request.setAttribute("projectList",list);
        request.getRequestDispatcher("/Employee/Overview/projectOverview.jsp").forward(request, response);
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
        int r = projectService.quitProject(userName,projectid);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('退出项目成功！');window.location='"+request.getContextPath()+"/personalProjectServlet?method=getAllPersonalProject';</script>");
        }else{
            out.print("<script>alert('退出项目失败！');window.location='"+request.getContextPath()+"/personalProjectServlet?method=getAllPersonalProject';</script>");
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
        int b = projectService.checkJoinProject(userName,projectid);
        int r =0;

        PrintWriter out = response.getWriter();
        if(b>0){
            out.print("<script>alert('您已在项目内！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllProject';</script>");
        }else{
            r = projectService.joinProject(userName,projectid);
            if(r>0){
                out.print("<script>alert('加入项目成功！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllProject';</script>");
            }else{
                out.print("<script>alert('加入项目失败！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllProject';</script>");
            }
        }
    }

    //得到项目所有的信息
    public void getProjectInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到项目信息
        String projectid = request.getParameter("projectid");
        Project project = projectService.getProjectById(projectid);
        request.setAttribute("project",project);

        //取得人员列表
        List<User> list = userservice.findAllUser();
        list.remove(0);
        request.setAttribute("userList",list);

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
        List<Project> list = projectService.getProjectListByUser(userName);
        request.setAttribute("projectList",list);
        response.sendRedirect("");
    }


    public void updateProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        //得到userId
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        PrintWriter out = response.getWriter();
        if(user.getPower()!=2){
            out.print("<script>alert('您无权修改！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllProject';</script>");
        }else{
            //取得项目
            Map<String,String[]> map =  request.getParameterMap();
            Project newProject = new Project();
            BeanUtils.populate(newProject,map);
            int b = projectService.deleteRelationByProject(newProject.getId());

            //为人员加入项目,并获得人员名字。
            int bce = 0;
            int bmanager = 0;
            int bdesigner = 0;
            int breviewer = 0;
            int boffice = 0;
            int rce = 0;
            int rmanager = 0;
            int rdesigner = 0;
            int rreviewer = 0;
            int roffice = 0;
            if(newProject.getCe()!="" && newProject.getCe()!=null){
                bce = projectService.joinProject(newProject.getCe(),newProject.getId());
                String ce = userservice.getUserByUsername(newProject.getCe()).getName();
                newProject.setCe(ce);
            }
            if(newProject.getManager()!="" && newProject.getManager()!=null){
                bmanager = projectService.joinProject(newProject.getManager(),newProject.getId());
                String manager = userservice.getUserByUsername(newProject.getManager()).getName();
                newProject.setManager(manager);
            }
            if(newProject.getDesigner()!="" && newProject.getDesigner()!=null){
                bdesigner = projectService.joinProject(newProject.getDesigner(),newProject.getId());
                String designer = userservice.getUserByUsername(newProject.getDesigner()).getName();
                newProject.setDesigner(designer);
            }
            if(newProject.getReviewer()!="" && newProject.getReviewer()!=null){
                breviewer = projectService.joinProject(newProject.getReviewer(),newProject.getId());
                String reviewer = userservice.getUserByUsername(newProject.getReviewer()).getName();
                newProject.setReviewer(reviewer);
            }
            if(newProject.getOffice()!="" && newProject.getOffice()!=null){
                boffice = projectService.joinProject(newProject.getOffice(),newProject.getId());
                String office = userservice.getUserByUsername(newProject.getOffice()).getName();
                newProject.setOffice(office);
            }

            //向数据库存入项目信息
            int r = projectService.updateProject(newProject);
            if(r>0){
                out.print("<script>alert('修改成功！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllProject';</script>");
            }else{
                out.print("<script>alert('修改失败！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllProject';</script>");
            }
        }
    }

    public void getProjectByProgress(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //		设置编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        // 得到参数并查询
        String progress = request.getParameter("progress");
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
        List<Project> list = projectService.getPersonalProjectByProgress(username,progress);

        //转换为json向前台传输数据
        Gson gson = new Gson();
        String json = gson.toJson(list);

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
    }
}
