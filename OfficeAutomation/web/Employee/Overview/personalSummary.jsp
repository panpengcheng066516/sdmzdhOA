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
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/select2/select2.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/fonts/feather-font/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/demo_1/style.css">
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.png" />
    <script type="text/javascript" src="<%=basePath%>assets/js/jquery-1.11.3.min.js" ></script>
    <script type="text/javascript">
        $(function(){
            // 选项框
            $("#selButton").click(function () {
                var year=$("#selYear").children('option:selected').val();
                var month=$("#selMonth").children('option:selected').val();
                var url = "${pageContext.request.contextPath}/personalSummaryServlet?method=getWorkingListByDateUser";
                var summaryContent = "";
                var designContent = "";
                var programingContent = "";
                var debugContent = "";
                var manageContent = "";
                var dailyContent = "";
                $.post(url,{"year":year,"month":month},function(data){
                    if(data.summaryList.length>0){
                        for(var i=0;i<data.summaryList.length;i++) {
                            summaryContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td>" + data.summaryList[i].name + "</td>" +
                                "<td>" + data.summaryList[i].work_day + "</td>" +
                                "</tr>";
                        }

                    }else{
                        summaryContent = " <tr> <td>空</td> </tr>";
                    }
                    if(data.designVoList.length>0){
                        for(var i=0;i<data.designVoList.length;i++) {
                            designContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td><div class='text-wrap text-break'>" + data.designVoList[i].projectName + "</div></td>" +
                                "<td><div class='text-wrap text-break'>" + data.designVoList[i].projectNo + "</div></td>" +
                                "<td>" + data.designVoList[i].amount + "</td>" +
                                "<td>" + data.designVoList[i].a1 + "</td>" +
                                "<td>" + data.designVoList[i].zheheWorkingDay + "</td>" +
                                "<td>" + data.designVoList[i].monthDay + "</td>" +
                                "<td>" + data.designVoList[i].programDay + "</td>" +
                                "<td>" + data.designVoList[i].basicDesignDay + "</td>" +
                                "<td>" + data.designVoList[i].leader + "</td>" +
                                "<td><div class='text text-wrap text-break'>" + data.designVoList[i].remark + "</div></td>" +
                                "<td><a href='${pageContext.request.contextPath}/designWorkingServlet?method=getDesignInfo&designid="+data.designVoList[i].id+"'><button type='button' class='btn btn-reddit btn-rounded btn-xs'>修改</button></a>" +
                                "<button type=\"button\" onclick=\"deDesign('"+data.designVoList[i].id+"')\" class=\"btn btn-primary btn-rounded btn-xs\">删除</button></td>" +
                                "</tr>";
                        }
                    }else{
                        designContent = " <tr> <td>空</td> </tr>";
                    }
                    if(data.programingVoList.length>0){
                        for(var i=0;i<data.programingVoList.length;i++) {
                            programingContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td><div class='text-wrap text-break'>" + data.programingVoList[i].projectName + "</div></td>" +
                                "<td>" + data.programingVoList[i].workname + "</td>" +
                                "<td>" + data.programingVoList[i].digitalNumber + "</td>" +
                                "<td>" + data.programingVoList[i].analogNumber + "</td>" +
                                "<td>" + data.programingVoList[i].programingPicture + "</td>" +
                                "<td>" + data.programingVoList[i].programingDay + "</td>" +
                                "<td>" + data.programingVoList[i].monthday + "</td>" +
                                "<td><div class='text-wrap text-break'>" + data.programingVoList[i].remark + "</div></td>" +
                                "<td><a href='${pageContext.request.contextPath}/programingPictureWorkingServlet?method=getProgramingInfo&programingid="+data.programingVoList[i].id+"'><button type='button' class='btn btn-reddit btn-rounded btn-xs'>修改</button></a>" +
                                "<button type=\"button\" onclick=\"dePrograming('"+data.programingVoList[i].id+"')\" class=\"btn btn-primary btn-rounded btn-xs\">删除</button></td>" +
                                "</tr>";
                        }
                    }else{
                        programingContent = " <tr> <td>空</td> </tr>";
                    }
                    if(data.debugVoList.length>0){
                        for(var i=0;i<data.debugVoList.length;i++) {
                            debugContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td><div class='text-wrap text-break'>" + data.debugVoList[i].projectName + "</div></td>" +
                                "<td>" + data.debugVoList[i].workname + "</td>" +
                                "<td>" + data.debugVoList[i].site + "</td>" +
                                "<td>" + data.debugVoList[i].manageday + "</td>" +
                                "<td>" + data.debugVoList[i].debugday + "</td>" +
                                "<td><div class='text-wrap text-break'>" + data.debugVoList[i].remark + "</div></td>" +
                                "<td><a href='${pageContext.request.contextPath}/debugWorkingServlet?method=getProgramingInfo&debugid="+data.debugVoList[i].id+"'><button type='button' class='btn btn-reddit btn-rounded btn-xs'>修改</button></a>" +
                                "<button type=\"button\" onclick=\"deDebug('"+data.debugVoList[i].id+"')\" class=\"btn btn-primary btn-rounded btn-xs\">删除</button></td>" +
                                "</tr>";
                        }
                    }else{
                        debugContent = " <tr> <td>空</td> </tr>";
                    }
                    if(data.manageVoList.length>0){
                        for(var i=0;i<data.manageVoList.length;i++) {
                            manageContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td><div class='text-wrap text-break'>" + data.manageVoList[i].projectName + "</div></td>" +
                                "<td>" + data.manageVoList[i].workname + "</td>" +
                                "<td>" + data.manageVoList[i].xunjiabaojia + "</td>" +
                                "<td>" + data.manageVoList[i].tender + "</td>" +
                                "<td>" + data.manageVoList[i].sign + "</td>" +
                                "<td>" + data.manageVoList[i].toubiao + "</td>" +
                                "<td>" + data.manageVoList[i].equip + "</td>" +
                                "<td>" + data.manageVoList[i].test + "</td>" +
                                "<td>" + data.manageVoList[i].cuikuan + "</td>" +
                                "<td>" + data.manageVoList[i].contract + "</td>" +
                                "<td>" + data.manageVoList[i].other + "</td>" +
                                "<td>" + data.manageVoList[i].PMday + "</td>" +
                                "<td><div class='text-wrap text-break'>" + data.manageVoList[i].remark + "</div></td>" +
                                "<td><a href='${pageContext.request.contextPath}/manageWorkingServlet?method=getManageInfo&manageid="+data.manageVoList[i].id+"'><button type='button' class='btn btn-reddit btn-rounded btn-xs'>修改</button></a>" +
                                "<button type=\"button\" onclick=\"deManage('"+data.manageVoList[i].id+"')\" class=\"btn btn-primary btn-rounded btn-xs\">删除</button></td>" +
                                "</tr>";
                        }
                    }else{
                        manageContent = " <tr> <td>空</td> </tr>";
                    }
                    if(data.dailyVoList.length>0){
                        for(var i=0;i<data.dailyVoList.length;i++) {
                            dailyContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td>" + data.dailyVoList[i].type + "</td>" +
                                "<td>" + data.dailyVoList[i].monthDay + "</td>" +
                                "<td><div class='text-wrap text-break'>" + data.dailyVoList[i].remark + "</div></td>" +
                                "<td><a href='${pageContext.request.contextPath}/dailyWorkingServlet?method=getDailyWorkingInfo&dailyid="+data.dailyVoList[i].id+"'><button type='button' class='btn btn-reddit btn-rounded btn-xs'>修改</button></a></td>" +
                                "<button type=\"button\" onclick=\"deDaily('"+data.dailyVoList[i].id+"')\" class=\"btn btn-primary btn-rounded btn-xs\">删除</button></td>" +
                                "</tr>";
                        }
                    }else{
                        dailyContent = " <tr> <td>空</td> </tr>";
                    }
                    $("#tbSummary").html(summaryContent);
                    $("#tbDesign").html(designContent);
                    $("#tbPorgraming").html(programingContent);
                    $("#tbDebug").html(debugContent);
                    $("#tbManage").html(manageContent);
                    $("#tbDaily").html(dailyContent);
                },"json");
            })
        });

        function deDesign(id) {
            if(confirm("确定删除此条工作量吗？")){
                window.location.href="${ pageContext.request.contextPath }/designWorkingServlet?method=deleteByid&designid="+id;
            }
        }
        function dePrograming(id) {
            if(confirm("确定删除此条工作量吗？")){
                window.location.href="${ pageContext.request.contextPath }/programingPictureWorkingServlet?method=deleteByid&programingid="+id;
            }
        }
        function deDebug(id) {
            if(confirm("确定删除此条工作量吗？")){
                window.location.href="${ pageContext.request.contextPath }/debugWorkingServlet?method=deleteByid&debugid="+id;
            }
        }
        function deManage(id) {
            if(confirm("确定删除此条工作量吗？")){
                window.location.href="${ pageContext.request.contextPath }/manageWorkingServlet?method=deleteByid&manageid="+id;
            }
        }
        function deDaily(id) {
            if(confirm("确定删除此条工作量吗？")){
                window.location.href="${ pageContext.request.contextPath }/dailyWorkingServlet?method=deleteByid&dailyid="+id;
            }
        }
    </script>
