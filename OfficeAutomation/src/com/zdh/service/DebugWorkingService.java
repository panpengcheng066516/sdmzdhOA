package com.zdh.service;

import com.zdh.dao.DebugWorkingDao;
import com.zdh.domain.DebugWorking;
import com.zdh.domain.DesignWorking;
import com.zdh.domain.Project;

import java.sql.SQLException;
import java.util.List;

public class DebugWorkingService {
    public int addDebugWorking(DebugWorking debugWorking) {
        DebugWorkingDao debugWorkingDao = new DebugWorkingDao();
        int i =0;
        try {
            i = debugWorkingDao.addDebugWorking(debugWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public List<DebugWorking> getDebugWorkingByUsername(String username) {
        DebugWorkingDao debugWorkingDao = new DebugWorkingDao();
        List<DebugWorking> list = null;
        try {
            list = debugWorkingDao.getDebugWorkingByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<DebugWorking> getDebugWorkingByDateUsername(String year,String month,String username) {
        DebugWorkingDao debugWorkingDao = new DebugWorkingDao();
        List<DebugWorking> list = null;
        try {
            list = debugWorkingDao.getDebugWorkingByDateUsername(year,month,username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int updateDebugWorking(DebugWorking debugWorking) {
        DebugWorkingDao debugWorkingDao = new DebugWorkingDao();
        int i =0;
        try {
            i = debugWorkingDao.updateDebugWorking(debugWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public DebugWorking getDebugWorkingInfo(String debugid) {
        DebugWorkingDao debugWorkingDao = new DebugWorkingDao();
        DebugWorking debugWorking = null;
        try {
            debugWorking = debugWorkingDao.getDebugWorkingInfo(debugid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return debugWorking;
    }

    public Project getProjectByid(String debugid) {
        DebugWorkingDao debugWorkingDao = new DebugWorkingDao();
        Project project = null;
        try {
            project = debugWorkingDao.getProjectByid(debugid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return project;
    }
}
