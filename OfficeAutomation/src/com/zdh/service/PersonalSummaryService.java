package com.zdh.service;

import com.zdh.dao.PersonalSummaryDao;
import com.zdh.domain.Summary;
import com.zdh.domain.vo.*;

import java.sql.SQLException;
import java.util.List;

public class PersonalSummaryService {

    //个人工作量统计
    public MainVo getMainVoByDateUser(String year, String month, String username) {
        MainVo mainVo = new MainVo();
        PersonalSummaryDao personalSummaryDao = new PersonalSummaryDao();
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
}
