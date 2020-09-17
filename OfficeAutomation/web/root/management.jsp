<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/3/2020
  Time: 3:03 PM
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
    <link rel="shortcut icon" href="<%=basePath%>assets/images/CRM.png" />
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/select2/select2.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <!-- 下拉框 -->
    <link href="<%=basePath%>css/bootstrap-select.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .table>thead>tr>th {
            text-align: center;
        }
        .table>tbody>tr>td {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="main-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <%@ include file="../root/Master/SideBar.jsp"%>
    <!-- partial -->

    <div class="page-wrapper">
        <!-- partial:partials/_navbar.html -->
        <%@ include file="../root/Master/NavBar.jsp"%>

        <!-- partial -->
        <div class="page-content">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title" style="font-size: 14px;">用户信息修改</h6>

                            <form class="forms-sample" action="${ pageContext.request.contextPath }/?????" method="post">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">用户选择：</label>
                                    <div class="col-sm-9">
                                        <select class="selectpicker" id="sel" name="sel" onchange="peopleSelect()">
                                            <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">姓名</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="name1" name="name1" placeholder="姓名">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">用户名</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="username1" name="username1" placeholder="用户名">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">密码</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="password11" name="password1" placeholder="密码">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="font-size: 14px;">密码确认</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="password22" name="password2" placeholder="密码确认">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">分组</label>
                                    <div class="col-sm-9">
                                        <select class="selectpicker" id="groupid1" name="groupid1">
                                            <option value="0" style="text-align: center; text-align-last: center;">领导组</option>
                                            <option value="1" style="text-align: center; text-align-last: center;">编程设计组</option>
                                            <option value="2" style="text-align: center; text-align-last: center;">软件组</option>
                                            <option value="3" style="text-align: center; text-align-last: center;">经营管理组</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">权限</label>
                                    <div class="col-sm-9">
                                        <select class="selectpicker" id="power1" name="power1">
                                            <option value="0" style="text-align: center; text-align-last: center;">管理员级别<</option>
                                            <option value="1" style="text-align: center; text-align-last: center;">主任</option>
                                            <option value="2" style="text-align: center; text-align-last: center;">副主任</option>
                                            <option value="3" style="text-align: center; text-align-last: center;">（副）主任级别</option>
                                            <option value="18" style="text-align: center; text-align-last: center;">员工</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">是否借调</label>
                                    <div class="col-sm-9">
                                        <select class="selectpicker" id="transfer" name="transfer">
                                            <option value="0" style="text-align: center; text-align-last: center;">否</option>
                                            <option value="1" style="text-align: center; text-align-last: center;">是</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">是否在职</label>
                                    <div class="col-sm-9">
                                        <select class="selectpicker" id="inuse" name="inuse">
                                            <option value="0" style="text-align: center; text-align-last: center;">否</option>
                                            <option value="1" style="text-align: center; text-align-last: center;">是</option>
                                        </select>
                                    </div>
                                </div>

                                <div align="center">
                                    <input type="submit" class="btn btn-primary mr-2" name="submit" value="确认修改">
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
<script src="<%=basePath%>assets/vendors/dataTables/jquery.dataTables.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/jquery.flot/jquery.flot.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/jquery.flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/progressbar.js/progressbar.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script src="<%=basePath%>js/datatable_zh.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/data-table.js"></script>
<script src="<%=basePath%>js/htmlFile/Management.js"></script>
<script src="<%=basePath%>js/bootstrap-select.js" type="text/javascript"></script>
<script type="text/javascript">

    function logUp() {
        window.location.href = "../../bye.jsp";
    }
</script>
</html>