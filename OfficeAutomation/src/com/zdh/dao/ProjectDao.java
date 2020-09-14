package com.zdh.dao;

import com.zdh.domain.Project;
import com.zdh.domain.User;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ProjectDao {

    public List<Project> getAllProject() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from project";
        return runner.query(sql, new BeanListHandler<Project>(Project.class));
    }

    public List<Project> getProjectListByUser(int userId) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from project where id in (select projectId from projectProject where peopleId = ?)";
        return runner.query(sql, new BeanListHandler<Project>(Project.class),userId);
    }

    //添加项目
    public int addProject(Project project) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into project values(?,?,?,?,?,?,?,?)";
        return runner.update(sql,project.getId());
    }
}
