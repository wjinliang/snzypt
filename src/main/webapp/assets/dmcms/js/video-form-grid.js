/** ************视频grid表格************ */

function getvideoOptions(action,hasPublishRole,hasShenheRole){

	var actionCloums=[ {
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
			/*if (c.status == "1")
				return false;*/
			return true;
		},
		handle : function(index, data) {
			// index为点击操作的行数
			// data为该行的数据
			$("#content_grid").html("");
			 form = $("#content_grid").dmForm(getVideoForm(data.contentType,hasPublishRole,hasShenheRole));
			form.loadRemote("../video/load?videoId=" + data.id,function(){
				if(data.publishDate){
				var l = dateTostr(data.publishDate);
				$("#publishDate").val(l);
				}
			});
		}
	}
	, {
		text : "排序",
		cls : "yellow btn-sm",
		handle : function(i, c) {
			sortfun(i, c,c.name);
		}
	}
	];
	var tools=[// 工具属性
	       	{
	    		text : "添加",
	    		cls : "btn green btn-sm",
	    		handle : function(grid) {// 按钮点击事件
	    			if(currentChannelId==undefined)
	    				bootbox.alert("请先选择频道");
	    			else if(currentChannelIsParent)
	    				bootbox.alert("请选择子频道进行添加!");
	    			else
	    				showForm(5, "视频内容");
	    		}
	    	},{
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
	    		text : " 删 除",
	    		cls : "btn red btn-sm",// 按钮样式
	    		handle : function(grid) {
	    			deleteItems(grid.getSelectIds());
	    		}
	    	} ];
	if(hasPublishRole){
		actionCloums.push(
				{
					text : "发布",
					cls : "green btn-sm",
					handle : function(i, data) {
						var url = "../video/check?status=2&videoIds="+data.id;
						$.ajax({
							url:url,
							type:'POST',
							success:function(res){
								bootbox.alert(res.msg);
								flushGrid();
							}
						});
						}
					}
		);
	}if(hasShenheRole){
		tools.push({
    		text : "提交",
    		cls : "btn green btn-sm",
    		handle : function(grid) {
    			var ids = grid.getSelectIds();
    			if (ids.length > 0) {
    				var url = "../video/commit?videoIds=" + ids;
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
    	});
	}

var videoOptions = {
	url : action, // ajax地址
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
	actionCloums : actionCloums,
	tools : tools
	
};
return videoOptions;
}

/** *************视频表单*************** */
function getVideoForm(typeId,hasPublishRole,hasShenheRole) {
	var buttons = [];
	if(hasPublishRole){
		buttons.push(
		{
			type : 'submit',
			attribute:'role=submit',
			cls:'blue btn-lg',
			text : '直接发布',
			handle : function() {
				form.setAction("../video/saveAndPublish");
			}
		});
	}if(hasShenheRole){
		buttons.push({
			type : 'submit',
			attribute:'role=submit',
			cls:'blue btn-lg',
			text : '提交审核',
			handle : function() {
				form.setAction("../video/saveAndCommit");
			}
		});
	}
	buttons.push({
		type : 'button',
		text : '关闭',
		handle : function() {
			flushGrid();
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
				name : 'channelId',
				id : 'channelId'
			},
			{
				type : 'hidden',
				name : 'type',
				id : 'type'
			},
			{
				type : 'text',// 类型
				name : 'name',// name
				id : 'name',// id
				label : '标题',// 左边label
				cls : 'input-xlarge',
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
				type : 'text',// 类型
				name : 'director',// name
				id : 'director',// id
				label : '作者',// 左边label
				cls : 'input-xlarge'
			},
			{
				type : 'datepicker',//类型
				name : 'publishDate',//name
				id : 'publishDate',//id
				label : '发布时间',//左边label
				cls : 'input-xlarge'
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
				cls : 'input-xlarge'
			} ];
	var contentText = {
		type : 'kindEditor',
		name : 'introduce',
		id : 'introduce',
		label : '视频介绍',
		height : "300px",
		width : "400px"
	};
	var fileUrl = {
			type : 'fileEditor',
			name : 'videoUrl',
			id : 'videoUrl',
			label : '视频地址',
			text:"选择视频",
			rule : {
				required : true
			},
			message : {
				required : "上传视频"
			}
		};
	var titleImg = {
		type : 'image',
		id : 'imageUrl',
		name : 'imageUrl',
		label : '视频图片',
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
		limit : 2,
		allowType : ".mp4,.rmvb,.flv,.avi,.flv,.m3u8,.f4v",// 用,分开
		uploadUrl : '../attachmentOther/multipleUpload?mediaType=video',
		convertData : function(data) {
			var arrays = [];
			arrays.push(data.attachment.id);
			arrays.push(data.attachment.attachmentName);
			arrays.push(data.attachment.attachmentUrl);
			return arrays;
		},
		fileInfoUrl : "../attachmentOther/detail",
		dataParam : "attachmentId",
		label : '上传视频',
		detail : "",
		rule : {
			required : true
		},
		message : {
			required : "上传视频",
		}
	};
	var videoUrl={
			type : 'text',
			name : 'videoUrl',
			id : 'videoUrl',
			label : '视频地址',
			rule : {
				required : true
			},
			message : {
				required : "请填写视频地址",
			}
	};
	var videoOrigen={
			type : 'text',
			name : 'origin',
			id : 'origin',
			label : '来源' 
	};
	//items.push(videoUrl);
	items.push(fileUrl);
	items.push(videoOrigen);
	//items.push(titleImg);
	items.push(contentText);
	var formOpts = {
		id : "media_form",// 表单id
		name : "media_form",// 表单名
		method : "post",// 表单method
		action : "../video/insertOrUpdate",// 表单action
		ajaxSubmit : true,// 是否使用ajax提交表单
		labelInline : true,
		rowEleNum : 1,
		beforeSubmit : function() {

		},
		ajaxSuccess : function() {
			flushGrid();
		},
		submitText : "保存",// 保存按钮的文本
		showReset : true,// 是否显示重置按钮
		resetText : "重置",// 重置按钮文本
		isValidate : true,// 开启验证
		buttons : buttons,
		buttonsAlign : "center",
		// 表单元素
		items : items
	};
	return formOpts;
}
