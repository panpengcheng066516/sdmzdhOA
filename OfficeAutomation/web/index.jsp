<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>自动化工程技术公司工作量汇总查询系统</title>
  <link rel="stylesheet" href="assets/vendors/core/core.css">
  <link rel="stylesheet" href="assets/fonts/feather-font/css/iconfont.css">
  <link rel="stylesheet" href="assets/css/demo_1/style.css">
  <link rel="shortcut icon" href="assets/images/CRM.png" />
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
                  <h5 class="text-muted font-weight-normal mb-4">欢迎使用</h5>
                  <form class="forms-sample" action="${ pageContext.request.contextPath }/userServlet?method=login" method="post">
                    <div class="form-group">
                      <label for="username">用户名</label>
                      <input type="text" name="username" class="form-control" id="username" placeholder="用户名" />
                    </div>
                    <div class="form-group">
                      <label for="password">密码</label>
                      <input type="password" name="password" class="form-control" id="password" autocomplete="current-password" placeholder="密码" />
                    </div>
                    <div class="mt-5">
                      <button type="submit" class="btn btn-primary mr-2 mb-2 mb-md-0">登录</button>
                      <button type="button" class="btn btn-success mr-2 mb-2 mb-md-0" onclick="updatepasswd();">修改密码</button>
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
  function updatepasswd() {
    window.location.href = "register.jsp";
  }

</script>
</html>