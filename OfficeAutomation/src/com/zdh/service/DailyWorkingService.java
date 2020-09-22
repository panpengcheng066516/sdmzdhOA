package com.zdh.service;

import com.zdh.dao.DailyWorkingDao;
import com.zdh.domain.DailyWorking;

import java.sql.SQLException;

public class DailyWorkingService {
    public int addDailyWorking(DailyWorking dailyWorking) {
        DailyWorkingDao dailyWorkingDao = new DailyWorkingDao();
        int i= 0;
        try {
            i = dailyWorkingDao.addDailyWorking(dailyWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
}
