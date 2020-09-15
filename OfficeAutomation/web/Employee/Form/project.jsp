<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 3:09 PM
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
    <meta http-equiv="X-UA-Compatible" content="ie=edge"ggg>
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
    <link rel="shortcut icon" href="<%=basePath%>assets/images/CRM.png" />
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
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title" style="font-size: 14px;">科室项目录入</h6>
                            <h6 class="card-title" style="font-size: 14px;color: red;">填写时请注意，不得使用英文标点符号。</h6>
                            <form class="forms-sample" action="${ pageContext.request.contextPath }/projectInputServlet" method="post">

                                <hr width="300" align="left">

                                <h6 class="card-title" style="font-size: 14px;">填写</h6>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">项目名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="project" id="project" placeholder="项目名称">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">工程号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="projectid" id="projectid" placeholder="工程号">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">要求完成时间</label>
                                    <div class="col-sm-9">
                                        <input type="date" data-provide="datepicker" name="deadline" id="deadline" class="form-control" placeholder="要求完成时间">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">实际完成时间</label>
                                    <div class="col-sm-9">
                                        <input type="date" data-provide="datepicker" name="finish" id="finish" class="form-control" placeholder="实际完成时间">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">状态</label>
                                    <div class="col-sm-9">
                                        <select class="selectpicker" name="progress" id="progress">
                                            <option value="0" style="text-align: center; text-align-last: center;">已完成</option>
                                            <option value="1" style="text-align: center; text-align-last: center;">延期</option>
                                            <option value="2" style="text-align: center; text-align-last: center;">取消</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">专业负责人</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="manager" id="manager" placeholder="专业负责人">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">设计人</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="designer" id="designer" placeholder="设计人">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">审核</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="reviewer" id="reviewer" placeholder="审核">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">室审</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="office" id="office" placeholder="室审">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">总师</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="CE" id="CE" placeholder="总师">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">备注</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="remarks" id="remarks" placeholder="备注" rows="3"></textarea>
                                    </div>
                                </div>

                                <div align="center">
                                    <input type="submit" class="btn btn-primary mr-2" name="submit" value="提交">
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title" style="font-size: 14px;">项目内容修改</h6>
                            <h6 class="card-title" style="font-size: 14px;color: red;">修改时请注意，不得使用英文标点符号。</h6>
                            <form class="forms-sample" action="${ pageContext.request.contextPath }/projectUpdateServlet" method="post">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">项目名称选择：</label>
                                    <div class="col-sm-9">
                                        <select class="selectpicker" id="projectSel" name="projectSel" onchange="opSel()">
                                            <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>
                                        </select>
                                    </div>
                                </div>

                                <hr width="300" align="left">

                                <h6 class="card-title" style="font-size: 14px;">修改</h6>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">项目名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="project" id="project1" placeholder="项目名称">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">工程号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="projectid" id="projectid1" placeholder="工程号">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">要求完成时间</label>
                                    <div class="col-sm-9">
                                        <input type="date" data-provide="datepicker" name="deadline" id="deadline1" class="form-control" placeholder="要求完成时间">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">实际完成时间</label>
                                    <div class="col-sm-9">
                                        <input type="date" data-provide="datepicker" name="finish" id="finish1" class="form-control" placeholder="实际完成时间">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">状态</label>
                                    <div class="col-sm-9">
                                        <select class="selectpicker" name="progress" id="progress1">
                                            <option value="0" style="text-align: center; text-align-last: center;">已完成</option>
                                            <option value="1" style="text-align: center; text-align-last: center;">延期</option>
                                            <option value="2" style="text-align: center; text-align-last: center;">取消</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">专业负责人</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="manager" id="manager1" placeholder="专业负责人">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">设计人</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="designer" id="designer1" placeholder="设计人">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">审核</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="reviewer" id="reviewer1" placeholder="审核">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">室审</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="office" id="office1" placeholder="室审">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">总师</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="CE" id="CE1" placeholder="总师">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">备注</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="remarks" id="remarks1" placeholder="备注1" rows="3"></textarea>
                                    </div>
                                </div>

                                <div align="center">
                                    <input type="submit" class="btn btn-primary mr-2" name="submit" value="修改">
                                    <button class="btn btn-warning" id="deleteBtn" name="submit" value="删除">删除</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title" style="font-size: 14px;">项目信息展示</h6>
                            <div class="form-group row">
                                <label class="col-sm-1 col-form-label" style="font-size: 14px;">项目选择</label>
                                <div class="col-sm-10">
                                    <select class="selectpicker" style="text-align:center;text-align-last:center;" id="projectSel1" name="projectSel1" onchange="opSel1()">
                                        <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>
                                    </select>
                                </div>
                            </div>
                            <div class="table-responsive pt-3">
                                <table class="table table-bordered" id="table01">
                                    <thead>
                                    <tr>
                                        <th>项目名称</th>
                                        <th>工程号</th>
                                        <th>要求完成时间</th>
                                        <th>实际完成时间</th>
                                        <th>状态</th>
                                        <th>专业负责人</th>
                                        <th>设计人</th>
                                        <th>审核</th>
                                        <th>室审</th>
                                        <th>总师</th>
                                        <th>备注</th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
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
    $(function() {
        var time = new Date();
        var day = ("0" + time.getDate()).slice(-2);
        var month = ("0" + (time.getMonth() + 1)).slice(-2);
        var today = time.getFullYear() + "-" + (month) + "-" + (day);
        $('#deadline').val(today);
        $('#finish').val(today);
    });

    $(document).ready(function() {
        $.ajax({                                     //发起ajax请求
            type : "post",                           //选择Servlet中执行doGet()方法还是doPost()方法
            url : "projectSelectServlet",//url是访问的Servlet的名称
            data : {method:"project"},  //传输到后台使用 request.getParameter(“para”); 方法接收参数
            cache : false,//当访问页面时浏览器会产生缓存。true如果当前请求有缓存的话，直接使用缓存。如果该属性设置为 false，则每次都会向服务器请求。
            async : false,//true是异步传输，false指同步传输
            dataType : "text",
            success : function(data) {               //传输成功回调函数，data为后台发送的数据
                var jsobj=eval("("+data+")");//据说是由于异步通信，所以要eval处理一下conSelect1<option value="${en.key}">${en.value}</option>
                var tmptable0="";
                if (jsobj.projectSel.length > 0) {
                    for (var i = 0; i < jsobj.projectSel.length; i++) {
                        tmptable0 += "<option value='"+jsobj.projectSel[i].ID+"' style='text-align: center; text-align-last: center;'>"+jsobj.projectSel[i].project+"</option>";
                    }
                    $("#projectSel").append(tmptable0);
                    //使用refresh方法更新UI以匹配新状态。
                    $("#projectSel").selectpicker("refresh");
                    //render方法强制重新渲染引导程序 - 选择ui。
                    $("#projectSel").selectpicker("render");

                    $("#projectSel1").append(tmptable0);
                    //使用refresh方法更新UI以匹配新状态。
                    $("#projectSel1").selectpicker("refresh");
                    //render方法强制重新渲染引导程序 - 选择ui。
                    $("#projectSel1").selectpicker("render");
                }
            },
            error : function(XMLHttpReques, textStatus, errorThrown) {//传输失败函数
                window.location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        });
    });

    //拉取修改内容
    function opSel() {
        var tmp=document.getElementById("projectSel").value;

        $.ajax({                                     //发起ajax请求
            type : "post",                           //选择Servlet中执行doGet()方法还是doPost()方法
            url : "projectSelectServlet",//url是访问的Servlet的名称
            data : {method:"selectedCom",selectedID:tmp},  //传输到后台使用 request.getParameter(“para”); 方法接收参数
            cache : false,//当访问页面时浏览器会产生缓存。true如果当前请求有缓存的话，直接使用缓存。如果该属性设置为 false，则每次都会向服务器请求。
            async : false,//true是异步传输，false指同步传输
            dataType : "text",
            success : function(data) {               //传输成功回调函数，data为后台发送的数据
                var jsobj=eval("("+data+")");//据说是由于异步通信，所以要eval处理一下

                $("#project1").val(jsobj.project[0].project);
                $("#projectid1").val(jsobj.project[0].projectid);
                $("#deadline1").val(jsobj.project[0].deadline);
                $("#finish1").val(jsobj.project[0].finish);
                $("#progress1").val(jsobj.project[0].progress);
                $("#manager1").val(jsobj.project[0].manager);
                $("#designer1").val(jsobj.project[0].designer);
                $("#reviewer1").val(jsobj.project[0].reviewer);
                $("#office1").val(jsobj.project[0].office);
                $("#CE1").val(jsobj.project[0].CE);
                $("#remarks1").val(jsobj.project[0].remarks);
            },
            error : function(XMLHttpReques, textStatus, errorThrown) {//传输失败函数
                window.location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        });
    }

    function opSel1() {
        var tmp=document.getElementById("projectSel1").value;
        $.ajax({                                     //发起ajax请求
            type : "post",                           //选择Servlet中执行doGet()方法还是doPost()方法
            url : "projectTableServlet",//url是访问的Servlet的名称
            data : {selectedID:tmp},  //传输到后台使用 request.getParameter(“para”); 方法接收参数
            cache : false,//当访问页面时浏览器会产生缓存。true如果当前请求有缓存的话，直接使用缓存。如果该属性设置为 false，则每次都会向服务器请求。
            async : false,//true是异步传输，false指同步传输
            dataType : "text",
            success : function(data) {               //传输成功回调函数，data为后台发送的数据
                var jsobj=eval("("+data+")");//据说是由于异步通信，所以要eval处理一下
                $("#table01 tbody").html("");
                if (jsobj.content.length > 0) {
                    for (var i = 0; i < jsobj.content.length; i++) {
                        $("#table01 tbody").append("<tr><td style='text-align:center'>"+jsobj.content[i].project+"</td>"+
                            "<td style='text-align:center'>"+jsobj.content[i].projectid+"</td>"+
                            "<td style='text-align:center'>"+jsobj.content[i].deadline+"</td>"+
                            "<td style='text-align:center'>"+jsobj.content[i].finish+"</td>"+
                            "<td style='text-align:center'>"+jsobj.content[i].progress+"</td>" +
                            "<td style='text-align:center'>"+jsobj.content[i].manager+"</td>" +
                            "<td style='text-align:center'>"+jsobj.content[i].designer+"</td>" +
                            "<td style='text-align:center'>"+jsobj.content[i].reviewer+"</td>" +
                            "<td style='text-align:center'>"+jsobj.content[i].office+"</td>" +
                            "<td style='text-align:center'>"+jsobj.content[i].CE+"</td>" +
                            "<td style='text-align:center'>"+jsobj.content[i].remarks+"</td>"</tr>");
                    }
                }
            },
            error : function(XMLHttpReques, textStatus, errorThrown) {//传输失败函数
                window.location.href = "${pageContext.request.contextPath}/index.jsp";
            }
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

    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/index.jsp";
    }

</script>
</html>