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
    <link href="<%=basePath%>css/bootstrap-select.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/sweetalert2/sweetalert2.min.css">
    <!-- 弹出气泡 -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/normalize.css" />
    <link rel="stylesheet" href="<%=basePath%>dialogeffects/css/dialog.css">
    <link rel="stylesheet" href="<%=basePath%>dialogeffects/css/dialog-sandra.css">
    <script src="<%=basePath%>dialogeffects/js/modernizr.custom.js"></script>
    <style type="text/css">
        hr.style-two {
            border: 0;
            height: 1px;
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgb(192, 192, 192), rgba(0, 0, 0, 0));
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
                <div class="container-fluid grid-margin col-md-12">
                    <div class="card card-rounded">
                        <div class="card-header">
                            <div class="custom-control-inline">
                                <div class="col">
                                    <div class="card-title"><h3 class="text text-primary">科室项目录入</h3>
                                    </div>
                                    <div class="col">
                                        <div class="alert alert-icon-info-muted text-small col-sm-auto">
                                            <i data-feather="alert-circle"></i>填写时请注意，不得使用英文标点符号。如需修改可前往个人查询页面选择要修改的内容，修改完自动跳回当前页面。
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form class="forms form-control-plaintext align-content-center" action="${ pageContext.request.contextPath }/addProjectServlet?method=addProject" method="post">
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" for="projectName">项目名称</label>
                                    <input type="text" class="form-control col-sm-2" name="projectName" id="projectName" placeholder="项目名称" autocomplete="off">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" for="projectNo">工程号&emsp;</label>
                                    <input type="text" class="form-control col-sm-2" name="projectNo" id="projectNo" placeholder="工程号" autocomplete="off">
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="deadline">截止日期</label>
                                    <input type="date" class="datepicker form-control col-sm-2 text-success" name="deadline" id="deadline">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="finish">实际日期</label>
                                    <input type="date" class="datepicker form-control col-sm-2 text-success" name="finish" id="finish">
                                </div>
                                &nbsp;
                                <div class="form-group row text-nowrap" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="progress">进度状态</label>
                                    <div class="control-text col-sm-2">
                                        <select class="dropdown-item-text" id="progress" name="progress">
                                            <option value="已完成">已完成</option>
                                            <option value="未完成">未完成</option>
                                            <option value="延期">延期</option>
                                            <option value="取消">取消</option>
                                        </select>
                                    </div>
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="stage">高阶段分类</label>
                                    <div class="control-text col-sm-2">
                                        <select class="dropdown-item-text" name="stage" id="stage">
                                            <option value="施工图">施工图</option>
                                            <option value="方案设计">方案设计</option>
                                            <option value="经营投标">经营投标</option>
                                            <option value="可研">可研</option>
                                            <option value="初步设计">初步设计</option>
                                        </select>
                                    </div>
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="manager">专业负责人</label>
                                    <div class="control-text col-sm-2">
                                        <select class="selectpicker" name="manager" id="manager" required="true" data-live-search="true">
                                            <option value=""  style="text-align: center; text-align-last: center;">请选择</option>
                                            <c:if test="${!empty userList}">
                                                <c:forEach var="u" items="${userList}">
                                                    <option value="${u.username}"  style="text-align: center; text-align-last: center;">${u.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
<%--                                    <input type="text" class="form-control col-sm-2" name="manager" id="manager" placeholder="专业负责人" autocomplete="off">--%>
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="designer">设计人&emsp;</label>
                                    <div class="control-text col-sm-2">
                                        <select class="selectpicker" name="designer" id="designer" required="true" data-live-search="true">
                                            <option value=""  style="text-align: center; text-align-last: center;">请选择</option>
                                            <c:if test="${!empty userList}">
                                                <c:forEach var="u" items="${userList}">
                                                    <option value="${u.username}"  style="text-align: center; text-align-last: center;">${u.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="reviewer">审核人&emsp;</label>
                                    <div class="control-text col-sm-2">
                                        <select class="selectpicker" name="reviewer" id="reviewer" required="true" data-live-search="true">
                                            <option value=""  style="text-align: center; text-align-last: center;">请选择</option>
                                            <c:if test="${!empty userList}">
                                                <c:forEach var="u" items="${userList}">
                                                    <option value="${u.username}"  style="text-align: center; text-align-last: center;">${u.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
<%--                                    <input type="text" class="form-control col-sm-2" name="reviewer" id="reviewer" placeholder="审核" autocomplete="off">--%>
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="office">室审&emsp;&emsp;</label>
                                    <div class="control-text col-sm-2">
                                        <select class="selectpicker" name="office" id="office" required="true" data-live-search="true">
                                            <option value=""  style="text-align: center; text-align-last: center;">请选择</option>
                                            <c:if test="${!empty userList}">
                                                <c:forEach var="u" items="${userList}">
                                                    <option value="${u.username}"  style="text-align: center; text-align-last: center;">${u.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
<%--                                    <input type="text" class="form-control col-sm-2" name="office" id="office" placeholder="室审" autocomplete="off">--%>
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="ce">总师&emsp;&emsp;</label>
                                    <div class="control-text col-sm-2">
                                        <select class="selectpicker" name="ce" id="ce" required="true" data-live-search="true">
                                            <option value=""  style="text-align: center; text-align-last: center;">请选择</option>
                                            <c:if test="${!empty userList}">
                                                <c:forEach var="u" items="${userList}">
                                                    <option value="${u.username}"  style="text-align: center; text-align-last: center;">${u.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
<%--                                    <input type="text" class="form-control col-sm-2" name="ce" id="ce" placeholder="总师" autocomplete="off">--%>
                                </div>
                                &nbsp;
                                <div class="form-group-material" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" for="remarks">备注</label>
                                    <textarea class="form-control col-sm-6" type="text" name="remarks" id="remarks" placeholder="备注" rows="5" ></textarea>
                                </div>
                                &nbsp;
                                <div align="center">
                                    <input type="submit" class="btn btn-inverse-success mb-1 mb-md-0" name="submit" value="提交">
                                </div>
                            </form>
                        </div>
                        <div class="card-footer">
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

    function logUp() {
        window.location.href = "../../login.jsp";
    }
</script>
</html>