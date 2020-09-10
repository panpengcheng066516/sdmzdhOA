<%--
  Created by IntelliJ IDEA.
  User: miles
  Date: 9/1/2020
  Time: 2:55 PM
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
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/jquery-tags-input/jquery.tagsinput.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/dropzone/dropzone.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/dropify/dist/dropify.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/bootstrap-colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/tempusdominus-bootstrap-4/tempusdominus-bootstrap-4.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/fonts/feather-font/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/demo_1/style.css">
    <link rel="shortcut icon" href="<%=basePath%>assets/images/CRM.png" />
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/select2/select2.min.css">
    <link href="<%=basePath%>css/bootstrap-select.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>assets/vendors/sweetalert2/sweetalert2.min.css">
    <!-- 弹出气泡 -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/normalize.css" />
    <link rel="stylesheet" href="<%=basePath%>dialogeffects/css/dialog.css">
    <link rel="stylesheet" href="<%=basePath%>dialogeffects/css/dialog-sandra.css">
    <script src="<%=basePath%>dialogeffects/js/modernizr.custom.js"></script>
    <style type="text/css">
        .table>thead>tr>th {
            text-align: center;
            border-top: 1px solid #000000;
            border-color: #000000;
        }
        .table>tbody>tr>td {
            text-align: center;
            border-top: 1px solid #000000;
            border-color: #000000;
        }
    </style>
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
            <!-- row -->
            <div class="row">
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title" style="font-size: 14px;">日常管理</h6>
                            <h6 class="card-title" style="font-size: 14px;color: red;">填写时请注意，不得使用英文标点符号。</h6>
                            <form class="forms-sample" action="${ pageContext.request.contextPath }/othersInputServlet" method="post">

                                <hr width="300" align="left">

                                <h6 class="card-title" style="font-size: 14px;">填写</h6>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">本月出差天数</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="business" id="business" placeholder="本月出差天数">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">技术交流天数</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="technical" id="technical" placeholder="技术交流天数">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">其他零星工日</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="others" id="others" placeholder="其他零星工日">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">备注</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="remarks" id="remarks" placeholder="备注" rows="3"></textarea>
                                    </div>
                                </div>

                                <div align="center">
                                    <input type="submit" class="btn btn-primary mr-2" name="submit" value="提交">
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title" style="font-size: 14px;">修改/删除索引</h6>
                            <h6 class="card-title" style="font-size: 14px;color: red;">序号自动生成，填写工作量时不用填写，仅修改及删除时填写。</h6>
                            <form class="forms-sample" action="${ pageContext.request.contextPath }/othersUpdateServlet" method="post">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">序号：</label>
                                    <div class="col-sm-9">
                                        <select class="selectpicker" id="idSel" name="ID" data-live-search="true">
                                            <option value="0" selected="selected" style="text-align: center; text-align-last: center;">请选择</option>
                                        </select>
                                    </div>
                                </div>

                                <hr width="300" align="left">

                                <h6 class="card-title" style="font-size: 14px;">填写</h6>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">本月出差天数</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="business1" id="business1" placeholder="本月出差天数">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">技术交流天数</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="technical1" id="technical1" placeholder="技术交流天数">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">其他零星工日</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="others1" id="others1" placeholder="其他零星工日">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label" style="font-size: 14px;">备注</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="remarks1" id="remarks1" placeholder="备注" rows="3"></textarea>
                                    </div>
                                </div>

                                <div align="center">
                                    <input type="submit" class="btn btn-primary mr-2" name="submit" value="修改">
                                    <button class="btn btn-warning" id="deleteBtn" name="submit" value="删除">删除</button>
                                </div>
                            </form>
                        </div>
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
<script src="<%=basePath%>assets/vendors/select2/select2.min.js"></script>
<script src="<%=basePath%>assets/vendors/core/core.js"></script>
<script src="<%=basePath%>assets/vendors/jquery.flot/jquery.flot.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/jquery.flot/jquery.flot.resize.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/progressbar.js/progressbar.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/feather-icons/feather.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/template.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/vendors/sweetalert2/sweetalert2.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/bootstrap-select.js" type="text/javascript"></script>
<script src="<%=basePath%>js/htmlFile/linkman.js" type="text/javascript"></script>
<!-- 弹出气泡 -->
<script src="<%=basePath%>dialogeffects/js/classie.js"></script>
<script src="<%=basePath%>dialogeffects/js/dialogFx.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $.ajax({                                     //发起ajax请求
            type : "post",                           //选择Servlet中执行doGet()方法还是doPost()方法
            url : "designInputServlet",                   //url是访问的Servlet的名称
            data : {method:"companyName"},           //传输到后台使用 request.getParameter(“para”); 方法接收参数
            cache : false,                           //当访问页面时浏览器会产生缓存。true如果当前请求有缓存的话，直接使用缓存。如果该属性设置为 false，则每次都会向服务器请求。
            async : false,                           //true是异步传输，false指同步传输
            dataType : "text",
            success : function(data) {               //传输成功回调函数，data为后台发送的数据
                var jsobj=eval("("+data+")");        //据说是由于异步通信，所以要eval处理一下conSelect1<option value="${en.key}">${en.value}</option>
                if (jsobj.login[0].state==="no") {
                    alert("用户未登录，请先登录");
                    window.location.href = "${pageContext.request.contextPath}/index.jsp";
                }

                var tmptable0="";
                if (jsobj.companySel.length > 0) {
                    for (var i = 0; i < jsobj.companySel.length; i++) {
                        tmptable0 += "<option value='"+jsobj.companySel[i].ID+"' style='text-align: center; text-align-last: center;'>"+jsobj.companySel[i].name+"</option>";
                    }
                    $("#companySel0").append(tmptable0);
                    //使用refresh方法更新UI以匹配新状态。
                    $("#companySel0").selectpicker("refresh");
                    //render方法强制重新渲染引导程序 - 选择ui。
                    $("#companySel0").selectpicker("render");

                    $("#companySel1").append(tmptable0);
                    //使用refresh方法更新UI以匹配新状态。
                    $("#companySel1").selectpicker("refresh");
                    //render方法强制重新渲染引导程序 - 选择ui。
                    $("#companySel1").selectpicker("render");

                    $("#customIDSel").append(tmptable0);
                    //使用refresh方法更新UI以匹配新状态。
                    $("#customIDSel").selectpicker("refresh");
                    //render方法强制重新渲染引导程序 - 选择ui。
                    $("#customIDSel").selectpicker("render");
                }

//                     tmptable0="";
//                     if (jsobj.companySel4.length > 0) {
//                         for (var i = 0; i < jsobj.companySel4.length; i++) {
//                             tmptable0 += "<option value='"+jsobj.companySel4[i].ID+"' style='text-align: center; text-align-last: center;'>"+jsobj.companySel4[i].name+"</option>";
//                         }
//                         $("#customIDSel").append(tmptable0);
//                         //使用refresh方法更新UI以匹配新状态。
//                         $("#customIDSel").selectpicker("refresh");
//                         //render方法强制重新渲染引导程序 - 选择ui。
//                         $("#customIDSel").selectpicker("render");
//                     }

            },
            error : function(XMLHttpReques, textStatus, errorThrown) {//传输失败函数
                window.location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        });
    });

    //拉取已输入人员
    function opSel() {
        var tmp=document.getElementById("customIDSel").value;

        $.ajax({                                     //发起ajax请求
            type : "post",                           //选择Servlet中执行doGet()方法还是doPost()方法
            url : "OrderLinkmanSelectPeopleServlet",//url是访问的Servlet的名称
            data : {selecetedID:tmp},  //传输到后台使用 request.getParameter(“para”); 方法接收参数
            cache : false,//当访问页面时浏览器会产生缓存。true如果当前请求有缓存的话，直接使用缓存。如果该属性设置为 false，则每次都会向服务器请求。
            async : false,//true是异步传输，false指同步传输
            dataType : "text",
            success : function(data) {               //传输成功回调函数，data为后台发送的数据
                var jsobj=eval("("+data+")");//据说是由于异步通信，所以要eval处理一下
                var tmptable0="";
                if (jsobj.nameContent.length > 0) {
                    for (var i = 0; i < jsobj.nameContent.length; i++) {
                        tmptable0 += "<option value='"+jsobj.nameContent[i].ID+"' style='text-align: center; text-align-last: center;'>"+jsobj.nameContent[i].name+"</option>";
                    }
                    $("#nameIDSel").empty();
                    $("#nameIDSel").append("<option value='0' selected='selected' style='text-align: center; text-align-last: center;'>请选择</option>");
                    $("#nameIDSel").append(tmptable0);
                    //使用refresh方法更新UI以匹配新状态。
                    $("#nameIDSel").selectpicker("refresh");
                    //render方法强制重新渲染引导程序 - 选择ui。
                    $("#nameIDSel").selectpicker("render");

                }
            },
            error : function(XMLHttpReques, textStatus, errorThrown) {//传输失败函数
                window.location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        });

    }

    //拉取修改内容
    function updateContent() {
        var tmp1=document.getElementById("nameIDSel").value;
        var tmp2=document.getElementById("customIDSel").value;
        $.ajax({                                     //发起ajax请求
            type : "post",                           //选择Servlet中执行doGet()方法还是doPost()方法
            url : "OrderLinkmanSelectContentServlet",//url是访问的Servlet的名称
            data : {customID:tmp2,peopleID:tmp1},  //传输到后台使用 request.getParameter(“para”); 方法接收参数
            cache : false,//当访问页面时浏览器会产生缓存。true如果当前请求有缓存的话，直接使用缓存。如果该属性设置为 false，则每次都会向服务器请求。
            async : false,//true是异步传输，false指同步传输
            dataType : "text",
            success : function(data) {               //传输成功回调函数，data为后台发送的数据
                var jsobj=eval("("+data+")");//据说是由于异步通信，所以要eval处理一下

                $("#name1").val(jsobj.updateContent[0].name);
                $("#gender1").selectpicker("val",jsobj.updateContent[0].gender);
                $("#department1").val(jsobj.updateContent[0].department);
                $("#duty1").val(jsobj.updateContent[0].duty);
                $("#maintainer1").val(jsobj.updateContent[0].maintainer);
                $("#maintainerDepart1").val(jsobj.updateContent[0].maintainerDepart);
                $("#superior1").val(jsobj.updateContent[0].superior);
                $("#officePhone1").val(jsobj.updateContent[0].officePhone);
                $("#mobile1").val(jsobj.updateContent[0].mobile);
                $("#officeLocation1").val(jsobj.updateContent[0].officeLocation);
                $("#school1").val(jsobj.updateContent[0].school);
                $("#gradutaionTime1").val(jsobj.updateContent[0].gradutaionTime);
                $("#major1").val(jsobj.updateContent[0].major);
                $("#origin1").val(jsobj.updateContent[0].origin);
                $("#contactLevel1").selectpicker("val",jsobj.updateContent[0].contactLevel);
                $("#isImportant1").selectpicker("val",jsobj.updateContent[0].isImportant);
                $("#howOften1").selectpicker("val",jsobj.updateContent[0].howOften);
                $("#isFestival1").selectpicker("val",jsobj.updateContent[0].isFestival);
                $("#remarks1").val(jsobj.updateContent[0].remarks);

                var flag=$('#isFestival1').val();
                if (flag==="0") {
                    $("#festivaler1").empty();
                }else if (flag==="1") {
                    $("#festivaler1").empty();
                    $("#festivaler1").append("<label class='col-sm-3 col-form-label' style='font-size: 14px;'>节日维护人 </label><div class='col-sm-9'><input type='text' class='form-control' id='festivaler2' name='festivaler' placeholder='节日维护人'></div>");
                    $("#festivaler2").val(jsobj.updateContent[0].festivaler);
                }
            },
            error : function(XMLHttpReques, textStatus, errorThrown) {//传输失败函数
                window.location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        });
    }

    function peopleInfo(id) {
        var content = "";
        $.ajax({                                     //发起ajax请求
            type : "post",                           //选择Servlet中执行doGet()方法还是doPost()方法
            url : "OrderLinkmanInfoServlet",//url是访问的Servlet的名称
            data : {selecetedID:id},  //传输到后台使用 request.getParameter(“para”); 方法接收参数
            cache : false,//当访问页面时浏览器会产生缓存。true如果当前请求有缓存的话，直接使用缓存。如果该属性设置为 false，则每次都会向服务器请求。
            async : false,//true是异步传输，false指同步传输
            dataType : "text",
            success : function(data) {               //传输成功回调函数，data为后台发送的数据
                var jsobj=eval("("+data+")");//据说是由于异步通信，所以要eval处理一下
                content = "<table style='width: 100%;' cellspacing='0' cellpadding='1' border='1px'><thead><tr>"+
                    "<th style = 'height:50px;font-size: 17px;'>客户单位</th><th style = 'height:50px;font-size: 17px;' colspan='3'>"+jsobj.tableContent[0].customID+"</th>"
                    +"</tr></thead><tbody>";
                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>联系人姓名</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].name+
                    "</td><td style='height:50px;font-size:14px;text-align:center'>性别</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].gender+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>联系人部门</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].department+
                    "</td><td style='height:50px;font-size:14px;text-align:center'>职务</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].duty+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>维护人</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].maintainer+
                    "</td><td style='height:50px;font-size:14px;text-align:center'>维护部门</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].maintainerDepart+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>直接上级</td><td style='height:50px;font-size:14px;text-align:center' colspan='3'>"+jsobj.tableContent[0].superior+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>办公电话</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].officePhone+
                    "</td><td style='height:50px;font-size:14px;text-align:center'>移动电话</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].mobile+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>办公地点</td><td style='height:50px;font-size:14px;text-align:center' colspan='3'>"+jsobj.tableContent[0].officeLocation+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>毕业院校</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].school+
                    "</td><td style='height:50px;font-size:14px;text-align:center'>毕业时间</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].gradutaionTime+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>专业</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].major+
                    "</td><td style='height:50px;font-size:14px;text-align:center'>籍贯</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].origin+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>联系人等级</td><td style='height:50px;font-size:14px;text-align:center' colspan='3'>"+jsobj.tableContent[0].contactLevel+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>是否重点联系人</td><td style='height:50px;font-size:14px;text-align:center' colspan='3'>"+jsobj.tableContent[0].isImportant+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>联系频率</td><td style='height:50px;font-size:14px;text-align:center' colspan='3'>"+jsobj.tableContent[0].howOften+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>是否节日维护对象</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].isFestival+
                    "</td><td style='height:50px;font-size:14px;text-align:center'>节日维护人</td><td style='height:50px;font-size:14px;text-align:center'>"+jsobj.tableContent[0].festivaler+"</td></tr>";

                content+="<tr><td style='height:50px;font-size:14px;text-align:center'>备注</td><td style='height:50px;font-size:14px;text-align:center' colspan='3'>"+jsobj.tableContent[0].remarks+"</td></tr>";
            },
            error : function(XMLHttpReques, textStatus, errorThrown) {//传输失败函数
                window.location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        });

        if (content.length > 0) {
            content += "</tbody></table>";
            $("#tips").empty();
            $("#tips").append(content);
            var dlgtrigger = document.getElementById('alertBtn');
            var somedialog = document.getElementById('somedialog');
            var dlg = new DialogFx(somedialog);
            dlgtrigger.addEventListener('click', dlg.toggle.bind(dlg));
            $("#alertBtn").click();
        }
    }

    //表格拉取
    function opSel1() {
        var tmp=document.getElementById("companySel1").value;
        $.ajax({                                     //发起ajax请求
            type : "post",                           //选择Servlet中执行doGet()方法还是doPost()方法
            url : "OrderLinkmanTableServlet",//url是访问的Servlet的名称
            data : {selecetedID:tmp},  //传输到后台使用 request.getParameter(“para”); 方法接收参数
            cache : false,//当访问页面时浏览器会产生缓存。true如果当前请求有缓存的话，直接使用缓存。如果该属性设置为 false，则每次都会向服务器请求。
            async : false,//true是异步传输，false指同步传输
            dataType : "text",
            success : function(data) {               //传输成功回调函数，data为后台发送的数据
                var jsobj=eval("("+data+")");//据说是由于异步通信，所以要eval处理一下
                $("#table01 tbody").html("");
                if (jsobj.tableContent.length > 0) {
                    for (var i = 0; i < jsobj.tableContent.length; i++) {
                        var num = i + 1;
                        $("#table01 tbody").append("<tr><td style='text-align:center'>"+
                            num+"</td><td style='text-align:center'><a onclick = 'peopleInfo("+jsobj.tableContent[i].ID+")' href='javascript:void(0)'>"+
                            jsobj.tableContent[i].name+"</a></td><td style='text-align:center'>"+
                            jsobj.tableContent[i].mobile+"</td></tr>");
                    };
                }
            },
            error : function(XMLHttpReques, textStatus, errorThrown) {//传输失败函数
                window.location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        });
    }
</script>
</html>