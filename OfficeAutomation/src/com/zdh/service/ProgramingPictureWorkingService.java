package com.zdh.service;

import com.zdh.dao.ProgramingPictureWorkingDao;
import com.zdh.domain.ProgramingPictureWorking;
import com.zdh.domain.Project;

import java.sql.SQLException;
import java.util.List;

public class ProgramingPictureWorkingService {

    ProgramingPictureWorkingDao programingPictureWorkingDao = new ProgramingPictureWorkingDao();


    public int addProgramingPictureWorking(ProgramingPictureWorking programingPictureWorking)  {
        int i = 0;
        try {
            i = programingPictureWorkingDao.addProgramingPictureWorking(programingPictureWorking);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return i;
    }

    public List<ProgramingPictureWorking> getProgramingPictureWorkingByUsername(String username) {
        List<ProgramingPictureWorking> list = null;
        try {
            list = programingPictureWorkingDao.getProgramingPictureWorkingByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProgramingPictureWorking> getDesignWorkingByDateUsername(String year,String month,String username) {
        List<ProgramingPictureWorking> list = null;
        try {
            list = programingPictureWorkingDao.getProgramingPictureWorkingByDateUsername(year,month,username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ProgramingPictureWorking getprogramingPictureWorkingInfo(String programingid) {
        ProgramingPictureWorking programingPictureWorking = null;
        try {
            programingPictureWorking = programingPictureWorkingDao.getProgramingPictureWorkingInfo(programingid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return programingPictureWorking;
    }

    public Project getProjectByid(String programingid) {
        Project project = null;
        try {
            project = programingPictureWorkingDao.getProjectByProgramingId(programingid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return project;
    }

    public int updateProgramingWorking(ProgramingPictureWorking programingPictureWorking) {
        int i = 0;
        try {
            i = programingPictureWorkingDao.updateProgramingPictureWorking(programingPictureWorking);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return i;
    }

    public int deleteProgramingPictureWorkingByid(String id) {
        int i = 0;
        try {
            i = programingPictureWorkingDao.deleteProgramingPictureWorkingByid(id);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return i;
    }
}
