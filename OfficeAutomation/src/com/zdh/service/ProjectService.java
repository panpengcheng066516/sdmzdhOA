package com.zdh.service;

import com.zdh.dao.ProjectDao;
import com.zdh.domain.Project;

import java.sql.SQLException;
import java.util.List;

public class ProjectService {
    public List<Project> getAllProject() {
        ProjectDao projectDao = new ProjectDao();
        List<Project> list = null;
        try {
            list = projectDao.getAllProject();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Project> getProjectListByUser(String username) {
        ProjectDao projectDao = new ProjectDao();
        List<Project> list = null;
        try {
            list = projectDao.getProjectListByUser(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int addProject(Project project) {
        ProjectDao projectDao = new ProjectDao();
        int r = 0;
        try {
            r = projectDao.addProject(project);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public List<Project> getProjectByProgress(String progress) {
        ProjectDao projectDao = new ProjectDao();
        List<Project> list = null;
        try {
            list = projectDao.getProjectByProgress(progress);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
