package com.zdh.service;

import com.zdh.dao.DesignWorkingDao;
import com.zdh.domain.DesignWorking;

import java.sql.SQLException;
import java.util.List;

public class DesignWorkingService {
    public int addDesignWorking(DesignWorking designWorking) {
        DesignWorkingDao designWorkingDao = new DesignWorkingDao();
        int i = 0;
        try {
            i = designWorkingDao.addDesignWorking(designWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }


    public List<DesignWorking> getDesignWorkingByUsername(String username) {
        DesignWorkingDao designWorkingDao = new DesignWorkingDao();
        List<DesignWorking> designWorkingList = null;
        try {
            designWorkingList = designWorkingDao.getDesignWorkingByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return designWorkingList;
    }

    public List<DesignWorking> getDesignWorkingByDateUsername(String year,String month,String username) {
        DesignWorkingDao designWorkingDao = new DesignWorkingDao();
        List<DesignWorking> designWorkingList = null;
        try {
            designWorkingList = designWorkingDao.getDesignWorkingByDateUsername(year,month,username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return designWorkingList;
    }
}
