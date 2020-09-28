package com.zdh.domain.vo;

import com.zdh.domain.Summary;
import com.zdh.utils.CommonsUtils;

import java.util.List;

public class SummaryMainVo {
    List<Summary> summaryMonthList;
    double departmentMonthWorkDay;

    List<Summary> summaryYearList;
    double departmentYearWorkDay;

    public List<Summary> getSummaryMonthList() {
        return summaryMonthList;
    }

    public void setSummaryMonthList(List<Summary> summaryMonthList) {
        this.summaryMonthList = summaryMonthList;
    }

    public double getDepartmentMonthWorkDay() {
        return departmentMonthWorkDay;
    }

    public void setDepartmentMonthWorkDay(double departmentMonthWorkDay) {
        this.departmentMonthWorkDay = departmentMonthWorkDay;
    }

    public List<Summary> getSummaryYearList() {
        return summaryYearList;
    }

    public void setSummaryYearList(List<Summary> summaryYearList) {
        this.summaryYearList = summaryYearList;
    }

    public double getDepartmentYearWorkDay() {
        return departmentYearWorkDay;
    }

    public void setDepartmentYearWorkDay(double departmentYearWorkDay) {
        this.departmentYearWorkDay = departmentYearWorkDay;
    }
}
