/** ************小说grid表格************ */

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

		text : "编辑",
		cls : "green btn-sm",
		visable : function(i, c) {
			if (c.status == "1")
				return false;
			return true;
		},
		handle : function(index, data) {
			// index为点击操作的行数
			// data为该行的数据
			modal = $.dmModal({
				id : "novelForm",
				title : "编辑小-《" + data.name + "》",
				distroy : true
			});
			modal.show();
			var form = modal.$body.dmForm(getNovelForm());
			form.loadRemote("../novel/load?id=" + data.id);
		}
	}, {
		text : "排序",
		cls : "yellow btn-sm",
		handle : function(i, c) {
			sortfun(i, c,c.name);
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
			else
				showForm(7, "小说内容");
		}
	},{
		text : "移动",
		cls : "btn green btn-sm",
		handle : function(grid) {
			cutOrCopyfun(grid.getSelectIds(), "移动", "radio", "../novel/cutTo");
		}
	}, {
		text : "复制",
		cls : "btn green btn-sm",
		handle : function(grid) {
			cutOrCopyfun(grid.getSelectIds(), "复制", "checkbox", "../novel/copyTo");
		}
	}, {
		text : "提交",
		cls : "btn green btn-sm",
		handle : function(grid) {
			var ids = grid.getSelectIds();
			if (ids.length > 0) {
				var url = "../novel/commit?novelIds=" + ids;
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
	}, {
		text : " 删 除",
		cls : "btn red btn-sm",// 按钮样式
		handle : function(grid) {
			deleteItems(grid.getSelectIds());
		}
	} ],
	search : {
		rowEleNum : 2,
		// 搜索栏元素
		items : [ {
			type : "text",
			label : "片名",
			name : "name",
			placeholder : "输入要搜索的影片名"
		}, {
			type : "text",
			label : "导演",
			name : "actor",
			placeholder : "输入要搜索的导演姓名"
		} ]
	}
};

/** *************小说表单*************** */
function getNovelForm(typeId) {
	var items = [
			{
				type : 'hidden',
				name : 'id',
				id : 'id'
			},
			{
				type : 'hidden',
				name : 'channelId',
				id : 'channelId'
			},
			{
				type : 'text',// 类型
				name : 'name',// name
				id : 'name',// id
				label : '小说名称',// 左边label
				cls : 'input-xlarge',
				rule : {
					required : true,
					maxlength : 50
				},
				message : {
					required : "请输入小说名称",
					maxlength : "最多输入50字符"
				}
			},
			{
				type : 'text',// 类型
				name : 'author',// name
				id : 'author',// id
				label : '作者',// 左边label
				cls : 'input-large',
				rule : {
					required : true,
					maxlength : 50
				},
				message : {
					required : "请输入作者名称",
					maxlength : "最多输入50字节"
				}
			},
			{
				type : 'text',// 类型
				name : 'origin',// name
				id : 'origin',// id
				label : '来源',// 左边label
				cls : 'input-large',
				rule : {
					required : true,
					maxlength : 100
				},
				message : {
					required : "请输入来源",
					maxlength : "最多输入100字符"
				}
			},
			{
				type : 'select',// 类型
				name : 'templateId',// name
				id : 'templateId',// id
				label : '模板',// 左边label
				items : [ {
					value : '',
					text : '默认模板'
				} ],
				itemsUrl : "../template/selects?templateType=2&siteId="
						+ currentSiteId,
				cls : 'input-large'
			} ];
	var contentText = {
			type : 'textarea',// 类型
			name : 'introduce',// name
			id : 'introduce',// id
			row : 5,
			cls : 'input-large',
			label : '简介',
			rule : {
				required : true
			},
			message : {
				required : "简介"
			}
		};
	var titleImg = {
		type : 'image',
		id : 'imageUrl',
		name : 'imageUrl',
		label : '小说封面',
		isAjaxUpload : true,
		autoUpload : true,
		uploadUrl : '../attachmentOther/singleUpload?mediaType=novel',
		onSuccess : function(data) {
			if (data.status == "1") {
				$("#imageUrl").attr("value", data.attachment.attachmentUrl);
			} else {
				alert(data.msg);
			}
		},
		deleteHandle : function() {
			$("#imageUrl").attr("value", "");
		}
	};
	var offic = {
		type : 'files',
		id : 'attachmentIds',
		name : 'attachmentIds',
		limit : 2,
		allowType : ".txt",// 用,分开
		uploadUrl : '../attachmentOther/multipleUpload?mediaType=novel',
		convertData : function(data) {
			var arrays = [];
			arrays.push(data.attachment.id);
			arrays.push(data.attachment.attachmentName);
			arrays.push(data.attachment.attachmentUrl);
			return arrays;
		},
		fileInfoUrl : "../attachmentOther/detail",
		dataParam : "attachmentId",
		label : '上传小说',
		detail : "",
		rule : {
			required : true
		},
		message : {
			required : "上传小说",
		}
	};
	items.push(titleImg);
	items.push(contentText);
	items.push(offic);
	var formOpts = {
		id : "novel_form",// 表单id
		name : "novel_form",// 表单名
		method : "post",// 表单method
		action : "../novel/insertOrUpdate",// 表单action
		ajaxSubmit : true,// 是否使用ajax提交表单
		labelInline : true,
		rowEleNum : 1,
		beforeSubmit : function() {

		},
		ajaxSuccess : function() {
			$("#content_grid").html("");
			grid.reload();
		},
		submitText : "保存",// 保存按钮的文本
		showReset : true,// 是否显示重置按钮
		resetText : "重置",// 重置按钮文本
		isValidate : true,// 开启验证
		buttonsAlign : "center",
		// 表单元素
		items : items
	};
	return formOpts;
}
