/*************小说grid****************/
var novelOptions = {
	url : "../novel/list", // ajax地址
	pageNum : 1,// 当前页码
	pageSize : 5,// 每页显示条数
	idFiled : "id",// id域指定
	showCheckbox : true,// 是否显示checkbox
	checkboxWidth : "3%",
	showIndexNum : true,
	indexNumWidth : "5%",
	pageSelect : [ 5, 15, 30, 50 ],
	cloums : [ {
		title : "小说名称",
		field : "name"
	}, {
		title : "作者",
		field : "author"
	}, {
		title : "状态",
		field : "status",
		format : function(i, c) {
			if (c.status == "0")
				return "新稿";
			if (c.status == "1")
				return "待审核";
			if (c.status == "2")
				return "已发布";
			if (c.status == "3")
				return "未通过";
			return "--";
		}
	} ],
	actionCloumText : "操作",// 操作列文本
	actionCloumWidth : "30%",
	actionCloums : [ {
		text : "预览",
		cls : "green btn-sm",
		icon : "fa fa-search",
		handle : function(index, data) {
			window.open(data.url);
		}
	}, {

		text : "发布",
		cls : "green btn-sm",
		handle : function(i, data) {

			var url = "../novel/check?status=2&novelIds="+data.id;
			check(url,data.id);
		}
	}, {
		text : "驳回",
		cls : "yellow btn-sm",
		handle : function(i, data) {
			var url = "../novel/check?status=3&novelIds="+data.id;
			check(url,data.id);
		}
	}
	],
	tools : [// 工具属性
	{
		text : "批量发布",
		cls : "btn green btn-sm",
		handle : function(i, data) {
			var ids = grid.getSelectIds();
			var url = "../novel/check?status=2&novelIds="+ids;
			check(url,ids);
		}
	},{
		text : "批量驳回",
		cls : "btn green btn-sm",
		handle : function(i, data) {
			var ids = grid.getSelectIds();
			var url = "../novel/check?status=3&novelIds="+ids;
			check(url,ids);
		}
	}],
	search : {
		rowEleNum : 2,
		// 搜索栏元素
		items : [ {
			type : "text",
			label : "标题",
			name : "name",
			placeholder : "输入要搜索的影片名"
		}, {
			type : "text",
			label : "作者",
			name : "actor",
			placeholder : "输入要搜索的姓名"
		} ]
	}
};

/** ************视频grid表格************ */
var videoOptions = {
	url : ".../video/list", // ajax地址
	pageNum : 1,// 当前页码
	pageSize : 5,// 每页显示条数
	idFiled : "id",// id域指定
	showCheckbox : true,// 是否显示checkbox
	checkboxWidth : "3%",
	showIndexNum : true,
	indexNumWidth : "5%",
	pageSelect : [ 5, 15, 30, 50 ],
	cloums : [ {
		title : "标题",
		field : "name"
	}, {
		title : "作者",
		field : "director"
	}, {
		title : "发布时间",
		field : "",
		format:function(i,content){
			return dateTostr(content.publisDate);
		}
	}, {
		title : "状态",
		field : "status",
		format : function(i, c) {
			if (c.status == "0")
				return "新稿";
			if (c.status == "1")
				return "待审核";
			if (c.status == "2")
				return "已发布";
			if (c.status == "3")
				return "未通过";
			return "--";
		}
	} ],
	actionCloumText : "操作",// 操作列文本
	actionCloumWidth : "30%",
	actionCloums : [ {
		text : "预览",
		cls : "green btn-sm",
		icon : "fa fa-search",
		handle : function(index, data) {
			window.open(data.url);
		}
	}, {

		text : "发布",
		cls : "green btn-sm",
		handle : function(i, data) {
			var url = "../video/check?status=2&videoIds="+data.id;
			check(url,data.id);
		}
	}
	, {
		text : "驳回",
		cls : "yellow btn-sm",
		handle : function(i, data) {
			var url = "../video/check?status=3&videoIds="+data.id;
			check(url,data.id);
		}
	}
	],
	tools : [// 工具属性
	{
		text : "批量发布",
		cls : "btn green btn-sm",
		handle : function(i, data) {
			var ids = grid.getSelectIds();
			var url = "../video/check?status=2&videoIds="+ids;
			check(url,ids);
		}
	},{
		text : "批量驳回",
		cls : "btn green btn-sm",
		handle : function(i, data) {
			var ids = grid.getSelectIds();
			var url = "../video/check?status=3&videoIds="+ids;
			check(url,ids);
		}
	} ],
	search : {
		rowEleNum : 2,
		// 搜索栏元素
		items : [ {
			type : "text",
			label : "标题",
			name : "name",
			placeholder : "输入要搜索的标题名"
		}, {
			type : "text",
			label : "作者",
			name : "actor",
			placeholder : "输入要搜索的作者"
		} ]
	}
};

