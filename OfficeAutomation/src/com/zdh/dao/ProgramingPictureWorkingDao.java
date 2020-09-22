package com.zdh.dao;

import com.zdh.domain.ProgramingPictureWorking;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ProgramingPictureWorkingDao {
    //获取全部编程画面工作列表
    public List<ProgramingPictureWorking> getProgramingPictureWorkingList() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from ProgramingPicture";
        return runner.query(sql, new BeanListHandler<ProgramingPictureWorking>(ProgramingPictureWorking.class));
    }

    //通过用户名获取编程画面工作列表
    public List<ProgramingPictureWorking> getProgramingPictureWorkingByUsername(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from ProgramingPicture where username = ?";
        return runner.query(sql, new BeanListHandler<ProgramingPictureWorking>(ProgramingPictureWorking.class),username);
    }

    //新增编程画面工作
    public int addProgramingPictureWorking(ProgramingPictureWorking programingPictureWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into ProgramingPicture (year,month,username,id,digitalNumber,analogNumber,programingPicture,ProgramingDay,MonthDay,remark,projectId) values(?,?,?,?,?,?,?,?,?,?,?)";
        return runner.update(sql,programingPictureWorking.getYear(),programingPictureWorking.getMonth(),programingPictureWorking.getUsername(),programingPictureWorking.getId(),
                programingPictureWorking.getDigitaNumber(),programingPictureWorking.getAnalogNumber(),programingPictureWorking.getProgramingPicture(),programingPictureWorking.getProgramingDay(),
                programingPictureWorking.getMonthday(),programingPictureWorking.getReamrk(),programingPictureWorking.getProjectid());
    }

    //通过id删除编程画面工作
    public int deleteProgramingPictureWorkingByid(String id) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from ProgramingPicture where id = ?";
        return runner.update(sql,id);
    }

    //更新编程画面工作
    public int updateProgramingPictureWorking(ProgramingPictureWorking programingPictureWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update ProgramingPicture set year=?,month=?,digitalNumber=?,analogNumber=?,programingPicture=?,ProgramingDay=?,MonthDay=?,remark=?,projectId=? where id = ?";
        int update = runner.update(sql,programingPictureWorking.getYear(),programingPictureWorking.getMonth(), programingPictureWorking.getDigitaNumber(),
                programingPictureWorking.getAnalogNumber(),programingPictureWorking.getProgramingPicture(),programingPictureWorking.getProgramingDay(),
                programingPictureWorking.getMonthday(),programingPictureWorking.getReamrk(),programingPictureWorking.getProjectid());
        return update;
    }
}
