<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/16/2020
  Time: 1:11 PM
  /* 主任用 */
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
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#projectCheck" role="button" aria-expanded="false" aria-controls="projectCheck"> <i class="link-icon" data-feather="box"></i> <span class="link-title">项目管理</span> <i class="link-arrow" data-feather="chevron-down"></i>
                </a>
                <div class="collapse" id="projectCheck">
                    <ul class="nav sub-menu">
                        <li class="nav-item" style="display: none;">
                            <a href="${ pageContext.request.contextPath }/Employee/Project/project.jsp" class="nav-link">科室项目录入</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/Employee/Overview/projectOverview.jsp" class="nav-link">科室项目查询</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#overview" role="button" aria-expanded="false" aria-controls="overview"> <i class="link-icon" data-feather="pocket"></i> <span class="link-title">科室工作量查询</span> <i class="link-arrow" data-feather="chevron-down"></i>
                </a>
                <div class="collapse" id="overview">
                    <ul class="nav sub-menu">
                        <li class="nav-item" style="display: none;">
                            <a href="${ pageContext.request.contextPath }/Employee/Overview/monthSummary.jsp" class="nav-link">本月及历史工作量查询</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/Employee/Overview/overview.jsp" class="nav-link">工作量统计汇总</a>
                        </li>
                    </ul>
                </div>
            </li>
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