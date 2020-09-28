package com.zdh.dao;

import com.zdh.domain.DesignWorking;
import com.zdh.domain.Summary;
import com.zdh.domain.vo.*;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class PersonalSummaryDao {
    //通过用户名获取日期设计工作列表
    public List<DesignVo> getDesignVoListByDateUsername(String year, String month, String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select " +
                "design.id,design.username,design.projectid,design.year,design.month," +
                "design.amount,design.a1,design.zheheWorkingDay,design.monthDay,design.programDay," +
                "design.basicDesignDay,design.leader,design.remark,people.name,people.groupId," +
                "project.projectName,project.projectNo " +
                "from design,people,project " +
                "where design.year = ? and design.month = ? and design.username = ? and design.projectid = project.id and design.username = people.username";
        return runner.query(sql, new BeanListHandler<DesignVo>(DesignVo.class),year,month,username);
    }

    public List<DesignVo> getDesignVoListByDate(String year, String month) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select " +
                "design.id,design.username,design.projectid,design.year,design.month," +
                "design.amount,design.a1,design.zheheWorkingDay,design.monthDay,design.programDay," +
                "design.basicDesignDay,design.leader,design.remark,people.name,people.groupId," +
                "project.projectName,project.projectNo " +
                "from design,people,project " +
                "where design.year = ? and design.month = ? and  design.projectid = project.id and design.username = people.username";
        return runner.query(sql, new BeanListHandler<DesignVo>(DesignVo.class),year,month);
    }

    public List<DesignVo> getDesignVoListByDateProject(String year, String month, String projectid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select " +
                "design.id,design.username,design.projectid,design.year,design.month," +
                "design.amount,design.a1,design.zheheWorkingDay,design.monthDay,design.programDay," +
                "design.basicDesignDay,design.leader,design.remark,people.name,people.groupId," +
                "project.projectName,project.projectNo " +
                "from design,people,project " +
                "where design.year = ? and design.month = ? and design.projectid = ? and design.projectid = project.id and design.username = people.username";
        return runner.query(sql, new BeanListHandler<DesignVo>(DesignVo.class),year,month,projectid);
    }

    public List<ManageVo> getManageVoListByDateUsername(String year, String month, String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select \n" +
                "Manage.id,Manage.username,Manage.projectid,Manage.year,Manage.month," +
                "Manage.xunjiaBaojia,Manage.tender,Manage.sign,Manage.toubiao,Manage.equip," +
                "Manage.test,Manage.cuikuan,Manage.contract,Manage.other,Manage.PMday,Manage.remark," +
                "people.name,people.groupId,project.projectName,project.projectNo " +
                "from Manage,people,project " +
                "where Manage.year = ? and Manage.month = ? and Manage.username = ? and Manage.projectid = project.id and Manage.username = people.username";
        return runner.query(sql, new BeanListHandler<ManageVo>(ManageVo.class),year,month,username);
    }

    public List<ManageVo> getManageVoListByDate(String year, String month) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select \n" +
                "Manage.id,Manage.username,Manage.projectid,Manage.year,Manage.month," +
                "Manage.xunjiaBaojia,Manage.tender,Manage.sign,Manage.toubiao,Manage.equip," +
                "Manage.test,Manage.cuikuan,Manage.contract,Manage.other,Manage.PMday,Manage.remark," +
                "people.name,people.groupId,project.projectName,project.projectNo " +
                "from Manage,people,project " +
                "where Manage.year = ? and Manage.month = ? and Manage.projectid = project.id and Manage.username = people.username";
        return runner.query(sql, new BeanListHandler<ManageVo>(ManageVo.class),year,month);
    }

    public List<ManageVo> getManageVoListByDateProject(String year, String month, String projectid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select \n" +
                "Manage.id,Manage.username,Manage.projectid,Manage.year,Manage.month," +
                "Manage.xunjiaBaojia,Manage.tender,Manage.sign,Manage.toubiao,Manage.equip," +
                "Manage.test,Manage.cuikuan,Manage.contract,Manage.other,Manage.PMday,Manage.remark," +
                "people.name,people.groupId,project.projectName,project.projectNo " +
                "from Manage,people,project " +
                "where Manage.year = ? and Manage.month = ? and Manage.projectid = ? and Manage.projectid = project.id and Manage.username = people.username";
        return runner.query(sql, new BeanListHandler<ManageVo>(ManageVo.class),year,month,projectid);
    }

    public List<ProgramingVo> getProgramingVoListByDateUsername(String year, String month, String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select " +
                "ProgramingPicture.id,ProgramingPicture.username,ProgramingPicture.projectid,ProgramingPicture.year,ProgramingPicture.month," +
                "ProgramingPicture.digitalNumber,ProgramingPicture.analogNumber,ProgramingPicture.programingPicture," +
                "ProgramingPicture.programingDay,ProgramingPicture.monthDay,ProgramingPicture.remark," +
                "people.name,people.groupId,project.projectName,project.projectNo " +
                "from ProgramingPicture,people,project " +
                "where ProgramingPicture.year = ? and ProgramingPicture.month = ? and ProgramingPicture.username = ? and ProgramingPicture.projectid = project.id and ProgramingPicture.username = people.username";
        return runner.query(sql, new BeanListHandler<ProgramingVo>(ProgramingVo.class),year,month,username);
    }

    public List<ProgramingVo> getProgramingVoListByDate(String year, String month) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select " +
                "ProgramingPicture.id,ProgramingPicture.username,ProgramingPicture.projectid,ProgramingPicture.year,ProgramingPicture.month," +
                "ProgramingPicture.digitalNumber,ProgramingPicture.analogNumber,ProgramingPicture.programingPicture," +
                "ProgramingPicture.programingDay,ProgramingPicture.monthDay,ProgramingPicture.remark," +
                "people.name,people.groupId,project.projectName,project.projectNo " +
                "from ProgramingPicture,people,project " +
                "where ProgramingPicture.year = ? and ProgramingPicture.month = ? and ProgramingPicture.projectid = project.id and ProgramingPicture.username = people.username";
        return runner.query(sql, new BeanListHandler<ProgramingVo>(ProgramingVo.class),year,month);
    }

    public List<ProgramingVo> getProgramingVoListByDateProject(String year, String month, String projectid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select " +
                "ProgramingPicture.id,ProgramingPicture.username,ProgramingPicture.projectid,ProgramingPicture.year,ProgramingPicture.month," +
                "ProgramingPicture.digitalNumber,ProgramingPicture.analogNumber,ProgramingPicture.programingPicture," +
                "ProgramingPicture.programingDay,ProgramingPicture.monthDay,ProgramingPicture.remark," +
                "people.name,people.groupId,project.projectName,project.projectNo " +
                "from ProgramingPicture,people,project " +
                "where ProgramingPicture.year = ? and ProgramingPicture.month = ? and ProgramingPicture.projectid = ? and ProgramingPicture.projectid = project.id and ProgramingPicture.username = people.username";
        return runner.query(sql, new BeanListHandler<ProgramingVo>(ProgramingVo.class),year,month,projectid);
    }

    public List<DebugVo> getDebugVoListByDateUsername(String year, String month, String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select " +
                "Debug.id,Debug.username,Debug.projectid,Debug.year,Debug.month," +
                "Debug.site,Debug.manageday,Debug.debugday,Debug.remark," +
                "people.name,people.groupId,project.projectName,project.projectNo " +
                "from Debug,people,project " +
                "where Debug.year = ? and Debug.month = ? and Debug.username = ? and Debug.projectid = project.id and Debug.username = people.username";
        return runner.query(sql, new BeanListHandler<DebugVo>(DebugVo.class),year,month,username);
    }

    public List<DebugVo> getDebugVoListByDate(String year, String month) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select " +
                "Debug.id,Debug.username,Debug.projectid,Debug.year,Debug.month," +
                "Debug.site,Debug.manageday,Debug.debugday,Debug.remark," +
                "people.name,people.groupId,project.projectName,project.projectNo " +
                "from Debug,people,project " +
                "where Debug.year = ? and Debug.month = ? and Debug.projectid = project.id and Debug.username = people.username";
        return runner.query(sql, new BeanListHandler<DebugVo>(DebugVo.class),year,month);
    }

    public List<DebugVo> getDebugVoListByDateProject(String year, String month, String projectid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select " +
                "Debug.id,Debug.username,Debug.projectid,Debug.year,Debug.month," +
                "Debug.site,Debug.manageday,Debug.debugday,Debug.remark," +
                "people.name,people.groupId,project.projectName,project.projectNo " +
                "from Debug,people,project " +
                "where Debug.year = ? and Debug.month = ? and Debug.projectid = ? and Debug.projectid = project.id and Debug.username = people.username";
        return runner.query(sql, new BeanListHandler<DebugVo>(DebugVo.class),year,month,projectid);
    }

    public List<DailyVo> getDailyVoListByDateUsername(String year, String month, String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select " +
                "DailyWorking.id,DailyWorking.username,DailyWorking.year,DailyWorking.month," +
                "DailyWorking.type,DailyWorking.monthDay,DailyWorking.remark," +
                "people.name,people.groupId " +
                "from DailyWorking,people " +
                "where DailyWorking.year = ? and DailyWorking.month = ? and DailyWorking.username = ? and DailyWorking.username = people.username";
        return runner.query(sql, new BeanListHandler<DailyVo>(DailyVo.class),year,month,username);
    }

    public List<DailyVo> getDailyVoListByDate(String year, String month) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select " +
                "DailyWorking.id,DailyWorking.username,DailyWorking.year,DailyWorking.month," +
                "DailyWorking.type,DailyWorking.monthDay,DailyWorking.remark," +
                "people.name,people.groupId " +
                "from DailyWorking,people " +
                "where DailyWorking.year = ? and DailyWorking.month = ? and DailyWorking.username = people.username";
        return runner.query(sql, new BeanListHandler<DailyVo>(DailyVo.class),year,month);
    }


    public List<Summary> getSummaryListByDateUsername(String year, String month, String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select Summary.year,Summary.month,Summary.username," +
                "Summary.work_day,Summary.ratio,people.name,people.groupId " +
                "from Summary,people " +
                "where Summary.year = ? and Summary.month = ? and Summary.username = ? and Summary.username = people.username";
        return runner.query(sql, new BeanListHandler<Summary>(Summary.class),year,month,username);
    }

    public List<Summary> getSummaryListByDate(String year, String month) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select Summary.year,Summary.month,Summary.username," +
                "Summary.work_day,Summary.ratio,people.name,people.groupId " +
                "from Summary,people " +
                "where Summary.year = ? and Summary.month = ? and Summary.username = people.username";
        return runner.query(sql, new BeanListHandler<Summary>(Summary.class),year,month);
    }


    public double getDepartmentMonth(String year, String month) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select sum(cast(work_day as float)) from Summary where year = ? and month = ?";
        Object o = runner.query(sql,new ScalarHandler(),year,month);
        if(o == null){
            return 0;
        }else{
            return (double)o;
        }
    }

    public List<Summary> getSummaryListByYear(String year) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select Summary.year,people.name,Summary.username,sum(cast(work_day as float)) as work_day," +
                "sum(cast(ratio as float)) as ratio " +
                "from Summary,people where  Summary.username = people.username and Summary.year = ? group by Summary.username,people.name,Summary.year";
        return runner.query(sql, new BeanListHandler<Summary>(Summary.class),year);
    }

    public double getDepartmentYear(String year) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select sum(cast(work_day as float)) from Summary where year = ?";
        Object o = runner.query(sql,new ScalarHandler(),year);
        if(o == null){
            return 0;
        }else{
            return (double)o;
        }
    }
}
