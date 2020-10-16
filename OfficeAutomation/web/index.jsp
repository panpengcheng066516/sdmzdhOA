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
                <div class="alert alert-danger-muted" role="alert">
                    <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
                        <div>
                            <h4 class="mb-3 mb-md-0">Hi again, ${ sessionScope.user.name } <i class="mb-1 text-primary ml-1 icon-small" data-feather="smile"></i></h4>
                            <br><h4 class="mb-3 mb-md-0">Welcome to Dashboard.</h4>
                        </div>
                        <div class="d-flex align-items-center flex-wrap text-nowrap">
                            <!--  dashboardDate -->
                            <div class="input-group date datepicker dashboard-date mr-2 mb-2 mb-md-0 d-md-none d-xl-flex" id="dashboardDate">
                                <span class="input-group-addon bg-transparent"><i data-feather="calendar" class="text-primary"></i></span>
                                <input type="text" class="form-control" disabled>
                            </div>
                            <div class="example">
                                <a tabindex="0" class="btn btn-inverse-warning btn-icon-text mb-2 mb-md-0" role="button" data-toggle="popover" data-placement="top" data-trigger="focus" title="Specially thanks to" data-content="小泮，小付！！！">
                                    <i class="btn-icon-prepend" data-feather="sun"></i>
                                    主页
                                </a>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <p class="mb-0">欢迎页，点击左侧标签卡选择类型填写工作量<br><i class="btn-icon-prepend" data-feather="arrow-left"></i></p>
                </div>
            </div>

            <hr width="400">
            <!-- partial -->
            <div class="row">
                <div class="col-lg-5 col-xl-4 grid-margin grid-margin-xl-0 stretch-card">
                    <!-- <div class="col-lg-3 col-xl-5 stretch-card"> -->
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-baseline mb-4 mb-md-3">
                                    <div class="noble-ui-logo d-block mt-3"><span>本月各类型数据比例</span></div>
                                </div>
                                <span></span>
                                <div class="flot-wrapper">
                                    <div id="pie" class="chart-pie" > </div><!-- style="width:100%; height:100%" -->
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="col-lg-7 col-xl-8 stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-baseline mb-4 mb-md-3">
                                <div class="noble-ui-logo d-block mt-3">今年各月总量</div>
                            </div>
                            <div class="flot-wrapper">
                                <div id="line" class="apexcharts-canvas"></div>
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
<%--<script src="<%=basePath%>assets/js/jquery-1.11.3.min.js" type="text/javascript"></script>--%>
<script type="text/javascript">
    var pieOption = {
        labels: ["设计", "编程画面", "调试管理", "经营", "日常"],
        series: [],
        chart: {
            type: 'donut'
        },
        dataLabels: {
            enabled: true
        },
        fill: {
            type: 'fill'
        },
        legend: {
            show: true,
            //formatter: function(val, opts) {
            //    return val + " - " + opts.w.globals.series[opts.seriesIndex]
            //}
        },
        noData: {
            text: '暂无数据',
            align: 'center',
            verticalAlign: 'middle',
            offsetX: 0,
            offsetY: 0,
            style: {
                color: '#F08080',
                fontSize: '18px',
            }
        },
        responsive: [{
            breakpoint: undefined,
            options: {
                chart: {
                    width: 200
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]
    };

    var pieChart = new ApexCharts(document.querySelector("#pie"), pieOption);

    var url = '${pageContext.request.contextPath}/chartServlet?method=getChartData';
    $.getJSON(url, function(date) {
        pieChart.updateSeries(date);
    });

    pieChart.render();


// line
    var options = {
        series: [],             //{name:'', data:[ 400, 300, 1000, 900, 290, 190, 220, 90, 120, 70, 190, 50 ]}
        chart: {
            height: 350,
            type: 'line',
        },
        stroke: {
            width: 7,
            curve: 'smooth'
        },
        xaxis: {
            type: 'datetime',
            categories: ['1/11/2000', '2/11/2000', '3/11/2000', '4/11/2000', '5/11/2000', '6/11/2000', '7/11/2000', '8/11/2000', '9/11/2000', '10/11/2000', '11/11/2000', '12/11/2000', '1/11/2001' ],
            tickAmount: 7,
            labels: {
                formatter: function(value, timestamp, opts) {
                    return opts.dateFormatter(new Date(timestamp), 'MMM')
                }
            }
        },
        tools: {
            download: false,
            selection: true,
            zoom: true,
            zoomin: true,
            zoomout: true,
            pan: true,
            reset: true,
        },
        title: {
            text: 'workload per each month',
            align: 'left',
            style: {
                fontSize: "16px",
                color: '#666'
            }
        },
        fill: {
            type: 'gradient',
            gradient: {
                shade: 'dark',
                gradientToColors: [ '#FDD835'],
                shadeIntensity: 1,
                type: 'horizontal',
                opacityFrom: 1,
                opacityTo: 1,
                stops: [0, 100, 100, 100]
            },
        },
        markers: {
            size: 4,
            colors: ["#FFA41B"],
            strokeColors: "#fff",
            strokeWidth: 2,
            hover: {
                size: 7,
            }
        },
        yaxis: {
            min: 0,
            max: undefined,
        }
    };
    var chart = new ApexCharts(document.querySelector("#line"), options);
    chart.render();
    var url = ' ';



    /* logout */
    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>
