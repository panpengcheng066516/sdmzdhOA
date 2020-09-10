package com.zdh.dao;

import com.zdh.domain.User;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.*;

import java.sql.SQLException;

public class UserDao {
//    public int regist(User user) throws SQLException {
//        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
//        String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?)";
////        int update = runner.update(sql, );
////        return update;
//        return 0;
//    }

    //校验用户名是否存在
    public int checkUsername(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from Login where username=?";
        int query = (int) runner.query(sql, new ScalarHandler(), username);
        return query;
    }

    //用户登录的方法
    public User login(String username, String password) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where username=? and password=?";
        User user = runner.query(sql, new BeanHandler<>(User.class), username,password);
        return user;
    }
}
