package com.zdh.service;

import com.zdh.dao.ManageWorkingDao;
import com.zdh.domain.ManageWorking;

import java.sql.SQLException;

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
}
