package com.zdh.service;

import com.zdh.dao.ManageWorkingDao;
import com.zdh.domain.ManageWorking;
import com.zdh.domain.Project;

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

    public List<ManageWorking> getManageWorkingByDateUsername(String year,String month,String username) {
        ManageWorkingDao manageWorkingDao = new ManageWorkingDao();
        List<ManageWorking> list = null;
        try {
            list = manageWorkingDao.getManageWorkingByDateUsername(year,month,username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int updateManageWorking(ManageWorking manageWorking) {
        ManageWorkingDao manageWorkingDao = new ManageWorkingDao();
        int i = 0;
        try {
            i = manageWorkingDao.updateManageWorking(manageWorking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public ManageWorking getManageWorkingInfo(String manageid) {
        ManageWorkingDao manageWorkingDao = new ManageWorkingDao();
        ManageWorking manageWorking = null;
        try {
            manageWorking = manageWorkingDao.getManageWorkingById(manageid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return manageWorking;
    }

    public Project getProjectByid(String manageid) {
        ManageWorkingDao manageWorkingDao = new ManageWorkingDao();
        Project project = null;
        try {
            project = manageWorkingDao.getProjectByid(manageid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return project;
    }
}
