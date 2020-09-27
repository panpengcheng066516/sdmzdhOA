package com.zdh.dao;

import com.zdh.domain.DailyWorking;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class DailyWorkingDao {

    //获取全部日常管理列表
    public List<DailyWorking> getDailyWorkingList() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from DailyWorking";
        return runner.query(sql, new BeanListHandler<DailyWorking>(DailyWorking.class));
    }

    //通过用户名获取日常管理列表
    public List<DailyWorking> getDailyWorkingByUsername(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from DailyWorking where username = ?";
        return runner.query(sql, new BeanListHandler<DailyWorking>(DailyWorking.class),username);
    }

    //通过用户名日期获取日常管理列表
    public List<DailyWorking> getDailyWorkingByDateUsername(String year,String month,String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from DailyWorking where username = ? and year = ? and month = ?";
        return runner.query(sql, new BeanListHandler<DailyWorking>(DailyWorking.class),username,year,month);
    }

    //新增日常管理
    public int addDailyWorking(DailyWorking dailyWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into DailyWorking (id,year,month,username,monthDay,remark,type) values(?,?,?,?,?,?,?)";
        return runner.update(sql,dailyWorking.getId(),dailyWorking.getYear(),dailyWorking.getMonth(),
                dailyWorking.getUsername(),dailyWorking.getMonthDay(),dailyWorking.getRemark(),dailyWorking.getType());
    }

    //通过id删除日常管理
    public int deleteDailyWorkingByid(String id) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from DailyWorking where id = ?";
        return runner.update(sql,id);
    }

    //更新日常管理
    public int updateDailyWorking(DailyWorking dailyWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update dailyWorking set monthDay=?,remark=?,type=? where id =?";
        int update = runner.update(sql,dailyWorking.getMonthDay(),dailyWorking.getRemark(),dailyWorking.getType(),dailyWorking.getId());
        return update;
    }

    public DailyWorking getDailyWorkingById(String dailyid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from DailyWorking where id =?";
        return runner.query(sql, new BeanHandler<DailyWorking>(DailyWorking.class),dailyid);
    }
}
