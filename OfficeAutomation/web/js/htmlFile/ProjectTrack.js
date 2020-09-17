$(function() {
            var wid=$('#year').width()+35;
            $("#customID").selectpicker({
                'width' : wid
            });
            
            $("#comeFrom").selectpicker({
            	'width' : wid
            });
            
            $("#importantGrade").selectpicker({
            	'width' : wid
            });
            
            $("#grade").selectpicker({
                'width' : wid
            });
            
            $("#SDMWay").selectpicker({
                'width' : wid
            });
            
            $("#partner").selectpicker({
                'width' : wid
            });
            
            $("#rongZi").selectpicker({
                'width' : wid
            });
            
            $("#progressLevel").selectpicker({
                'width' : wid
            });
            
            $("#area").selectpicker({
                'width' : wid
            });
            
            $("#govLevel").selectpicker({
            	'width' : wid
            });
            
            $("#name1").selectpicker({
                'width' : wid
            });
            
            $("#customID1").selectpicker({
                'width' : wid
            });
            
            $("#comeFrom1").selectpicker({
            	'width' : wid
            });
            
            $("#importantGrade1").selectpicker({
            	'width' : wid
            });
            
            $("#grade1").selectpicker({
                'width' : wid
            });
            
            $("#SDMWay1").selectpicker({
                'width' : wid
            });
            
            $("#partner1").selectpicker({
                'width' : wid
            });
            
            $("#rongZi1").selectpicker({
                'width' : wid
            });
            
            $("#progressLevel1").selectpicker({
                'width' : wid
            });
            
            $("#area1").selectpicker({
            	'width' : wid
            });
            
            $("#govLevel1").selectpicker({
            	'width' : wid
            });
            
            $("#abandon1").selectpicker({
            	'width' : wid
            });
});

function isHidden1() {
    var flag=$('#area').val();
    if (flag==="其他") {
        $("#areaAdd").empty();
        $("#areaAdd").append("<label class='col-sm-3 col-form-label' style='font-size: 14px;'>项目领域：其他</label><div class='col-sm-9'><input type='text' class='form-control' name='areaOther' placeholder='其他'></div>");
    }else {
    	$("#areaAdd").empty();
    }
}

function isHidden2() {
    var flag=$('#govLevel').val();
    if (flag==="其他") {
        $("#govLevelAdd").empty();
        $("#govLevelAdd").append("<label class='col-sm-3 col-form-label' style='font-size: 14px;'>政府层别：其他</label><div class='col-sm-9'><input type='text' class='form-control' name='govLevelOther' placeholder='其他'></div>");
    }else {
    	$("#govLevelAdd").empty();
    }
}

function isHidden3() {
    var flag=$('#area1').val();
    if (flag==="其他") {
        $("#areaAdd1").empty();
        $("#areaAdd1").append("<label class='col-sm-3 col-form-label' style='font-size: 14px;'>项目领域：其他</label><div class='col-sm-9'><input type='text' class='form-control' name='areaOther1' placeholder='其他'></div>");
    }else {
    	$("#areaAdd1").empty();
    }
}

function isHidden4() {
    var flag=$('#govLevel1').val();
    if (flag==="其他") {
        $("#govLevelAdd1").empty();
        $("#govLevelAdd1").append("<label class='col-sm-3 col-form-label' style='font-size: 14px;'>政府层别：其他</label><div class='col-sm-9'><input type='text' class='form-control' id='govLevelOther1' name='govLevelOther1' placeholder='其他'></div>");
    }else {
    	$("#govLevelAdd1").empty();
    }
}