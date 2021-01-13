<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/18/2020
  Time: 2:53 PM
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
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/select2/select2.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/fonts/feather-font/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/demo_1/style.css">
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.png" />

</head>
<body>
<div class="main-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <%@ include file="../Master/SideBar.jsp"%>
    <!-- partial -->
    <div class="page-wrapper" style="background-image: linear-gradient(to right bottom, #fbf6f0, #f8f6ee, #f5f5ed, #f1f5ed, #edf5ed, #edf5ed, #edf5ed, #edf5ed, #f1f5ed, #f5f5ed, #f8f6ee, #fbf6f0);">
        <!-- partial:partials/_navbar.html -->
        <%@ include file="../Master/NavBar.jsp"%>
        <!-- partial -->
        <div class="page-content">
            <!-- row -->
            <div class="row">
                <div class="container-fluid grid-margin col-md-8">
                    <div class="card card-rounded shadow-lg">
                        <div class="card-header">
                            <div class="custom-control-inline">
                                <div class="col">
                                    <div class="card-title"><h3 class="text text-primary">项目修改</h3>
                                    </div>
                                    <div class="col">
                                        <div class="alert alert-icon-danger-muted text-small col-sm-auto">
                                            <i data-feather="alert-circle"></i>修改时请注意，不得使用英文标点符号。
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form class="forms form-control-plaintext align-content-center" action="${ pageContext.request.contextPath }/projectServlet?method=updateProject" method="post">
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" for="projectName">项目名称</label>
                                    <input type="text" class="form-control col-sm-2" name="projectName" id="projectName" value="${project.projectName}">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" for="projectNo">工程号&emsp;</label>
                                    <input type="text" class="form-control col-sm-2" name="projectNo" id="projectNo" value="${project.projectNo}">
                                </div>
                                &nbsp;
                                <div class="text-area" style="margin-left: 3.5%; margin-right: 3.5%" hidden="true">
                                    <input type="text"  class="form-control col-sm-1" name="id" id="id" value="${project.id}">
                                </div>

                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="deadline" >截止日期</label>
                                    <input type="text" class="datepicker form-control col-sm-2" name="deadline" id="deadline" value="${project.deadline}">
<%--                                    placeholder="${project.deadline}"--%>
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="finish">实际日期</label>
                                    <input type="text" class="datepicker form-control col-sm-2" name="finish" id="finish" value="${project.finish}">
<%--                                    placeholder="${project.finish}"--%>
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="progress">进度状态</label>
                                    <div class="control-text col-sm-2">
                                        <select class="select2" id="progress" name="progress">
                                            <option value="已完成" ${project.progress == '已完成'?"selected":""}>已完成</option>
                                            <option value="未完成" ${project.progress == '未完成'?"selected":""}>未完成</option>
                                            <option value="延期" ${project.progress == '延期'?"selected":""}>延期</option>
                                            <option value="取消" ${project.progress == '取消'?"selected":""}>取消</option>
                                        </select>
                                    </div>
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="stage">高阶段分类</label>
                                    <div class="control-text col-sm-2">
                                        <select class="select2" name="stage" id="stage">
                                            <option value="施工图" ${project.stage == '施工图'?"selected":""}>施工图</option>
                                            <option value="方案设计" ${project.stage == '方案设计'?"selected":""}>方案设计</option>
                                            <option value="经营投标" ${project.stage == '经营投标'?"selected":""}>经营投标</option>
                                            <option value="可研" ${project.stage == '可研'?"selected":""}>可研</option>
                                            <option value="初步设计" ${project.stage == '初步设计'?"selected":""}>初步设计</option>
                                        </select>
                                    </div>
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="manager">专业负责人</label>
                                    <div class="control-text col-sm-2">
                                        <select class="select2-single" name="manager" id="manager">
                                            <option value="">请选择</option>
                                            <c:if test="${!empty userList}">
                                                <c:forEach var="u" items="${userList}">
                                                    <option value="${u.username}" ${project.manager == u.name?"selected":""}>${u.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="designer">设计人&emsp;</label>
                                    <div class="control-text col-sm-2">
                                        <select class="select2-single" name="designer" id="designer">
                                            <option value="">请选择</option>
                                            <c:if test="${!empty userList}">
                                                <c:forEach var="u" items="${userList}">
                                                    <option value="${u.username}"  ${project.designer == u.name?"selected":""}>${u.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="reviewer">审核人&emsp;</label>
                                    <div class="control-text col-sm-2">
                                        <select class="select2-single" name="reviewer" id="reviewer">
                                            <option value="">请选择</option>
                                            <c:if test="${!empty userList}">
                                                <c:forEach var="u" items="${userList}">
                                                    <option value="${u.username}"  ${project.reviewer == u.name?"selected":""}>${u.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="office">室审&emsp;&emsp;</label>
                                    <div class="control-text col-sm-2">
                                        <select class="select2-single" name="office" id="office">
                                            <option value="">请选择</option>
                                            <c:if test="${!empty userList}">
                                                <c:forEach var="u" items="${userList}">
                                                    <option value="${u.username}"  ${project.office == u.name?"selected":""}>${u.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="ce">总师&emsp;&emsp;</label>
                                    <input type="text" class="form-control col-sm-2" name="ce" id="ce" value="${project.ce}">
                                </div>
                                &nbsp;
                                <div class="form-group-material" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" for="remarks">备注</label>
                                    <textarea class="form-control col-sm-6" type="text" name="remarks" id="remarks" placeholder="备注" rows="5" >${project.remarks}</textarea>
                                </div>
                                &nbsp;
                                <div class="d-flex col-sm-6 justify-content-center">
                                    <input type="submit" class="btn btn-inverse-primary mb-1 mb-md-0" name="submit" value="确认修改">
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
<script src="<%=basePath%>assets/vendors/core/core.js"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/bootstrap-datepicker/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=basePath%>assets/vendors/select2/select2.min.js"></script>
<script type="text/javascript">
    if ($(".select2").length) {
        $(".select2").select2({
            minimumResultsForSearch: Infinity,

        });
    }

    if ($(".select2-single").length) {
        $(".select2-single").select2();
    }

        $('#deadline').datepicker({
            language: 'zh-CN',
            format: "mm-dd-yyyy",
            todayHighlight: true,
            autoclose: true,
            immediateUpdates: true,
            orientation: 'bottom',
            todayBtn: true,
        });
        $('#deadline').datepicker('setDate');

        $('#finish').datepicker({
            language: 'zh-CN',
            format: "mm-dd-yyyy",
            todayHighlight: true,
            autoclose: true,
            immediateUpdates: true,
            orientation: 'bottom',
            todayBtn: true,
        });
        $('#finish').datepicker('setDate');

    function logUp() {
        window.location.href = "../../index.jsp";
    }

</script>
</html>