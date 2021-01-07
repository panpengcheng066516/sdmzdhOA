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

            //删除之前参与人员
//            int b = projectService.deleteRelationByProject(newProject.getId());

            //为人员加入项目,并获得人员名字。
            int bce = 1;
            int bmanager = 1;
            int bdesigner = 1;
            int breviewer = 1;
            int boffice = 1;
            if(newProject.getCe()!="" && newProject.getCe()!=null){
                User uce = userservice.getUserByName(newProject.getCe());
                if(uce != null){
                    bce = projectService.joinProject(uce.getUsername(),newProject.getId());
                }
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
            if(r>0 && bce>0 && bmanager>0 && bdesigner>0 && breviewer>0 && boffice>0){
                out.print("<script>alert('修改成功！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllProject';</script>");
            }else{
                out.print("<script>alert('修改失败！');window.location='"+request.getContextPath()+"/addProjectServlet?method=getPeopleInfo';</script>");
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

    //前往人员修改页面
    public void projectPeopleInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到项目信息
        String projectid = request.getParameter("projectid");
        Project project = projectService.getProjectById(projectid);
        request.setAttribute("project",project);

        //取得人员列表
        List<User> peopleList = projectService.getUserListByProject(projectid);
        List<User> userList = userservice.findAllUser();
        userList.remove(0);
        request.setAttribute("peopleList",peopleList);
        request.setAttribute("userList",userList);

        request.getRequestDispatcher("/Employee/Overview/projectPeopleOverview.jsp").forward(request, response);
    }

    //撤离人员
    public void removePeopleFromProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到userId
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String projectid = request.getParameter("projectid");
        //验证是否已经加入
        int b = projectService.removePeopleFromProject(projectid,username);


        PrintWriter out = response.getWriter();
        if(b>0){
            request.getRequestDispatcher("/projectServlet?method=projectPeopleInfo&projectid="+projectid).forward(request, response);
        }else{
            out.print("<script>alert('撤离失败！');window.location='"+request.getContextPath()+"/projectServlet?method=projectPeopleInfo&projectid="+projectid+"';</script>");
        }
    }

    //加入项目
    public void addPeopleToProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到userId
        String username = request.getParameter("username");
        String projectid = request.getParameter("projectid");
        //验证是否已经加入
        int b = projectService.checkJoinProject(username,projectid);
        int r =0;

        PrintWriter out = response.getWriter();
        if(b>0){
            out.print("<script>alert('该人员已在项目中！');window.location='"+request.getContextPath()+"/projectServlet?method=projectPeopleInfo&projectid="+projectid+"';</script>");
        }else{
            r = projectService.joinProject(username,projectid);
            if(r>0){
                request.getRequestDispatcher("/projectServlet?method=projectPeopleInfo&projectid="+projectid).forward(request, response);
            }else{
                out.print("<script>alert('加入失败！');window.location='"+request.getContextPath()+"/projectServlet?method=projectPeopleInfo&projectid="+projectid+"';</script>");
            }
        }
    }

    //通过id删除
//    public void deleteByid(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
//
//        //通过id得到对象
//        String id = request.getParameter("projectid");
//        int r  = projectService.deleteProjectByid(id);
//
//        PrintWriter out = response.getWriter();
//        if(r>0){
//            out.print("<script>alert('已删除！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllProject';</script>");
//        }else{
//            out.print("<script>alert('删除失败！');window.location='"+request.getContextPath()+"/projectServlet?method=getAllProject';</script>");
//        }
//    }
}
