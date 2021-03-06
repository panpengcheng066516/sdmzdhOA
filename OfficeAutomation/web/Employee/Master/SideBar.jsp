<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="sidebar">
    <div class="sidebar-header">
    <img src="<%=basePath%>assets/images/SDM.png" alt=" " style="width: 70%" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
        <div class="sidebar-toggler not-active">
            <span></span> <span></span> <span></span>
        </div>
    </div>
    <div class="sidebar-body">
        <ul class="nav">
            <li class="nav-item nav-category"></li>
            <li class="nav-item">
                <a href="${ pageContext.request.contextPath }/index.jsp" class="nav-link">
                    <i class="link-icon" data-feather="star"></i><span class="link-title">首页</span>
                </a>
            </li>
            <li class="nav-item nav-category">工作量</li>
            <li class="nav-item" ${user.power!=1?"":"hidden"}>
                <a class="nav-link" data-toggle="collapse" href="#workloadInput" role="button" aria-expanded="false" aria-controls="workloadInput">
                    <i class="link-icon" data-feather="chevrons-right"></i><span class="link-title">工作量填写</span>
                    <i class="link-arrow" data-feather="chevron-down"></i>
                </a>
                <div class="collapse show" id="workloadInput">
                    <ul class="nav sub-menu">
                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/Employee/Form/transfer.jsp" class="nav-link">借调</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/designWorkingServlet?method=getAllProjectByUser" class="nav-link">设计</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/programingPictureWorkingServlet?method=getAllProjectByUser" class="nav-link">编程/画面</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/debugWorkingServlet?method=getAllProjectByUser" class="nav-link">调试/管理</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/manageWorkingServlet?method=getAllProjectByUser" class="nav-link">经营管理</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/Employee/Form/daily.jsp" class="nav-link">日常其他</a>
                        </li>

                        <li class="nav-item" ${user.power==2?"":"hidden"}>
                            <a href="${ pageContext.request.contextPath }/addProjectServlet?method=getPeopleInfo" class="nav-link">科室项目</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="nav-item nav-category">个人查询</li>
            <li class="nav-item" ${user.power!=1?"":"hidden"}>
                <a class="nav-link" data-toggle="collapse" href="#personalCheck" role="button" aria-expanded="false" aria-controls="personalCheck">
                    <i class="link-icon" data-feather="trello"></i><span class="link-title">个人工作量查询</span>
                    <i class="link-arrow" data-feather="chevron-down"></i>
                </a>
                <div class="collapse show" id="personalCheck">
                    <ul class="nav sub-menu">
                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/personalSummaryServlet?method=getAllWorkingList" class="nav-link">历史工作量</a>
                        </li>

                        <li class="nav-item" ${user.power!=1?"":"hidden"}>
                            <a href="${ pageContext.request.contextPath }/personalProjectServlet?method=getAllPersonalProject" class="nav-link">个人已参与项目</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="nav-item nav-category">科室查询</li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#overview" role="button" aria-expanded="false" aria-controls="overview">
                    <i class="link-icon" data-feather="pocket"></i><span class="link-title">科室工作量查询</span>
                    <i class="link-arrow" data-feather="chevron-down"></i>
                </a>
                <div class="collapse show" id="overview">
                    <ul class="nav sub-menu">
                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/departmentSummaryServlet?method=getWorkingList" class="nav-link">历史工作量</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/countSummaryServlet?method=getHistorySummary" class="nav-link">工作量统计汇总</a>
                        </li>

                        <li class="nav-item" ${user.power==2 || user.power==1?"":"hidden"}>
                            <a href="${ pageContext.request.contextPath }/projectServlet?method=getAllProject" class="nav-link">科室项目查询</a>
                        </li>
                    </ul>
                </div>
            </li>

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