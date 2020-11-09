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
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.png" />
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

    <script type="text/javascript" src="assets/js/jquery-1.11.3.min.js" ></script>
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
                <div class="container-fluid grid-margin col-md-12">
                    <div class="card card-rounded">
                        <div class="card-header">
                            <div class="custom-control-inline">
                                <div class="col">
                                    <div class="card-title">
                                        <h3 class="text text-success">用户信息修改</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form class="forms-sample" action="${ pageContext.request.contextPath }/manageUserServlet?method=updateUser" method="post">
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="name">选择用户</label>
                                    <div class="control-text col-sm-2">
                                        <select class="selectpicker" name="username" id="username" required="true" data-live-search="true">
                                            <c:if test="${!empty userList}">
                                                <c:forEach var="u" items="${userList}">
                                                    <option value="${u.username}"  style="text-align: center; text-align-last: center;">${u.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="name">姓名&emsp;&emsp;</label>
                                    <input type="text" class="form-control col-sm-2" name="name" id="name" placeholder="姓名"  required="true" autocomplete="off">

                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="username1">用户名&emsp;</label>
                                    <input type="text" class="form-control col-sm-2" name="username1" id="username1" placeholder="用户名" autocomplete="off" required="true">
                                </div>

                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="password">密码&emsp;&emsp;</label>
                                    <input type="text" class="form-control col-sm-2" name="password" id="password" placeholder="密码"  required="true" autocomplete="off">

                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="password1">确认密码</label>
                                    <input type="text" class="form-control col-sm-2" name="password1" id="password1" placeholder="确认密码" autocomplete="off" required="true">
                                </div>

                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="password">分组&emsp;&emsp;</label>
                                    <div class="control-text col-sm-2">
                                        <select class="dropdown-item-text" id="groupId" name="groupId" required="true">
                                            <option value="0" style="text-align: center; text-align-last: center;">领导组</option>
                                            <option value="1" style="text-align: center; text-align-last: center;">编程设计组</option>
                                            <option value="2" style="text-align: center; text-align-last: center;">软件组</option>
                                            <option value="3" style="text-align: center; text-align-last: center;">经营管理组</option>
                                        </select>
                                    </div>

                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="password1">权限&emsp;&emsp;</label>
                                    <div class="control-text col-sm-2">
                                        <select class="dropdown-item-text" id="power" name="power" required="true">
                                            <option value="0" style="text-align: center; text-align-last: center;">管理员</option>
                                            <option value="1" style="text-align: center; text-align-last: center;">主任</option>
                                            <option value="2" style="text-align: center; text-align-last: center;">副主任</option>
                                            <option value="3" style="text-align: center; text-align-last: center;">（副）主任级别</option>
                                            <option value="18" style="text-align: center; text-align-last: center;">员工</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="password">是否借调</label>
                                    <div class="control-text col-sm-2">
                                        <select class="dropdown-item-text" id="transfer" name="transfer" required="true">
                                            <option value="0" selected style="text-align: center; text-align-last: center;">否</option>
                                            <option value="1" style="text-align: center; text-align-last: center;">是</option>
                                        </select>
                                    </div>

                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="password1">是否在职</label>
                                    <div class="control-text col-sm-2">
                                        <select class="dropdown-item-text" id="inuse" name="inuse" required="true">
                                            <option value="0"  style="text-align: center; text-align-last: center;">否</option>
                                            <option value="1" selected style="text-align: center; text-align-last: center;">是</option>
                                        </select>
                                    </div>
                                </div>

                                <c:if test="${!empty updateError}">
                                    <span style="color: red">${updateError}</span>
                                </c:if>
                                <br>

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
        <%@ include file="../root/Master/Footer.jsp"%>
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

    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
        $('.selectpicker').selectpicker('mobile');
    }

    function logUp() {
        window.location.href = "login.jsp";
    }
</script>
</html>