</head>
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
<body>
<div class="main-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <%@ include file="../Master/SideBar.jsp"%>
    <!-- partial -->
    <div class="page-wrapper" style="background-image: linear-gradient(to right bottom, #fbf6f0, #f8f6ee, #f5f5ed, #f1f5ed, #edf5ed, #edf5ed, #edf5ed, #edf5ed, #f1f5ed, #f5f5ed, #f8f6ee, #fbf6f0);">
        <!-- partial:partials/_navbar.html -->
        <%@ include file="../Master/NavBar.jsp"%>
        <!-- partial -->
        <main class="page-main">
            <div class="page-content">
                <%--breadscrumb--%>
                <nav class="page-breadcrumb">
                    <ol class="breadcrumb bg-inverse-primary">
                        <li class="breadcrumb-item text-small"><a href="index.jsp">首页</a></li>
                        <li class="breadcrumb-item active text-small" aria-current="page">个人工作记录一览</li>
                    </ol>
                </nav>
                <!-- row -->
                <div class="row">
                    <div class="container-fluid grid-margin col-md-12">
                        <div class="card card-rounded border-light shadow-lg">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-sm-auto col-form-label text-muted">年份</label>
                                    <div class="control-text col-sm-auto col-md-auto col-lg-auto">
                                        <select class="select2" id="selYear" name="selYear">
                                            <c:forEach begin="2018" end="2026" step="1" var="i">
                                                <option value="${i}" ${currentYear == i?"selected":""} style="text-align: center; text-align-last: center;">${i}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <label class="col-sm-auto col-form-label text-muted">月份</label>
                                    <div class="control-text col-sm-auto col-md-auto col-lg-auto">
                                        <select class="select2" id="selMonth" name="selMonth" >
                                            <c:forEach begin="1" end="12" step="1" var="i">
                                                <option value="${i}" ${currentMonth == i?"selected":""} style="text-align: center; text-align-last: center;">${i}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    &nbsp;
                                    <div class="col-sm-1 form-label">
                                        <input type="button" class="btn btn-danger btn-sm" id="selButton" value="确定">
                                    </div>
                                </div>
                                <hr class="style-two">
                                <ul class="nav nav-tabs mt-6 nav-tabs-justified" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="tab-total" data-toggle="tab" href="#total" role="tab" aria-controls="chats" aria-selected="true">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="edit" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">月总工日</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-design" data-toggle="tab" href="#design" role="tab" aria-controls="calls" aria-selected="false">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="git-branch" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">设计</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-programming" data-toggle="tab" href="#programming" role="tab" aria-controls="contacts" aria-selected="false">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="git-merge" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">编程画面</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-debug" data-toggle="tab" href="#debug" role="tab" aria-controls="contacts" aria-selected="false">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="file-text" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">调试管理</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-manage" data-toggle="tab" href="#manage" role="tab" aria-controls="contacts" aria-selected="false">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="gift" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">经营</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-daily" data-toggle="tab" href="#daily" role="tab" aria-controls="contacts" aria-selected="false">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="layers" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">日常零星</p>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                                <!-- tab选项内容 -->
                                <div class="tab-content mt-3">
                                    <div class="tab-pane fade show active" id="total" role="tabpanel" aria-labelledby="total-tab">
                                        <div class="custom-control table">
                                            <div class="table-responsive text-nowrap">
                                                <table class="table table-striped table-hover table-responsive-md" id="table01">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">#</th>
                                                        <th>姓名</th>
                                                        <th>总工日</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbSummary" class="text-secondary">
                                                    <c:if test="${!empty mainVo.summaryList}">
                                                        <c:forEach var="summary" items="${mainVo.summaryList}" varStatus="s">
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
                                    <div class="tab-pane fade" id="design" role="tabpanel" aria-labelledby="design-tab">
                                        <div class="custom-control table">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover table-responsive-md w-auto" id="table02" >
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">#</th>
                                                        <th style="width:10%">工程名称</th>
                                                        <th>工程号</th>
                                                        <th>图纸数</th>
                                                        <th>折合A1</th>
                                                        <th>总工日</th>
                                                        <th>完成工日</th>
                                                        <th>技术方案</th>
                                                        <th>基本设计</th>
                                                        <th style="width:5%">专业<br>负责人</th>
                                                        <th style="width:15%">&emsp;备注&emsp;</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbDesign" class="text-secondary">
                                                    <c:if test="${!empty mainVo.designVoList}">
                                                        <c:forEach var="design" items="${mainVo.designVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td><div class="text text-wrap text-break">${design.projectName}</div></td>
                                                                <td><div class="text text-wrap text-break">${design.projectNo}</div></td>
                                                                <td>${design.amount}</td>
                                                                <td>${design.a1}</td>
                                                                <td>${design.zheheWorkingDay}</td>
                                                                <td>${design.monthDay}</td>
                                                                <td>${design.programDay}</td>
                                                                <td>${design.basicDesignDay}</td>
                                                                <td>${design.leader}</td>
                                                                <td><div class="text text-wrap text-break">${design.remark}</div></td>
                                                                <td>
                                                                    <a href="${pageContext.request.contextPath}/designWorkingServlet?method=getDesignInfo&designid=${design.id}">
                                                                        <button type="button" class="btn btn-reddit btn-rounded btn-xs">修改</button>
                                                                    </a><br>
                                                                    <button type="button"
                                                                            onclick="deDesign('${design.id}')"
                                                                            class="btn btn-primary btn-rounded btn-xs">删除
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="programming" role="tabpanel" aria-labelledby="programming-tab">
                                        <div class="custom-control table">
                                            <div class="table-responsive text-nowrap">
                                                <table class="table table-striped table-hover table-responsive-md" id="table03" cellspacing="0">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">#</th>
                                                        <th>工程名</th>
                                                        <th>工作名称</th>
                                                        <th>总开关量</th>
                                                        <th>总模拟量</th>
                                                        <th>类型</th>
                                                        <th>总工日</th>
                                                        <th>完成工日</th>
                                                        <th>&emsp;备注&emsp;</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbPorgraming" class="text-secondary">
                                                    <c:if test="${!empty mainVo.programingVoList}">
                                                        <c:forEach var="programing" items="${mainVo.programingVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td><div class="text-wrap text-break">${programing.projectName}</div></td>
                                                                <td>${programing.workname}</td>
                                                                <td>${programing.digitalNumber}</td>
                                                                <td>${programing.analogNumber}</td>
                                                                <td>${programing.programingPicture}</td>
                                                                <td>${programing.programingDay}</td>
                                                                <td>${programing.monthday}</td>
                                                                <td><div class="text-wrap text-break">${programing.remark}</div></td>
                                                                <td>
                                                                    <a href="${pageContext.request.contextPath}/programingPictureWorkingServlet?method=getProgramingInfo&programingid=${programing.id}">
                                                                        <button type="button" class="btn btn-reddit btn-rounded btn-xs">修改</button>
                                                                    </a><br>
                                                                    <button type="button"
                                                                            onclick="dePrograming('${programing.id}')" class="btn btn-primary btn-rounded btn-xs">删除</button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="debug" role="tabpanel" aria-labelledby="debug-tab" >
                                        <div class="custom-control table">
                                            <div class="table-responsive text-nowrap">
                                                <table class="table table-striped table-hover table-responsive-md" cellspacing="0" id="table04">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">#</th>
                                                        <th>工程名</th>
                                                        <th>工作名称</th>
                                                        <th>地点</th>
                                                        <th style="width:5%">管理</th>
                                                        <th style="width:5%">调试</th>
                                                        <th>备注</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbDebug" class="text-secondary">
                                                    <c:if test="${!empty mainVo.debugVoList}">
                                                        <c:forEach var="debug" items="${mainVo.debugVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td><div class="text-wrap text-break">${debug.projectName}</div></td>
                                                                <td>${debug.workname}</td>
                                                                <td>${debug.site}</td>
                                                                <td>${debug.manageday}</td>
                                                                <td>${debug.debugday}</td>
                                                                <td><div class="text-wrap text-break">${debug.remark}</div></td>
                                                                <td>
                                                                    <a href="${pageContext.request.contextPath}/debugWorkingServlet?method=getProgramingInfo&debugid=${debug.id}">
                                                                        <button type="button" class="btn btn-reddit btn-rounded btn-xs">修改</button>
                                                                    </a><br>
                                                                    <button type="button" onclick="deDebug('${debug.id}')" class="btn btn-primary btn-rounded btn-xs">删除</button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="manage" role="tabpanel" aria-labelledby="manage-tab">
                                        <div class="custom-control table">
                                            <div class="table-responsive text-nowrap">
                                                <table class="table table-striped table-bordered table-hover table-responsive-md w-auto" cellspacing="0" id="table05">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">#</th>
                                                        <th>工程名</th>
                                                        <th>工作名称</th>
                                                        <th>商务询价</th>
                                                        <th>标书制作</th>
                                                        <th>合同签署</th>
                                                        <th>投标</th>
                                                        <th>设备采购</th>
                                                        <th>设备检测</th>
                                                        <th>债务</th>
                                                        <th>合同管理</th>
                                                        <th>其他</th>
                                                        <th>项目经理</th>
                                                        <th>&emsp;备注&emsp;</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbManage" class="text-secondary">
                                                    <c:if test="${!empty mainVo.manageVoList}">
                                                        <c:forEach var="manage" items="${mainVo.manageVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td><div class="text-wrap text-break">${manage.projectName}</div></td>
                                                                <td>${manage.workname}</td>
                                                                <td>${manage.xunjiabaojia}</td>
                                                                <td>${manage.tender}</td>
                                                                <td>${manage.sign}</td>
                                                                <td>${manage.toubiao}</td>
                                                                <td>${manage.equip}</td>
                                                                <td>${manage.test}</td>
                                                                <td>${manage.cuikuan}</td>
                                                                <td>${manage.contract}</td>
                                                                <td>${manage.other}</td>
                                                                <td>${manage.PMday}</td>
                                                                <td><div class="text-wrap text-break">${manage.remark}</div></td>
                                                                <td>
                                                                    <a href="${pageContext.request.contextPath}/manageWorkingServlet?method=getManageInfo&manageid=${manage.id}">
                                                                        <button type="button" class="btn btn-reddit btn-rounded btn-xs">修改</button>
                                                                    </a><br>
                                                                    <button type="button" onclick="deManage('${manage.id}')" class="btn btn-primary btn-rounded btn-xs">删除</button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="daily" role="tabpanel" aria-labelledby="daily-tab">
                                        <div class="custom-control table">
                                            <div class="table-responsive text-nowrap">
                                                <table class="table table-striped table-hover table-responsive-md" cellspacing="0" id="table06">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">#</th>
                                                        <th>类型</th>
                                                        <th style="width:10%">工日</th>
                                                        <th>&emsp;备注&emsp;</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbDaily" class="text-secondary">
                                                    <c:if test="${!empty mainVo.dailyVoList}">
                                                        <c:forEach var="daily" items="${mainVo.dailyVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${daily.type}</td>
                                                                <td>${daily.monthDay}</td>
                                                                <td><div class="text-wrap text-break">${daily.remark}</div></td>
                                                                <td>
                                                                    <a href="${pageContext.request.contextPath}/dailyWorkingServlet?method=getDailyWorkingInfo&dailyid=${daily.id}">
                                                                        <button type="button" class="btn btn-reddit btn-rounded btn-xs">修改</button>
                                                                    </a><br>
                                                                    <button type="button" onclick="deDaily('${daily.id}')" class="btn btn-primary btn-rounded btn-xs">删除</button>
                                                                </td>
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
        </main>
        <!-- partial:partials/_footer.html -->
        <%@ include file="../Master/Footer.jsp"%>
        <!-- partial -->
    </div>
</div>
</body>
<script src="<%=basePath%>assets/vendors/core/core.js"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/select2/select2.min.js"></script>
<script>

    if ($(".select2").length) {
        $(".select2").select2({
            minimumResultsForSearch: Infinity,
        });
    }

    function logUp() {
        window.location.href = "../../login.jsp";
    }

</script>
</html>