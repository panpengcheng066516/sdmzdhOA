<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/3/2020
  Time: 9:25 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.LinkedList"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Queue"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>自动化工程技术公司工作量汇总查询系统</title>
    <!-- 解决转发后页面失效问题 -->
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
    %>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/core/core.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/jquery-tags-input/jquery.tagsinput.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/dropzone/dropzone.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/dropify/dist/dropify.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/bootstrap-colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/tempusdominus-bootstrap-4/tempusdominus-bootstrap-4.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/fonts/feather-font/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/demo_1/style.css">
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.png" />
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/select2/select2.min.css">
    <link href="<%=basePath%>css/bootstrap-select.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/sweetalert2/sweetalert2.min.css">
    <!-- 弹出气泡 -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/normalize.css" />
    <link rel="stylesheet" href="<%=basePath%>dialogeffects/css/dialog.css">
    <link rel="stylesheet" href="<%=basePath%>dialogeffects/css/dialog-sandra.css">
    <script src="<%=basePath%>dialogeffects/js/modernizr.custom.js"></script>
    <style type="text/css">
        .table>thead>tr>th {
            text-align: center;
        }
        .table>tbody>tr>td {
            text-align: center;
        }
        hr.style-two {
            border: 0;
            height: 1px;
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(204,204,204), rgba(0, 0, 0, 0));
        }
        table {
            table-layout: fixed;
        }
    </style>
    <script type="text/javascript" src="assets/js/jquery-1.11.3.min.js" ></script>
    <script type="text/javascript">
        $(function(){
            // 选项框
            $("#selButton").click(function () {
                var year=$("#selYear").children('option:selected').val();
                var month=$("#selMonth").children('option:selected').val();

                var url = "${pageContext.request.contextPath}/personalSummaryServlet?method=getHistorySummaryByDate";
                var summaryMonthContent = "";
                var summaryYearContent = "";
                var departmentMonthContent = "";
                var departmentYearContent = "";
                $.post(url,{"year":year,"month":month},function(data){
                    if(data.summaryMonthList.length>0){
                        for(var i=0;i<data.summaryMonthList.length;i++) {
                            summaryMonthContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td>" + data.summaryMonthList[i].name + "</td>" +
                                "<td>" + data.summaryMonthList[i].work_day + "</td>" +
                                "</tr>";
                        }
                    }else{
                        summaryMonthContent = " <tr> <td>空</td> </tr>";
                    }

                    if(data.summaryYearList.length>0){
                        for(var i=0;i<data.summaryYearList.length;i++) {
                            summaryYearContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td>" + data.summaryYearList[i].name + "</td>" +
                                "<td>" + data.summaryYearList[i].work_day + "</td>" +
                                "</tr>";
                        }
                    }else{
                        summaryYearContent = " <tr> <td>空</td> </tr>";
                    }

                    if(data.departmentMonthWorkDay != null){
                        departmentMonthContent += "此月科室总工日为：" +
                            data.departmentMonthWorkDay;
                    }else{
                        departmentMonthContent = "空";
                    }

                    if(data.departmentYearWorkDay != null){
                        departmentYearContent += "此年科室总工日为：" +
                            data.departmentYearWorkDay;
                    }else{
                        departmentYearContent = "空";
                    }
                    $("#tbMonth").html(summaryMonthContent);
                    $("#tbYear").html(summaryYearContent);
                    $("#hMonth").html(departmentMonthContent);
                    $("#hYear").html(departmentYearContent);
                },"json");
            })
        });
    </script>
