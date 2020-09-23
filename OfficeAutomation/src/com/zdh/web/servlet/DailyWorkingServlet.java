package com.zdh.web.servlet;

import com.zdh.domain.DailyWorking;
import com.zdh.domain.DesignWorking;
import com.zdh.domain.User;
import com.zdh.service.DailyWorkingService;
import com.zdh.service.DesignWorkingService;
import com.zdh.utils.CommonsUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

public class DailyWorkingServlet extends BaseServlet {
    public void addDailyWorking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {

        //取得项目
        Map<String,String[]> map =  request.getParameterMap();
        DailyWorking dailyWorking = new DailyWorking();
        BeanUtils.populate(dailyWorking,map);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        dailyWorking.setId(CommonsUtils.getUUID());
        dailyWorking.setUsername(user.getUsername());
        dailyWorking.setYear(CommonsUtils.getCurrentYear());
        dailyWorking.setMonth(CommonsUtils.getCurrentMonth());

        //向数据库存入项目信息
        DailyWorkingService dailyWorkingService = new DailyWorkingService();
        int r = dailyWorkingService.addDailyWorking(dailyWorking);

        PrintWriter out = response.getWriter();
        if(r>0){
            out.print("<script>alert('提交成功！');window.location='"+request.getContextPath()+"/Employee/Form/daily.jsp';</script>");
        }else{
            out.print("<script>alert('提交失败！');window.location='"+request.getContextPath()+"/Employee/Form/daily.jsp';</script>");
        }
    }
}
