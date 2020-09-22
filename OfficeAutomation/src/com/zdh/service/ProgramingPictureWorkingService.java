package com.zdh.service;

import com.zdh.dao.ProgramingPictureWorkingDao;
import com.zdh.domain.ProgramingPictureWorking;

import java.sql.SQLException;

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
}
