/** ************grid表格************ */
;var in_grid;
var in_modal;
var currentvoteId;
function getVoteOptions(id){
var voteOptions = {
	url : "../votes/list?questionnairesId="+id, // ajax地址
	pageNum : 1,// 当前页码
	pageSize : 50,// 每页显示条数
	idFiled : "id",// id域指定
	showCheckbox : true,// 是否显示checkbox
	checkboxWidth : "3%",
	showIndexNum : true,
	indexNumWidth : "5%",
	showPaging:false,
	cloums : [ {
		title : "标题",
		field : "title"
	}, {
		title : "类型",
		field : "type",
		format : function(i, c) {
			if (c.checkType == "radio")
				return "单选";
			if (c.checkType == "checkbox")
				return "多选";
			return "--";
		}
	} ],
	actionCloumText : "操作",// 操作列文本
	actionCloumWidth : "30%",
	actionCloums : [ 
	{
		text : "管理选项",
		cls : "green btn-sm",
		handle : function(index, data) {
			currentvoteId=data.id;
			freshItem(currentvoteId);
		}
	},{

		text : "编辑",
		cls : "green btn-sm",
		visable : function(i, c) {
			return true;
		},
		handle : function(index, data) {
			$("#channel_grid_child1").html("");
			form =$("#channel_grid_child1").dmForm(getVoteForm(1));
			form.loadRemote("../votes/load?id=" + data.id);
			$("#questionnairesId").val(id);
		}
	}
	
	],
	tools : [// 工具属性
	{
		text : "添加",
		cls : "btn green btn-sm",
		handle : function(grid) {// 按钮点击事件
			$("#channel_grid_child1").html("");
			form =$("#channel_grid_child1").dmForm(getVoteForm(1));
			$("#questionnairesId").val(id);
				
		}
	}, {
		text : " 删 除",
		cls : "btn red btn-sm",// 按钮样式
		handle : function(grid) {
			deleteVoteItem(grid.getSelectIds());
		}
	} ]
};
return voteOptions;
}

function getVoteForm(type) {
	var buttons = [];
	buttons.push({
		type : 'button',
		text : '关闭',
		handle : function() {
			manage(currentqId);
		}
	} );
	var items = [
			{
				type : 'hidden',
				name : 'id',
				id : 'id'
			},
			{
				type : 'hidden',
				name : 'questionnairesId',
				id : 'questionnairesId'
			},
			{
				type : 'text',// 类型
				name : 'title',// name
				id : 'title',// id
				label : '标题',// 左边label
				cls : 'input-large',
				rule : {
					required : true,
					maxlength : 50
				},
				message : {
					required : "请输入标题",
					maxlength : "最多输入50字符"
				}
			},
			{
				type : 'textarea',// 类型
				name : 'description',// name
				id : 'description',// id
				label : '说明',// 左边label
				cls : 'input-large'
			},{
				type : 'radioGroup',// 类型
				name : 'checkType',// name
				id : 'checkType',// id
				label : '类型',// 左边label
				items:[{value:'radio',text:'单选'},{value:'checkbox',text:'多选'}],
				cls : 'input-large',
				rule : {
					required : true,
					maxlength : 50
				},
				message : {
					required : "请输入标题",
					maxlength : "最多输入50字符"
				}
			}
			];

	//items.push(offic);
	var formOpts = {
		id : "media_form",// 表单id
		name : "media_form",// 表单名
		method : "post",// 表单method
		action : "../votes/insertOrUpdate",// 表单action
		ajaxSubmit : true,// 是否使用ajax提交表单
		labelInline : true,
		rowEleNum : 1,
		beforeSubmit : function() {

		},
		ajaxSuccess : function() {
			manage(currentqId);
		},
		submitText : "保存",// 保存按钮的文本
		showReset : true,// 是否显示重置按钮
		resetText : "重置",// 重置按钮文本
		isValidate : true,// 开启验证
		buttons :buttons,
		buttonsAlign : "center",
		// 表单元素
		items : items
	};
	return formOpts;
};
var optFormOpt = {
		id : "media_form",// 表单id
		name : "media_form",// 表单名
		method : "post",// 表单method
		action : "../votes/insertOrUpdateOpt",// 表单action
		ajaxSubmit : true,// 是否使用ajax提交表单
		labelInline : true,
		rowEleNum : 1,
		beforeSubmit : function() {

		},
		ajaxSuccess : function() {
			freshItem(currentvoteId);
		},
		submitText : "保存",// 保存按钮的文本
		showReset : true,// 是否显示重置按钮
		resetText : "重置",// 重置按钮文本
		isValidate : true,// 开启验证
		buttons : [ {
			type : 'button',
			text : '关闭',
			handle : function() {
				freshItem(currentvoteId);
			}
		} ],
		buttonsAlign : "center",
		// 表单元素
		items : [{
			type : 'hidden',
			name : 'id',
			id : 'id'
		},
		{
			type : 'hidden',
			name : 'voteId',
			id : 'voteId'
		},
		{
			type : 'textarea',// 类型
			name : 'option',// name
			id : 'option',// id
			label : '选项',// 左边label
			cls : 'input-large',
			rule : {
				required : true,
				maxlength : 80
			},
			message : {
				required : "请输入",
				maxlength : "最多输入80字符"
			}
		}]
	};
function getoptions(id){
	var opt = {
			url : "../votes/listOpt?voteId="+id, // ajax地址
			pageNum : 1,// 当前页码
			pageSize : 50,// 每页显示条数
			idFiled : "id",// id域指定
			showCheckbox : true,// 是否显示checkbox
			checkboxWidth : "3%",
			showIndexNum : true,
			indexNumWidth : "5%",
			showPaging:false,
			cloums : [ {
				title : "投票项 ",
				field : "option"
			}, {
				title : "投票量",
				field : "clickTimes"
			} ],
			actionCloumText : "操作",// 操作列文本
			actionCloumWidth : "30%",
			actionCloums : [{

				text : "编辑",
				cls : "green btn-sm",
				visable : function(i, c) {
					return true;
				},
				handle : function(index, data) {
					// index为点击操作的行数
					// data为该行的数据
					$("#channel_grid_child2").html("");
					var form = $("#channel_grid_child2").dmForm(optFormOpt)
					form.loadLocal(data);
				}
			},{
				text : "删除",
				cls : "red btn-sm",
				visable : function(i, c) {
					return true;
				},
				handle : function(index, data) {
					bootbox.confirm("确定删除?",function(r){
						if(r){
						
						$.ajax({
							url:"../votes/deleteOpt?id="+data.id,
							type:"POST",
							success:function(res){
								grid.reload();
							} ,
							error:function(){
								alert("错误");
							}
						});	
						}
					});
				}
			}
			
			],
			tools : [// 工具属性
			{
				text : "添加",
				cls : "btn green btn-sm",
				handle : function(grid) {// 按钮点击事件
				$("#channel_grid_child2").html("");
					var form = $("#channel_grid_child2").dmForm(optFormOpt);//.load("../interview/page?id="+data.id);
					form.loadLocal({voteId:id});
					
				}
			} ]
			
	};
	return opt;
}
function freshItem(id){
	$("#channel_grid_child2").html("");
	grid = $("#channel_grid_child2").dmGrid(getoptions(id));
}
