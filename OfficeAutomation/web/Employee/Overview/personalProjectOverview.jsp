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
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link href="<%=basePath%>css/bootstrap-select.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .table>thead>tr>th {
            text-align: center;
        }
        .table>tbody>tr>td {
            text-align: center;
        }
    </style>

    <script type="text/javascript" src="assets/js/jquery-1.11.3.min.js" ></script>
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
                                        "<th>" + data[i].projectName + "</th>" +
                                        "<th>" + data[i].projectNo + "</th>" +
                                        "<th>" + data[i].deadline + "</th>" +
                                        "<th>" + data[i].finish + "</th>" +
                                        "<th>" + data[i].progress + "</th>" +
                                        "<th>" + data[i].manager + "</th>" +
                                        "<th>" + data[i].designer + "</th>" +
                                        "<th>" + data[i].reviewer + "</th>" +
                                        "<th>" + data[i].office + "</th>" +
                                        "<th>" + data[i].ce + "</th>" +
                                        "<th>" + data[i].stage + "</th>" +
                                        "<th>" + data[i].remarks + "</th>" +
                                        "<td><a href='${pageContext.request.contextPath}/projectServlet?method=quitProject&projectid="+data[i].id+"'><button type='button' class='btn btn-outline-info btn-sm' >退出</button></a></td>" +
                                        "</tr>";
                                }
                            }else{
                                content = " <tr> <th>空</th> </tr>";
                            }
                            $("#tb").html(content);
                        },"json");
                    }
                })
            });
    </script>
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
<%--                            <div class="form-group row">--%>
<%--                                <label class="col-sm-1 col-form-label" style="font-size: 14px;">年份选择</label>--%>
<%--                                <div class="col-sm-2">--%>
<%--                                    <select class="selectpicker" style="text-align:center;text-align-last:center;" id="year" name="year" onchange="sel()">--%>
<%--                                        <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>

<%--                                <label class="col-sm-1 col-form-label" style="font-size: 14px;">月份选择</label>--%>
<%--                                <div class="col-sm-2">--%>
<%--                                    <select class="selectpicker" style="text-align:center;text-align-last:center;" id="month" name="month" onchange="sel1()">--%>
<%--                                        <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>

                            <div class="form-group row">
                                <label class="col-sm-1 col-form-label" style="font-size: 14px;">查看部分</label>
                                <div class="col-sm-2">
                                    <select class="selectpicker" style="text-align:center;text-align-last:center;" id="progressSelect" name="progressSelect">
                                        <option value="全部"  style="text-align: center; text-align-last: center;">全部</option>
                                        <option value="已完成"  style="text-align: center; text-align-last: center;">已完成</option>
                                        <option value="未完成"  style="text-align: center; text-align-last: center;">未完成</option>
                                        <option value="延期"  style="text-align: center; text-align-last: center;">延期</option>
                                        <option value="取消"  style="text-align: center; text-align-last: center;">取消</option>
                                    </select>
                                </div>
                            </div>

                            <hr width="300" align="left">
                            <div align="center">
                                <h6 class="card-title" style="font-size: 14px;">项目工程汇总展示</h6>
                            </div>

                            <div class="form-group row">
                                <div class="table-responsive pt-3">
                                    <table class="table table-bordered" id="table01">
                                        <thead>
                                            <tr>
                                                <th>项目名称</th>
                                                <th>工程号</th>
                                                <th>要求<br>完成时间</th>
                                                <th>实际<br>完成时间</th>
                                                <th>状态</th>
                                                <th>项目<br>负责人</th>
                                                <th>设计人</th>
                                                <th>审核</th>
                                                <th>室审</th>
                                                <th>总师</th>
                                                <th>高阶段</th>
                                                <th>备注</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tb">
                                            <c:if test="${!empty projectList}">
                                                <c:forEach var="project" items="${projectList}">
                                                    <tr>
                                                        <th>${project.projectName}</th>
                                                        <th>${project.projectNo}</th>
                                                        <th>${project.deadline}</th>
                                                        <th>${project.finish}</th>
                                                        <th>${project.progress}</th>
                                                        <th>${project.manager}</th>
                                                        <th>${project.designer}</th>
                                                        <th>${project.reviewer}</th>
                                                        <th>${project.office}</th>
                                                        <th>${project.ce}</th>
                                                        <th>${project.stage}</th>
                                                        <th>${project.remarks}</th>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/projectServlet?method=quitProject&projectid=${project.id}">
                                                                <button type="button" class="btn btn-outline-info btn-sm">退出项目</button>
                                                            </a>
                                                        </td>
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
        var fileName="项目信息整理分析表";
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

    $(function() {
        var winWidth=$(window).width();
        if (parseInt(winWidth)>parseInt("900")) {
            $("#title1").addClass("search-form");
            $("#titleText").css("font-size","24px");
        }
        else {
            $("#title1").removeClass("search-form");
        }
    });

    $('#table01').DataTable({
        "aLengthMenu" : [ [ 10, 20, 30, -1 ], [ "10条", "20条", "30条", "所有" ] ],
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

    $('#table01').each(function() {
        var datatable = $(this);
        var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
        search_input.attr('placeholder', '搜索');
        search_input.removeClass('form-control-sm');
        var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
        length_sel.removeClass('form-control-sm');
    });

    $(function() {
        var winWidth=$(window).width();
        if (parseInt(winWidth)>parseInt("900")) {
            $("#title1").addClass("search-form");
            $("#titleText").css("font-size","24px");
        }
        else {
            $("#title1").removeClass("search-form");
        }
    });

    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";

    }
</script>
</html>