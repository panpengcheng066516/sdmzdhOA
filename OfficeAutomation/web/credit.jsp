<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 11/13/2020
  Time: 2:49 PM
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
    <title>你发现彩蛋啦！🎉Credits about this web app...</title>
    <!-- 解决转发后页面失效问题 -->
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
    %>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/core/core.css">
    <link rel="stylesheet" href="<%=basePath%>assets/fonts/feather-font/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/fullcalendar/fullcalendar.min.css">
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
    <script type="text/javascript" src="<%=basePath%>assets/js/jquery-1.11.3.min.js" ></script>
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
            <nav class="page-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Credits</li>
                </ol>
            </nav>

            <div class="row">
                <div class="col-md-6 grid-margin container">
                    <div class="card card-rounded">
                        <div class="card-body">
                            <h6 class="card-title text-danger-muted">恭喜你发现彩蛋啦！🎉😆🥰😊🌺</h6>
                            <div name="content">
                                <h6 class="card-subtitle text-primary">关于本站<br>About this web app</h6>
                                <ul class="timeline">
                                    <li class="event" data-date="">
                                        <h5 class="text-primary">There will be no OA2.0 without the following incredible developers:</h5>
                                    </li>
                                    <li class="event" data-date="TEAM">
                                        <h6 class="text-secondary">The Developers</h6>
                                        <p class="text-linkedin">付增军，泮鹏程，徐舒</p>
                                    </li>
                                    <li class="event" data-date="">
                                        <h6 class="text-secondary">Other Contributors</h6>
                                        <p class="text-linkedin">胡芸志，王若然</p>
                                    </li>
                                    <li class="event" data-date="">
                                        <h3> </h3>
                                        <p class="text-danger-muted">排名按姓氏首字母顺序排列，无关主次，不分先后</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-footer"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- partial -->
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
<!-- chart -->
<script src="<%=basePath%>js/apexcharts.min.js"></script>
<script type="text/javascript">
    /* logout */
    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>
