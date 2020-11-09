package com.zdh.service;

import com.zdh.dao.JiediaoDao;
import com.zdh.domain.Jiediao;
import com.zdh.domain.User;

import java.sql.SQLException;

public class JiediaoService {
    JiediaoDao jiediaoDao = new JiediaoDao();

    public int addJiediao(Jiediao jiediao) {
        int i = 0;
        try {
            i = jiediaoDao.insertJiediao(jiediao);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
}
