$(function() {
            var wid=$('#name').width()+34;
            $("#jurisdiction").selectpicker({
                'width' : wid
            });
            
            $("#department").selectpicker({
                'width' : wid
            });
            
            $("#selName1").selectpicker({
                'width' : wid
            });
            
            $("#jurisdiction1").selectpicker({
                'width':wid
            });
            
            $("#department1").selectpicker({
                'width' : wid
            });
            
            $("#effective1").selectpicker({
            	'width' : wid
            });
});

function exportExcel() {
    var tmp=document.getElementById("companySel1").value;
    var form=$("<form>");//定义一个form表单
    form.attr("style","display:none");
    form.attr("target","");
    form.attr("method","post");
    form.attr("action","OrderKeyPersonExportExcelServlet?method="+tmp);
    var input1=$("<input>");
    $("body").append(form);//将表单放置在web中
    form.append(input1);
    form.submit();//表单提交
}

$(function() { 
    var winWidth=$(window).width();
    if (parseInt(winWidth)>parseInt("900")) {
        $("#title1").addClass("search-form");
        $("#titleText").css("font-size","24px");
    }
    else {
        $("#title1").removeClass("search-form");
    }
});

function logUp() {
    window.location.href = "${pageContext.request.contextPath}/index.jsp";
}