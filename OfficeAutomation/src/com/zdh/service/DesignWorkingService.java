package com.zdh.service;

import com.zdh.dao.DesignWorkingDao;
import com.zdh.domain.DesignWorking;

import java.sql.SQLException;

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


}
