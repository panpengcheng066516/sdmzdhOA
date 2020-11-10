package com.zdh.web.servlet;

import com.google.gson.Gson;
import com.zdh.domain.Summary;
import com.zdh.domain.vo.SummaryMainVo;
import com.zdh.service.ChartsService;
import com.zdh.service.PersonalSummaryService;
import com.zdh.utils.CommonsUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class ChartServlet  extends BaseServlet {

    ChartsService chartsService = new ChartsService();


    public void getChartData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        String year = CommonsUtils.getCurrentYear();
        String month = CommonsUtils.getCurrentMonth();


        List<Double> doubles = chartsService.getSumWorkdays(year,month);

        //转换为json向前台传输数据
        Gson gson = new Gson();
        String json = gson.toJson(doubles);

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
    }
}
