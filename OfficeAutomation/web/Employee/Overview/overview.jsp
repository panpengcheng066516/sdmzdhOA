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

                            <!-- tab选项卡 -->
                            <ul class="nav nav-tabs mt-6" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="tab-month1" data-toggle="tab" href="#month1" role="tab" aria-controls="chats" aria-selected="true">
                                        <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                            <i data-feather="archive" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                            <p class="d-none d-sm-block">本年员工月工作量汇总</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab-year1" data-toggle="tab" href="#year1" role="tab" aria-controls="calls" aria-selected="false">
                                        <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                            <i data-feather="calendar" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                            <p class="d-none d-sm-block">历年员工年工作量汇总</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab-year2" data-toggle="tab" href="#year2" role="tab" aria-controls="contacts" aria-selected="false">
                                        <div class="d-flex flex-row flex-lg-column flex-xl-row align-items-center">
                                            <i data-feather="chrome" class="icon-sm mr-sm-2 mr-lg-0 mr-xl-2 mb-md-1 mb-xl-0"></i>
                                            <p class="d-none d-sm-block">历年月工作量汇总</p>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <!-- tab选项内容 -->
                            <div class="tab-content mt-3">
                                <div class="tab-pane fade show active" id="month1" role="tabpanel" aria-labelledby="month1-tab">
                                    <div class="form-group row">
                                        <label class="col-sm-1 col-form-label" style="font-size: 14px;">月份选择</label>
                                        <div class="col-sm-2">
                                             <select class="selectpicker" style="text-align:center;text-align-last:center;" id="month01" name="month" onchange="sel0()">
                                                 <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>
                                             </select>
                                        </div>

                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-primary mr-2 mb-2 mb-md-0" onclick="exportExcel()">导出</button>
                                        </div>
                                    </div>
                                    <div class="text-muted mb-1" align="center">本年员工月工作量汇总</div>
                                    <div class="form-group row">
                                        <div class="table-responsive pt-3">
                                            <table class="table table-bordered" id="table01">
                                                <thead>
                                                <tr>
                                                    <th>序号</th>
                                                    <th>员工姓名</th>
                                                    <th>工日总和</th>
                                                    <th>总计</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>哈哈</td>
                                                    <td>0</td>
                                                    <td>1</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- 别加div。。 -->
                                <div class="tab-pane fade" id="year1" role="tabpanel" aria-labelledby="year1-tab">
                                    <div class="form-group row">
                                        <label class="col-sm-1 col-form-label" style="font-size: 14px;">年份选择</label>
                                        <div class="col-sm-2">
                                            <select class="selectpicker" style="text-align:center;text-align-last:center;" id="year01" name="year" onchange="sel0()">
                                                <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>
                                            </select>
                                        </div>

                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-primary mr-2 mb-2 mb-md-0" onclick="exportExcel()">导出</button>
                                        </div>
                                    </div>
                                    <div class="text-muted mb-1" align="center">历年员工年工作量汇总</div>
                                    <div class="form-group row">
                                        <div class="table-responsive pt-3">
                                            <table class="table table-bordered" id="table02">
                                                <thead>
                                                <tr>
                                                    <th>序号</th>
                                                    <th>员工姓名</th>
                                                    <th>工日总和</th>
                                                    <th>总计</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${kits}" var="k" varStatus="s">
                                                    <tr>
                                                        <td>${s.index}</td>
                                                        <td>${k.name}</td>
                                                        <td>${k.total}</td>
                                                        <td>${k.total1}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="year2" role="tabpanel" aria-labelledby="year2-tab">
                                    <div class="form-group row">
                                        <label class="col-sm-1 col-form-label" style="font-size: 14px;">年份选择</label>
                                        <div class="col-sm-2">
                                            <select class="selectpicker" style="text-align:center;text-align-last:center;" id="year02" name="year" onchange="sel0()">
                                                <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>
                                            </select>
                                        </div>

                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-primary mr-2 mb-2 mb-md-0" onclick="exportExcel()">导出</button>
                                        </div>
                                    </div>
                                    <p class="text-muted mb-1" align="center">历年月工作量汇总</p>
                                    <div class="form-group row">
                                        <div class="table-responsive pt-3">
                                            <table class="table table-bordered" id="table03">
                                                <thead>
                                                <tr>
                                                    <th>月份</th>
                                                    <th>工日总和</th>
                                                    <th>总计</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${kits}" var="k" varStatus="s">
                                                    <tr>
                                                        <td>${k.month}</td>
                                                        <td>${k.total}</td>
                                                        <td>${k.total1}</td>
                                                    </tr>
                                                </c:forEach>
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

    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>