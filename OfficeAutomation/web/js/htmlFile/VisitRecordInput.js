 $(function() {
        var time = new Date();
        var day = ("0" + time.getDate()).slice(-2);
        var month = ("0" + (time.getMonth() + 1)).slice(-2);
        var today = time.getFullYear() + "-" + (month) + "-" + (day);
        $('#Time').val(today);
        $('#Time2').val(today);
    });
    
$(function() {
            var wid=$('#details').width()+35;
            $("#type").selectpicker({
                'width' : wid
            });
            
            $("#customID").selectpicker({
                'width' : wid
            });
            
            $("#projectID").selectpicker({
                'width' : wid
            });
            
            $("#projectID").selectpicker({
            	'width' : wid
            });
            
            $("#type").selectpicker({
                'width' : wid
            });
            
            $("#customID1").selectpicker({
                'width' : wid
            });
            
            $("#projectID1").selectpicker({
                'width' : wid
            });
            
            $("#Time1").selectpicker({
                'width' : wid
            });
            
            $("#type1").selectpicker({
                'width' : wid
            });
            
            $("#customID2").selectpicker({
                'width' : wid
            });
            
            $("#projectID2").selectpicker({
                'width' : wid
            });
});