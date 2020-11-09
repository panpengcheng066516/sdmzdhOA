package com.zdh.dao;

import com.zdh.domain.Project;
import com.zdh.domain.User;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class ProjectDao {

    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

    public List<Project> getAllProject() throws SQLException {
        String sql = "select * from project order by deadline DESC";
        return runner.query(sql, new BeanListHandler<Project>(Project.class));
    }

    public List<Project> getProjectListByUser(String username) throws SQLException {
        String sql = "select * from project where id in (select projectid from projectPeople where username = ?)";
        return runner.query(sql, new BeanListHandler<Project>(Project.class),username);
    }

    //添加项目
    public int addProject(Project project) throws SQLException {
        String sql = "insert into project (id,projectName,projectNo,deadline,finish,progress,manager,designer,reviewer,office,CE,remarks,stage) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        return runner.update(sql,project.getId(),project.getProjectName(),project.getProjectNo(),project.getDeadline(),project.getFinish(),
                project.getProgress(),project.getManager(),project.getDesigner(),project.getReviewer(),project.getOffice(),project.getCe(),
                project.getRemarks(),project.getStage());
    }

    //通过状态获取项目表
    public List<Project> getProjectByProgress(String progress) throws SQLException {
        String sql = "select * from project where progress = ? order by deadline DESC";
        return runner.query(sql, new BeanListHandler<Project>(Project.class),progress);
    }

    public Project getProjectById(String projectid) throws SQLException {
        String sql = "select * from project where id = ?";
        return runner.query(sql, new BeanHandler<Project>(Project.class),projectid);
    }

    //更新项目
    public int updateProject(Project project) throws SQLException {
        String sql = "update project set projectName=?,projectNo=?,deadline=?,finish=?,progress=?,manager=?,designer=?,reviewer=?,office=?,CE=?,remarks=?,stage=? where id = ?";
        return runner.update(sql,project.getProjectName(),project.getProjectNo(),project.getDeadline(),project.getFinish(),
                project.getProgress(),project.getManager(),project.getDesigner(),project.getReviewer(),project.getOffice(),project.getCe(),
                project.getRemarks(),project.getStage(),project.getId());
    }

    public int joinProject(String userName, String projectid) throws SQLException {
        String sql = "insert into projectPeople (projectid,username) values (?,?)";
        return runner.update(sql,projectid,userName);
    }

    public int quitProject(String userName, String projectid) throws SQLException {
        String sql = "delete from projectPeople where projectid = ? and username =?";
        return runner.update(sql,projectid,userName);
    }

    public List<Project> getPersonalProjectByProgress(String username, String progress) throws SQLException {
        String sql = "select * from project,projectPeople " +
                "where project.id = projectPeople.projectid and project.progress = ? and projectPeople.username = ? order by project.deadline DESC";
        return runner.query(sql, new BeanListHandler<Project>(Project.class),progress,username);
    }

    public int checkJoinProject(String userName, String projectid) throws SQLException {
        String sql = "select count(*) from projectPeople where projectid = ? and username = ?";
        return (int) runner.query(sql, new ScalarHandler(),projectid,userName);
    }
}
