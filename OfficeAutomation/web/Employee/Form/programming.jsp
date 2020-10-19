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
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">

                            <h3 class="text text-primary">编程/画面</h3>
                            <br>
                            <div class="alert alert-icon-info" role="alert">
                                <i data-feather="alert-circle"></i>
                                填写时请注意，不得使用英文标点符号。<br><br>tip:  如需修改可前往个人查询页面选择要修改的内容，修改完自动跳回当前页面。
                            </div>

                            <form class="forms-sample" action="${ pageContext.request.contextPath }/programingPictureWorkingServlet?method=addProgramingPictureWorking" method="post">

                                <hr width="300" align="left">

                                <h6 class="card-title" style="font-size: 14px;">填写</h6>

                                <!-- idSel对应数据库project里的projectid工程号 -->
                                <div class="form-group row">
                                    <label class="col-sm-1 col-form-label" style="font-size: 14px;">项目名称</label>
                                    <div class="col-sm-4">
                                        <select class="selectpicker" id="projectid" name="projectid" data-live-search="true" required="ture">
                                            <c:if test="${!empty projectList}">
                                                <c:forEach var="project" items="${projectList}">
                                                    <option id="${project.projectNo}" value="${project.id}" style="text-align: center; text-align-last: center;">${project.projectName}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>

                                    <label class="col-sm-1 col-form-label" style="font-size: 14px;">工程号</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="projectNo" id="projectNo" disabled="true">
                                    </div>
                                </div>

<%--                                    <!-- type对应数据库worktype里的type项目下的阶段类型 -->--%>
<%--                                <div class="form-group row">--%>
<%--                                    <label class="col-sm-1 col-form-label" style="font-size: 14px;">高阶段分类</label>--%>
<%--                                    <div class="col-sm-4">--%>
<%--                                        <select class="selectpicker" name="type" id="type">--%>
<%--                                            <option value="施工图" style="text-align: center; text-align-last: center;">施工图</option>--%>
<%--                                            <option value="方案设计" style="text-align: center; text-align-last: center;">方案设计</option>--%>
<%--                                            <option value="经营投标" style="text-align: center; text-align-last: center;">经营投标</option>--%>
<%--                                            <option value="可研" style="text-align: center; text-align-last: center;">可研</option>--%>
<%--                                            <option value="初步设计" style="text-align: center; text-align-last: center;">初步设计</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <div class="form-group row">
                                    <label class="col-sm-1 col-form-label" style="font-size: 14px;">总开关量点数</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="digitalNumber" id="digitalNumber" placeholder="总开关量点数">
                                    </div>

                                    <label class="col-sm-1 col-form-label" style="font-size: 14px;">总模拟量点数</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="analogNumber" id="analogNumber" placeholder="总模拟量点数">
                                    </div>
                                </div>

                                <!-- 这条记录在designType上 -->
                                <div class="form-group row">
                                    <label class="col-sm-1 col-form-label" style="font-size: 14px;">编程/画面</label>
                                    <div class="col-sm-4">
                                        <div class="form-check form-check-inline">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="programingPicture" id="programingPicture1" value="data1" checked="true">
                                                编程
                                            </label>
                                        </div>

                                        <div class="form-check form-check-inline">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="programingPicture" id="programingPicture2" value="data2">
                                                画面
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-1 col-form-label" style="font-size: 14px;">总工日数</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="programingDay" id="programingDay" placeholder="总工日数">
                                    </div>

                                    <label class="col-sm-1 col-form-label" style="font-size: 14px;">本月完成工日数</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="monthday" id="monthday" placeholder="本月完成工日数">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-1 col-form-label" style="font-size: 14px;">备注</label>
                                    <div class="col-sm-4">
                                        <textarea class="form-control" name="remark" id="remark" placeholder="备注" rows="3"></textarea>
                                    </div>
                                </div>

                                <br>

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


    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>