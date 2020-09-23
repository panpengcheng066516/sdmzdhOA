package com.zdh.web.servlet;

import com.zdh.domain.*;
import com.zdh.service.*;

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
        DesignWorkingService designWorkingService = new DesignWorkingService();
        ProgramingPictureWorkingService programingPictureWorkingService = new ProgramingPictureWorkingService();
        DebugWorkingService debugWorkingService = new DebugWorkingService();
        ManageWorkingService manageWorkingService = new ManageWorkingService();
        DailyWorkingService dailyWorkingService = new DailyWorkingService();

        List<DesignWorking> designList = designWorkingService.getDesignWorkingByUsername(username);
        List<ProgramingPictureWorking> programingPictureList = programingPictureWorkingService.getDesignWorkingByUsername(username);
        List<DebugWorking> debugList = debugWorkingService.getDebugWorkingByUsername(username);
        List<ManageWorking> manageList = manageWorkingService.getManageWorkingByUsername(username);
        List<DailyWorking> dailyList = dailyWorkingService.getDailyWorkingByUsername(username);

        request.setAttribute("designList",designList);
        request.setAttribute("programingPictureList",programingPictureList);
        request.setAttribute("debugList",debugList);
        request.setAttribute("manageList",manageList);
        request.setAttribute("dailyList",dailyList);

        //请求转发
        request.getRequestDispatcher("/Employee/Overview/personalSummary.jsp").forward(request, response);
    }
}
