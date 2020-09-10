<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 11:25 AM
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
    <title>客户关系管理系统</title>
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

        .Indent_word{
            text-indent:2em;
            font-size:25px;
        }

        .NoIndent_word{
            font-size:25px;
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

            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <h2>管理员操作手册</h2>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <p class="Indent_word">
                                        以管理员账户登入后，可进行管理员操作，包括对平台用户的管理、拜访周期设置等。
                                    </p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <br>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <h3>1. 用户管理</h3>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <p class="Indent_word">
                                        点击左侧“用户管理”选项卡，进入用户管理界面，可进行包括对新用户的信息录入及已有用户的信息修改等操作，同时可看到所有已存在用户的汇总信息。
                                    </p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <p class="NoIndent_word">
                                        <b>用户信息录入：</b>
                                        根据提示输入姓名、用户名、密码及密码确认、用户部门、用户层级（职位）等信息，点击“提交”按钮。
                                    </p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <p class="NoIndent_word">
                                        <b>用户信息修改：</b>
                                        首先选择要修改的用户名称，接着可修改其姓名、用户名、密码、密码确认、用户部门、用户层级、是否在职等信息。确认无误后，点击“修改”按钮完成修改。
                                    </p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8">
                                    <img src='Root/UserManual/Images/AdministratorLevel/AdministratorLevel_1.png' width="100%" height="100%" alt="图片无法显示"/>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>


                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <br><br>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <h3>2. 拜访周期设置</h3>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <p class="Indent_word">
                                        点击左侧“拜访周期设置”选项卡，进入拜访周期设置操作界面，可对不同重点层次的客户，设置对应的拜访提醒周期，点击“提交”按钮完成设置。已设置的拜访周期展示在界面右半侧。图中示例表明对重点客户、次重点客户、一般客户的拜访周期设置分别为1周、2周、4周。
                                    </p>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8">
                                    <img src='Root/UserManual/Images/AdministratorLevel/AdministratorLevel_2.png' width="100%" height="100%" alt="图片无法显示"/>
                                </div>
                                <div class="col-sm-2"></div>
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
<script src="<%=basePath%>assets/vendors/dataTables/jquery.dataTables.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/jquery.flot/jquery.flot.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/jquery.flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/progressbar.js/progressbar.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script src="<%=basePath%>js/datatable_zh.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/data-table.js"></script>

<script src="<%=basePath%>js/bootstrap-select.js" type="text/javascript"></script>

</html>