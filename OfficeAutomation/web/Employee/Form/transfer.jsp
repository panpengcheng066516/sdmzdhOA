<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 1:17 PM
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
    <link rel="stylesheet" href="<%=basePath%>assets/fonts/feather-font/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/demo_1/style.css">
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.png" />
</head>
<body>
<div class="main-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <%@ include file="../Master/SideBar.jsp"%>
    <!-- partial -->
    <div class="page-wrapper" style="background-image: linear-gradient(to right bottom, #fbf6f0, #f8f6ee, #f5f5ed, #f1f5ed, #edf5ed, #edf5ed, #edf5ed, #edf5ed, #f1f5ed, #f5f5ed, #f8f6ee, #fbf6f0);">
        <!-- partial:partials/_navbar.html -->
        <%@ include file="../Master/NavBar.jsp"%>
        <!-- partial -->
        <div class="page-content">
            <%--breadscrumb--%>
            <nav class="page-breadcrumb">
                <ol class="breadcrumb bg-inverse-primary">
                    <li class="breadcrumb-item text-small"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                    <li class="breadcrumb-item text-small active" aria-current="page">借调</li>
                </ol>
            </nav>
            <!-- row -->
            <div class="row">
                <div class="col-md-6 grid-margin container-fluid">
                    <div class="card card-rounded card-block visible-inline shadow-lg">
                        <div class="card-header">
                            <div class="card-title"><h3 class="text text-primary mt-md-3">借调</h3></div>
                        </div>
                        <div class="card-body">
                            <form class="custom-control" action="${ pageContext.request.contextPath }/jiediaoServlet?method=addJiediao" method="post">
                                <div class="input-group mb-3 col-md-12">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text col-sm-auto text-dark">借调至</span>
                                    </div>
                                    <input type="text" aria-label="部门/地点" class="form-control col-sm-auto" style="margin-right:40px" name="transfer" id="transfer" placeholder="相应部门/地点" autocomplete="off">
                                </div>

                                <div class="help-text col-sm-auto text-small text-reddit text-justify">注：此处请填写被借调至的相应地点或者部门名称。</div>
                                &nbsp;
                                <div class="d-flex col-md-6 justify-content-end">
                                    <input type="submit" class="btn btn-inverse-success mr-2" name="submit" value="提交">
                                </div>
                            </form>
                        </div>
                        <div class="card-footer"></div>
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
<script src="<%=basePath%>assets/vendors/core/core.js"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script type="text/javascript">

    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>