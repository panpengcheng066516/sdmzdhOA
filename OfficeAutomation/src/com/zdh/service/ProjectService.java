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

    public List<Project> getProjectListByUser(int userId) {
        ProjectDao projectDao = new ProjectDao();
        List<Project> list = null;
        try {
            list = projectDao.getProjectListByUser(userId);
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
}
