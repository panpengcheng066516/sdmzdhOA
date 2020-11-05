<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>自动化工程技术公司工作量汇总查询系统</title>
    <!-- core:css -->
    <link rel="stylesheet" href="assets/vendors/core/core.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- end plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="assets/fonts/feather-font/css/iconfont.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/demo_1/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.png" />

    <script type="text/javascript" src="assets/js/jquery-1.11.3.min.js" ></script>
    <script type="text/javascript" src="assets/js/jquery.validate.js" ></script>
    <script type="text/javascript" src="assets/js/messages_zh.js" ></script>
    <script type="text/javascript">
        $(function(){
            if (${!empty user}){
                $("#username").val("${user.username}");
                $("#oldPIN").val("${user.password}");
            }
        })
    </script>
</head>
<body>
<div class="main-wrapper">
    <div class="page-wrapper full-page">
        <div class="page-content d-flex align-items-center justify-content-center">

            <div class="row w-100 mx-0 auth-page">
                <div class="col-md-8 col-xl-6 mx-auto">
                    <div class="card">
                        <div class="row">
                            <div class="col-md-7 pr-md-0">
                                <div class="auth-left-wrapper"></div>
                            </div>
                            <div class="col-md-auto pl-md-0">
                                <div class="auth-form-wrapper px-4 py-5">
                                    <h4 class="text-facebook mb-1">密码修改</h4>
                                    <form id="updateUserForm" class="forms-sample" action="${pageContext.request.contextPath}/userServlet?method=updatePassword" method="post">
                                        <div class="form-group">
                                            <label for="username">用户名<span class="text-danger">*</span></label>
                                            <input type="text" name="username" class="form-control col-sm-2 col-md-auto col-lg-auto" id="username" autocomplete="username" placeholder="用户名" required="true"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="oldPIN">原密码<span class="text-danger">*</span></label>
                                            <input type="password" name="oldPIN" class="form-control col-sm-2 col-md-auto col-lg-auto" id="oldPIN" placeholder="原密码" required="true"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="newPIN">新密码<span class="text-danger">*</span></label>
                                            <input type="password" name="newPIN" class="form-control col-sm-2 col-md-auto col-lg-auto" id="newPIN" autocomplete="new-password" placeholder="新密码" required="true" />
                                        </div>
                                        <div class="form-group">
                                            <label for="newPIN">确认新密码<span class="text-danger">*</span></label>
                                            <input type="password" name="newPIN2" class="form-control col-sm-2 col-md-auto col-lg-auto" id="newPIN2" autocomplete="new-password" placeholder="确认新密码" required="true"/>
                                        </div>
                                        <c:if test="${!empty loginError}">
                                            <span style="color: red">${loginError}</span>
                                        </c:if>
                                        <div class="custom-control-inline mt-3">
                                            <button type="submit" class="btn btn-primary mr-2 mb-2 mb-md-0">确认</button>
                                            <div class="flex-fill"></div>
                                            <a href="index.jsp" class="text text-small mt-2"> 返回登录页面</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="assets/vendors/core/core.js"></script>
<script src="assets/vendors/feather-icons/feather.min.js"></script>
<script src="assets/js/template.js"></script>
<script type="text/javascript">
    function LoginIn() {
        window.location.href = "login.jsp";
    }
</script>
</html>