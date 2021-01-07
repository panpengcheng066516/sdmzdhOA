package com.zdh.service;

import com.zdh.dao.DebugWorkingDao;
import com.zdh.domain.DebugWorking;
import com.zdh.domain.DesignWorking;
import com.zdh.domain.Project;

import java.sql.SQLException;
import java.util.List;

public class DebugWorkingService {

    DebugWorkingDao debugWorkingDao = new DebugWorkingDao();


    public int addDebugWorking(DebugWorking debugWorking) {
        int i =0;
        try {
            i = debugWorkingDao.addDebugWorking(debugWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public List<DebugWorking> getDebugWorkingByUsername(String username) {
        List<DebugWorking> list = null;
        try {
            list = debugWorkingDao.getDebugWorkingByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<DebugWorking> getDebugWorkingByDateUsername(String year,String month,String username) {
        List<DebugWorking> list = null;
        try {
            list = debugWorkingDao.getDebugWorkingByDateUsername(year,month,username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int updateDebugWorking(DebugWorking debugWorking) {
        int i =0;
        try {
            i = debugWorkingDao.updateDebugWorking(debugWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public DebugWorking getDebugWorkingInfo(String debugid) {
        DebugWorking debugWorking = null;
        try {
            debugWorking = debugWorkingDao.getDebugWorkingInfo(debugid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return debugWorking;
    }

    public Project getProjectByid(String debugid) {
        Project project = null;
        try {
            project = debugWorkingDao.getProjectByid(debugid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return project;
    }

    public int deleteDebugWorkingByid(String id) {
        int i =0;
        try {
            i = debugWorkingDao.deleteDebugWorkingByid(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
}
