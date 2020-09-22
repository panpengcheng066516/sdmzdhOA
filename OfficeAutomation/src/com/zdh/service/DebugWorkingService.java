package com.zdh.service;

import com.zdh.dao.DebugWorkingDao;
import com.zdh.domain.DebugWorking;

import java.sql.SQLException;

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
}
