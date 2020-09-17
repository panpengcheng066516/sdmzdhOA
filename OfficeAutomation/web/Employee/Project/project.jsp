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
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title" style="font-size: 14px;">科室项目录入</h6>
                            <h6 class="card-title" style="font-size: 14px;color: red;">填写时请注意，不得使用英文标点符号。</h6>
                            <form class="forms-sample" action="${ pageContext.request.contextPath }/????" method="post">

                                <hr width="300" align="left">

                                <h6 class="card-title" style="font-size: 14px;">填写</h6>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">项目名称</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="project" id="project" placeholder="项目名称">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">工程号</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="projectid" id="projectid" placeholder="工程号">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">要求完成时间</label>
                                    <div class="col-sm-4">
                                        <input type="date" data-provide="datepicker" name="deadline" id="deadline" class="form-control" placeholder="要求完成时间">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">实际完成时间</label>
                                    <div class="col-sm-4">
                                        <input type="date" data-provide="datepicker" name="finish" id="finish" class="form-control" placeholder="实际完成时间">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">状态</label>
                                    <div class="col-sm-4">
                                        <select class="selectpicker" name="progress" id="progress">
                                            <option value="0" style="text-align: center; text-align-last: center;">已完成</option>
                                            <option value="1" style="text-align: center; text-align-last: center;">延期</option>
                                            <option value="2" style="text-align: center; text-align-last: center;">取消</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">专业负责人</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="manager" id="manager" placeholder="专业负责人">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">设计人</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="designer" id="designer" placeholder="设计人">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">审核</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="reviewer" id="reviewer" placeholder="审核">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">室审</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="office" id="office" placeholder="室审">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">总师</label>
                                    <div class="col-sm-4">
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
        window.location.href = "../../index.jsp";
    }

</script>
</html>