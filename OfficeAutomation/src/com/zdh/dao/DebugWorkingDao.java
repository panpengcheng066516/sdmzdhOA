package com.zdh.dao;

import com.zdh.domain.DebugWorking;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class DebugWorkingDao {
    //获取全部调试工作列表
    public List<DebugWorking> getDebugWorkingList() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from Debug";
        return runner.query(sql, new BeanListHandler<DebugWorking>(DebugWorking.class));
    }

    //通过用户名获取调试工作列表
    public List<DebugWorking> getDebugWorkingByUsername(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from Debug where username = ?";
        return runner.query(sql, new BeanListHandler<DebugWorking>(DebugWorking.class),username);
    }

    //新增调试工作
    public int addDebugWorking(DebugWorking debugWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into Debug (id,debugday,manageday,month,projectid,remark,site,username,year) values(?,?,?,?,?,?,?,?,?)";
        return runner.update(sql,debugWorking.getId(),debugWorking.getDebugday(),debugWorking.getManageday(),debugWorking.getMonth(),debugWorking.getPeojectid(),debugWorking.getRemark(),debugWorking.getSite(),debugWorking.getUsername(),debugWorking.getYear());
    }

    //通过id删除调试工作
    public int deleteDebugWorkingByid(String id) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from Debug where id = ?";
        return runner.update(sql,id);
    }

    //更新调试工作
    public int updateDebugWorking(DebugWorking debugWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update Debug set site = ?,manageday = ?,debugday = ?,remark = ?,projectid = ? where id = ?";
        int update = runner.update(sql,debugWorking.getSite(),debugWorking.getManageday(),debugWorking.getDebugday(),debugWorking.getRemark(),debugWorking.getPeojectid());
        return update;
    }
}
