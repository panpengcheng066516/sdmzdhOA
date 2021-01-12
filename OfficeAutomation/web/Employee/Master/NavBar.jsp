<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 11:34 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
    $(function(){
        $("#updatePassword").click(function(){
            $(location).attr('href','${pageContext.request.contextPath}/register.jsp');
        });
    });
</script>

<nav class="navbar">
    <a href="#" class="sidebar-toggler">
        <i data-feather="menu"></i>
    </a>
    <div class="navbar-content">
        <form class="search-form">
            <div class="input-group">
                <i data-feather="home" style="color:white" class="mt-2"></i>&nbsp;
                <span style="font-weight: bold; font-size: x-large;color: white;margin-bottom: 10px" onselectstart="return false">
                    &emsp;山冶设计自动化工程技术分公司
                </span>
            </div>
        </form>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown nav-profile">
                <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="<%=basePath%>assets/images/user2.png" alt="profile">
                </a>
                <div class="dropdown-menu" aria-labelledby="profileDropdown">
                    <div class="dropdown-header d-flex flex-column align-items-center">
                        <div class="figure mb-3">
                            <img src="<%=basePath%>assets/images/user2.png" alt="">
                        </div>
                        <div class="info text-center">
                            <p class="name font-weight-bold mb-0">${ sessionScope.user.name }</p>
                            <c:if test="${user.power==0}">
                                <p class="name font-weight-bold mb-0">管理员<i class="mb-1 text-primary ml-1 icon-small" data-feather="award"></i></p>
                            </c:if>
                            <c:if test="${user.power==1||user.power==2}">
                                <p class="name font-weight-bold mb-0">主任<i class="mb-1 text-primary ml-1 icon-small" data-feather="award"></i></p>
                            </c:if>
                            <c:if test="${user.power==3}">
                                <p class="name font-weight-bold mb-0">副主任<i class="mb-1 text-primary ml-1 icon-small" data-feather="award"></i></p>
                            </c:if>
                            <c:if test="${user.power!=0 && user.power!=1 && user.power!=2 && user.power!=3}">
                                <p class="name font-weight-bold mb-0">员工<i class="mb-1 text-primary ml-1 icon-small" data-feather="award"></i></p>
                            </c:if>
                        </div>
                    </div>
                    <div class="dropdown-body">
                        <ul class="profile-nav p-0 pt-3">
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/register.jsp" class="nav-link" id="updatePassword" >
                                <i data-feather="user"></i> <span>密码修改</span>
                            </a></li>
                            <li class="nav-item"><a href="${ pageContext.request.contextPath }/userServlet?method=logout" class="nav-link">
                                <i data-feather="log-out"></i> <span>退出</span>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</nav>
