package com.zdh.service;

import com.zdh.dao.ChartsDao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ChartsService {
    public List<Double> getSumWorkdays(String year, String month) {
        ChartsDao chartsDao = new ChartsDao();
        ArrayList<Double> list = new ArrayList<Double>();
        Double design = Double.valueOf(0);
        Double programing = Double.valueOf(0);
        Double debug = Double.valueOf(0);
        Double manage = Double.valueOf(0);
        Double daily = Double.valueOf(0);

        try {
            design = chartsDao.getDesignMonthdays(year,month);
            programing = chartsDao.getProgramingMonthdays(year,month);
            debug = chartsDao.getDebugMonthdays(year,month);
            manage = chartsDao.getManageMonthdays(year,month);
            daily = chartsDao.getDailyMonthdays(year,month);

            list.add(design);
            list.add(programing);
            list.add(debug);
            list.add(manage);
            list.add(daily);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
