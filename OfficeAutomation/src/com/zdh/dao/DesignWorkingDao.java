package com.zdh.dao;

import com.zdh.domain.DesignWorking;
import com.zdh.domain.Project;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;
import java.util.List;

public class DesignWorkingDao {
    //获取全部设计工作列表
    public List<DesignWorking> getDesignWorkingList() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from Design";
        return runner.query(sql, new BeanListHandler<DesignWorking>(DesignWorking.class));
    }

    //通过用户名获取设计工作列表
    public List<DesignWorking> getDesignWorkingByUsername(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from Design where username = ?";
        return runner.query(sql, new BeanListHandler<DesignWorking>(DesignWorking.class),username);
    }

    //通过用户名获取日期设计工作列表
    public List<DesignWorking> getDesignWorkingByDateUsername(String year,String month,String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from Design where username = ? and year = ? and month = ?";
        return runner.query(sql, new BeanListHandler<DesignWorking>(DesignWorking.class),username,year,month);
    }

    //新增设计工作
    public int addDesignWorking(DesignWorking designWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into Design (id,year,month,username,amount,a1,zheheWorkingDay,monthDay,programDay,BasicDesignDay,leader,remark,projectid) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        return runner.update(sql,designWorking.getId(),designWorking.getYear(),designWorking.getMonth(),designWorking.getUsername(),
                designWorking.getAmount(), designWorking.getA1(),designWorking.getZheheWorkingDay(),designWorking.getMonthDay(),
                designWorking.getProgramDay(),designWorking.getBasicDesignDay(),designWorking.getLeader(),designWorking.getRemark(),designWorking.getProjectid());
    }

    //通过id删除设计工作
    public int deleteDesignWorkingByid(String id) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from Design where id = ?";
        return runner.update(sql,id);
    }

    //更新设计工作
    public int updateDesignWorking(DesignWorking designWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update Design set amount = ?,a1 = ?,zheheWorkingDay = ?,monthDay = ?,programDay = ?,basicDesignDay = ?,leader = ?,remark = ?,projectid = ?  where id = ?";
        int update = runner.update(sql,designWorking.getAmount(),designWorking.getA1(),designWorking.getZheheWorkingDay(),designWorking.getMonthDay(),
                designWorking.getProgramDay(),designWorking.getBasicDesignDay(),designWorking.getLeader(),designWorking.getRemark(),designWorking.getProjectid(),designWorking.getId());
        return update;
    }

    public DesignWorking getDesignWorkingInfo(String designid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from Design where id = ?";
        return runner.query(sql, new BeanHandler<DesignWorking>(DesignWorking.class),designid);
    }

    public Project getProjectByid(String designid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from project where project.id = (select projectid from Design where Design.id = ?)";
        return runner.query(sql, new BeanHandler<Project>(Project.class),designid);
    }
}
