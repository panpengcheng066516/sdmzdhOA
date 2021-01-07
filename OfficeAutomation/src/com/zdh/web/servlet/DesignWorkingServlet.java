package com.zdh.web.servlet;

import com.zdh.domain.DesignWorking;
import com.zdh.domain.Project;
import com.zdh.domain.User;
import com.zdh.service.DesignWorkingService;
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

public class DesignWorkingServlet extends BaseServlet {

    ProjectService projectService = new ProjectService();
    DesignWorkingService designWorkingService = new DesignWorkingService();

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
        request.getRequestDispatcher("/Employee/Form/design.jsp").forward(request, response);
    }


    public void addDesignWorking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        //取得项目
        Map<String,String[]> map =  request.getParameterMap();
        DesignWorking designWorking = new DesignWorking();
        BeanUtils.populate(designWorking,map);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        designWorking.setId(CommonsUtils.getUUID());
        designWorking.setUsername(user.getUsername());
        designWorking.setYear(CommonsUtils.getCurrentYear());
        designWorking.setMonth(CommonsUtils.getCurrentMonth());

        //向数据库存入项目信息
        int r = designWorkingService.addDesignWorking(designWorking);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('提交成功！');window.location='"+request.getContextPath()+"/designWorkingServlet?method=getAllProjectByUser';</script>");
        }else{
            out.print("<script>alert('提交失败！');window.location='"+request.getContextPath()+"/designWorkingServlet?method=getAllProjectByUser';</script>");
        }
    }

    public void updateDesignWorking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        //取得项目
        Map<String,String[]> map =  request.getParameterMap();
        DesignWorking designWorking = new DesignWorking();
        BeanUtils.populate(designWorking,map);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        designWorking.setUsername(user.getUsername());

        //向数据库存入项目信息
        int r = designWorkingService.updateDesignWorking(designWorking);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('修改成功！');window.location='"+request.getContextPath()+"/personalSummaryServlet?method=getAllWorkingList';</script>");
        }else{
            out.print("<script>alert('修改失败！');window.location='"+request.getContextPath()+"/personalSummaryServlet?method=getAllWorkingList';</script>");
        }
    }

    //通过id得到design
    public void getDesignInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到projectList
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userName = user.getUsername();
        //通过Userid获得projectList
        List<Project> list = projectService.getProjectListByUser(userName);
        request.setAttribute("projectList",list);

        //通过id得到design对象
        String designid = request.getParameter("designid");
        DesignWorking designWorking = designWorkingService.getDesignWorkingInfo(designid);
        //通过id得到工程
        Project project = designWorkingService.getProjectByid(designid);

        request.setAttribute("design",designWorking);
        request.setAttribute("designproject",project);
        request.getRequestDispatcher("/Employee/Form/design1.jsp").forward(request, response);
    }

    //通过id删除
    public void deleteByid(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        //通过id得到对象
        String id = request.getParameter("designid");
        int r  = designWorkingService.deleteDesignWorkingByid(id);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('已删除！');window.location='"+request.getContextPath()+"/personalSummaryServlet?method=getAllWorkingList';</script>");
        }else{
            out.print("<script>alert('删除失败！');window.location='"+request.getContextPath()+"/personalSummaryServlet?method=getAllWorkingList';</script>");
        }
    }
}
