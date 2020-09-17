$(function() {
            var wid=$('#partner2').width()+35;
            var colwidth=$('#colWid').width()*2;
            $("#unitSel1").selectpicker({
                'width' : wid
            });
            $("#unitSel2").selectpicker({
                'width' : wid
            });
            
            $("#partnerSel").selectpicker({
                'width' : wid
            });
            
            $("#grade").selectpicker({
                'width' : wid
            });
            
            $("#grade1").selectpicker({
                'width' : wid
            });
});

$('#table01').DataTable({
	flexibleWidth: false,
    responsive: true,
    "bAutoWidth": true, //自定义列宽
    "aLengthMenu" : [ [ 10, 20, 30, -1 ], [ "10条", "20条", "30条", "所有" ] ],
    "iDisplayLength": 10,
    "language": {
      search: "",
       "sProcessing": "处理中...",
       "sLengthMenu": "显示 _MENU_ 项结果",
       "sZeroRecords": "没有匹配结果",
       "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
       "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
       "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
       "sInfoPostFix": "",
       "sSearch": "搜索:",
       "sUrl": "",
       "sEmptyTable": "表中数据为空",
       "sLoadingRecords": "载入中...",
       "sInfoThousands": ",",
       "oPaginate": {
          "sFirst": "首页",
          "sPrevious": "上页",
          "sNext": "下页",
          "sLast": "末页"
       }
  },
  "oAria": {
       "sSortAscending": ": 以升序排列此列",
       "sSortDescending": ": 以降序排列此列"
  },
  "aoColumnDefs": [
	  { "aTargets": [0],"sWidth": "1%"  },
	  { "aTargets": [1],"sWidth": "10%"  },
	  { "aTargets": [2],"sWidth": "13%"  },
	  { "aTargets": [3],"sWidth": "10%"  },
      { "aTargets": [6],"sWidth": "20%"  }
    ]
});
$('#table01').each(function() {
    var datatable = $(this);
    var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
    search_input.attr('placeholder', '搜索');
    search_input.removeClass('form-control-sm');
    var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
    length_sel.removeClass('form-control-sm');
});

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