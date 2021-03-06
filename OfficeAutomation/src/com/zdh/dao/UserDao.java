package com.zdh.dao;

import com.zdh.domain.User;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.beanutils.converters.SqlDateConverter;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.*;

import java.sql.SQLException;
import java.util.List;

public class UserDao {

    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

    // 校验用户名是否存在
    public int checkUsername(String username) throws SQLException {
        String sql = "select count(*) from people where username=?";
        int query = (int) runner.query(sql, new ScalarHandler(), username);
        return query;
    }

    // 用户登录的方法
    public User login(String username, String password) throws SQLException {
        String sql = "select * from people where username=? and password=?";
        return runner.query(sql, new BeanHandler<>(User.class), username,password);
    }

    //获得所有用户
    public List<User> getUserList() throws SQLException {
        String sql = "select * from people";
        return runner.query(sql, new BeanListHandler<User>(User.class));
    }

    public int updatePassword(String username, String newPIN) throws SQLException {
        String sql = "update people SET password = ? where username=?";
        int update = runner.update(sql, newPIN, username);
        return update;
    }

    //添加用户
    public int insertUser(User user) throws SQLException {
        String sql = "insert into people values (?,?,?,?,?,?,?)";
        int update = runner.update(sql, user.getUsername(),user.getPassword(), user.getName(),user.getGroupId(),user.getPower(),user.getTransfer(),user.getInuse());
        return update;
    }

    //更新用户信息
    public int updateUser(User user) throws SQLException {
        String sql = "update people set password=?,name=?,groupid=?,power=?,transfer=?,inuse=? where username =?";
        int update = runner.update(sql, user.getPassword(), user.getName(),user.getGroupId(),user.getPower(),user.getTransfer(),user.getInuse(),user.getUsername());
        return update;
    }

    public int jiediaoUser(String username) throws SQLException {
        String sql = "update people set transfer=1 where username =?";
        int update = runner.update(sql, username);
        return update;
    }

    public User getUserByUsername(String username) throws SQLException {
        String sql = "select * from people where username = ?";
        return runner.query(sql, new BeanHandler<User>(User.class),username);
    }

    public User getUserByName(String name) throws SQLException {
        String sql = "select * from people where name = ?";
        return runner.query(sql, new BeanHandler<User>(User.class),name);
    }
}
