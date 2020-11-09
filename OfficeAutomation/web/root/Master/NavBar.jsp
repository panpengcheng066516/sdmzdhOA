<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- partial:partials/_navbar.html -->
<script type="text/javascript" src="assets/js/jquery-1.11.3.min.js" ></script>
<script type="text/javascript">
    $(function(){
        // 修改密码按钮
        $("#updatePassword").click(function(){
            $(location).attr('href','${pageContext.request.contextPath}/register.jsp');
        });
    });
</script>

<nav class="navbar"> <a href="#" class="sidebar-toggler">
    <i data-feather="menu"></i>
</a>
    <div class="navbar-content">
        <div id="title1">
            <div class="navbar-brand">
                <span id="titleText" style="font-weight: bold; font-size: x-large;color: white;">Office Automation</span>
            </div>
        </div>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown nav-profile"><a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img src="<%=basePath%>assets/images/carousel/gitlab.jpg" alt="profile">
            </a>
                <div class="dropdown-menu" aria-labelledby="profileDropdown">
                    <div class="dropdown-header d-flex flex-column align-items-center">
                        <div class="figure mb-3">
                            <img src="<%=basePath%>assets/images/carousel/gitlab.jpg" alt="">
                        </div>
                        <div class="info text-center">
                            <p class="name font-weight-bold mb-0">用户名：${ sessionScope.user.name }</p>
                            <p class="name font-weight-bold mb-0">职位：管理员<i class="mb-1 text-primary ml-1 icon-small" data-feather="gitlab"></i></p>
                            <p class="name font-weight-bold mb-0">Welcome back!</p>
                        </div>
                    </div>
                    <div class="dropdown-body">
                        <ul class="profile-nav p-0 pt-3">
                            <li class="nav-item"><a href="javascript:void(0);" class="nav-link" id="updatePassword" >
                                <i data-feather="user"></i> <span>密码修改</span>
                            </a></li>
                            <li class="nav-item"><a href="${ pageContext.request.contextPath }/userServlet?method=logout" class="nav-link">
                                <i data-feather="log-out"></i> <span>退出</span>
                            </a></li>
                        </ul>
                    </div>
                </div></li>
        </ul>
    </div>
</nav>
