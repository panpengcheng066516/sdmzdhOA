<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 2:20 PM
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
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(192,192,192), rgba(0, 0, 0, 0));
        }
    </style>
    <script type="text/javascript" src="assets/js/jquery-1.11.3.min.js" ></script>
    <script type="text/javascript">
        $(function(){
            var p=$("#projectid").children('option:selected').attr("id");
            $("#projectNo").val(p);
            // 给工程号赋值
            $("#projectid").change(function () {
                var p1=$(this).children('option:selected').attr("id");
                $("#projectNo").val(p1);
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
                <div class="col-md-12 grid-margin container-fluid">
                    <div class="card">
                        <div class="card-header">
                            <div class="custom-control-inline">
                                <div class="col">
                                    <div class="card-title"><h3 class="text text-primary">编程/画面</h3>
                                    </div>
                                    <div class="col">
                                        <div class="alert alert-icon-info-muted text-small col-sm-auto">
                                            <i data-feather="alert-circle" ></i>填写时请注意，不得使用英文标点符号。如需修改可前往个人查询页面选择要修改的内容，修改完自动跳回当前页面。
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form class="forms form-control-plaintext align-content-center" action="${ pageContext.request.contextPath }/programingPictureWorkingServlet?method=addProgramingPictureWorking" method="post">
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <strong><label class="col-sm-auto col-form-label" for="projectid">项目名称</label></strong>
                                    <div class="control-text col-sm col-md-3 col-lg-3">
                                        <select class="selectpicker" id="projectid" name="projectid" data-live-search="true"  >
                                            <option value="" style="text-align: center; text-align-last: center;">请选择</option>
                                            <c:if test="${!empty projectList}">
                                                <c:forEach var="project" items="${projectList}">
                                                    <option id="${project.projectNo}" value="${project.id}" style="text-align: center; text-align-last: center;">${project.projectName}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    &nbsp;
                                    <strong><label class="col-sm-auto col-form-label" for="projectNo">工程号</label></strong>
                                    <input type="text" class="form-control col-sm-2" name="projectNo" id="projectNo" disabled>
                                </div>
                                <div class="help-text col-sm text-small text-success mt-1 text-justify" style="margin-left: 3.5%; margin-right: 3.5%">前往<a href="${ pageContext.request.contextPath }/projectServlet?method=getAllProject" class="text">项目查询页</a>添加相关项目</div>
                                <hr class="style-two">
                                <%-- horizontal rule --%>
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="workname" >工作量名称</label>
                                    <input type="text" class="form-control col-sm-2" name="workname" id="workname" placeholder="请为工作量起个名称" autocomplete="off">
                                </div>
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="digitalNumber" >总开关量</label>
                                    <input type="text" class="form-control col-sm-2" name="digitalNumber" id="digitalNumber" placeholder="点数" autocomplete="off">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="analogNumber">总模拟量</label>
                                    <input type="text" class="form-control col-sm-2"  name="analogNumber" id="analogNumber" placeholder="点数" autocomplete="off">
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" >具体类型</label>
                                    <div class="col-sm-4">
                                        <div class="form-check form-check-inline form-check-danger-muted">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="programingPicture" id="programingPicture1" value="编程">
                                                编程
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline form-check-danger-muted">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="programingPicture" id="programingPicture2" value="画面">
                                                画面
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="programingDay">总工日数</label>
                                    <input type="text" class="form-control col-sm-2 " name="programingDay" id="programingDay" placeholder="总工日数" autocomplete="off">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="monthday">完成情况</label>
                                    <input type="text" class="form-control col-sm-2 " name="monthday" id="monthday" placeholder="完成工日数" autocomplete="off">
                                </div>
                                &nbsp;
                                <div class="form-group-material" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" for="remark">备注</label>
                                    <textarea class="form-control col-sm-6" type="text" name="remark" id="remark" placeholder="备注" rows="5"></textarea>
                                </div>
                                &nbsp;
                                <div align="center">
                                    <input type="submit" class="btn btn-inverse-success mr-2" name="submit" value="提交">
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
    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
        $('.selectpicker').selectpicker('mobile');
    }

    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>