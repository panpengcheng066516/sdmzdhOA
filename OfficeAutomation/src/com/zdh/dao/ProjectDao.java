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

    public List<Project> getProjectListByUser(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from project where id in (select projectid from projectPeople where username = ?)";
        return runner.query(sql, new BeanListHandler<Project>(Project.class),username);
    }

    //添加项目
    public int addProject(Project project) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into project (id,projectName,projectNo,deadline,finish,progress,manager,designer,reviewer,office,CE,remarks) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        return runner.update(sql,project.getId(),project.getProjectName(),project.getProjectNo(),project.getDeadline(),project.getFinish(),
                project.getProgress(),project.getManager(),project.getDesigner(),project.getReviewer(),project.getOffice(),project.getCe(),
                project.getRemarks());
    }
}
