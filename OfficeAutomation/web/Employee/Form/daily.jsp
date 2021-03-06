<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 2:50 PM
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
                    <li class="breadcrumb-item text-small"><a href="index.jsp">首页</a></li>
                    <li class="breadcrumb-item text-small"><a href="${ pageContext.request.contextPath }/personalSummaryServlet?method=getAllWorkingList">个人工作记录一览</a></li>
                    <li class="breadcrumb-item active text-small" aria-current="page">录入工作量</li>
                </ol>
            </nav>
            <!-- row -->
            <div class="row">
                <div class="container-fluid grid-margin col-md-8">
                    <div class="card card-rounded shadow-lg">
                        <div class="card-header">
                            <div class="custom-control-inline">
                                <div class="col">
                                    <div class="card-title"><h3 class="text text-primary">日常零星</h3>
                                    </div>
                                    <div class="col">
                                        <div class="alert alert-icon-info-muted text-small col-sm-auto">
                                            <i data-feather="alert-circle" ></i>填写时请注意，不得使用英文标点符号。如需修改可前往个人查询页面选择要修改的内容，修改完自动跳回当前页面。
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form class="forms form-control-plaintext" action="${ pageContext.request.contextPath }/dailyWorkingServlet?method=addDailyWorking" method="post" >
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label">选择类型</label>
                                    <div class="control-text col-sm-auto col-md-auto col-lg-auto">
                                        <select class="select2-single w-100" name="type" id="type">
                                            <option value="日常管理">日常管理</option>
                                            <option value="工会事务">工会事务</option>
                                            <option value="党/团组事务">党/团组事务</option>
                                            <option value="考勤">考勤</option>
                                            <option value="出差/交流">出差/交流</option>
                                            <option value="其他报销/零星工日">报销/零星工日</option>
                                        </select>
                                    </div>
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label">折合工日</label>
                                    <input type="text" class="form-control col-sm-2" name="monthDay" id="monthDay" placeholder="天数" autocomplete="off">
                                </div>
                                <div class="help-text col-sm text-small text-facebook mt-1 text-justify" style="margin-left: 3.5%; margin-right: 3.5%">注：如有多项工作内容，请多次填写。</div>
                                &nbsp;
                                <div class="form-group-material" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label">备注</label>
                                    <textarea class="form-control col-sm-6" type="text" name="remark" id="remark" placeholder="备注" rows="5"></textarea>
                                </div>
                                &nbsp;
                                <div class="d-flex col-sm-6 justify-content-center">
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
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/select2/select2.min.js"></script>
<script type="text/javascript">

    if ($(".select2-single").length) {
        $(".select2-single").select2({
            minimumResultsForSearch: Infinity,
        });
    }

    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>