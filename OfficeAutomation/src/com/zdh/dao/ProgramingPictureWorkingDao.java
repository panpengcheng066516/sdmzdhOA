package com.zdh.dao;

import com.zdh.domain.ProgramingPictureWorking;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ProgramingPictureWorkingDao {
    //获取全部调试工作列表
    public List<ProgramingPictureWorking> getProgramingPictureWorkingList() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from DesignWorking";
        return runner.query(sql, new BeanListHandler<ProgramingPictureWorking>(ProgramingPictureWorking.class));
    }

    //通过用户名获取调试工作列表
    public List<ProgramingPictureWorking> getProgramingPictureWorkingByUsername(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from DesignWorking where username = ?";
        return runner.query(sql, new BeanListHandler<ProgramingPictureWorking>(ProgramingPictureWorking.class),username);
    }

//    //新增调试工作
//    public int addProgramingPictureWorking(ProgramingPictureWorking programingPictureWorking) throws SQLException {
//        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
//        String sql = "insert into ProgramingPictureWorking values()";
//        return runner.update(sql,);
//    }

    //通过id删除调试工作
    public int deleteProgramingPictureWorkingByid(String id) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from ProgramingPictureWorking where id = ?";
        return runner.update(sql,id);
    }

//    //更新调试工作
//    public int updateProgramingPictureWorking(ProgramingPictureWorking programingPictureWorking) throws SQLException {
//        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
//        String sql = "update ProgramingPictureWorking set  where id = ?";
//        int update = runner.update(sql,);
//        return update;
//    }
}
