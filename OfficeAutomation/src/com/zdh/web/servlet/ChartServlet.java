package com.zdh.web.servlet;

import com.google.gson.Gson;
import com.zdh.domain.Summary;
import com.zdh.domain.vo.SummaryMainVo;
import com.zdh.service.PersonalSummaryService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class ChartServlet  extends BaseServlet {
    public void getChartData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        String year = request.getParameter("year");
        String month = request.getParameter("month");

        int[] i = {5,5,5,5,5};

        //转换为json向前台传输数据
        Gson gson = new Gson();
        String json = gson.toJson(i);

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
    }
}
