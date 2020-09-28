<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- partial:partials/_sidebar.html -->
<nav class="sidebar" style="color:#8DB6CD">
    <div class="sidebar-header">
        <a href="javascript:void(0);" class="sidebar-brand" onclick="ShuaXin1()" style="color: white;">SDMZDH</a>
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

            <li class="nav-item nav-category">Home</li>
            <li class="nav-item"><a href="${ pageContext.request.contextPath }/index.jsp" class="nav-link">
                <i class="link-icon" data-feather="chevrons-right"></i> <span class="link-title">Dashboard</span>
            </a></li>

            <li class="nav-item nav-category">功能</li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#workloadInput" role="button" aria-expanded="false" aria-controls="workloadInput"> <i class="link-icon" data-feather="upload-cloud"></i> <span class="link-title">工作量填写</span> <i class="link-arrow" data-feather="chevron-down"></i>
                </a>
                <div class="collapse" id="workloadInput">
                    <ul class="nav sub-menu">
                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/Employee/Form/transfer.jsp" class="nav-link">借调状态更改</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/designWorkingServlet?method=getAllProjectByUser" class="nav-link">设计</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/programingPictureWorkingServlet?method=getAllProjectByUser" class="nav-link">编程/画面</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/debugWorkingServlet?method=getAllProjectByUser" class="nav-link">调试工程管理</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/manageWorkingServlet?method=getAllProjectByUser" class="nav-link">经营</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/Employee/Form/daily.jsp" class="nav-link">日常管理/零星</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#projectCheck" role="button" aria-expanded="false" aria-controls="projectCheck"> <i class="link-icon" data-feather="box"></i> <span class="link-title">项目管理</span> <i class="link-arrow" data-feather="chevron-down"></i>
                </a>
                <div class="collapse" id="projectCheck">
                    <ul class="nav sub-menu">
                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/Employee/Form/project.jsp" class="nav-link">科室项目录入</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/projectServlet?method=getAllProject" class="nav-link">科室项目查询</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#personalCheck" role="button" aria-expanded="false" aria-controls="personalCheck"> <i class="link-icon" data-feather="trello"></i> <span class="link-title">个人工作量查询</span> <i class="link-arrow" data-feather="chevron-down"></i>
                </a>
                <div class="collapse" id="personalCheck">
                    <ul class="nav sub-menu">
                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/personalSummaryServlet?method=getAllWorkingList" class="nav-link">历史工作量查询</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#overview" role="button" aria-expanded="false" aria-controls="overview"> <i class="link-icon" data-feather="pocket"></i> <span class="link-title">科室工作量查询</span> <i class="link-arrow" data-feather="chevron-down"></i>
                </a>
                <div class="collapse" id="overview">
                    <ul class="nav sub-menu">
                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/personalSummaryServlet?method=getWorkingList" class="nav-link">历史工作量查询</a>
                        </li>

                        <li class="nav-item">
                            <a href="${ pageContext.request.contextPath }/personalSummaryServlet?method=getHistorySummary" class="nav-link">工作量统计汇总</a>
                        </li>
                    </ul>
                </div>
            </li>

            <script type="text/javascript">
                function ShuaXin() {
                    location.reload(true);
                }
            </script>

            <script type="text/javascript">
                function ShuaXin1(){
                    window.location = "index.jsp";
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