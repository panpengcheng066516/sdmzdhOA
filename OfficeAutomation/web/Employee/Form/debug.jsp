<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 2:39 PM
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
        <div class="page-content" style="background-image: linear-gradient(to right bottom, #fbf6f0, #f8f6ee, #f5f5ed, #f1f5ed, #edf5ed, #edf5ed, #edf5ed, #edf5ed, #f1f5ed, #f5f5ed, #f8f6ee, #fbf6f0);">
            <%--breadscrumb--%>
            <nav class="page-breadcrumb">
                <ol class="breadcrumb bg-inverse-primary">
                    <li class="breadcrumb-item text-small"><a href="index.jsp">首页</a></li>
                    <li class="breadcrumb-item text-small"><a href="${ pageContext.request.contextPath }/personalSummaryServlet?method=getAllWorkingList">个人工作记录一览</a></li>
                    <li class="breadcrumb-item active text-small" aria-current="page">录入工作量</li>
                </ol>
            </nav>
            <!-- row -->
            <div class="row">
                <div class="container-fluid grid-margin col-md-8">
                    <div class="card card-rounded shadow-lg">
                        <div class="card-header">
                            <div class="custom-control-inline">
                                <div class="col">
                                    <div class="card-title"><h3 class="text text-primary">调试工程管理</h3>
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
                            <form class="forms form-control-plaintext align-content-center" action="${ pageContext.request.contextPath }/debugWorkingServlet?method=addDebugWorking" method="post">
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <strong><label class="col-sm-auto col-form-label" for="projectid">项目名称</label></strong>
                                    <div class="control-text col-sm-auto col-md-3 col-lg-3">
                                        <select class="select2-single" id="projectid" name="projectid">
                                            <option value="">请选择</option>
                                            <c:if test="${!empty projectList}">
                                                <c:forEach var="project" items="${projectList}">
                                                    <option id="${project.projectNo}" value="${project.id}">${project.projectName}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    &nbsp;
                                    <strong><label class="col-sm-auto col-form-label" for="projectNo">工程号</label></strong>
                                    <input type="text" class="form-control col-sm-2 " name="projectNo" id="projectNo" readonly>
                                </div>
                                <div class="help-text col-sm text-small text-success mt-1 text-justify" style="margin-left: 3.5%; margin-right: 3.5%">前往<a href="${ pageContext.request.contextPath }//personalProjectServlet?method=getAllPersonalProject" class="text">项目查询页</a>查看相关内容</div>
                                &nbsp;
                                <div class="row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <div class="form-check form-check-flat form-check-danger-muted">
                                        <label class="form-check-label text-secondary">
                                            <input type="checkbox" class="form-check-input" onclick="var input=document.getElementById('workname'); if(this.checked){ input.disabled=false; input.focus();}else{input.disabled=true;}">
                                            该工作无可对应项目
                                        </label>
                                    </div>
                                    &nbsp;
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text col-sm-auto text-dark">工作名称</span>
                                        </div>
                                        <input type="text" aria-label="定义工作" class="form-control col-sm-5" disabled
                                               style="margin-right:40px" name="workname" id="workname" placeholder="请定义工作量具体名称" autocomplete="off">
                                    </div>
                                </div>

                                <hr class="style-two">
                                <%-- horizontal rule --%>
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="site" >项目地点</label>
                                    <input type="text" class="form-control col-sm-2" name="site" id="site" placeholder="地点" autocomplete="off">
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="manageday">工程管理</label>
                                    <input type="text" class="form-control col-sm-2" name="manageday" id="manageday" placeholder="工日" autocomplete="off">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="debugday">工程调试</label>
                                    <input type="text" class="form-control col-sm-2" name="debugday" id="debugday" placeholder="工日" autocomplete="off">
                                </div>
                                <div class="help-text col-sm text-small text-reddit mt-1 text-justify" style="margin-left: 3.2%; margin-right: 3.5%">注：填写以上两（单）项内容请统计好当月该项工作所用的工日。</div>
                                &nbsp;
                                <div class="form-group-material" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="font-size: 14px;">备注</label>
                                    <textarea class="form-control col-sm-6" name="remark" id="remark" placeholder="备注" rows="5"></textarea>
                                </div>
                                &nbsp;
                                <div class="d-flex col-sm-6 justify-content-center">
                                    <input type="submit" class="btn btn-inverse-success btn-icon-text mr-2" name="submit" value="提交">
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
</div>
</body>
<script src="<%=basePath%>assets/vendors/core/core.js"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/select2/select2.min.js"></script>
<script type="text/javascript">

    if ($(".select2-single").length) {
        $(".select2-single").select2();
    }

    function logUp() {
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    }

</script>
</html>