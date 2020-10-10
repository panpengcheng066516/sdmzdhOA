<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/30/2020
  Time: 1:34 PM
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
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/flag-icon-css/css/flag-icon.min.css">
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
    <script src="echarts.min.js"></script>
    <style type="text/javascript">


    </style>
</head>
<body>
<div class="main-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <%@ include file="Employee/Master/SideBar.jsp"%>
    <!-- partial -->

    <div class="page-wrapper">
        <!-- partial:partials/_navbar.html -->
        <%@ include file="Employee/Master/NavBar.jsp"%>

        <!-- partial -->
        <div class="page-content">
            <!-- row -->
            <div class="alert alert-danger" role="alert">
                <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
                    <div>
                        <h4 class="mb-3 mb-md-0">Welcome to Dashboard. </h4>
                    </div>
                    <div class="d-flex align-items-center flex-wrap text-nowrap">
                        <!-- 就是个日历 -->
                        <div class="input-group date datepicker dashboard-date mr-2 mb-2 mb-md-0 d-md-none d-xl-flex" id="dashboardDate">
                            <span class="input-group-addon bg-transparent"><i data-feather="calendar" class=" text-primary"></i></span>
                            <input type="text" class="form-control">
                        </div>
                        <!-- mr-2 mb-2 mb-md-0 -->
                        <div class="example">
                            <a tabindex="0" class="btn btn-danger btn-icon-text mr-2 mb-2 mb-md-0" role="button" data-toggle="popover" data-placement="top" data-trigger="focus" data-content="点我有彩蛋">
                                <i class="btn-icon-prepend" data-feather="thumbs-up"></i>
                                一个按钮
                            </a>
                        </div>
                        <!-- 下载屁 -->
                        <div class="example">
                            <a tabindex="0" class="btn btn-inverse-warning btn-icon-text mb-2 mb-md-0" role="button" data-toggle="popover" data-placement="top" data-trigger="focus" title="Special thanks to" data-content="小泮，小付！！！">
                                <i class="btn-icon-prepend" data-feather="sun"></i>
                                另一个按钮
                            </a>
                        </div>


                    </div>
                </div>
            </div>

            <!-- chart -->

            <div class="row">
                <div class="col-lg-5 col-xl-4 grid-margin grid-margin-xl-0 stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-baseline mb-2">
                                <h6 class="card-title mb-0">各类型比重</h6>
                            </div>

                            <div class="row">
                                <div class="col-6 col-md-12 col-xl-5">
                                    <h3 class="mb-2"></h3>
                                    <div class="d-flex align-items-baseline">
                                        <p class="text-danger">
                                            <span></span>
                                            <i data-feather="bar-chart-2" class="icon-sm mb-1"></i>
                                        </p>
                                    </div>
                                </div>

                                <div class="col-6 col-md-12 col-xl-7">
                                    <div id="pie" class="mt-md-3 mt-xl-0"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 col-xl-8 stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-baseline mb-2">
                                <h6 class="card-title mb-0">本月各类型工作量</h6>
                            </div>
                            <div class="row">
                                <div class="col-6 col-md-12 col-xl-5">
                                    <h3 class="mb-2"></h3>
                                    <div class="d-flex align-items-baseline">
                                        <p class="text-success">
                                            <span></span>
                                            <i data-feather="compass" class="icon-sm mb-1"></i>
                                        </p>
                                    </div>
                                </div>

                                <div class="col-6 col-md-12 col-xl-7">
                                    <div id="bar" class="mt-md-3 mt-xl-0"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br> <!-- row -->
            <!--  -->

            <div class="row">
                <div class="col-12 col-xl-12 grid-margin stretch-card">
                    <div class="card overflow-hidden">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-baseline mb-4 mb-md-3">
                                <h6 class="card-title mb-0">年度每月总工作量</h6>
                            </div>
                            <div class="row align-items-start mb-2">
                                <div class="col-md-7">
                                    <p class="text-muted tx-13 mb-3 mb-md-0"></p>
                                </div>

                                <div class="col-md-5 d-flex justify-content-md-end">
                                    <div class="btn-group mb-3 mb-md-0" role="group" aria-label="Basic example">
                                        <h5><span class="badge badge-pill badge-primary">&nbsp; Current Year &nbsp;</span></h5>
                                    </div>
                                </div>
                            </div>

                            <div class="flot-wrapper">
                                <div id="line"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- row -->
        </div>
        <!-- partial:partials/_footer.html -->
        <%@ include file="Employee/Master/Footer.jsp"%>
        <!-- partial -->
    </div>
</div>
</body>
<script src="<%=basePath%>assets/vendors/select2/select2.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/core/core.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/jquery.flot/jquery.flot.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/jquery.flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/sweetalert2/sweetalert2.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/bootstrap-select.js" type="text/javascript"></script>
<script src="<%=basePath%>js/htmlFile/linkman.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/dashboard.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/datepicker.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js" type="text/javascript"></script>
<!-- 弹出气泡 -->
<script src="<%=basePath%>dialogeffects/js/classie.js"></script>
<script src="<%=basePath%>dialogeffects/js/dialogFx.js"></script>
<script type="text/javascript">

    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>