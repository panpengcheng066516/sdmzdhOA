package com.zdh.web.servlet;

import com.zdh.domain.Summary;
import com.zdh.domain.vo.SummaryMainVo;
import com.zdh.service.PersonalSummaryService;
import com.zdh.utils.CommonsUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class CountSummaryServlet extends BaseServlet {

    PersonalSummaryService personalSummaryService = new PersonalSummaryService();


    public void getHistorySummary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        //月各人员工作量
        List<Summary> summaryMonthList = personalSummaryService.getSummaryList(CommonsUtils.getCurrentYear(),CommonsUtils.getCurrentMonth());
        //月科室总工作量
        double departmentMonthWorkDay = personalSummaryService.getDepartmentMonth(CommonsUtils.getCurrentYear(),CommonsUtils.getCurrentMonth());
        //年各人员工作量
        List<Summary> summaryYearList = personalSummaryService.getSummaryYearList(CommonsUtils.getCurrentYear());
        //年科室总工作量
        double departmentYearWorkDay = personalSummaryService.getDepartmentYear(CommonsUtils.getCurrentYear());

        SummaryMainVo summaryMainVo = new SummaryMainVo();
        summaryMainVo.setDepartmentMonthWorkDay(departmentMonthWorkDay);
        summaryMainVo.setDepartmentYearWorkDay(departmentYearWorkDay);
        summaryMainVo.setSummaryMonthList(summaryMonthList);
        summaryMainVo.setSummaryYearList(summaryYearList);
        //请求转发
        request.setAttribute("summaryMainVo",summaryMainVo);
        request.setAttribute("currentYear",CommonsUtils.getCurrentYear());
        request.setAttribute("currentMonth",CommonsUtils.getCurrentMonth());
        request.getRequestDispatcher("/Employee/Overview/overview.jsp").forward(request, response);
    }
}
