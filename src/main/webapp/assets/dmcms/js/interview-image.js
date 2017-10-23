var imageoptions={

		url : "../interview/listImage?interviewId="+currentInterviewId, // ajax地址
		pageNum : 1,//当前页码
		pageSize : 5,//每页显示条数
		idFiled : "id",//id域指定
		showCheckbox : true,//是否显示checkbox
		checkboxWidth : "3%",
		showIndexNum : false,
		indexNumWidth : "5%",
		pageSelect : [ 2, 15, 30, 50 ],
		cloums : [ 
		{
			title : "标题",
			field : "title",
			width : "20%"
		},{
			title : "图片",
			field : "",
			width : "10%",
			format:function(i,c){
				if(c.imageUrl=='null' ||c.imageUrl==null || c.imageUrl==''){
					return '[暂无]';
				}
				return '<image src="'+c.imageUrl+'" title="'+c.name+'" style="width:90px;"/>';
			}
		} ],
		actionCloumText : "操作",//操作列文本
		actionCloumWidth : "20%",
		actionCloums : [
				 {
					text : "编辑",
					cls : "green btn-sm",
					handle : function(index, data) {
						replyModal(data);
					}
				}
				,{
					
					text : "删除",
					cls : "btn red btn-sm",//按钮样式
					handle : function(i,c) {
						deleteItem(c.id);
					}
				}
				],
		
		 tools : [ {
			text : "添加",
			cls : "btn green btn-sm",//按钮样式
			handle : function(grid) {
				in_model = $.dmModal({
					id : "siteForm",
					title : "添加",
					distroy : true
				});
				in_model.show();
				var form = in_model.$body.dmForm(imageFormOpt);
				form.loadLocal({interviewId:currentInterviewId});
			}
		} ]
	};
var imageFormOpt = {
		id : "channel_form",//表单id
		name : "channel_form",//表单名
		method : "post",//表单method
		action : "./insertOrUpdateImage",//表单action
		ajaxSubmit : true,//是否使用ajax提交表单
		labelInline : true,
		rowEleNum : 1,
		beforeSubmit : function() {

		},
		ajaxSuccess : function() {
			in_modal.hide();
			image_grid.reload();
		},
		submitText : "提交",//保存按钮的文本
		isValidate : true,//开启验证
		buttons : [ {
			type : 'button',
			text : '关闭',
			handle : function() {
				in_modal.hide();
			}
		} ],
		buttonsAlign : "center",
		//表单元素
		items : [ {
			type : 'hidden',
			name : 'id',
			id : 'id'
		},{
			type : 'hidden',
			name : 'interviewId',
			id : 'interviewId'
		},{
				type : 'text',//类型
				name : 'title',//name
				id : 'title',//id
				label : '标题',//左边label
				cls : 'input-large',
				rule : {
					required : true
				},
				message : {
					required : "请输入"
				}
			}
		,{	type : 'image',
			id : 'imgUrl',
			name : 'imgUrl',
			label : '图片',
			isAjaxUpload : true,
			autoUpload : true,
			uploadUrl : '../attachment/singleUpload',
			onSuccess : function(data) {
				if (data.status == "1") {
					$("#imgUrl")
							.attr("value", data.attachment.attachmentUrl);
				} else {
					alert(data.msg);
				}
			},
			deleteHandle : function() {
				$("#imgUrl").attr("value", "");
			}
			}]
	};
//var in_model;
var image_grid;