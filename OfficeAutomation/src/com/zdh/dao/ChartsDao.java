package com.zdh.dao;

import com.zdh.domain.DailyWorking;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class ChartsDao {

    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

    public double getDesignMonthdays(String year, String month) throws SQLException {
        String sql = "select SUM(cast(monthDay as float)) from Design where year = ? and month = ?";
        Object o = runner.query(sql,new ScalarHandler(),year,month);
        if(o == null){
            return 0;
        }else{
            return (double)o;
        }
    }

    public double getProgramingMonthdays(String year, String month) throws SQLException {
        String sql = "select SUM(cast(monthDay as float)) from ProgramingPicture where year = ? and month = ?";
        Object o = runner.query(sql,new ScalarHandler(),year,month);
        if(o == null){
            return 0;
        }else{
            return (double)o;
        }
    }

    public double getDebugMonthdays(String year, String month) throws SQLException {
        String sql = "select SUM(cast(debugday as float))+SUM(cast(manageday as float)) from Debug where year = ? and month = ?";
        Object o = runner.query(sql,new ScalarHandler(),year,month);
        if(o == null){
            return 0;
        }else{
            return (double)o;
        }
    }

    public double getManageMonthdays(String year, String month) throws SQLException {
        String sql = "select " +
                "SUM(cast(xunjiaBaojia as float))+SUM(cast(tender as float))+" +
                "SUM(cast(sign as float))+SUM(cast(toubiao as float))+" +
                "SUM(cast(equip as float))+SUM(cast(test as float)) +" +
                "SUM(cast(cuikuan as float))+SUM(cast(contract as float)) +" +
                "SUM(cast(other as float))+SUM(cast(PMday as float)) " +
                "from Manage where year = ? and month = ?";
        Object o = runner.query(sql,new ScalarHandler(),year,month);
        if(o == null){
            return 0;
        }else{
            return (double)o;
        }
    }

    public double getDailyMonthdays(String year, String month) throws SQLException {
        String sql = "select " +
                "SUM(cast(monthDay as float)) " +
                "from DailyWorking where year = ? and month = ?";
        Object o = runner.query(sql,new ScalarHandler(),year,month);
        if(o == null){
            return 0;
        }else{
            return (double)o;
        }
    }
}
