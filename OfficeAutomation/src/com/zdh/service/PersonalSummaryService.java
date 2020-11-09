package com.zdh.service;

import com.zdh.dao.PersonalSummaryDao;
import com.zdh.domain.Summary;
import com.zdh.domain.vo.*;

import java.sql.SQLException;
import java.util.List;

public class PersonalSummaryService {

    PersonalSummaryDao personalSummaryDao = new PersonalSummaryDao();

    //个人工作量统计
    public MainVo getMainVoByDateUser(String year, String month, String username) {
        MainVo mainVo = new MainVo();
        List<DailyVo> dailyVoList = null;
        List<DebugVo> debugVoList = null;
        List<DesignVo> designVoList = null;
        List<ManageVo> manageVoList = null;
        List<ProgramingVo> programingVoList = null;
        List<Summary> summaryList = null;
        try {
            dailyVoList = personalSummaryDao.getDailyVoListByDateUsername(year,month,username);
            debugVoList = personalSummaryDao.getDebugVoListByDateUsername(year,month,username);
            designVoList = personalSummaryDao.getDesignVoListByDateUsername(year,month,username);
            manageVoList = personalSummaryDao.getManageVoListByDateUsername(year,month,username);
            programingVoList = personalSummaryDao.getProgramingVoListByDateUsername(year,month,username);
            summaryList = personalSummaryDao.getSummaryListByDateUsername(year,month,username);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        mainVo.setDailyVoList(dailyVoList);
        mainVo.setDebugVoList(debugVoList);
        mainVo.setDesignVoList(designVoList);
        mainVo.setManageVoList(manageVoList);
        mainVo.setProgramingVoList(programingVoList);
        mainVo.setSummaryList(summaryList);

        return mainVo;
    }

    public MainVo getMainVoByDate(String year, String month) {
        MainVo mainVo = new MainVo();
        List<DailyVo> dailyVoList = null;
        List<DebugVo> debugVoList = null;
        List<DesignVo> designVoList = null;
        List<ManageVo> manageVoList = null;
        List<ProgramingVo> programingVoList = null;
        List<Summary> summaryList = null;
        try {
            dailyVoList = personalSummaryDao.getDailyVoListByDate(year,month);
            debugVoList = personalSummaryDao.getDebugVoListByDate(year,month);
            designVoList = personalSummaryDao.getDesignVoListByDate(year,month);
            manageVoList = personalSummaryDao.getManageVoListByDate(year,month);
            programingVoList = personalSummaryDao.getProgramingVoListByDate(year,month);
            summaryList = personalSummaryDao.getSummaryListByDate(year,month);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        mainVo.setDailyVoList(dailyVoList);
        mainVo.setDebugVoList(debugVoList);
        mainVo.setDesignVoList(designVoList);
        mainVo.setManageVoList(manageVoList);
        mainVo.setProgramingVoList(programingVoList);
        mainVo.setSummaryList(summaryList);

        return mainVo;
    }

    public MainVo getMainVoByDateProject(String year, String month, String projectid) {
        MainVo mainVo = new MainVo();
        List<DailyVo> dailyVoList = null;
        List<DebugVo> debugVoList = null;
        List<DesignVo> designVoList = null;
        List<ManageVo> manageVoList = null;
        List<ProgramingVo> programingVoList = null;
        List<Summary> summaryList = null;
        try {
            dailyVoList = personalSummaryDao.getDailyVoListByDate(year,month);
            debugVoList = personalSummaryDao.getDebugVoListByDateProject(year,month,projectid);
            designVoList = personalSummaryDao.getDesignVoListByDateProject(year,month,projectid);
            manageVoList = personalSummaryDao.getManageVoListByDateProject(year,month,projectid);
            programingVoList = personalSummaryDao.getProgramingVoListByDateProject(year,month,projectid);
            summaryList = personalSummaryDao.getSummaryListByDate(year,month);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        mainVo.setDailyVoList(dailyVoList);
        mainVo.setDebugVoList(debugVoList);
        mainVo.setDesignVoList(designVoList);
        mainVo.setManageVoList(manageVoList);
        mainVo.setProgramingVoList(programingVoList);
        mainVo.setSummaryList(summaryList);

        return mainVo;
    }

    public List<Summary> getSummaryList(String year,String month) {
        List<Summary> summaryList = null;
        try {
            summaryList = personalSummaryDao.getSummaryListByDate(year,month);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return summaryList;
    }

    public double getDepartmentMonth(String year, String month) {
        double departmentMonthDay = 0;
        try {
            departmentMonthDay = personalSummaryDao.getDepartmentMonth(year,month);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departmentMonthDay;
    }

    public List<Summary> getSummaryYearList(String year) {

        List<Summary> summaryList = null;
        try {
            summaryList = personalSummaryDao.getSummaryListByYear(year);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return summaryList;
    }

    public double getDepartmentYear(String year) {
        double departmentYearDay = 0;
        try {
            departmentYearDay = personalSummaryDao.getDepartmentYear(year);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departmentYearDay;
    }
}
