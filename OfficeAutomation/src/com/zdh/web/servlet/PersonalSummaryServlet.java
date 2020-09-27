package com.zdh.web.servlet;

import com.zdh.domain.*;
import com.zdh.domain.vo.MainVo;
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
        request.setAttribute("mainVo",mainVo);
        request.getRequestDispatcher("/Employee/Overview/personalSummary.jsp").forward(request, response);
    }
}