/** ************音频grid表格************ */

var audioOptions = {
	url : "../audio/list", // ajax地址
	pageNum : 1,// 当前页码
	pageSize : 5,// 每页显示条数
	idFiled : "id",// id域指定
	showCheckbox : true,// 是否显示checkbox
	checkboxWidth : "3%",
	showIndexNum : true,
	indexNumWidth : "5%",
	pageSelect : [ 5, 15, 30, 50 ],
	cloums : [ {
		title : "歌名",
		field : "name"
	}, {
		title : "歌手",
		field : "singer"
	}, {
		title : "状态",
		field : "status",
		format : function(i, c) {
			if (c.status == "0")
				return "新稿";
			if (c.status == "1")
				return "待审核";
			if (c.status == "2")
				return "已发布";
			if (c.status == "3")
				return "未通过";
			return "--";
		}
	} ],
	actionCloumText : "操作",// 操作列文本
	actionCloumWidth : "30%",
	actionCloums : [ {
		text : "预览",
		cls : "green btn-sm",
		icon : "fa fa-search",
		handle : function(index, data) {
			window.open(data.url);
		}
	}, {

		text : "发布",
		cls : "green btn-sm",
		handle : function(i, data) {
			var url = "../audio/check?status=2&audioIds="+data.id
			check(url,data.id);
		}		
	},{
		text : "驳回",
		cls : "yellow btn-sm",
		handle : function(i, data) {
			var url = "../audio/check?status=3&audioIds="+data.id
			check(url,data.id);
		}
	}
	],
	tools : [// 工具属性
	{
		text : "批量发布",
		cls : "btn green btn-sm",
		handle : function(i, data) {
			var ids = grid.getSelectIds();
			var url = "../audio/check?status=2&audioIds="+ids;
			check(url,ids);
		}
	},{
		text : "批量驳回",
		cls : "btn green btn-sm",
		handle : function(i, data) {
			var ids = grid.getSelectIds();
			var url = "../audio/check?status=3&audioIds="+ids;
			check(url,ids);
		}
	}],
	search : {
		rowEleNum : 2,
		// 搜索栏元素
		items : [ {
			type : "text",
			label : "歌名",
			name : "name",
			placeholder : "输入要搜索的歌名"
		}, {
			type : "text",
			label : "歌手",
			name : "singer",
			placeholder : "输入要搜索的歌手"
		} ]
	}
};
/*************新闻类gird**************/
var options = {
		url : "./list", // ajax地址
		pageNum : 1,// 当前页码
		pageSize : 5,// 每页显示条数
		idFiled : "id",// id域指定
		showCheckbox : true,// 是否显示checkbox
		checkboxWidth : "3%",
		showIndexNum : true,
		indexNumWidth : "5%",
		pageSelect : [ 2, 15, 30, 50 ],
		cloums : [ {
			title : "标题",
			field : "title",
			sort : true
		}, {
			title : "来源",
			field : "origin"
		}, {
			title : "发布人",
			field : "createUserName"
		}, {
			title : "发布时间",
			field : "origin",
			format:function(i,c){
				if(c.publishDate){
					return dateTostr(c.publishDate);
				}
				return dataTostr(new Date());
			}
		}, {
			title : "状态",
			field : "status",
			format : function(i, c) {
				if (c.status == "0")
					return "新稿";
				if (c.status == "1")
					return "待审核";
				if (c.status == "2")
					return "已发布";
				if (c.status == "3")
					return "未通过";
				return "--";
			}
		} ],
		actionCloumText : "操作",// 操作列文本
		actionCloumWidth : "30%",
		actionCloums : [ {
			text : "预览",
			cls : "green btn-sm",
			icon : "fa fa-search",
			handle : function(index, data) {
				window.open(data.url);
			}
		}, {

			text : "发布",
			cls : "green btn-sm",
			handle : function(i, data) {
				var url = "./check?status=2&ids="+data.id
				check(url,data.id);
			}
		}, {
			text : "驳回",
			cls : "yellow btn-sm",
			handle : function(i, data) {
				var url = "./check?status=3&ids="+data.id
				check(url,data.id);
			}
		} ],
		tools : [// 工具属性
		{
			text : "批量发布",
			cls : "btn green btn-sm",
			handle : function(i, data) {
				var ids = grid.getSelectIds();
				var url = "./check?status=2&ids="+ids;
				check(url,ids);
			}
		}, {
			text : "批量驳回",
			cls : "btn green btn-sm",
			handle : function(i, data) {
				var ids = grid.getSelectIds();
				var url = "./check?status=3&ids="+ids;
				check(url,ids);
			}
		}],
		search : {
			rowEleNum : 2,
			// 搜索栏元素
			items : [ {
				type : "text",
				label : "标题",
				name : "title",
				placeholder : "输入要搜索的内容信息标题"
			} ]
		}
	};

