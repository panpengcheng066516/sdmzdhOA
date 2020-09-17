/*汉化by lxf qq1140215489*/
(function() {
	var oLanguage = {
		"oAria" : {
			"sSortAscending" : ": 升序排列",
			"sSortDescending" : ": 降序排列"
		},
		"oPaginate" : {
			"sFirst" : "首页",
			"sLast" : "末页",
			"sNext" : "下页",
			"sPrevious" : "上页"
		},
		"sEmptyTable" : "没有相关记录",
		"sInfo" : "第 _START_ 到 _END_ 条记录，共 _TOTAL_ 条",
		"sInfoEmpty" : "第 0 到 0 条记录，共 0 条",
		"sInfoFiltered" : "(从 _MAX_ 条记录中检索)",
		"sInfoPostFix" : "",
		"sDecimal" : "",
		"sThousands" : ",",
		"sLengthMenu" : "每页显示条数: _MENU_",
		"sLoadingRecords" : "正在载入...",
		"sProcessing" : "正在载入...",
		"sSearch" : "搜索:",
		"sSearchPlaceholder" : "",
		"sUrl" : "",
		"sZeroRecords" : "没有相关记录",
		/*
		 * "aLengthMenu": [[10, 20, 30, -1], ["10条", "20条", "30条",
		 * "All"]];//二组数组，第一组数量，第二组说明文字;
		 */
		"aLengthMenu" : [10, 20, 30, -1 ]
	// 也可以直接用一维数组设置数量
	}
	$.fn.dataTable.defaults.oLanguage = oLanguage;
	// $.extend($.fn.dataTable.defaults.oLanguage,oLanguage)
})();