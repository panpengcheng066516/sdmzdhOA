<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- partial:partials/_sidebar.html -->
<nav class="sidebar" style="color:#8DB6CD">
    <div class="sidebar-header">
        <a href="javascript:void(0);" class="sidebar-brand" onclick="ShuaXin()" style="color: white;">SDMZDH</a>
        <div class="sidebar-toggler not-active">
            <span></span> <span></span> <span></span>
        </div>
    </div>
    <div class="sidebar-body">
        <ul class="nav">
            <li class="nav-item nav-category">刷新</li>
            <li class="nav-item">
                <a href="javascript:void(0);" class="nav-link" onclick="ShuaXin()"> <i class="link-icon" data-feather="activity"></i> <span class="link-title">刷新本页</span>
                </a>
            </li>

            <li class="nav-item nav-category">功能</li>
            <li class="nav-item"><a href="${ pageContext.request.contextPath }/root/signup.jsp" class="nav-link">
                <i class="link-icon" data-feather="info"></i> <span class="link-title">新用户注册</span>
            </a></li>
            <li class="nav-item"><a href="${ pageContext.request.contextPath }/manageUserServlet?method=findAllUser" class="nav-link">
                <i class="link-icon" data-feather="cast"></i> <span class="link-title">用户注册和管理</span>
            </a></li>

            <script type="text/javascript">
                function ShuaXin() {
                    location.reload(true);
                }

            </script>

        </ul>
    </div>
</nav>

<!-- core:js -->
<script src="../../../assets/vendors/core/core.js"></script>
<!-- endinject -->
<!-- plugin js for this page -->
<!-- end plugin js for this page -->
<!-- inject:js -->
<script src="../../../assets/vendors/feather-icons/feather.min.js"></script>
<script src="../../../assets/js/template.js"></script>
<!-- endinject -->
<!-- custom js for this page -->
<script src="../../../assets/js/chat.js"></script>
<!-- end custom js for this page -->
</body>
</html>