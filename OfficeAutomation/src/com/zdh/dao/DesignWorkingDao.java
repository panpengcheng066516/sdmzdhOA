package com.zdh.dao;

import com.zdh.domain.DesignWorking;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class DesignWorkingDao {
    //获取全部调试工作列表
    public List<DesignWorking> getDesignWorkingList() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from Design";
        return runner.query(sql, new BeanListHandler<DesignWorking>(DesignWorking.class));
    }

    //通过用户名获取调试工作列表
    public List<DesignWorking> getDesignWorkingByUsername(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from Design where username = ?";
        return runner.query(sql, new BeanListHandler<DesignWorking>(DesignWorking.class),username);
    }

    //新增调试工作
    public int addDesignWorking(DesignWorking designWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into Design (id,year,month,username,amount,a1,zheheWorkingDay,monthDay,programDay,BasicDesignDay,leader,remark,projectid) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        return runner.update(sql,designWorking.getId(),designWorking.getYear(),designWorking.getMonth(),designWorking.getUsername(),
                designWorking.getAmount(), designWorking.getA1(),designWorking.getZheheWorkingDay(),designWorking.getMonthDay(),
                designWorking.getProgramDay(),designWorking.getBasicDesignDay(),designWorking.getLeader(),designWorking.getRemark(),designWorking.getPeojectid());
    }

    //通过id删除调试工作
    public int deleteDesignWorkingByid(String id) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from Design where id = ?";
        return runner.update(sql,id);
    }

    //更新调试工作
    public int updateDesignWorking(DesignWorking designWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update Debug set amount = ?,a1 = ?,zheheWorkingDay = ?,monthDay = ?,programDay = ?,basicDesignDay = ?,leader = ?,remark = ?,projectid = ?  where id = ?";
        int update = runner.update(sql,designWorking.getAmount(),designWorking.getA1(),designWorking.getZheheWorkingDay(),designWorking.getMonthDay(),
                designWorking.getProgramDay(),designWorking.getBasicDesignDay(),designWorking.getLeader(),designWorking.getRemark(),designWorking.getPeojectid(),designWorking.getId());
        return update;
    }
}
