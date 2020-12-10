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
                <div class="container-fluid grid-margin col-md-12">
                    <div class="card card-rounded">
                        <div class="card-header">
                            <div class="custom-control-inline">
                                <div class="col">
                                    <div class="card-title"><h3 class="text text-primary">经营</h3>
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
                            <form class="forms form-control-plaintext align-content-center" action="${ pageContext.request.contextPath }/manageWorkingServlet?method=addManageWorking" method="post">
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <strong><label class="col-sm-auto col-form-label" for="projectid">项目名称</label></strong>
                                    <div class="control-text col-sm col-md-2 col-lg-2">
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
                                    <input type="text" class="form-control col-sm-2" name="projectNo" id="projectNo" disabled>
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
                                        <input type="text" aria-label="定义工作" class="form-control col-sm-2" disabled style="margin-right:40px" name="workname" id="workname" placeholder="请定义工作量具体名称" autocomplete="off">
                                    </div>
                                </div>

                                <hr class="style-two">

                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="xunjiabaojia" >商务询价</label>
                                    <input type="text" class="form-control col-sm-2" name="xunjiabaojia" id="xunjiabaojia" placeholder="询价/报价等" autocomplete="off">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="tender">标书制作</label>
                                    <input type="text" class="form-control col-sm-2"  name="tender" id="tender" placeholder="标书" autocomplete="off">
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="sign">合同相关</label>
                                    <input type="text" class="form-control form-group-sm col-sm-2" name="sign" id="sign" placeholder="制作/签署等" autocomplete="off">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="toubiao">投标工作</label>
                                    <input type="text" class="form-control col-sm-2" name="toubiao" id="toubiao" placeholder="投标" autocomplete="off">
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="equip">设备采购</label>
                                    <input type="text" class="form-control col-sm-2 " name="equip" id="equip" placeholder="招标采购" autocomplete="off">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="test">设备检测</label>
                                    <input type="text" class="form-control col-sm-2 " name="test" id="test" placeholder="出厂检测" autocomplete="off">
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="cuikuan">债务相关</label>
                                    <input type="text" class="form-control col-sm-2 " name="cuikuan" id="cuikuan" placeholder="催收欠款/尾款等">
                                    &nbsp;
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="contract">合同管理</label>
                                    <input type="text" class="form-control col-sm-2 " name="contract" id="contract" placeholder="合同" autocomplete="off">
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="other">其他活动</label>
                                    <input type="text" class="form-control col-sm-2" name="other" id="other" placeholder="其他相关业务" autocomplete="off">
                                </div>
                                &nbsp;
                                <div class="form-group row" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" style="display:table-cell;" for="PMday" >项目经理</label>
                                    <input type="text" class="form-control col-sm-2" name="PMday" id="PMday" placeholder="工日" autocomplete="off">
                                    <div class="help-text col-sm-3 text-small text-reddit mt-2 text-justify" for="leader">注：<strong>该处不写经理人名字</strong>，请经理人将工作量折合工日写在此处。</div>
                                </div>
                                &nbsp;
                                <div class="form-group-material" style="margin-left: 3.5%; margin-right: 3.5%">
                                    <label class="col-sm-auto col-form-label" for="remark">备注</label>
                                    <textarea class="form-control col-sm-6" type="text" name="remark" id="remark" placeholder="备注" rows="5" ></textarea>
                                </div>
                                &nbsp;
                                <div align="center">
                                    <input type="submit" class="btn btn-inverse-success mb-1 mb-md-0" name="submit" value="提交">
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