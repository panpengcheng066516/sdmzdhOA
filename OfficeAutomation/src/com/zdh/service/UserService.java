package com.zdh.service;

import com.zdh.dao.UserDao;
import com.zdh.domain.User;

import java.sql.SQLException;
import java.util.List;

public class UserService {

    UserDao dao = new UserDao();


//    public boolean regist(User user) {
//
//        UserDao dao = new UserDao();
//        int row = 0;
//        try {
//            row = dao.regist(user);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return row>0?true:false;
//    }
//
//
    //校验用户名是否存在
    public boolean checkUsername(String username) {
        int isExist = 0;
        try {
            isExist = dao.checkUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isExist>0?true:false;
    }

    //检查用户名和密码是否一致，用户登录的方法
    public User login(String username, String password) throws SQLException {
        return dao.login(username,password);
    }

    public List<User> getUserList() {
        List<User> list = null;
        try {
             list = dao.getUserList();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int updatePassword(String username, String newPIN) {
        int i = 0;
        try {
            i = dao.updatePassword(username,newPIN);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public List<User> findAllUser() {
        List<User> list = null;
        try {
            list = dao.getUserList();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int addUser(User user) {
        int i = 0;
        try {
            i = dao.insertUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public int updateUser(User user) {
        int i = 0;
        try {
            i = dao.updateUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public int jiediaouser(String username) {
        int i = 0;
        try {
            i = dao.jiediaoUser(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public User getUserByUsername(String username){
        User user = null;
        try {
            user = dao.getUserByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
