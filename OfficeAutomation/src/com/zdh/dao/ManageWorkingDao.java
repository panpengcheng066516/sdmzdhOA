package com.zdh.dao;

import com.zdh.domain.ManageWorking;
import com.zdh.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ManageWorkingDao {
    //获取全部管理工作列表
    public List<ManageWorking> getManageWorkingList() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from Manage";
        return runner.query(sql, new BeanListHandler<ManageWorking>(ManageWorking.class));
    }

    //通过用户名获取管理工作列表
    public List<ManageWorking> getManageWorkingByUsername(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from Manage where username = ?";
        return runner.query(sql, new BeanListHandler<ManageWorking>(ManageWorking.class),username);
    }

    //新增管理工作
    public int addManageWorking(ManageWorking manageWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into Manage (year,month,username,id,xunjiabaojia,tender,sign,toubiao,equip,test,cuikuan,contract,other,PMday,remark,projectid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        return runner.update(sql,manageWorking.getYear(),manageWorking.getMonth(),manageWorking.getUsername(),manageWorking.getId(),
                manageWorking.getXunjiabaojia(),manageWorking.getTender(),manageWorking.getSign(),manageWorking.getToubiao(),
                manageWorking.getEquip(),manageWorking.getTest(),manageWorking.getCuikuan(),manageWorking.getContract(),manageWorking.getOther(),manageWorking.getPMday(),
                manageWorking.getRemark(),manageWorking.getProjectid());
    }

    //通过id删除管理工作
    public int deleteManageWorkingByid(String id) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from Manage where id = ?";
        return runner.update(sql,id);
    }

    //更新管理工作
    public int updateManageWorking(ManageWorking manageWorking) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update Manage set year=?,month=?,xunjiabaojia=?,tender=?,sign=?,toubiao=?,equip=?,test=?,cuikuan=?,contract=?,other=?,PMday=?,remark=?projectid=? where id = ?";
        int update = runner.update(sql,manageWorking.getYear(),manageWorking.getMonth(),manageWorking.getXunjiabaojia(),manageWorking.getTender(),
                manageWorking.getSign(),manageWorking.getToubiao(),manageWorking.getEquip(),manageWorking.getTest(),manageWorking.getCuikuan(),
                manageWorking.getContract(),manageWorking.getOther(),manageWorking.getPMday(),manageWorking.getRemark(),manageWorking.getProjectid());
        return update;
    }
}
