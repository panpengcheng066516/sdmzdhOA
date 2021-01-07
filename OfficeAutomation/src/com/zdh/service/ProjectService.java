package com.zdh.service;

import com.zdh.dao.ProjectDao;
import com.zdh.domain.Project;
import com.zdh.domain.User;

import java.sql.SQLException;
import java.util.List;

public class ProjectService {

    ProjectDao projectDao = new ProjectDao();


    public List<Project> getAllProject() {
        List<Project> list = null;
        try {
            list = projectDao.getAllProject();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Project> getProjectListByUser(String username) {
        List<Project> list = null;
        try {
            list = projectDao.getProjectListByUser(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<User> getUserListByProject(String projectid) {
        List<User> list = null;
        try {
            list = projectDao.getUserListByPeoject(projectid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int addProject(Project project) {

        int r = 0;
        try {
            r = projectDao.addProject(project);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public List<Project> getProjectByProgress(String progress) {
        List<Project> list = null;
        try {
            list = projectDao.getProjectByProgress(progress);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Project getProjectById(String projectid) {
        Project project = null;
        try {
            project = projectDao.getProjectById(projectid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return project;
    }

    public int updateProject(Project project) {
        int r = 0;
        try {
            r = projectDao.updateProject(project);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public int quitProject(String userName, String projectid) {
        int r = 0;
        try {
            r = projectDao.quitProject(userName,projectid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public List<Project> getPersonalProjectByProgress(String username, String progress) {
        List<Project> list = null;
        try {
            list = projectDao.getPersonalProjectByProgress(username,progress);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int joinProject(String userName, String projectid) {
        int b = checkJoinProject(userName,projectid);
        if(b>0){
            return 1;
        }
        int r = 0;
        try {
            r = projectDao.joinProject(userName,projectid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public int checkJoinProject(String userName, String projectid) {
        int r = 0;
        try {
            r = projectDao.checkJoinProject(userName,projectid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public int deleteRelationByProject(String id) {
        int r = 0;
        try {
            r = projectDao.deleteRelationByProject(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public int removePeopleFromProject(String projectid, String username) {
        int r = 0;
        try {
            r = projectDao.removePeopleFromProject(projectid,username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public int deleteProjectByid(String id) {
        int r = 0;
        int r2 = 0;
        try {
            r = projectDao.deleteRelationByProject(id);
            r2 = projectDao.deleteProjectByid(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(r >0 && r2 >0){
            return 1;
        }else{
            return 0;
        }
    }

}
