<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/3/2020
  Time: 1:44 PM
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
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.png" />
    <script type="text/javascript" src="<%=basePath%>assets/js/jquery-1.11.3.min.js" ></script>
    <script type="text/javascript">
            $(function(){
                // 选项框
                $("#progressSelect").change(function () {
                    var p1=$(this).children('option:selected').val();
                    if(p1=="全部"){
                        var p2 = "${pageContext.request.contextPath}/personalProjectServlet?method=getAllPersonalProject";
                        $(location).attr('href',p2);
                    }else{
                        var p2 = "${pageContext.request.contextPath}/projectServlet?method=getPersonalProjectByProgress";
                        var content = "";
                        $.post(p2,{"progress":p1},function(data){
                            if(data.length>0){
                                for(var i=0;i<data.length;i++) {
                                    content += " <tr>" +
                                        "<td><div class='text-wrap text-break'>" + data[i].projectName + "</div></td>" +
                                        "<td><div class='text-wrap text-break'>" + data[i].projectNo + "</div></td>" +
                                        "<td><div class='text-wrap text-break'>" + data[i].deadline + "</div></td>" +
                                        "<td><div class='text-wrap text-break'>" + data[i].finish + "</div></td>" +
                                        "<td><div class='text-wrap text-break'>" + data[i].progress + "</div></td>" +
                                        "<td>" + data[i].manager + "</td>" +
                                        "<td>" + data[i].designer + "</td>" +
                                        "<td>" + data[i].reviewer + "</td>" +
                                        "<td>" + data[i].office + "</td>" +
                                        "<td>" + data[i].ce + "</td>" +
                                        "<td>" + data[i].stage + "</td>" +
                                        "<td><div class='text-wrap text-break'>" + data[i].remarks + "</div></td>" +
                                        <%--"<td><a href='${pageContext.request.contextPath}/projectServlet?method=quitProject&projectid="+data[i].id+"'><button type='button' class='btn btn-inverse-danger-muted btn-rounded btn-xs text-danger border-danger'>退出</button></a></td>" +--%>
                                        "</tr>";
                                }
                            }else{
                                content = " <tr> <td>空</td> </tr>";
                            }
                            $("#tb").html(content);
                        },"json");
                    }
                })
            });
    </script>
</head>
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
<body>
<div class="main-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <%@ include file="../Master/SideBar.jsp"%>
    <!-- partial -->
    <main class="page-wrapper" style="background-image: linear-gradient(to right bottom, #fbf6f0, #f8f6ee, #f5f5ed, #f1f5ed, #edf5ed, #edf5ed, #edf5ed, #edf5ed, #f1f5ed, #f5f5ed, #f8f6ee, #fbf6f0);">
        <!-- partial:partials/_navbar.html -->
        <%@ include file="../Master/NavBar.jsp"%>
        <!-- partial -->
        <div class="page-main">
            <div class="page-content">
                <%--breadscrumb--%>
                <nav class="page-breadcrumb">
                    <ol class="breadcrumb bg-inverse-primary">
                        <li class="breadcrumb-item text-small"><a href="index.jsp">首页</a></li>
                        <li class="breadcrumb-item active text-small" aria-current="page">个人项目一览</li>
                    </ol>
                </nav>
                <!-- row -->
                <div class="row">
                    <div class="container-fluid grid-margin col-md-12">
                        <div class="card card-rounded border-light shadow-lg">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-sm-auto col-form-label text-muted">请选择</label>
                                    <div class="control-text col-sm-auto col-md-auto col-lg-auto">
                                        <select class="select2" id="progressSelect" name="progressSelect">
                                            <option value="全部">全部</option>
                                            <option value="已完成">已完成</option>
                                            <option value="未完成">未完成</option>
                                            <option value="延期">延期</option>
                                            <option value="取消">取消</option>
                                        </select>
                                    </div>
                                </div>
                                <hr class="style-two">
                                <div class="table-content">
                                    <div class="custom-control table">
                                        <div class="table-responsive text-wrap">
                                            <table class="table table-striped table-bordered table-hover table-responsive-md w-auto" id="table01">
                                                <thead>
                                                <tr>
                                                    <th>项目名称</th>
                                                    <th>工程号</th>
                                                    <th>截止日期</th>
                                                    <th>实际日期</th>
                                                    <th>状态</th>
                                                    <th>专业<br>负责人</th>
                                                    <th>设计人</th>
                                                    <th>审核</th>
                                                    <th>室审</th>
                                                    <th>总师</th>
                                                    <th>高阶段<br>分类</th>
                                                    <th>&emsp;备注&emsp;</th>
<%--                                                    <th>操作</th>--%>
                                                </tr>
                                                </thead>
                                                <tbody id="tb" class="text-secondary">
                                                <c:if test="${!empty projectList}">
                                                    <c:forEach var="project" items="${projectList}">
                                                        <tr>
                                                            <td><div class="text-wrap text-break">${project.projectName}</div></td>
                                                            <td><div class="text-wrap text-break">${project.projectNo}</div></td>
                                                            <td><div class="text-wrap text-break">${project.deadline}</div></td>
                                                            <td><div class="text-wrap text-break">${project.finish}</div></td>
                                                            <td>${project.progress}</td>
                                                            <td>${project.manager}</td>
                                                            <td>${project.designer}</td>
                                                            <td>${project.reviewer}</td>
                                                            <td>${project.office}</td>
                                                            <td>${project.ce}</td>
                                                            <td>${project.stage}</td>
                                                            <td><div class="text-wrap">${project.remarks}</div></td>
<%--                                                            <td>--%>
<%--                                                                <a href="${pageContext.request.contextPath}/projectServlet?method=quitProject&projectid=${project.id}">--%>
<%--                                                                    <button type="button" class="btn btn-inverse-danger-muted btn-rounded btn-xs text-danger border-danger">退出</button>--%>
<%--                                                                </a>--%>
<%--                                                            </td>--%>
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
        <!-- partial:partials/_footer.html -->
        <%@ include file="../Master/Footer.jsp"%>
        <!-- partial -->
    </main>
</div>
</body>
<script src="<%=basePath%>assets/vendors/core/core.js"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/select2/select2.min.js"></script>
<script src="<%=basePath%>assets/vendors/datatables.net/jquery.dataTables.js"></script>
<script src="<%=basePath%>assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="<%=basePath%>assets/js/data-table.js"></script>
<script type="text/javascript">
    if ($(".select2").length) {
        $(".select2").select2({
            minimumResultsForSearch: Infinity,
        });
    }

    $('#table01').DataTable({
        "aLengthMenu": [[10, 20, 30, -1], ["10条", "20条", "30条", "所有"]],
        "iDisplayLength": 10,
        "language": {
            search: "",
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索:",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页"
            }
        },
        "oAria": {
            "sSortAscending": ": 以升序排列此列",
            "sSortDescending": ": 以降序排列此列"
        }
    });

    $('#table01').each(function () {
        var datatable = $(this);
        var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
        search_input.attr('placeholder', '搜索');
        search_input.removeClass('form-control-sm');
        var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
        length_sel.removeClass('form-control-sm');
    });

    $(function () {
        var winWidth = $(window).width();
        if (parseInt(winWidth) > parseInt("900")) {
            $("#title1").addClass("search-form");
            $("#titleText").css("font-size", "24px");
        } else {
            $("#title1").removeClass("search-form");
        }
    });

    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }
</script>
</html>