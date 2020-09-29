package com.zdh.web.servlet;

import com.google.gson.Gson;
import com.zdh.domain.*;
import com.zdh.domain.vo.MainVo;
import com.zdh.domain.vo.SummaryMainVo;
import com.zdh.service.*;
import com.zdh.utils.CommonsUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class PersonalSummaryServlet  extends BaseServlet {
    //得到所有的project
    public void getAllWorkingList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到用户名
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();

        //得到所有工作量
        PersonalSummaryService personalSummaryService = new PersonalSummaryService();
        MainVo mainVo = personalSummaryService.getMainVoByDateUser(CommonsUtils.getCurrentYear(),CommonsUtils.getCurrentMonth(),username);

        //请求转发
        request.setAttribute("currentYear",CommonsUtils.getCurrentYear());
        request.setAttribute("currentMonth",CommonsUtils.getCurrentMonth());
        request.setAttribute("mainVo",mainVo);
        request.getRequestDispatcher("/Employee/Overview/personalSummary.jsp").forward(request, response);
    }


    public void getWorkingListByDateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到用户名
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        //得到所有工作量
        PersonalSummaryService personalSummaryService = new PersonalSummaryService();
        MainVo mainVo = personalSummaryService.getMainVoByDateUser(year,month,username);

        //转换为json向前台传输数据
        Gson gson = new Gson();
        String json = gson.toJson(mainVo);

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
    }



    public void getWorkingListByDateProject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //得到用户名
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String projectid = request.getParameter("projectid");
        PersonalSummaryService personalSummaryService = new PersonalSummaryService();
        MainVo mainVo = null;

        if(projectid.equals("全部")){
            //得到所有工作量
            mainVo = personalSummaryService.getMainVoByDate(year,month);
        }else{
            //得到项目工作量
            mainVo = personalSummaryService.getMainVoByDateProject(year,month,projectid);
        }


        //转换为json向前台传输数据
        Gson gson = new Gson();
        String json = gson.toJson(mainVo);

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
    }



    public void getHistorySummaryByDate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        String year = request.getParameter("year");
        String month = request.getParameter("month");

        PersonalSummaryService personalSummaryService = new PersonalSummaryService();
        //月各人员工作量
        List<Summary> summaryMonthList = personalSummaryService.getSummaryList(year,month);
        //月科室总工作量
        double departmentMonthWorkDay = personalSummaryService.getDepartmentMonth(year,month);
        //年各人员工作量
        List<Summary> summaryYearList = personalSummaryService.getSummaryYearList(year);
        //年科室总工作量
        double departmentYearWorkDay = personalSummaryService.getDepartmentYear(year);

        SummaryMainVo summaryMainVo = new SummaryMainVo();
        summaryMainVo.setDepartmentMonthWorkDay(departmentMonthWorkDay);
        summaryMainVo.setDepartmentYearWorkDay(departmentYearWorkDay);
        summaryMainVo.setSummaryMonthList(summaryMonthList);
        summaryMainVo.setSummaryYearList(summaryYearList);

        //转换为json向前台传输数据
        Gson gson = new Gson();
        String json = gson.toJson(summaryMainVo);

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
    }
}
