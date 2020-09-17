$(function() {
            var wid=$('#name').width();
            $("#companySel0").selectpicker({
                'width' : wid
            });
            
            $("#companySel").selectpicker({
                'width' : wid
            });
            
            $("#name1").selectpicker({
                'width':wid
            });
            
            $("#companySel1").selectpicker({
                'width' : wid*3/4
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