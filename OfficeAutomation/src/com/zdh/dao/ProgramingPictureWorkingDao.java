package com.zdh.dao;

import com.zdh.domain.ProgramingPictureWorking;
import com.zdh.domain.Project;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ProgramingPictureWorkingDao {

    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());


    //获取全部编程画面工作列表
    public List<ProgramingPictureWorking> getProgramingPictureWorkingList() throws SQLException {
        String sql = "select * from ProgramingPicture";
        return runner.query(sql, new BeanListHandler<ProgramingPictureWorking>(ProgramingPictureWorking.class));
    }

    //通过用户名获取编程画面工作列表
    public List<ProgramingPictureWorking> getProgramingPictureWorkingByUsername(String username) throws SQLException {
        String sql = "select * from ProgramingPicture where username = ?";
        return runner.query(sql, new BeanListHandler<ProgramingPictureWorking>(ProgramingPictureWorking.class),username);
    }

    //通过用户名日期获取编程画面工作列表
    public List<ProgramingPictureWorking> getProgramingPictureWorkingByDateUsername(String year,String month,String username) throws SQLException {
        String sql = "select * from ProgramingPicture where username = ? and year = ? and month = ?";
        return runner.query(sql, new BeanListHandler<ProgramingPictureWorking>(ProgramingPictureWorking.class),username,year,month);
    }

    //新增编程画面工作
    public int addProgramingPictureWorking(ProgramingPictureWorking programingPictureWorking) throws SQLException {
        String sql = "insert into ProgramingPicture (year,month,username,id,digitalNumber,analogNumber,programingPicture,ProgramingDay,MonthDay,remark,projectId,workname) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        return runner.update(sql,programingPictureWorking.getYear(),programingPictureWorking.getMonth(),programingPictureWorking.getUsername(),programingPictureWorking.getId(),
                programingPictureWorking.getDigitalNumber(),programingPictureWorking.getAnalogNumber(),programingPictureWorking.getProgramingPicture(),programingPictureWorking.getProgramingDay(),
                programingPictureWorking.getMonthday(),programingPictureWorking.getRemark(),programingPictureWorking.getProjectid(),programingPictureWorking.getWorkname());
    }

    //通过id删除编程画面工作
    public int deleteProgramingPictureWorkingByid(String id) throws SQLException {
        String sql = "delete from ProgramingPicture where id = ?";
        return runner.update(sql,id);
    }

    //更新编程画面工作
    public int updateProgramingPictureWorking(ProgramingPictureWorking programingPictureWorking) throws SQLException {
        String sql = "update ProgramingPicture set year=?,month=?,digitalNumber=?,analogNumber=?,programingPicture=?,ProgramingDay=?,MonthDay=?,remark=?,projectId=?,workname = ? where id = ?";
        int update = runner.update(sql,programingPictureWorking.getYear(),programingPictureWorking.getMonth(), programingPictureWorking.getDigitalNumber(),
                programingPictureWorking.getAnalogNumber(),programingPictureWorking.getProgramingPicture(),programingPictureWorking.getProgramingDay(),
                programingPictureWorking.getMonthday(),programingPictureWorking.getRemark(),programingPictureWorking.getProjectid(),programingPictureWorking.getWorkname(),programingPictureWorking.getId());
        return update;
    }

    public ProgramingPictureWorking getProgramingPictureWorkingInfo(String programingid) throws SQLException {
        String sql = "select * from ProgramingPicture where id = ?";
        return runner.query(sql, new BeanHandler<ProgramingPictureWorking>(ProgramingPictureWorking.class),programingid);
    }

    public Project getProjectByProgramingId(String programingid) throws SQLException {
        String sql = "select * from Project where Project.id = (select projectId from ProgramingPicture where ProgramingPicture.id = ?)";
        return runner.query(sql, new BeanHandler<Project>(Project.class),programingid);
    }
}