/*************所有表格************/
var allOptions = {
		url : "./checkList?status=1", // ajax地址
		pageNum : 1,// 当前页码
		pageSize : 5,// 每页显示条数
		idFiled : "id",// id域指定
		showCheckbox : true,// 是否显示checkbox
		checkboxWidth : "3%",
		showIndexNum : true,
		indexNumWidth : "5%",
		pageSelect : [ 2, 15, 30, 50 ],
		cloums : [ {
			title : "标题",
			field : "title",
			sort : true
		}, {
			title : "频道",
			field : "displayName",
			sort : true
		},{
			title : "发布时间",
			field : "origin",
			format:function(i,c){
				if(c.publishDate){
					return dateTostr(c.publishDate);
				}
				return '';
			}
		}, {
			title : "状态",
			field : "status",
			format : function(i, c) {
				if (c.status == "0")
					return "新稿";
				if (c.status == "1")
					return "待审核";
				if (c.status == "2")
					return "已发布";
				if (c.status == "3")
					return "未通过";
				return "--";
			}
		} ],
		actionCloumText : "操作",// 操作列文本
		actionCloumWidth : "30%",
		actionCloums : [ {
			text : "预览",
			cls : "green btn-sm",
			icon : "fa fa-search",
			handle : function(index, data) {
				window.open(data.url);
			}
		}, {

			text : "发布",
			cls : "green btn-sm",
			handle : function(i, data) {
				var url = "./checkAllType?status=2&id="+data.id+"&channelType="+data.channelType;
				check(url,data.id);
			}
		}, {
			text : "驳回",
			cls : "yellow btn-sm",
			handle : function(i, data) {
				var url = "./checkAllType?status=3&id="+data.id+"&channelType="+data.channelType;
				check(url,data.id);
			}
		} ],
		tools : [// 工具属性
		{
			text : "批量发布",
			cls : "btn green btn-sm",
			handle : function(i, data) {
				var datas = grid.getSelectDatas();
				var ids=[];
				var types=[];
				for(var i=0;i<datas.length;i++){
					ids.push(datas[i].id);
					types.push(datas[i].channelType);
				}
				var url = "./checkAll?status=2&ids="+ids+"&channelTypes="+types;
				check(url,ids);
			}
		}, {
			text : "批量驳回",
			cls : "btn green btn-sm",
			handle : function(i, data) {
				var datas = grid.getSelectDatas();
				var ids=[];
				var types=[];
				for(var i=0;i<datas.length;i++){
					ids.push(datas.id);
					types.push(datas.channelType);
				}
				var url = "./checkAll?status=3&ids="+ids+"&channelTypes="+data.channelType;
				check(url,ids);
			}
		}],
		search : {
			rowEleNum : 2,
			// 搜索栏元素
			items : [ {
				type : "text",
				label : "标题",
				name : "title",
				placeholder : "输入要搜索的内容信息标题"
			} ]
		}
	};
