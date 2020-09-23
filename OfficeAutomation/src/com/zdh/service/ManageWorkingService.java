package com.zdh.service;

import com.zdh.dao.ManageWorkingDao;
import com.zdh.domain.ManageWorking;

import java.sql.SQLException;
import java.util.List;

public class ManageWorkingService {
    public int addManageWorking(ManageWorking manageWorking) {
        ManageWorkingDao manageWorkingDao = new ManageWorkingDao();
        int i = 0;
        try {
            i = manageWorkingDao.addManageWorking(manageWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public List<ManageWorking> getManageWorkingByUsername(String username) {
        ManageWorkingDao manageWorkingDao = new ManageWorkingDao();
        List<ManageWorking> list = null;
        try {
            list = manageWorkingDao.getManageWorkingByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
