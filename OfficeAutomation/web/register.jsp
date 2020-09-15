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
    <link rel="shortcut icon" href="assets/images/CRM.png" />

    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js" ></script>
    <script type="text/javascript" src="js/messages_zh.js" ></script>

    <script type="text/javascript">
        $(function(){
            $("#updateUserForm").validate({
                rules:{
                    username: {
                        required: true,
                        minlength: 2
                    },
                    oldPIN: {
                        required: true,
                        minlength: 6
                    },
                    newPIN: {
                        required: true,
                        minlength: 6
                    },
                    newPIN2: {
                        required: true,
                        minlength: 6,
                        equalTo:"#password"
                    }
                },
                message:{
                    username: {
                        required: "用户名不能为空",
                        minlength: "用户名最少两位"
                    },
                    oldPIN: {
                        required: "不能为空",
                        minlength: "最少六位"
                    },
                    newPIN: {
                        required: "不能为空",
                        minlength: "最少六位"
                    },
                    newPIN2: {
                        required: "不能为空",
                        minlength: "最少六位",
                        equalTo:"两次密码不一致"
                    }
                }
            });

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
                            <div class="col-md-5 pl-md-0">
                                <div class="auth-form-wrapper px-4 py-5">
                                    <a href="#" class="noble-ui-logo d-block mb-2">自动化工程技术公司工作量汇总查询系统</a>
                                    <h5 class="text-muted font-weight-normal mb-4">密码修改</h5>
                                    <form id="updateUserForm" class="forms-sample" action="${pageContext.request.contextPath}/userServlet?method=updatePassword" method="post">
                                        <div class="form-group">
                                            <label for="username">用户名</label>
                                            <input type="text" name="username" class="form-control" id="username" autocomplete="username" placeholder="用户名" />
                                        </div>
                                        <div class="form-group">
                                            <label for="oldPIN">原密码</label>
                                            <input type="password" name="oldPIN" class="form-control" id="oldPIN" placeholder="原密码" />
                                        </div>
                                        <div class="form-group">
                                            <label for="newPIN">新密码 </label>
                                            <input type="password" name="newPIN" class="form-control" id="newPIN" autocomplete="new-password" placeholder="新密码" />
                                        </div>
                                        <div class="form-group">
                                            <label for="newPIN">密码确认 </label>
                                            <input type="password" name="newPIN2" class="form-control" id="newPIN2" autocomplete="new-password" placeholder="新密码确认" />
                                        </div>
                                        <c:if test="${!empty loginError}">
                                            <span style="color: red">${loginError}</span>
                                        </c:if>
                                        <div class="mt-3">
                                            <button type="submit" class="btn btn-primary mr-2 mb-2 mb-md-0">提交</button>
                                            <button type="reset" class="btn btn-outline-info mr-2 mb-1 mb-md-0">清空</button>
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
        window.location.href = "index.jsp";
    }
</script>
</html>