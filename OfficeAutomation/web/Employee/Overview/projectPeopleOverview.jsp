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
        hr.style-two {
            border: 0;
            height: 1px;
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(204,204,204), rgba(0, 0, 0, 0));
        }
        table {
            table-layout: fixed;
        }
    </style>
    <script type="text/javascript" src="assets/js/jquery-1.11.3.min.js" ></script>
    <script type="text/javascript">
            $(function(){
                // 选项框
            });
            function de(name,username,projectid) {
                if(confirm("确定从项目中撤离"+name+"吗？")){
                    window.location.href="${pageContext.request.contextPath}/projectServlet?method=removePeopleFromProject&projectid="+projectid+"&username="+username;
                }
            }

            function addpeople(projectid) {
                var username = $("#uname").children('option:selected').val();
                var name = $("#uname").children('option:selected').html();
                if(username!=null && username!=''){
                    if(confirm("确定从项目中添加"+name+"吗？")){
                        window.location.href="${pageContext.request.contextPath}/projectServlet?method=addPeopleToProject&projectid="+projectid+"&username="+username;
                    }
                }
            }
    </script>
</head>
<body>
<div class="main-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <%@ include file="../Master/SideBar.jsp"%>
    <!-- partial -->
    <main class="page-wrapper">
        <!-- partial:partials/_navbar.html -->
        <%@ include file="../Master/NavBar.jsp"%>
        <!-- partial -->
        <div class="page-main">
            <div class="page-content">
                <nav class="page-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item text-small text-twitter">Tables</li>
                        <li class="breadcrumb-item active text-small" aria-current="project">编辑参与人员</li>
                    </ol>
                </nav>
                <!-- row -->
                <div class="row">
                    <div class="container-fluid grid-margin col-md-12">
                        <div class="card card-rounded border-light">
                            <div class="card-header">
                                <div class="custom-control-inline">
                                    <div class="col">
                                        <div class="card-title"><h3 class="text text-primary">${project.projectName}</h3></div>
                                    </div>

                                    <label class="col-sm-auto col-form-label text-primary">姓名：</label>
                                    <div class="control-text col-sm-auto col-md-auto col-lg-auto">
                                        <select class="dropdown-item-text text-primary border-primary-muted" id="uname" name="uname">
                                            <option value="" selected style="text-align: center; text-align-last: center;">请选择</option>
                                            <c:if test="${!empty userList}">
                                                <c:forEach var="u" items="${userList}">
                                                    <option value="${u.username}"  style="text-align: center; text-align-last: center;">${u.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    <div class="col-sm-1 form-label">
                                        <input type="button" class="btn btn-inverse-warning btn-rounded border-warning btn-sm" id="addButton" onclick="addpeople('${project.id}')" value="添加人员">
                                    </div>
                                </div>
                            </div>

                            <hr class="style-two">

                            <div class="card-body">
                                <div class="table-content">
                                    <div class="custom-control table">
                                        <div class="table-responsive text-wrap">
                                            <table class="table table-striped table-bordered table-hover table-condensed table-responsive-md table-sm w-auto" id="table01" cellspacing="0" cellpadding="15">
                                                <thead>
                                                <tr>
                                                    <th>人员姓名</th>
                                                    <th>人员账号</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody id="tb" class="text-secondary">
                                                    <c:if test="${!empty peopleList}">
                                                        <c:forEach var="people" items="${peopleList}">
                                                            <tr>
                                                                <td><div class="text-wrap text-break">${people.name}</div></td>
                                                                <td><div class="text-wrap text-break">${people.username}</div></td>
                                                                <td>
                                                                    <button id="bDelete" type="button" onclick="de('${people.name}','${people.username}','${project.id}')" class="btn btn-inverse-danger-muted btn-rounded btn-xs text-danger border-danger">撤离此人员</button>
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
            </div>
        </div>
        <!-- partial:partials/_footer.html -->
        <%@ include file="../Master/Footer.jsp"%>
        <!-- partial -->
    </main>
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

</script>
</html>