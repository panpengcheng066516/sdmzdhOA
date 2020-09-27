package com.zdh.domain.vo;

import com.zdh.domain.Summary;

import java.util.List;

public class MainVo {
    List<DailyVo> dailyVoList;
    List<DebugVo> debugVoList;
    List<DesignVo> designVoList;
    List<ManageVo>  manageVoList;
    List<ProgramingVo> programingVoList;
    List<Summary> summaryList;

    public List<Summary> getSummaryList() {
        return summaryList;
    }

    public void setSummaryList(List<Summary> summaryList) {
        this.summaryList = summaryList;
    }

    public List<DailyVo> getDailyVoList() {
        return dailyVoList;
    }

    public void setDailyVoList(List<DailyVo> dailyVoList) {
        this.dailyVoList = dailyVoList;
    }

    public List<DebugVo> getDebugVoList() {
        return debugVoList;
    }

    public void setDebugVoList(List<DebugVo> debugVoList) {
        this.debugVoList = debugVoList;
    }

    public List<DesignVo> getDesignVoList() {
        return designVoList;
    }

    public void setDesignVoList(List<DesignVo> designVoList) {
        this.designVoList = designVoList;
    }

    public List<ManageVo> getManageVoList() {
        return manageVoList;
    }

    public void setManageVoList(List<ManageVo> manageVoList) {
        this.manageVoList = manageVoList;
    }

    public List<ProgramingVo> getProgramingVoList() {
        return programingVoList;
    }

    public void setProgramingVoList(List<ProgramingVo> programingVoList) {
        this.programingVoList = programingVoList;
    }
}