</head>
<body>
<div class="main-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <%@ include file="../Master/SideBar.jsp"%>
    <!-- partial -->
    <main class="page-wrapper">
        <!-- partial:partials/_navbar.html -->
        <%@ include file="../Master/NavBar.jsp"%>
        <!-- partial -->
        <div class="page-main">
            <div class="page-content">
                <div class="row">
                    <div class="container-fluid grid-margin col-md-12">
                        <div class="card card-rounded border-light">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label class="col-sm-auto col-form-label text-primary">年份</label>
                                        <div class="control-text col-sm-auto col-md-auto col-lg-auto">
                                            <select class="dropdown-item-text text-primary border-primary-muted" id="selYear" name="selYear" onchange="sel()">
                                                <c:forEach begin="2019" end="2025" step="1" var="i">
                                                    <option value="${i}" ${currentYear == i?"selected":""}>${i}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        &nbsp;
                                        <label class="col-sm-auto col-form-label text-primary">月份</label>
                                        <div class="control-text col-sm-auto col-md-auto col-lg-auto">
                                            <select class="dropdown-item-text text-primary border-primary-muted" id="selMonth" name="selMonth" onchange="sel0()">
                                                <c:forEach begin="1" end="12" step="1" var="i">
                                                    <option value="${i}" ${currentMonth == i?"selected":""}>${i}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        &nbsp;
                                        <div class="col-sm-1 form-label">
                                            <input type="button" id="selButton" class="btn btn-inverse-danger-muted btn-rounded border-danger-muted btn-sm text-danger" name="submit" value="确定">
                                        </div>
                                    </div>
                                    <hr class="style-two">
                                    <!-- tab选项卡 -->
                                    <ul class="nav nav-tabs mt-6" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="tab-month1" data-toggle="tab" href="#month1" role="tab" aria-controls="chats" aria-selected="true">
                                                <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                    <i data-feather="archive" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                    <p class="d-none d-sm-block">月工日统计</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="tab-year1" data-toggle="tab" href="#year1" role="tab" aria-controls="calls" aria-selected="false">
                                                <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                    <i data-feather="calendar" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                    <p class="d-none d-sm-block">年工日统计</p>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- tab选项内容 -->
                                    <div class="tab-content mt-3">
                                        <div class="tab-pane fade show active" id="month1" role="tabpanel" aria-labelledby="month1-tab">
                                            <div class="alert alert-icon-primary" role="alert">
                                                <i data-feather="clipboard"></i>
                                                本月全科室总工日：<strong>${summaryMainVo.departmentMonthWorkDay}</strong>
                                            </div>
                                            <div class="custom-control table">
                                                <div class="table-responsive text-nowrap">
                                                    <table class="table table-striped table-condensed table-hover table-responsive-md" id="table01">
                                                        <thead>
                                                        <tr>
                                                            <th style="width:5%">#</th>
                                                            <th>员工</th>
                                                            <th>月工日和</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="tbMonth" class="text-muted">
                                                        <c:if test="${!empty summaryMainVo.summaryMonthList}">
                                                            <c:forEach var="summary" items="${summaryMainVo.summaryMonthList}" varStatus="s">
                                                                <tr>
                                                                    <td>${s.index}</td>
                                                                    <td>${summary.name}</td>
                                                                    <td>${summary.work_day}</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="year1" role="tabpanel" aria-labelledby="year1-tab">
                                            <div class="alert alert-icon-primary" role="alert">
                                                <i data-feather="clipboard"></i>
                                                全年科室总工日：<strong>${summaryMainVo.departmentYearWorkDay}</strong>
                                            </div>
                                            <div class="custom-control table">
                                                <div class="table-responsive text-nowrap">
                                                    <table class="table table-striped table-condensed table-hover table-responsive-md" id="table02">
                                                        <thead>
                                                        <tr>
                                                            <th style="width:5%">#</th>
                                                            <th>员工</th>
                                                            <th>年工日和</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="tbYear" class="text-muted">
                                                        <c:if test="${!empty summaryMainVo.summaryYearList}">
                                                            <c:forEach var="summary" items="${summaryMainVo.summaryYearList}" varStatus="s">
                                                                <tr>
                                                                    <td>${s.index}</td>
                                                                    <td>${summary.name}</td>
                                                                    <td>${summary.work_day}</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- partial:partials/_footer.html -->
        <%@ include file="../Master/Footer.jsp"%>
        <!-- partial -->
    </main>
</div>
</body>
<script src="<%=basePath%>assets/vendors/select2/select2.min.js"></script>
<script src="<%=basePath%>assets/vendors/core/core.js"></script>
<script src="<%=basePath%>assets/vendors/jquery.flot/jquery.flot.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/jquery.flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/progressbar.js/progressbar.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/sweetalert2/sweetalert2.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/bootstrap-select.js" type="text/javascript"></script>
<script src="<%=basePath%>js/htmlFile/linkman.js" type="text/javascript"></script>
<!-- 弹出气泡 -->
<script src="<%=basePath%>dialogeffects/js/classie.js"></script>
<script src="<%=basePath%>dialogeffects/js/dialogFx.js"></script>
<script type="text/javascript">

    function exportExcel() {
        //var tmp=document.getElementById("companySel1").value;
        //var form=$("<form>");//定义一个form表单
        //form.attr("style","display:none");
        //form.attr("target","");
        //form.attr("method","post");
        //form.attr("action","${pageContext.request.contextPath}/OrderContactExportExcelServlet?method="+tmp);
        //var input1=$("<input>");
        //$("body").append(form);//将表单放置在web中
        //form.append(input1);
        //form.submit();//表单提交
        var fileName="工作量统计";
        var time = new Date();
        var day = ("0" + time.getDate()).slice(-2);
        var month = ("0" + (time.getMonth() + 1)).slice(-2);
        var today = time.getFullYear() + month + day + time.getHours() + time.getMinutes() + time.getSeconds();

        $("#table01").table2excel({
            exclude: ".noExl",
            name: "Excel Document Name",
            filename: fileName+today,
            sheetName: fileName,// sheetName
            exclude_img: true,
            exclude_links: true,
            exclude_inputs: true
        });
    }

    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
        $('.selectpicker').selectpicker('mobile');
    }

    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>