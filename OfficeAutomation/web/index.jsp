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
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/demo_1/style.css">
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.png" />
</head>
<body>
<div class="main-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <%@ include file="Employee/Master/SideBar.jsp"%>
    <!-- partial -->
    <div class="page-wrapper" style="background-image: linear-gradient(to right bottom, #fbf6f0, #f8f6ee, #f5f5ed, #f1f5ed, #edf5ed, #edf5ed, #edf5ed, #edf5ed, #f1f5ed, #f5f5ed, #f8f6ee, #fbf6f0);">
        <!-- partial:partials/_navbar.html -->
        <%@ include file="Employee/Master/NavBar.jsp"%>
        <!-- partial -->
        <div class="page-content">
            <div class="container-fluid inline grid-margin col-md-12">
                <div class="alert alert-danger-muted" role="alert">
                    <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
                        <div>
                            <h4 class="mb-3 mb-md-0">
                                你好，${sessionScope.user.name}&nbsp;
                                <i class="text-primary" data-feather="smile"></i>
                            </h4>
                            <br>
                            <h4 class="mb-3 mb-md-0">欢迎回来</h4>
                        </div>
                        <div class="d-flex align-items-center flex-wrap text-nowrap">
                            <div class="input-group date datepicker dashboard-date mr-2 mb-2 mb-md-0 d-md-none d-xl-flex" id="dashboardDate">
                                <span class="input-group-addon bg-transparent"><i data-feather="calendar" class="text-primary"></i></span>
                                <input type="text" class="form-control text-primary" disabled="disabled">
                            </div>
                        </div>
                    </div>
                    <hr>
                    <p class="mb-0">点击左侧标签卡选择类型填写工作量<br><i class="btn-icon-prepend" data-feather="arrow-left"></i></p>
                </div>
            </div>

            <hr style="border-top: 1px dashed lightsteelblue;" width="400">

            <div class="main-wrapper">
                <div class="main-content">
                    <div class="row">
                        <div class="col-xs-11 col-md-12">
                            <div class="container align-self-stretch">
                                <div class="content">
                                    <div class="card-header-transparent">
                                        <p class="text-linkedin ">本月各类工作完成比例</p>
                                        <button class="btn btn-o btn-icon btn-s btn-icon-text pull-right" data-toggle="popover" data-trigger="focus" data-content="由于部分浏览器的缓存设置可能导致回调函数请求失效。为了保证图形渲染准确，推荐使用Google Chrome浏览器。">
                                            <i data-feather="alert-triangle"></i>
                                        </button>
                                    </div>
                                    <br>
                                    <div class="container-fluid">
                                        <div class="apexcharts-canvas" id="pie"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
<script src="<%=basePath%>assets/js/jquery-1.11.3.min.js" type="text/javascript" ></script>
<script src="<%=basePath%>assets/vendors/core/core.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/bootstrap-datepicker/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>assets/vendors/apexcharts/apexcharts.min.js"></script>
<script type="text/javascript">
    if($('#dashboardDate').length) {
        var date = new Date();
        var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        $('#dashboardDate').datepicker({
            language: 'zh-CN',
            format: "MM dd,  DD",
            todayHighlight: true,
            autoclose: true
        });
        $('#dashboardDate').datepicker('setDate', today);
    }


    var pieOption = {
        labels: ["设计", "编程画面", "调试管理", "经营", "日常"],
        series: [1,1,1,1,1],
        chart: {
            type: 'donut',
            width: "130%",
            // height: auto,
        },
        dataLabels: {
            enabled: true,
            dropShadow: {
                enabled: true,
                left: 2,
                top: 2,
                opacity: 0.5
            },
        },
        fill: {
            type: 'fill'
        },
        legend: {
            show: true,
            formatter: function(val, opts) {
               return val + "  " + opts.w.globals.series[opts.seriesIndex]
            },
            position: 'right',
            containerMargin: {
                left: 35,
                right: 60
            }
        },
        noData: {
            text: '暂无可用数据',
            align: 'right',
            verticalAlign: 'center',
            offsetX: 0,
            offsetY: 0,
            style: {
                color: '#000000',
                fontSize: '14px',
            }
        },
        responsive: [{
            breakpoint: undefined,
            legend: {
                position: "top"
            }
        }]
    };

    var pieChart = new ApexCharts(document.querySelector("#pie"), pieOption);
    var url = '${pageContext.request.contextPath}/chartServlet?method=getChartData';
    $.getJSON(url, function(date) {
        pieChart.updateSeries(date);
    });
    pieChart.render();

    /* logout */
    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>
