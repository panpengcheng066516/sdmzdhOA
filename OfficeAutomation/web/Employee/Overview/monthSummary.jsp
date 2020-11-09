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
            $("#expButton").click(function () {
                var year=$("#selYear").children('option:selected').val();
                var month=$("#selMonth").children('option:selected').val();
                var projectid=$("#selProject").children('option:selected').val();
                var url = "${pageContext.request.contextPath}/exportMonthSummaryServlet?method=exportMonthSummary";

                window.location.href=url+"&year="+year+"&month="+month+"&projectid="+projectid;
            });
            // 选项框
            $("#selButton").click(function () {
                var year=$("#selYear").children('option:selected').val();
                var month=$("#selMonth").children('option:selected').val();
                var projectid=$("#selProject").children('option:selected').val();
                var url = "${pageContext.request.contextPath}/personalSummaryServlet?method=getWorkingListByDateProject";
                var summaryContent = "";
                var designContent = "";
                var programingContent = "";
                var debugContent = "";
                var manageContent = "";
                var dailyContent = "";
                $.post(url,{"year":year,"month":month,"projectid":projectid},function(data){
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
                                "<td>" + data.designVoList[i].name + "</td>" +
                                "<td><div class='text text-wrap text-break'>" + data.designVoList[i].projectName + "</div></td>" +
                                "<td><div class='text text-wrap text-break'>" + data.designVoList[i].projectNo + "</div></td>" +
                                "<td>" + data.designVoList[i].amount + "</td>" +
                                "<td>" + data.designVoList[i].a1 + "</td>" +
                                "<td>" + data.designVoList[i].zheheWorkingDay + "</td>" +
                                "<td>" + data.designVoList[i].monthDay + "</td>" +
                                "<td>" + data.designVoList[i].programDay + "</td>" +
                                "<td>" + data.designVoList[i].basicDesignDay + "</td>" +
                                "<td>" + data.designVoList[i].leader + "</td>" +
                                "<td ${user.power==1||user.power==2?'':'hidden'}><div class='text text-wrap text-break'>" + data.designVoList[i].remark + "</div></td>" +
                                "<td><a href='${pageContext.request.contextPath}/designWorkingServlet?method=getDesignInfo&designid="+data.designVoList[i].id+"'><button type='button' class='btn btn-inverse-info btn-rounded border-primary-muted btn-xs text-primary'>修改</button></a></td>" +
                                "</tr>";
                        }
                    }else{
                        designContent = " <tr> <td>空</td> </tr>";
                    }
                    if(data.programingVoList.length>0){
                        for(var i=0;i<data.programingVoList.length;i++) {
                            programingContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td>" + data.programingVoList[i].name + "</td>" +
                                "<td><div class='text text-wrap text-break'>" + data.programingVoList[i].projectNo + "</div></td>" +
                                "<td><div class='text text-wrap text-break'>" + data.programingVoList[i].digitalNumber + "</div></td>" +
                                "<td>" + data.programingVoList[i].analogNumber + "</td>" +
                                "<td>" + data.programingVoList[i].programingPicture + "</td>" +
                                "<td>" + data.programingVoList[i].programingDay + "</td>" +
                                "<td>" + data.programingVoList[i].monthday + "</td>" +
                                "<td ${user.power==1||user.power==2?'':'hidden'}><div class='text text-wrap text-break'>" + data.programingVoList[i].remark + "</div></td>" +
                                "<td><a href='${pageContext.request.contextPath}/programingPictureWorkingServlet?method=getProgramingInfo&programingid="+data.programingVoList[i].id+"'><button type='disabled' class='btn btn-inverse-info btn-rounded border-primary-muted btn-xs text-primary' >修改</button></a></td>" +
                                "</tr>";
                        }
                    }else{
                        programingContent = " <tr> <td>空</td> </tr>";
                    }
                    if(data.debugVoList.length>0){
                        for(var i=0;i<data.debugVoList.length;i++) {
                            debugContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td>" + data.debugVoList[i].name + "</td>" +
                                "<td><div class='text text-wrap text-break'>" + data.debugVoList[i].projectNo + "</div></td>" +
                                "<td>" + data.debugVoList[i].site + "</td>" +
                                "<td>" + data.debugVoList[i].manageday + "</td>" +
                                "<td>" + data.debugVoList[i].debugday + "</td>" +
                                "<td ${user.power==1||user.power==2?'':'hidden'}><div class='text text-wrap text-break'>" + data.debugVoList[i].remark + "</div></td>" +
                                "<td><a href='${pageContext.request.contextPath}/debugWorkingServlet?method=getProgramingInfo&debugid="+data.debugVoList[i].id+"'><button type='button' class='btn btn-inverse-info btn-rounded border-primary-muted btn-xs text-primary' >修改</button></a></td>" +
                                "</tr>";
                        }
                    }else{
                        debugContent = " <tr> <td>空</td> </tr>";
                    }
                    if(data.manageVoList.length>0){
                        for(var i=0;i<data.manageVoList.length;i++) {
                            manageContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td>" + data.manageVoList[i].name + "</td>" +
                                "<td><div class='text text-wrap text-break'>" + data.manageVoList[i].projectNo + "</div></td>" +
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
                                "<td ${user.power==1||user.power==2?'':'hidden'}><div class='text text-wrap text-break'>" + data.manageVoList[i].remark + "</div></td>" +
                                "<td><a href='${pageContext.request.contextPath}/manageWorkingServlet?method=getManageInfo&manageid="+data.manageVoList[i].id+"'><button type='button' class='btn btn-inverse-info btn-rounded border-primary-muted btn-xs text-primary' >修改</button></a></td>" +
                                "</tr>";
                        }
                    }else{
                        manageContent = " <tr> <td>空</td> </tr>";
                    }
                    if(data.dailyVoList.length>0){
                        for(var i=0;i<data.dailyVoList.length;i++) {
                            dailyContent += " <tr>" +
                                "<td>" + i + "</td>" +
                                "<td>" + data.dailyVoList[i].name + "</td>" +
                                "<td>" + data.dailyVoList[i].type + "</td>" +
                                "<td>" + data.dailyVoList[i].monthDay + "</td>" +
                                "<td ${user.power==1||user.power==2?'':'hidden'}><div class='text text-wrap text-break'>" + data.dailyVoList[i].remark + "</div></td>" +
                                "<td><a href='${pageContext.request.contextPath}/dailyWorkingServlet?method=getDailyWorkingInfo&dailyid="+data.dailyVoList[i].id+"'><button type='button' class='btn btn-inverse-info btn-rounded border-primary-muted btn-xs text-primary' >修改</button></a></td>" +
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
    </script>
</head>
<body>
<div class="main-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <%@ include file="../Master/SideBar.jsp"%>
    <!-- partial -->
    <div class="page-wrapper">
        <!-- partial:partials/_navbar.html -->
        <%@ include file="../Master/NavBar.jsp"%>
        <!-- partial -->
        <main class="page-main">
            <div class="page-content">
                <!-- row -->
                <div class="row">
                    <div class="container-fluid grid-margin col-md-12">
                        <div class="card card-rounded border-light">
                            <div class="card-body">
                                <div class="custom-control">
                                    <div class="form-group row">
                                        <label class="col-sm-auto col-form-label text-primary">年份</label>
                                        <div class="control-text col-sm-auto col-md-auto col-lg-auto">
                                            <select class="dropdown-item-text text-primary border-primary-muted" id="selYear" name="selYear" >
                                                <c:forEach begin="2019" end="2025" step="1" var="i">
                                                    <option value="${i}" ${currentYear == i?"selected":""}>${i}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        &nbsp;
                                        <label class="col-sm-auto col-form-label text-primary">月份</label>
                                        <div class="control-text col-sm-auto col-md-auto col-lg-auto">
                                            <select class="dropdown-item-text text-primary border-primary-muted" id="selMonth" name="selMonth" >
                                                <c:forEach begin="1" end="12" step="1" var="i">
                                                    <option value="${i}" ${currentMonth == i?"selected":""}>${i}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        &nbsp;
                                        <label class="col-sm-auto col-form-label text-primary">项目</label>
                                        <div class="control-text col-sm-auto col-md-auto col-lg-auto">
                                            <select class="selectpicker show-tick " id="selProject" name="selProject" data-live-search="true">
                                                <c:if test="${!empty projectList}">
                                                    <option value="全部" selected="selected" data-content="<span class='badge badge-primary'>全部</span>">全部</option>
                                                    <option value="全部" selected="selected">全部</option>
                                                    <c:forEach  var="project" items="${projectList}">
                                                        <option value="${project.id}">${project.projectName}</option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>
                                        &nbsp;
                                        <div class="col-sm-1 form-label">
                                            <input type="button" id="selButton" class="btn btn-inverse-success btn-rounded border-success btn-sm" name="submit" value="确定">
                                        </div>
                                    </div>
                                    &nbsp;
                                    <div class="form-group row align-content-sm-center">
                                        <div class="col-sm-auto form-label align-content-sm-center">
                                            <button type="button" id="expButton" class="btn btn-outline-danger btn-rounded btn-sm">导出</button>
                                        </div>
                                    </div>
                                </div>

                                <hr class="style-two">
                                <!-- tab选项卡 -->
                                <ul class="nav nav-tabs mt-6" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="tab-total" data-toggle="tab" href="#total" role="tab" aria-controls="chats" aria-selected="true">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="check-square" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">月总工日</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-design" data-toggle="tab" href="#design" role="tab" aria-controls="calls" aria-selected="false">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="cloud-lightning" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">设计</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-programming" data-toggle="tab" href="#programming" role="tab" aria-controls="contacts" aria-selected="false">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="disc" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">编程画面</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-debug" data-toggle="tab" href="#debug" role="tab" aria-controls="contacts" aria-selected="false">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="edit-2" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">调试管理</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-manage" data-toggle="tab" href="#manage" role="tab" aria-controls="contacts" aria-selected="false">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="file-minus" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">经营</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-daily" data-toggle="tab" href="#daily" role="tab" aria-controls="contacts" aria-selected="false">
                                            <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                                <i data-feather="image" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                                <p class="d-none d-sm-block">日常零星</p>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                                <!-- tab选项内容 -->
                                <div class="tab-content mt-3">
                                    <div class="tab-pane fade show active" id="total" role="tabpanel" aria-labelledby="total-tab">
                                        <div class="alert alert-warning alert-dismissible fade show text-danger" role="alert">
                                            <strong>此表为当月工日总和</strong> ，非指定项目的工日和
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="custom-control table">
                                            <div class="table-responsive text-nowrap">
                                                <table class="table table-striped table-condensed table-hover table-responsive-md" id="table01">
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
                                            <div class="table-responsive text-nowrap">
                                                <table class="table table-striped table-bordered table-hover table-condensed table-sm table-responsive-md" id="table02">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">#</th>
                                                        <th style="width:10%">姓名</th>
                                                        <th style="width:10%">工程名称</th>
                                                        <th>工程号</th>
                                                        <th>图纸数</th>
                                                        <th>折合A1</th>
                                                        <th>总工日</th>
                                                        <th>完成工日</th>
                                                        <th>技术方案</th>
                                                        <th>基本设计</th>
                                                        <th>专业<br>负责人</th>
                                                        <th style="width:20%">&emsp;备注&emsp;</th>
                                                        <th ${user.power==1||user.power==2?"":"hidden"}>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbDesign" class="text-secondary">
                                                    <c:if test="${!empty mainVo.designVoList}">
                                                        <c:forEach var="design" items="${mainVo.designVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${design.name}</td>
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
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>
                                                                    <a href="${pageContext.request.contextPath}/designWorkingServlet?method=getDesignInfo&designid=${design.id}">
                                                                        <button type="button" class="btn btn-inverse-info btn-rounded border-primary-muted btn-xs text-primary">修改</button>
                                                                    </a>
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
                                                <table class="table table-striped table-bordered table-hover table-condensed table-sm table-responsive-md" id="table03" cellspacing="0">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">#</th>
                                                        <th>姓名</th>
                                                        <th>工程号</th>
                                                        <th>总开关量</th>
                                                        <th>总模拟量</th>
                                                        <th>类型</th>
                                                        <th>总工日</th>
                                                        <th>完成工日</th>
                                                        <th>&emsp;备注&emsp;</th>
                                                        <th ${user.power==1||user.power==2?"":"hidden"}>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbPorgraming" class="text-secondary">
                                                    <c:if test="${!empty mainVo.programingVoList}">
                                                        <c:forEach var="programing" items="${mainVo.programingVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${programing.name}</td>
                                                                <td><div class="text text-wrap text-break">${programing.projectNo}</div></td>
                                                                <td>${programing.digitalNumber}</td>
                                                                <td>${programing.analogNumber}</td>
                                                                <td>${programing.programingPicture}</td>
                                                                <td>${programing.programingDay}</td>
                                                                <td>${programing.monthday}</td>
                                                                <td><div class="text text-wrap text-break">${programing.remark}</div></td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>
                                                                    <a href="${pageContext.request.contextPath}/programingPictureWorkingServlet?method=getProgramingInfo&programingid=${programing.id}">
                                                                        <button type="button" class="btn btn-inverse-info btn-rounded border-primary-muted btn-xs text-primary">修改</button>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="debug" role="tabpanel" aria-labelledby="debug-tab">
                                        <div class="custom-control table">
                                            <div class="table-responsive text-nowrap">
                                                <table class="table table-striped table-bordered table-hover table-condensed table-sm table-responsive-md" cellspacing="0" id="table04">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">#</th>
                                                        <th>姓名</th>
                                                        <th>工程号</th>
                                                        <th>地点</th>
                                                        <th style="width:5%">管理</th>
                                                        <th style="width:5%">调试</th>
                                                        <th>&emsp;备注&emsp;</th>
                                                        <th ${user.power==1||user.power==2?"":"hidden"}>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbDebug" class="text-secondary">
                                                    <c:if test="${!empty mainVo.debugVoList}">
                                                        <c:forEach var="debug" items="${mainVo.debugVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td><div class="text text-wrap text-break">${debug.name}</div></td>
                                                                <td><div class="text text-wrap text-break">${debug.projectNo}</div></td>
                                                                <td><div class="text text-wrap text-break">${debug.site}</div></td>
                                                                <td><div class="text text-wrap text-break">${debug.manageday}</div></td>
                                                                <td><div class="text text-wrap text-break">${debug.debugday}</div></td>
                                                                <td><div class="text text-wrap text-break">${debug.remark}</div></td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>
                                                                    <a href="${pageContext.request.contextPath}/debugWorkingServlet?method=getProgramingInfo&debugid=${debug.id}">
                                                                        <button type="button" class="btn btn-inverse-info btn-rounded border-primary-muted btn-xs text-primary">修改</button>
                                                                    </a>
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
                                                <table class="table table-striped table-bordered table-hover table-condensed table-sm table-responsive-md w-auto" cellspacing="0" id="table05">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">#</th>
                                                        <th>姓名</th>
                                                        <th>工程号</th>
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
                                                        <th style="width:15%" ${user.power==1||user.power==2?"":"hidden"}>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbManage" class="text-secondary">
                                                    <c:if test="${!empty mainVo.manageVoList}">
                                                        <c:forEach var="manage" items="${mainVo.manageVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${manage.name}</td>
                                                                <td><div class="text text-wrap text-break">${manage.projectNo}</div></td>
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
                                                                <td><div class="text text-wrap text-break">${manage.remark}</div></td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>
                                                                    <a href="${pageContext.request.contextPath}/manageWorkingServlet?method=getManageInfo&manageid=${manage.id}">
                                                                        <button type="button" class="btn btn-inverse-info btn-rounded border-primary-muted btn-xs text-primary">修改</button>
                                                                    </a>
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
                                                <table class="table table-striped table-borderless table-hover table-condensed table-sm table-responsive-md" cellspacing="0" id="table06">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">#</th>
                                                        <th>姓名</th>
                                                        <th>类型</th>
                                                        <th style="width:10%">工日</th>
                                                        <th>&emsp;备注&emsp;</th>
                                                        <th ${user.power==1||user.power==2?"":"hidden"}>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tbDaily" class="text-secondary">
                                                    <c:if test="${!empty mainVo.dailyVoList}">
                                                        <c:forEach var="daily" items="${mainVo.dailyVoList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${daily.name}</td>
                                                                <td>${daily.type}</td>
                                                                <td>${daily.monthDay}</td>
                                                                <td><div class="text text-wrap text-break">${daily.remark}</div></td>
                                                                <td ${user.power==1||user.power==2?"":"hidden"}>
                                                                    <a href="${pageContext.request.contextPath}/dailyWorkingServlet?method=getDailyWorkingInfo&dailyid=${daily.id}">
                                                                        <button type="button" class="btn btn-inverse-info btn-rounded border-primary-muted btn-xs text-primary">修改</button>
                                                                    </a>
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
<script>

    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
        $('.selectpicker').selectpicker('mobile');
    }

    function logUp() {
        window.location.href = "../../login.jsp";
    }

</script>
</html>