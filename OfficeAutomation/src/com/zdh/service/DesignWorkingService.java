package com.zdh.service;

import com.zdh.dao.DesignWorkingDao;
import com.zdh.domain.DesignWorking;
import com.zdh.domain.Project;

import java.sql.SQLException;
import java.util.List;

public class DesignWorkingService {


    DesignWorkingDao designWorkingDao = new DesignWorkingDao();


    public int addDesignWorking(DesignWorking designWorking) {
        int i = 0;
        try {
            i = designWorkingDao.addDesignWorking(designWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }


    public List<DesignWorking> getDesignWorkingByUsername(String username) {
        List<DesignWorking> designWorkingList = null;
        try {
            designWorkingList = designWorkingDao.getDesignWorkingByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return designWorkingList;
    }

    public List<DesignWorking> getDesignWorkingByDateUsername(String year,String month,String username) {
        List<DesignWorking> designWorkingList = null;
        try {
            designWorkingList = designWorkingDao.getDesignWorkingByDateUsername(year,month,username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return designWorkingList;
    }

    public DesignWorking getDesignWorkingInfo(String designid) {
        DesignWorking designWorking = null;
        try {
            designWorking = designWorkingDao.getDesignWorkingInfo(designid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return designWorking;
    }

    public Project getProjectByid(String designid) {
        Project project = null;
        try {
            project = designWorkingDao.getProjectByid(designid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return project;
    }

    public int updateDesignWorking(DesignWorking designWorking) {
        int i = 0;
        try {
            i = designWorkingDao.updateDesignWorking(designWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
    public int deleteDesignWorkingByid(String id) {
        int i =0;
        try {
            i = designWorkingDao.deleteDesignWorkingByid(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
}
