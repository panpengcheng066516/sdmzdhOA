package com.zdh.service;

import com.zdh.dao.DebugWorkingDao;
import com.zdh.domain.DebugWorking;

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
}
