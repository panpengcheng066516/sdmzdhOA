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
            border-top: 1px solid #000000;
            border-color: #000000;
        }
        .table>tbody>tr>td {
            text-align: center;
            border-top: 1px solid #000000;
            border-color: #000000;
        }
    </style>
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
        <div class="page-content">

            <!-- row -->
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <!-- 过滤年月 -->
                            <div class="form-group row">
                                <label class="col-sm-1 col-form-label" style="font-size: 14px;">年份选择</label>
                                <div class="col-sm-2">
                                    <select class="selectpicker" style="text-align:center;text-align-last:center;" id="year" name="year" onchange="sel()">
                                        <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>
                                    </select>
                                </div>

                                <label class="col-sm-1 col-form-label" style="font-size: 14px;">月份选择</label>
                                <div class="col-sm-2">
                                    <select class="selectpicker" style="text-align:center;text-align-last:center;" id="month" name="month" onchange="sel0()">
                                        <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <hr width="300" align="left">
                            <!-- tab选项卡 -->
                            <ul class="nav nav-tabs mt-6" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="tab-design" data-toggle="tab" href="#total" role="tab" aria-controls="chats" aria-selected="true">
                                        <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                            <i data-feather="edit" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                            <p class="d-none d-sm-block">当月工日之和</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab-programming" data-toggle="tab" href="#design" role="tab" aria-controls="calls" aria-selected="false">
                                        <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                            <i data-feather="git-branch" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                            <p class="d-none d-sm-block">设计</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab-debug" data-toggle="tab" href="#programming" role="tab" aria-controls="contacts" aria-selected="false">
                                        <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                            <i data-feather="git-merge" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                            <p class="d-none d-sm-block">编程画面</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab-manage" data-toggle="tab" href="#debug" role="tab" aria-controls="contacts" aria-selected="false">
                                        <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                            <i data-feather="file-text" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                            <p class="d-none d-sm-block">调试管理</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab-daily" data-toggle="tab" href="#manage" role="tab" aria-controls="contacts" aria-selected="false">
                                        <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                            <i data-feather="gift" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                            <p class="d-none d-sm-block">经营</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab-others" data-toggle="tab" href="#daily" role="tab" aria-controls="contacts" aria-selected="false">
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

                                    <div class="text-muted mb-1" align="center">本月工日之和</div>
                                    <div class="form-group row">
                                        <div class="table-responsive pt-3">
                                            <table class="table table-bordered" id="table01">
                                                <thead>
                                                <tr>
                                                    <th>姓名</th>
                                                    <th>总工日</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${!empty workDay}">
                                                        <tr>
                                                            <td>${user.username}</td>
                                                            <td>${workDay}</td>
                                                        </tr>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- 别加div。。 -->
                                <div class="tab-pane fade" id="design" role="tabpanel" aria-labelledby="design-tab">

                                    <p class="text-muted mb-1" align="center">设计工作量</p>
                                    <div class="form-group row">
                                        <div class="table-responsive pt-3">
                                            <table class="table table-bordered" id="table02">
                                                <thead>
                                                <tr>
                                                    <th>序号</th>
                                                    <th>工程号</th>
                                                    <th>工程名称</th>
                                                    <th>施工图<br>图纸张数</th>
                                                    <th>图纸<br>折合A1数</th>
                                                    <th>折合<br>总工日</th>
                                                    <th>本月<br>完成工日</th>
                                                    <th>技术方案</th>
                                                    <th>基本设计</th>
                                                    <th>专业<br>负责人</th>
                                                    <th>备注</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${!empty designList}">
                                                        <c:forEach var="design" items="${designList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${design.projectid}</td>
                                                                <td>${design.projectid}</td>
                                                                <td>${design.amount}</td>
                                                                <td>${design.a1}</td>
                                                                <td>${design.zheheWorkingDay}</td>
                                                                <td>${design.monthDay}</td>
                                                                <td>${design.programDay}</td>
                                                                <td>${design.basicDesignDay}</td>
                                                                <td>${design.leader}</td>
                                                                <td>${design.remark}</td>
                                                                <td><button type="button" class="btn btn-outline-info btn-sm" onclick="update()">修改</button></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="programming" role="tabpanel" aria-labelledby="programming-tab">

                                    <p class="text-muted mb-1" align="center">编程画面工作量</p>
                                    <div class="form-group row">
                                        <div class="table-responsive pt-3">
                                            <table class="table table-bordered" id="table03">
                                                <thead>
                                                    <tr>
                                                        <th>序号</th>
                                                        <th>工程号</th>
                                                        <th>总开关量<br>点数</th>
                                                        <th>总模拟量<br>点数</th>
                                                        <th>编程/画面</th>
                                                        <th>总工日</th>
                                                        <th>本月<br>完成工日</th>
                                                        <th>备注</th>
                                                        <th>操作</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:if test="${!empty programingPictureList}">
                                                    <c:forEach var="programing" items="${programingPictureList}" varStatus="s">
                                                        <tr>
                                                            <td>${s.index}</td>
                                                            <td>${programing.projectid}</td>
                                                            <td>${programing.digitaNumber}</td>
                                                            <td>${programing.analogNumber}</td>
                                                            <td>${programing.programingPicture}</td>
                                                            <td>${programing.programingDay}</td>
                                                            <td>${programing.monthday}</td>
                                                            <td>${programing.reamrk}</td>
                                                            <td><button type="button" class="btn btn-outline-info btn-sm" onclick="update()">修改</button></td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="debug" role="tabpanel" aria-labelledby="debug-tab" >

                                    <p class="text-muted mb-1" align="center">调试工程管理工作量</p>
                                    <div class="form-group row">
                                        <div class="table-responsive pt-3">
                                            <table class="table table-bordered" id="table04">
                                                <thead>
                                                    <tr>
                                                        <th>序号</th>
                                                        <th>工程号</th>
                                                        <th>项目地点</th>
                                                        <th>工程管理</th>
                                                        <th>调试</th>
                                                        <th>备注</th>
                                                        <th>操作</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${!empty debugList}">
                                                        <c:forEach var="debug" items="${debugList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${debug.projectid}</td>
                                                                <td>${debug.site}</td>
                                                                <td>${debug.manageday}</td>
                                                                <td>${debug.debugday}</td>
                                                                <td>${debug.remark}</td>
                                                                <td><button type="button" class="btn btn-outline-info btn-sm" onclick="update()">修改</button></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="manage" role="tabpanel" aria-labelledby="manage-tab">

                                    <p class="text-muted mb-1" align="center">经营管理工作量</p>
                                    <div class="form-group row">
                                        <div class="table-responsive pt-3">
                                            <table class="table table-bordered" id="table05">
                                                    <thead>
                                                        <tr>
                                                            <th>序号</th>
                                                            <th>工程号</th>
                                                            <th>商务<br>询价报价</th>
                                                            <th>标书制作</th>
                                                            <th>合同制作<br>与签署</th>
                                                            <th>投标</th>
                                                            <th>设备<br>招标采购</th>
                                                            <th>设备<br>出厂检测</th>
                                                            <th>催款</th>
                                                            <th>合同管理</th>
                                                            <th>其他</th>
                                                            <th>项目经理</th>
                                                            <th>备注</th>
                                                            <th>操作</th>
                                                        </tr>
                                                    </thead>
                                                <tbody>
                                                    <c:if test="${!empty manageList}">
                                                        <c:forEach var="manage" items="${manageList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${manage.projectid}</td>
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
                                                                <td>${manage.remark}</td>
                                                                <td><button type="button" class="btn btn-outline-info btn-sm" onclick="update()">修改</button></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="daily" role="tabpanel" aria-labelledby="daily-tab">

                                    <p class="text-muted mb-1" align="center">日常管理零星工日</p>
                                    <div class="form-group row">
                                        <div class="table-responsive pt-3">
                                            <table class="table table-bordered" id="table06">
                                                <thead>
                                                <tr><th>序号</th>
                                                    <th>工作类型</th>
                                                    <th>折合天数</th>
                                                    <th>备注</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${!empty dailyList}">
                                                        <c:forEach var="daily" items="${dailyList}" varStatus="s">
                                                            <tr>
                                                                <td>${s.index}</td>
                                                                <td>${daily.type}</td>
                                                                <td>${daily.monthDay}</td>
                                                                <td>${daily.remark}</td>
                                                                <td><button type="button" class="btn btn-outline-info btn-sm" onclick="update()">修改</button></td>
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

</html>