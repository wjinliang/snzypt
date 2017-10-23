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
				id : "mediaForm",
				title : "编辑视频信息-" + data.name,
				distroy : true
			});
			modal.show();
			var form = modal.$body.dmForm(getAudioForm(data.contentType));
			form.loadRemote("../audio/load?audioId=" + data.id);
		}
	}
	, {
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
				showForm(6, "音乐内容");
		}
	},{
		text : "移动",
		cls : "btn green btn-sm",
		handle : function(grid) {
			cutOrCopyfun(grid.getSelectIds(), "移动", "radio", "../audio/cutTo");
		}
	}, {
		text : "复制",
		cls : "btn green btn-sm",
		handle : function(grid) {
			cutOrCopyfun(grid.getSelectIds(), "复制", "checkbox", "../audio/copyTo");
		}
	}, {
		text : "提交",
		cls : "btn green btn-sm",
		handle : function(grid) {
			var ids = grid.getSelectIds();
			if (ids.length > 0) {
				var url = "../audio/commit?audioIds=" + ids;
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

/** *************视频表单*************** */
function getAudioForm(typeId) {
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
				label : '歌名',// 左边label
				cls : 'input-large',
				rule : {
					required : true,
					maxlength : 50
				},
				message : {
					required : "请输入歌名",
					maxlength : "最多输入50字符"
				}
			},
			{
				type : 'text',// 类型
				name : 'singer',// name
				id : 'singer',// id
				label : '歌手',// 左边label
				cls : 'input-large',
				rule : {
					required : true,
					maxlength : 50
				},
				message : {
					required : "请输入歌手",
					maxlength : "最多输入50字节"
				}
			},
			{
				type : 'textarea',// 类型
				name : 'introduce',// name
				id : 'introduce',// id
				label : '歌曲介绍',// 左边label
				row : 3,
				cls : 'input-large',
				rule : {
					maxlength : 100
				},
				message : {
					maxlength : "最多输入100字符"
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
		type : 'kindEditor',
		name : 'lyrc',
		id : 'lyrc',
		label : '歌词',
		height : "300px",
		width : "400px",
		rule : {
			required : true
		},
		message : {
			required : "歌词"
		}
	};
	var titleImg = {
		type : 'image',
		id : 'imageUrl',
		name : 'imageUrl',
		label : '歌手照片',
		isAjaxUpload : true,
		autoUpload : true,
		uploadUrl : '../attachmentOther/singleUpload?mediaType=video',
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
		limit : 3,
		allowType : ".mp3",// 用,分开
		uploadUrl : '../attachmentOther/multipleUpload?mediaType=audio',
		convertData : function(data) {
			var arrays = [];
			arrays.push(data.attachment.id);
			arrays.push(data.attachment.attachmentName);
			arrays.push(data.attachment.attachmentUrl);
			return arrays;
		},
		fileInfoUrl : "../attachmentOther/detail",
		dataParam : "attachmentId",
		label : '上传音乐',
		detail : "",
		rule : {
			required : true
		},
		message : {
			required : "上传音乐",
		}
	};
	items.push(titleImg);
	items.push(contentText);
	items.push(offic);
	var formOpts = {
		id : "media_form",// 表单id
		name : "media_form",// 表单名
		method : "post",// 表单method
		action : "../audio/insertOrUpdate",// 表单action
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