/*************访谈类gird**************/
var interviewOptions = {
		url : "../interview/list", // ajax地址
		pageNum : 1,// 当前页码
		pageSize : 5,// 每页显示条数
		idFiled : "id",// id域指定
		showCheckbox : true,// 是否显示checkbox
		checkboxWidth : "3%",
		showIndexNum : true,
		indexNumWidth : "5%",
		pageSelect : [ 2, 15, 30, 50 ],
		cloums : [ {
			title : "标题",
			field : "title",
			sort : true
		}, {
			title : "开始时间",
			field : "startTime"
		}, {
			title : "开始时间",
			field : "startTime"
		}, {
			title : "嘉宾",
			field : "guests"
		},{
			title : "状态",
			field : "status",
			format : function(i, c) {
				if (c.status == "0")
					return "新稿";
				if (c.status == "1")
					return "待审核";
				if (c.status == "2")
					return "已发布";
				if (c.status == "3")
					return "未通过";
				return "--";
			}
		} ],
		actionCloumText : "操作",// 操作列文本
		actionCloumWidth : "30%",
		actionCloums : [ {
			text : "预览",
			cls : "green btn-sm",
			icon : "fa fa-search",
			handle : function(index, data) {
				window.open(data.url);
			}
		}, {

			text : "发布",
			cls : "green btn-sm",
			handle : function(i, data) {
				var url = "../interview/check?status=2&ids="+data.id
				check(url,data.id);
			}
		}, {
			text : "驳回",
			cls : "yellow btn-sm",
			handle : function(i, data) {
				var url = "../interview/check?status=3&ids="+data.id
				check(url,data.id);
			}
		} ],
		tools : [// 工具属性
		{
			text : "批量发布",
			cls : "btn green btn-sm",
			handle : function(i, data) {
				var ids = grid.getSelectIds();
				var url = "../interview/check?status=2&ids="+ids;
				check(url,ids);
			}
		}, {
			text : "批量驳回",
			cls : "btn green btn-sm",
			handle : function(i, data) {
				var ids = grid.getSelectIds();
				var url = "../interview/check?status=3&ids="+ids;
				check(url,ids);
			}
		}],
		search : {
			rowEleNum : 2,
			// 搜索栏元素
			items : [ {
				type : "text",
				label : "标题",
				name : "title",
				placeholder : "输入要搜索的内容信息标题"
			} ]
		}
	};
