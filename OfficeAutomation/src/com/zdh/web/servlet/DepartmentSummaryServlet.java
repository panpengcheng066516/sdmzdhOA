package com.zdh.web.servlet;

import com.zdh.domain.Project;
import com.zdh.domain.vo.MainVo;
import com.zdh.service.PersonalSummaryService;
import com.zdh.service.ProjectService;
import com.zdh.utils.CommonsUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class DepartmentSummaryServlet extends BaseServlet {

    public void getWorkingList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        ProjectService projectService = new ProjectService();
        List<Project> projectList = projectService.getAllProject();

        //得到所有工作量
        PersonalSummaryService personalSummaryService = new PersonalSummaryService();
        MainVo mainVo = personalSummaryService.getMainVoByDate(CommonsUtils.getCurrentYear(),CommonsUtils.getCurrentMonth());

        //请求转发
        request.setAttribute("projectList",projectList);
        request.setAttribute("currentYear",CommonsUtils.getCurrentYear());
        request.setAttribute("currentMonth",CommonsUtils.getCurrentMonth());
        request.setAttribute("mainVo",mainVo);
        request.getRequestDispatcher("/Employee/Overview/monthSummary.jsp").forward(request, response);
    }
}
