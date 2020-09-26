package com.zdh.service;

import com.zdh.dao.ProgramingPictureWorkingDao;
import com.zdh.domain.ProgramingPictureWorking;
import com.zdh.domain.Project;

import java.sql.SQLException;
import java.util.List;

public class ProgramingPictureWorkingService {
    public int addProgramingPictureWorking(ProgramingPictureWorking programingPictureWorking)  {
        ProgramingPictureWorkingDao programingPictureWorkingDao = new ProgramingPictureWorkingDao();
        int i = 0;
        try {
            i = programingPictureWorkingDao.addProgramingPictureWorking(programingPictureWorking);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return i;
    }

    public List<ProgramingPictureWorking> getProgramingPictureWorkingByUsername(String username) {
        ProgramingPictureWorkingDao programingPictureWorkingDao = new ProgramingPictureWorkingDao();
        List<ProgramingPictureWorking> list = null;
        try {
            list = programingPictureWorkingDao.getProgramingPictureWorkingByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProgramingPictureWorking> getDesignWorkingByDateUsername(String year,String month,String username) {
        ProgramingPictureWorkingDao programingPictureWorkingDao = new ProgramingPictureWorkingDao();
        List<ProgramingPictureWorking> list = null;
        try {
            list = programingPictureWorkingDao.getProgramingPictureWorkingByDateUsername(year,month,username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ProgramingPictureWorking getprogramingPictureWorkingInfo(String programingid) {
        ProgramingPictureWorkingDao programingPictureWorkingDao = new ProgramingPictureWorkingDao();
        ProgramingPictureWorking programingPictureWorking = null;
        try {
            programingPictureWorking = programingPictureWorkingDao.getProgramingPictureWorkingInfo(programingid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return programingPictureWorking;
    }

    public Project getProjectByid(String programingid) {
        ProgramingPictureWorkingDao programingPictureWorkingDao = new ProgramingPictureWorkingDao();
        Project project = null;
        try {
            project = programingPictureWorkingDao.getProjectByProgramingId(programingid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return project;
    }

    public int updateProgramingWorking(ProgramingPictureWorking programingPictureWorking) {
        ProgramingPictureWorkingDao programingPictureWorkingDao = new ProgramingPictureWorkingDao();
        int i = 0;
        try {
            i = programingPictureWorkingDao.updateProgramingPictureWorking(programingPictureWorking);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return i;
    }
}
