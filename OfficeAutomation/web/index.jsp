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
    <script type="text/javascript" src="assets/js/jquery-1.11.3.min.js" ></script>

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
                    <li class="breadcrumb-item"><a href="index.jsp">Welcome page</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Content</li>
                </ol>
            </nav>

            <div class="col-md-12">
            <div class="alert alert-warning" role="alert">
                <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
                    <div>
                        <h4 class="mb-3 mb-md-0">Hi again, ${ sessionScope.user.name } <i class="mb-1 text-primary ml-1 icon-small" data-feather="smile"></i></h4>
                    </div>
                    <div class="d-flex align-items-center flex-wrap text-nowrap">
                        <!--   -->
                        <div class="input-group date datepicker dashboard-date mr-2 mb-2 mb-md-0 d-md-none d-xl-flex" id="dashboardDate">
                            <span class="input-group-addon bg-transparent"><i data-feather="calendar" class="text-primary"></i></span>
                            <input type="text" class="form-control">
                        </div>
                        <!--   -->
                        <button type="button" class="btn btn-outline-dribbble btn-icon-text mr-2 mb-2 mb-md-0" id="print">
                            <i class="btn-icon-prepend" data-feather="download-cloud"></i>
                            这是主页
                        </button>
                    </div>
                </div>
                <hr>

                <p class="mb-0">欢迎页，点击左侧标签卡选择类型填写工作量<br><i class="btn-icon-prepend" data-feather="arrow-left"></i></p>

            </div>
            </div>

            <hr width="400">
            <!-- partial -->
            <div class="card">
                <div class="card-body">
                    <div class="container-fluid d-flex justify-content-between">
                        <div class="col-lg-3 pl-0">
                            <div class="noble-ui-logo d-block mt-3">SDM<span>ZDH</span></div>
                            <h4 class="mt-5 mb-2 text-muted">本月汇总</h4>
                        </div>

                        <div class="col-lg-3 pr-0">
                            <h4 class="font-weight-medium text-uppercase text-right mt-4 mb-2"> </h4>
                            <h6 class="text-right mb-5 pb-4"> </h6>
                            <h6 class="mb-0 mt-3 text-right font-weight-normal mb-2"><i class="btn-icon-prepend" data-feather="paperclip"></i>&nbsp; <span class="text-muted">Overview</span></h6>
                        </div>
                    </div>
                    <div class="container-fluid mt-5 d-flex justify-content-center w-100">
                        <div class="table-responsive w-100">
                            <table class="table table-bordered" id="table1">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Description</th>
                                    <th class="text-right">Quantity</th>
                                    <th class="text-right">Percentage</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr class="text-right">
                                    <td class="text-left">1</td>
                                    <td class="text-left">设计</td>
                                    <td> </td>
                                    <td> </td>
                                </tr>

                                <tr class="text-right">
                                    <td class="text-left">2</td>
                                    <td class="text-left">编程/画面</td>
                                    <td> </td>
                                    <td> </td>
                                </tr>

                                <tr class="text-right">
                                    <td class="text-left">3</td>
                                    <td class="text-left">调试/管理</td>
                                    <td> </td>
                                    <td> </td>
                                </tr>

                                <tr class="text-right">
                                    <td class="text-left">4</td>
                                    <td class="text-left">经营</td>
                                    <td> </td>
                                    <td> </td>
                                </tr>

                                <tr class="text-right">
                                    <td class="text-left">5</td>
                                    <td class="text-left">其他</td>
                                    <td> </td>
                                    <td> </td>
                                </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                    <div class="container-fluid mt-5 w-100">
                        <div class="row">
                            <div class="col-md-6 ml-auto">
                                <div class="table-responsive">
                                    <table class="table" id="table2">
                                        <tbody>
                                        <tr>
                                            <td>Current Month Total</td>
                                            <td class="text-right"> </td>
                                        </tr>
                                        <tr>
                                            <td>Annual Total</td>
                                            <td class="text-right"> </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid w-100">
                        <a href="index.jsp" class="btn btn-inverse-success float-right mt-4 ml-2"><i data-feather="send" class="mr-3 icon-md"></i>Back to top</a>
                    </div>
                </div>
            </div>
        </div>
        <!--  -->
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

    $(function(){
        // 选项框
        $(function () {
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
                            "<th>" + i + "</th>" +
                            "<th>" + data.summaryMonthList[i].name + "</th>" +
                            "<th>" + data.summaryMonthList[i].work_day + "</th>" +
                            "</tr>";
                    }
                }else{
                    summaryMonthContent = " <tr> <th>空</th> </tr>";
                }

                if(data.summaryYearList.length>0){
                    for(var i=0;i<data.summaryYearList.length;i++) {
                        summaryYearContent += " <tr>" +
                            "<th>" + i + "</th>" +
                            "<th>" + data.summaryYearList[i].name + "</th>" +
                            "<th>" + data.summaryYearList[i].work_day + "</th>" +
                            "</tr>";
                    }
                }else{
                    summaryYearContent = " <tr> <th>空</th> </tr>";
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


    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>