/*************投票类gird**************/
var voteOptions = {
		url : "../vote/list", // ajax地址
		pageNum : 1,// 当前页码
		pageSize : 5,// 每页显示条数
		idFiled : "id",// id域指定
		showCheckbox : true,// 是否显示checkbox
		checkboxWidth : "3%",
		showIndexNum : true,
		indexNumWidth : "5%",
		pageSelect : [ 2, 15, 30, 50 ],
		cloums : [ {
			title : "标题",
			field : "title",
			sort : false
		}, {
			title : "发布时间",
			field : "publishTime",
			sort : false
		}, {
			title : "状态",
			field : "status",
			format : function(i, c) {
				if (c.status == "0")
					return "新稿";
				if (c.status == "1")
					return "待审核";
				if (c.status == "2")
					return "已发布";
				if (c.status == "3")
					return "未通过";
				return "--";
			}
		} ],
		actionCloumText : "操作",// 操作列文本
		actionCloumWidth : "30%",
		actionCloums : [ {
			text : "预览",
			cls : "green btn-sm",
			icon : "fa fa-search",
			handle : function(index, data) {
				window.open(data.filed1);
			}
		}, {

			text : "发布",
			cls : "green btn-sm",
			handle : function(i, data) {

				var url = "../vote/publish?voteIds="+data.id;
				check(url,data.id);
			}
		}, {
			text : "驳回",
			cls : "yellow btn-sm",
			handle : function(i, data) {
				var url = "./back?voteIds="+data.id;
				check(url,data.id);
			}
		} ],
		tools : [// 工具属性
		{
			text : "批量发布",
			cls : "btn green btn-sm",
			handle : function(i, data) {
				var ids = grid.getSelectIds();
				var url = "../vote/publish?voteIds="+ids;
				check(url,ids);
			}
		}, {
			text : "批量驳回",
			cls : "btn green btn-sm",
			handle : function(i, data) {
				var ids = grid.getSelectIds();
				var url = "./back?voteIds="+ids;
				check(url,ids);
			}
		}],
		search : {
			rowEleNum : 2,
			// 搜索栏元素
			items : [ {
				type : "text",
				label : "标题",
				name : "title",
				placeholder : "输入要搜索的内容信息标题"
			} ]
		}
	};
var fileoptions = {
		url : "./list", // ajax地址
		pageNum : 1,// 当前页码
		pageSize : 5,// 每页显示条数
		idFiled : "id",// id域指定
		showCheckbox : true,// 是否显示checkbox
		checkboxWidth : "3%",
		showIndexNum : true,
		indexNumWidth : "5%",
		pageSelect : [ 2, 15, 30, 50 ],
		cloums : [ {
			title : "文号",
			field : "author",
			sort : true
		},{
			title : "名称",
			field : "title",
			sort : true
		}, {
			title : "发文机构",
			field : "origin",
			sort : true
		}, {
			title : "状态",
			field : "status",
			format : function(i, c) {
				if (c.status == "0")
					return "新稿";
				if (c.status == "1")
					return "待审核";
				if (c.status == "2")
					return "已发布";
				if (c.status == "3")
					return "未通过";
				return "--";
			}
		} ],
		actionCloumText : "操作",// 操作列文本
		actionCloumWidth : "30%",
		actionCloums : [ {
			text : "预览",
			cls : "green btn-sm",
			icon : "fa fa-search",
			handle : function(index, data) {
				window.open(data.url);
			}
		}, {

			text : "发布",
			cls : "green btn-sm",
			handle : function(i, data) {
				var url = "./check?status=2&ids="+data.id
				check(url,data.id);
			}
		}, {
			text : "驳回",
			cls : "yellow btn-sm",
			handle : function(i, data) {
				var url = "./check?status=3&ids="+data.id
				check(url,data.id);
			}
		} ],
		tools : [// 工具属性
		{
			text : "批量发布",
			cls : "btn green btn-sm",
			handle : function(i, data) {
				var ids = grid.getSelectIds();
				var url = "./check?status=2&ids="+ids;
				check(url,ids);
			}
		}, {
			text : "批量驳回",
			cls : "btn green btn-sm",
			handle : function(i, data) {
				var ids = grid.getSelectIds();
				var url = "./check?status=3&ids="+ids;
				check(url,ids);
			}
		}],
		search : {
			rowEleNum : 2,
			// 搜索栏元素
			items : [ {
				type : "text",
				label : "标题",
				name : "title",
				placeholder : "输入要搜索的内容信息标题"
			} ]
		}
	};
	



