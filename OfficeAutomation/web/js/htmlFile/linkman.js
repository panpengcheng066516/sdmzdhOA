$(function() {
            var wid=$('#name').width();
            $("#companySel0").selectpicker({
                'width' : wid
            });
            
            $("#customIDSel").selectpicker({
                'width' : wid
            });
            
            $("#nameIDSel").selectpicker({
                'width' : wid
            });
            
            $("#gender").selectpicker({
                'width' : wid
            });
            
            $("#contactLevel").selectpicker({
                'width' : wid
            });
            
            $("#isImportant").selectpicker({
                'width' : wid
            });
            
            $("#howOften").selectpicker({
                'width' : wid
            });
            
            $("#isFestival").selectpicker({
                'width' : wid
            });
            
            $("#gender1").selectpicker({
                'width' : wid
            });
            
            $("#contactLevel1").selectpicker({
                'width' : wid
            });
            
            $("#isImportant1").selectpicker({
                'width' : wid
            });
            
            $("#howOften1").selectpicker({
                'width' : wid
            });
            
            $("#isFestival1").selectpicker({
                'width' : wid
            });
        });

function isHidden() {
    var flag=$('#isFestival').val();
    if (flag==="0") {
        $("#festivaler").empty();
    }else if (flag==="1") {
        $("#festivaler").empty();
        $("#festivaler").append("<label class='col-sm-3 col-form-label' style='font-size: 14px;'>节日维护人 </label><div class='col-sm-9'><input type='text' class='form-control' name='festivaler' placeholder='节日维护人'></div>");
    }
}
function isHidden2() {
    var flag=$('#isFestival1').val();
    if (flag==="0") {
        $("#festivaler1").empty();
    }else if (flag==="1") {
    	$("#festivaler1").empty();
        $("#festivaler1").append("<label class='col-sm-3 col-form-label' style='font-size: 14px;'>节日维护人 </label><div class='col-sm-9'><input type='text' class='form-control' id='festivaler2' name='festivaler' placeholder='节日维护人'></div>");
    }
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
