$(function() {
  'use strict';

  $(function() {
    $('#dataTableExample').DataTable({
      "aLengthMenu": [
        [10,20, 30, 50, -1],
        [10,20, 30, 50, "所有"]
      ],
      "iDisplayLength": 10,
      language: {
      	sProcessing: "处理中...",
      	sLengthMenu: "显示 _MENU_ 项结果",
      	sZeroRecords: "没有匹配结果",
      	sInfo: "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
      	sInfoEmpty: "显示第 0 至 0 项结果，共 0 项",
      	sInfoFiltered: "(由 _MAX_ 项结果过滤)",
      	sInfoPostFix: "",
      	sSearch: "搜索:",
      	sUrl: "",
      	sEmptyTable: "表中数据为空",
      	sLoadingRecords: "载入中...",
      	sInfoThousands: ",",
      	oPaginate: {
      		"sFirst": "首页",
      		"sPrevious": "上页",
      		"sNext": "下页",
      		"sLast": "末页"
      	},
      	oAria: {
      		"sSortAscending": ": 以升序排列此列",
      		"sSortDescending": ": 以降序排列此列"
      	},
      },
    });
    $('#dataTableExample').each(function() {
      var datatable = $(this);
      // SEARCH - Add the placeholder for Search and Turn this into in-line form control
      var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
      search_input.attr('placeholder', 'Search');
      search_input.removeClass('form-control-sm');
      // LENGTH - Inline-Form control
      var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
      length_sel.removeClass('form-control-sm');
    });
  });

});