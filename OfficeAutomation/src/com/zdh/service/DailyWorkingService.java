package com.zdh.service;

import com.zdh.dao.DailyWorkingDao;
import com.zdh.domain.DailyWorking;

import java.sql.SQLException;
import java.util.List;

public class DailyWorkingService {

    DailyWorkingDao dailyWorkingDao = new DailyWorkingDao();


    public int addDailyWorking(DailyWorking dailyWorking) {
        int i= 0;
        try {
            i = dailyWorkingDao.addDailyWorking(dailyWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public List<DailyWorking> getDailyWorkingByUsername(String username) {
        List<DailyWorking> list = null;
        try {
            list = dailyWorkingDao.getDailyWorkingByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<DailyWorking> getDailyWorkingByDateUsername(String year,String month,String username) {
        List<DailyWorking> list = null;
        try {
            list = dailyWorkingDao.getDailyWorkingByDateUsername(year,month,username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int updateDailyWorking(DailyWorking dailyWorking) {
        int i= 0;
        try {
            i = dailyWorkingDao.updateDailyWorking(dailyWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public DailyWorking getDailyWorkingInfo(String dailyid) {
        DailyWorking dailyWorking = null;
        try {
            dailyWorking = dailyWorkingDao.getDailyWorkingById(dailyid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dailyWorking;
    }
    public int deleteDailyWorkingByid(String id){
        int i =0;
        try {
            i = dailyWorkingDao.deleteDailyWorkingByid(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
}
