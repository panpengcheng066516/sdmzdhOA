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
        List<ProgramingPictureWorking> programingPictureList = programingPictureWorkingService.getProgramingPictureWorkingByUsername(username);
        List<DebugWorking> debugList = debugWorkingService.getDebugWorkingByUsername(username);
        List<ManageWorking> manageList = manageWorkingService.getManageWorkingByUsername(username);
        List<DailyWorking> dailyList = dailyWorkingService.getDailyWorkingByUsername(username);

//        //个人工作量汇总
//        Double workday = null;
//        for(int i=0;i<designList.size();i++){
//            workday += Double.parseDouble(designList.get(i).getMonthDay());
//        }
//        for(int i=0;i<programingPictureList.size();i++){
//            workday += Double.parseDouble(programingPictureList.get(i).getMonthday());
//        }
//        for(int i=0;i<debugList.size();i++){
//            workday += Double.parseDouble(debugList.get(i).getManageday());
//            workday += Double.parseDouble(debugList.get(i).getDebugday());
//        }
//        for(int i=0;i<manageList.size();i++){
//            workday += Double.parseDouble(manageList.get(i).getContract());
//            workday += Double.parseDouble(manageList.get(i).getCuikuan());
//            workday += Double.parseDouble(manageList.get(i).getEquip());
//            workday += Double.parseDouble(manageList.get(i).getOther());
//            workday += Double.parseDouble(manageList.get(i).getPMday());
//            workday += Double.parseDouble(manageList.get(i).getSign());
//            workday += Double.parseDouble(manageList.get(i).getTender());
//            workday += Double.parseDouble(manageList.get(i).getTest());
//            workday += Double.parseDouble(manageList.get(i).getXunjiabaojia());
//            workday += Double.parseDouble(manageList.get(i).getToubiao());
//        }
//        for(int i=0;i<dailyList.size();i++){
//            workday += Double.parseDouble(dailyList.get(i).getMonthDay());
//        }
//      request.setAttribute("workDay",workday);


        request.setAttribute("designList",designList);
        request.setAttribute("programingPictureList",programingPictureList);
        request.setAttribute("debugList",debugList);
        request.setAttribute("manageList",manageList);
        request.setAttribute("dailyList",dailyList);



        //请求转发
        request.getRequestDispatcher("/Employee/Overview/personalSummary.jsp").forward(request, response);
    }
}
