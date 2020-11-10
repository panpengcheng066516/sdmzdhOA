package com.zdh.web.servlet;

import com.zdh.domain.vo.MainVo;
import com.zdh.service.PersonalSummaryService;
import com.zdh.utils.ExcelUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;

public class ExportMonthSummaryServlet extends BaseServlet {

    PersonalSummaryService personalSummaryService = new PersonalSummaryService();

    public void exportMonthSummary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //首先准备要输出的工作量数据
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String projectid = new String(request.getParameter("projectid").getBytes("ISO-8859-1"),"UTF-8");
        MainVo mainVo = null;
        if(projectid.equals("全部")){
            //得到所有工作量
            mainVo = personalSummaryService.getMainVoByDate(year,month);
        }else{
            //得到项目工作量
            mainVo = personalSummaryService.getMainVoByDateProject(year,month,projectid);
        }

        //得到工作量数据后将数据存入表格文件中
        //创建一个HSSFWorkbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        String fileName = year + "年" + month + "月科室工作量汇总_项目：" + projectid + ".xls";
        String[] table = {"当月工日之和","设计","编程画面","调试管理","经营","日常零星"};
        String[][] title = {{"姓名","总工日"},
                {"姓名","工程号","工程名称","施工图纸张数","折合A1","折合总工日","本月完成工日","技术方案","基本设计","专业负责人","备注"},
                {"姓名","工程号","总开关点数","总模拟量点数","编程/画面","总工日","本月完成工日","备注"},
                {"姓名","工程号","项目地点","项目管理","调试","备注"},
                {"姓名","工程号","商务询价报价","标书制作","合同制作与签署","投标","设备招标采购","设备出厂检测","催款","合同管理","其他","项目经理","备注"},
                {"姓名","工作类型","折合天数","备注"}};
        for(int i = 0;i<table.length;i++){
            //在workbook中添加一个sheet
            HSSFSheet sheet = wb.createSheet(table[i]);
            //在sheet中添加表头第0行
            HSSFRow row = sheet.createRow(0);
            // 创建单元格，并设置值表头 设置表头居中
            HSSFCellStyle style = wb.createCellStyle();
            style.setAlignment(HorizontalAlignment.CENTER_SELECTION);; // 创建一个居中格式
            //声明列对象
            HSSFCell cell = null;
            //创建标题
            for(int j=0;j<title[i].length;j++){
                cell = row.createCell(j);
                cell.setCellValue(title[i][j]);
                cell.setCellStyle(style);
            }
            //创建内容
            switch (i){
                case 0:
                    for(int j=0;j<mainVo.getSummaryList().size();j++){
                        row = sheet.createRow(j + 1);
                        row.createCell(0).setCellValue(mainVo.getSummaryList().get(j).getName());
                        row.createCell(1).setCellValue(mainVo.getSummaryList().get(j).getWork_day());
                    }
                    break;
                case 1:
                    for(int j=0;j<mainVo.getDesignVoList().size();j++){
                        row = sheet.createRow(j + 1);
                        row.createCell(0).setCellValue(mainVo.getDesignVoList().get(j).getName());
                        row.createCell(1).setCellValue(mainVo.getDesignVoList().get(j).getProjectNo());
                        row.createCell(2).setCellValue(mainVo.getDesignVoList().get(j).getProjectName());
                        row.createCell(3).setCellValue(mainVo.getDesignVoList().get(j).getAmount());
                        row.createCell(4).setCellValue(mainVo.getDesignVoList().get(j).getA1());
                        row.createCell(5).setCellValue(mainVo.getDesignVoList().get(j).getZheheWorkingDay());
                        row.createCell(6).setCellValue(mainVo.getDesignVoList().get(j).getMonthDay());
                        row.createCell(7).setCellValue(mainVo.getDesignVoList().get(j).getProgramDay());
                        row.createCell(8).setCellValue(mainVo.getDesignVoList().get(j).getBasicDesignDay());
                        row.createCell(9).setCellValue(mainVo.getDesignVoList().get(j).getLeader());
                        row.createCell(10).setCellValue(mainVo.getDesignVoList().get(j).getRemark());
                    }
                    break;
                case 2:
                    for(int j=0;j<mainVo.getProgramingVoList().size();j++){
                        row = sheet.createRow(j + 1);
                        row.createCell(0).setCellValue(mainVo.getProgramingVoList().get(j).getName());
                        row.createCell(1).setCellValue(mainVo.getProgramingVoList().get(j).getProjectNo());
                        row.createCell(2).setCellValue(mainVo.getProgramingVoList().get(j).getDigitalNumber());
                        row.createCell(3).setCellValue(mainVo.getProgramingVoList().get(j).getAnalogNumber());
                        row.createCell(4).setCellValue(mainVo.getProgramingVoList().get(j).getProgramingPicture());
                        row.createCell(5).setCellValue(mainVo.getProgramingVoList().get(j).getProgramingDay());
                        row.createCell(6).setCellValue(mainVo.getProgramingVoList().get(j).getMonthday());
                        row.createCell(7).setCellValue(mainVo.getProgramingVoList().get(j).getRemark());
                    }
                    break;
                case 3:
                    for(int j=0;j<mainVo.getDebugVoList().size();j++){
                        row = sheet.createRow(j + 1);
                        row.createCell(0).setCellValue(mainVo.getDebugVoList().get(j).getName());
                        row.createCell(1).setCellValue(mainVo.getDebugVoList().get(j).getProjectNo());
                        row.createCell(2).setCellValue(mainVo.getDebugVoList().get(j).getSite());
                        row.createCell(3).setCellValue(mainVo.getDebugVoList().get(j).getManageday());
                        row.createCell(4).setCellValue(mainVo.getDebugVoList().get(j).getDebugday());
                        row.createCell(5).setCellValue(mainVo.getDebugVoList().get(j).getRemark());
                    }
                    break;
                case 4:
                    for(int j=0;j<mainVo.getManageVoList().size();j++){
                        row = sheet.createRow(j + 1);
                        row.createCell(0).setCellValue(mainVo.getManageVoList().get(j).getName());
                        row.createCell(1).setCellValue(mainVo.getManageVoList().get(j).getProjectNo());
                        row.createCell(2).setCellValue(mainVo.getManageVoList().get(j).getXunjiabaojia());
                        row.createCell(3).setCellValue(mainVo.getManageVoList().get(j).getTender());
                        row.createCell(4).setCellValue(mainVo.getManageVoList().get(j).getSign());
                        row.createCell(5).setCellValue(mainVo.getManageVoList().get(j).getToubiao());
                        row.createCell(6).setCellValue(mainVo.getManageVoList().get(j).getEquip());
                        row.createCell(7).setCellValue(mainVo.getManageVoList().get(j).getTest());
                        row.createCell(8).setCellValue(mainVo.getManageVoList().get(j).getCuikuan());
                        row.createCell(9).setCellValue(mainVo.getManageVoList().get(j).getContract());
                        row.createCell(10).setCellValue(mainVo.getManageVoList().get(j).getOther());
                        row.createCell(11).setCellValue(mainVo.getManageVoList().get(j).getPMday());
                        row.createCell(12).setCellValue(mainVo.getManageVoList().get(j).getRemark());
                    }
                    break;
                case 5:
                    for(int j=0;j<mainVo.getDailyVoList().size();j++){
                        row = sheet.createRow(j + 1);
                        row.createCell(0).setCellValue(mainVo.getDailyVoList().get(j).getName());
                        row.createCell(1).setCellValue(mainVo.getDailyVoList().get(j).getType());
                        row.createCell(2).setCellValue(mainVo.getDailyVoList().get(j).getMonthDay());
                        row.createCell(3).setCellValue(mainVo.getDailyVoList().get(j).getRemark());
                    }
                    break;
                default :
                    System.out.println("生成表格出错");
            }

        }
        //响应到客户端
        response.reset();
        try {
            ExcelUtils.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
