/** ************访谈grid表格************ */

var interviewOptions = {
	url : "../interview/list", // ajax地址
	pageNum : 1,// 当前页码
	pageSize : 5,// 每页显示条数
	idFiled : "id",// id域指定
	showCheckbox : true,// 是否显示checkbox
	checkboxWidth : "3%",
	showIndexNum : true,
	indexNumWidth : "5%",
	pageSelect : [ 5, 15, 30, 50 ],
	cloums : [ {
		title : "主题",
		field : "title"
	}, {
		title : "嘉宾",
		field : "guests"
	}/*,
	 {
		title : "类型",
		field : "",
		format:function(i,d){
			if(d.type=='0'){
				return '申请';
			}
			if(d.type=='1'){
				return '录入';
			}
			return '--';
		}
	}*/,{
		title : "状态",
		field : "status",
		format : function(i, c) {
			if (c.status == "1")
				return "待审核";
			if (c.status == "0")
				return "新建";
			if (c.status == "2")
				return "已发布";
			if (c.status == "3")
				return "已驳回";
			if (c.status == "4")
				return "已核实";
			if (c.status == "5")
				return "<font color='green'>已完成</font>";
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

		text : "编辑",
		cls : "green btn-sm",
		visable : function(i, c) {
			if(c.status=="1"){
				return false;
			}
			
			return true;
		},
		handle : function(index, data) {
			// index为点击操作的行数
			// data为该行的数据
			modal = $.dmModal({
				id : "mediaForm",
				title : "编辑信息-" + data.title,
				distroy : true
			});
			currentInterviewId=data.id;
			/*setTimeout("modal.show();",500);*/
			$("#content_grid").html("");
			$("#content_grid").load("../interview/page?id="+data.id);
			/*var form = modal.$body.load("../interview/page?id="+data.id);*/
			/*var form = modal.$body.dmForm(getVideoForm(data.contentType));
			form.loadRemote("../video/load?videoId=" + data.id);*/
		}
	},{
		text:"发布",
		cls:"green btn-sm",
		handle:function(i,data){
			var url = "../interview/check?status=2&ids="+data.id;
			bootbox.confirm("确定发布?",function(res){
				if(res){
					$.ajax({
						url:url,
						type:"POST",
						success:function(res){
							if(res.status=="1"){
								grid.reload();
							}
							else{
								bootbox.alert(res.msg);
							}
						}
					});
				}
			})
		}
	}
	, {
		text : "完成访谈",
		cls : "yellow btn-sm",
		visable : function(i, c) {
			if(c.status=="2"){
				return true;
			}
			return false;
		},
		handle : function(i, c) {
			bootbox.confirm("确定已完成?",function(res){
				if(res){
					$.ajax({
						url:"../interview/check?status=5&ids="+c.id,
						type:"POST",
						success:function(res){
							if(res.status=="1"){
								grid.reload();
							}
							else{
								bootbox.alert(res.msg);
							}
						}
					});
				}
			})
		}
	}
	],
	tools : [// 工具属性
	{
		text : "添加",
		cls : "btn green btn-sm",
		handle : function(grid) {// 按钮点击事件
			if(currentChannelId==undefined)
				bootbox.alert("请先选择频道");
			else if(currentChannelIsParent)
				bootbox.alert("请选择子频道进行添加!");
			else{
				/*modal = $.dmModal({
					id : "mediaForm",
					title : "添加",
					distroy : true
				});
				setTimeout("modal.show();",500);*/
				/*var form = modal.$body*/$("#content_grid").html("");
				$("#content_grid").load("../interview/add?channelId="+currentChannelId);
				currentInterviewId='';
			}
		}
	},/*{
		text : "移动",
		cls : "btn green btn-sm",
		handle : function(grid) {
			cutOrCopyfun(grid.getSelectIds(), "移动", "radio", "../video/cutTo");
		}
	}, {
		text : "复制",
		cls : "btn green btn-sm",
		handle : function(grid) {
			cutOrCopyfun(grid.getSelectIds(), "复制", "checkbox", "../video/copyTo");
		}
	}, {
		text : "提交",
		cls : "btn green btn-sm",
		handle : function(grid) {
			var ids = grid.getSelectIds();
			if (ids.length > 0) {
				var url = "../interview/check?status=1&ids=" + ids;
				$.ajax({
					url : url,
					type : "POST",
					dataType : "json",
					success : function(res) {
						bootbox.alert(res.msg);
						grid.reload();
					},
					error : function() {
						bootbox.alert("请求异常！");
					}
				});
			} else {
				bootbox.alert("请选择要提交的项");
			}
		}
	},*/ {
		text : " 删 除",
		cls : "btn red btn-sm",// 按钮样式
		handle : function(grid) {
			deleteItems(grid.getSelectIds());
		}
	} ]
	
};

