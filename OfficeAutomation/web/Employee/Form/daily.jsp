<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 2:50 PM
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
                            <h6 class="card-title" style="font-size: 14px;">日常管理/出差交流/零星工日</h6>
                            <h6 class="card-title" style="font-size: 14px;color: red;">填写时请注意，不得使用英文标点符号。</h6>
                            <form class="forms-sample" action="${ pageContext.request.contextPath }/dailyInputServlet" method="post">

                                <hr width="300" align="left">

                                <h6 class="card-title" style="font-size: 14px;">填写</h6>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">部门内部日常管理</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily1" id="daily1" placeholder="部门内部日常管理">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">工会事务</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily2" id="daily2" placeholder="工会事务">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">党组事务</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily3" id="daily3" placeholder="党组事务">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">团组事务</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily4" id="daily4" placeholder="团组事务">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">考勤</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily5" id="daily5" placeholder="考勤">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">其他报销</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily6" id="daily6" placeholder="其他报销">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">备注</label>
                                    <h6 class="card-title" style="font-size: 14px;">体系内审/外审等工作请备注在此处</h6>
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
                            <h6 class="card-title" style="font-size: 14px;">工作内容修改</h6>
                            <h6 class="card-title" style="font-size: 14px;color: red;">修改时请注意，不得使用英文标点符号。</h6>
                            <form class="forms-sample" action="${ pageContext.request.contextPath }/dailyUpdateServlet" method="post">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">序号：</label>
                                    <div class="col-sm-9">
                                        <select class="selectpicker" id="idSel1" name="idSel" data-live-search="true">
                                            <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>
                                        </select>
                                    </div>
                                </div>

                                <hr width="300" align="left">

                                <h6 class="card-title" style="font-size: 14px;">修改</h6>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">部门内部日常管理</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily1" id="daily11" placeholder="部门内部日常管理">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">工会事务</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily2" id="daily21" placeholder="工会事务">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">党组事务</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily3" id="daily31" placeholder="党组事务">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">团组事务</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily4" id="daily41" placeholder="团组事务">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">考勤</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily5" id="daily51" placeholder="考勤">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">其他报销</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="daily6" id="daily61" placeholder="其他报销">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">备注</label>
                                    <h6 class="card-title" style="font-size: 14px;">体系内审/外审等工作请备注在此处</h6>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="remarks" id="remarks1" placeholder="备注" rows="3"></textarea>
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