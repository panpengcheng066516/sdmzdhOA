package com.zdh.service;

import com.zdh.dao.ManageWorkingDao;
import com.zdh.domain.ManageWorking;
import com.zdh.domain.Project;

import java.sql.SQLException;
import java.util.List;

public class ManageWorkingService {
    ManageWorkingDao manageWorkingDao = new ManageWorkingDao();

    public int addManageWorking(ManageWorking manageWorking) {
        int i = 0;
        try {
            i = manageWorkingDao.addManageWorking(manageWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public List<ManageWorking> getManageWorkingByUsername(String username) {
        List<ManageWorking> list = null;
        try {
            list = manageWorkingDao.getManageWorkingByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ManageWorking> getManageWorkingByDateUsername(String year,String month,String username) {
        List<ManageWorking> list = null;
        try {
            list = manageWorkingDao.getManageWorkingByDateUsername(year,month,username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int updateManageWorking(ManageWorking manageWorking) {
        int i = 0;
        try {
            i = manageWorkingDao.updateManageWorking(manageWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public ManageWorking getManageWorkingInfo(String manageid) {
        ManageWorking manageWorking = null;
        try {
            manageWorking = manageWorkingDao.getManageWorkingById(manageid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return manageWorking;
    }

    public Project getProjectByid(String manageid) {
        Project project = null;
        try {
            project = manageWorkingDao.getProjectByid(manageid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return project;
    }
}
