package com.zdh.dao;

import com.zdh.domain.Jiediao;
import com.zdh.domain.User;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;

public class JiediaoDao {
    //添加借调
    public int insertJiediao(Jiediao jiediao) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into Jiediao (year,month,username,ratio,transfer) values (?,?,?,?,?)";
        int update = runner.update(sql,jiediao.getYear(),jiediao.getMonth(),jiediao.getUsername(),jiediao.getRatio(),jiediao.getTransfer());
        return update;
    }
}
