<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 1:15 PM
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
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/select2/select2.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/fonts/feather-font/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/demo_1/style.css">
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.png" />
    <style type="text/css">
        hr.style-two {
            border: 0;
            height: 1px;
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(192,192,192), rgba(0, 0, 0, 0));
        }
    </style>
    <script type="text/javascript" src="<%=basePath%>assets/js/jquery-1.11.3.min.js" ></script>
    <script type="text/javascript">
        $(function(){
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
                            <div class="custom-control">
                                <div class="col">
                                    <div class="card-title"><h3 class="text text-primary">设计修改</h3></div>
                                </div>
                                <div class="row">
                                    <div class="alert alert-icon-danger-muted text-small">
                                        <i data-feather="alert-circle"></i>修改时请注意，不得使用英文标点符号。
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form class="forms form-control-plaintext align-content-center" action="${ pageContext.request.contextPath }/designWorkingServlet?method=updateDesignWorking" method="post">
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <strong><label class="col-sm-auto col-form-label" for="projectid">项目名称</label></strong>
                                    <div class="control-text col-sm col-md-3 col-lg-3">
                                        <select class="select2-single" id="projectid" name="projectid" required="true">
                                            <c:if test="${!empty projectList}">
                                                <c:forEach var="project" items="${projectList}">
                                                    <option id="${project.projectNo}" value="${project.id}" ${project.id == design.id?"selected":""} >${project.projectName}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    &nbsp;
                                    <strong><label class="col-sm-auto col-form-label" for="projectNo">工程号</label></strong>
                                    <input type="text" class="form-control col-sm-2" name="projectNo" id="projectNo" disabled value="${requestScope.designproject.projectNo}">
                                </div>

                                <div class="input-group-append" style="margin-left: 3.5%; margin-right: 3.5%" hidden="true">
                                    <input type="text"  class="form-control col-sm-1" name="id" id="id"  value="${design.id}">
                                    <input type="text"  class="form-control col-sm-1" name="year" id="year"  value="${design.year}">
                                    <input type="text" class="form-control col-sm-1" name="month" id="month"  value="${design.month}">
                                </div>

                                <hr class="style-two">
                                <%-- horizontal rule --%>
                                <div>
                                    <div class="form-text mdi-help-box text-small text-gray col-xs-auto" style="margin-left: 50px">施工图工作量：</div><br>
                                    <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                        <label class="col-sm-auto col-form-label" style="display:table-cell;" for="amount">图纸张数</label>
                                        <input type="text" class="form-control col-sm-2" name="amount" id="amount" value="${design.amount}">
                                        &nbsp;
                                        <label class="col-sm-auto col-form-label" style="display:table-cell;" for="a1">折合成A1</label>
                                        <input type="text" class="form-control col-sm-2"  name="a1" id="a1" value="${design.a1}">
                                    </div>
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="zheheWorkingDay">总工日数</label>
                                    <input type="text" class="form-control form-group-sm col-sm-2" name="zheheWorkingDay" id="zheheWorkingDay" value="${design.zheheWorkingDay}">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="monthDay">本月完成</label>
                                    <input type="text" class="form-control col-sm-2" name="monthDay"   id="monthDay" value="${design.monthDay}">
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="programDay">技术方案</label>
                                    <input type="text" class="form-control col-sm-2" name="programDay" id="programDay" value="${design.programDay}">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="basicDesignDay">基本设计</label>
                                    <input type="text" class="form-control col-sm-2" name="basicDesignDay" id="basicDesignDay" value="${design.basicDesignDay}">
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="leader" >专业负责人</label>
                                    <input type="text" class="form-control col-sm-2" name="leader" id="leader" value="${design.leader}">
                                    <div class="help-text col-sm-3 text-small text-reddit mt-2 text-justify">注：<strong>是专业负责人且不是设计人员</strong>，将工作量折合工日后填在此处。</div>
                                </div>
                                &nbsp;
                                <div class="form-group-material" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" for="remark">备注</label>
                                    <textarea class="form-control col-sm-6" type="text" name="remark" id="remark" placeholder="备注" rows="5" >${design.remark}</textarea>
                                </div>
                                &nbsp;
                                <div class="d-flex col-sm-6 justify-content-center">
                                    <input type="submit" class="btn btn-inverse-primary mb-1 mb-md-0" name="submit" value="确认修改">
                                </div>
                            </form>
                        </div>
                    <div class="card-footer"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- partial:partials/_footer.html -->
    <%@ include file="../Master/Footer.jsp"%>
    <!-- partial -->
</div>
</body>
<script src="<%=basePath%>assets/vendors/core/core.js"></script>
<script src="<%=basePath%>assets/vendors/select2/select2.min.js"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script type="text/javascript">
    if ($(".select2-single").length) {
        $(".select2-single").select2();
    }

    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>