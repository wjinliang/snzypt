<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>后台管理 | 领导之窗管理和发布</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/select2/select2.css" />
<%@include file="../includejsps/style.jsp"%>
<%@include file="../includejsps/plugin-style.jsp"%>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
	<!-- BEGIN HEADER -->
	<%@include file="../includejsps/head.jsp"%>
	<!-- END HEADER -->
	<!-- BEGIN PAGE CONTAINER -->
	<%-- <div class="page-container">
		<!-- BEGIN PAGE HEAD -->
		<div class="page-head">
			<div class="container">
				<!-- BEGIN PAGE TITLE -->
				<div class="page-title">
					<h1>内容信息管理</h1>
				</div>
				<!-- END PAGE TITLE -->
				<!-- BEGIN PAGE TOOLBAR -->
				<%@include file="../includejsps/toolbar.jsp"%>
				<!-- END PAGE TOOLBAR -->
			</div>
		</div> --%>
		<!-- END PAGE HEAD -->
		<!-- BEGIN PAGE CONTENT -->
		<div class="page-content">
			<div class="container">
				<!-- BEGIN PAGE CONTENT INNER -->
				<div class="row margin-top-10">
					<div class="col-md-3 col-sm-12">
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<!-- BEGIN PORTLET-->
								
								<!-- END PORTLET-->
							</div>
						</div>
					</div>
					<div class="col-md-12 col-sm-12">
						<!-- BEGIN PORTLET-->
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">领导之窗信息管理</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="content_grid"></div>
						</div>
						<!-- END PORTLET-->
					</div>
				</div>
				<!-- END PAGE CONTENT INNER -->
			</div>
		</div>
		<!-- END PAGE CONTENT -->
	</div>
	<!-- END PAGE CONTAINER -->
	<!-- BEGIN FOOTER -->
	<%@include file="../includejsps/foot.jsp"%>
	<!-- END FOOTER-->
	<!-- BEGIN JAVASCRIPTS-->
	<%@include file="../includejsps/js.jsp"%>
	<%@include file="../includejsps/plugin-js.jsp"%>
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/select2/select2.min.js"></script>
     
	<script type="text/javascript">
	/**********普通内容操作函数****************/
	var modal;
	function deleteItems(ids) {
		if (ids.length > 0) {
			bootbox.confirm("确定删除吗？", function(result) {
				if (result) {
					$.ajax({
						type : "POST",
						dataType : "json",
						data:{id:ids},
						url : "./delete",
						success : function(data) {
							if (data.status == 1) {
								grid.reload();
								bootbox.alert(data.msg);
							}
						}
					});
				}
			});
		} else {
			bootbox.alert("请选择要删除的选项！");
		}
	}
	var replyModal;
	//form
	var replyForm = {
			id : "reply_form",//表单id
			name : "sort_form",//表单名
			method : "post",//表单method
			action : "./addOrUpdate",//表单action
			ajaxSubmit : true,//是否使用ajax提交表单
			labelInline : true,
			rowEleNum : 1,
			beforeSubmit : function() {
				
			},
			ajaxSuccess : function() {
				modal.hide();
				grid.reload();
			},
			submitText : "保存",//保存按钮的文本
			showReset : true,//是否显示重置按钮
			resetText : "重置",//重置按钮文本
			isValidate : true,//开启验证
			buttons : [ {
				type : 'button',
				text : '关闭',
				handle : function() {
					modal.hide();
				}
			} ],
			buttonsAlign : "center",
			//表单元素
			items : [
					{
						type : 'hidden',
						name : 'id',
						id : 'id'
					},
					{
						type : 'text',//类型
						name : 'name',
						label : '姓名',//左边label
						cls : 'input-xlarge',
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}
					},{
						type : 'textarea',//类型
						name : 'occupation',
						label : '职务',//左边label
						cls : 'input-xlarge',
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}
					},
					{
						type : 'textarea',//类型
						name : 'division',
						label : '分工',//左边label
						cls : 'input-xlarge'
					},
					{
						type : 'text',//类型
						name : 'seq',
						label : '排序号',//左边label
						cls : 'input-xlarge',
						rule : {
							required : true,
							number:true
						},
						message : {
							required : "请输入数字",
							number:"请输入数字"
						}
					},
					/* {
						type : 'select',
						name : 'type',
						id : 'type',
						label : '领导分类',
						cls : 'input-xlarge',
						items : [ {
							value : '1',
							text : '县长'
						},
						 {
							value : '2',
							text : '书记'
						}],
						rule : {
							required : true
						},
						message : {
							required : "请选择"
						}
					}, */{
						type : 'image',
						id : 'headImg',
						name : 'headImg',
						label : '头像',
						isAjaxUpload : true,
						autoUpload : true,
						uploadUrl : '../cms/attachment/singleUpload',
						onSuccess : function(data) {
							if (data.status == "1") {
								$("#headImg")
										.attr("value", data.attachment.attachmentUrl);
							} else {
								alert(data.msg);
							}
						},
						deleteHandle : function() {
							$("#headImg").attr("value", "");
						}
					} ,{
						type:'radioGroup',
						name:'org',
						id:'org',
						label:'分类',
						cls:'input-xlarge',
						items:[],
						itemsUrl:'../dict/getItems?code=C01',
						rule : {
							required : true
						},
						message : {
							required : "请选择"
						}
					}
					]
	}
	var cutOrCopyModal;
	function cutOrCopyfun(ids,title,checkType,url){
		if (ids.length > 0) {
			cutOrCopyModal = $.dmModal({
				id : "cutCopyForm",
				title : title,
				distroy : true
			});
			cutOrCopyModal.show();
			var form = cutOrCopyModal.$body.dmForm(getcutOrCopyForm(checkType,url));
			form.setValue("ids",ids);
		} else {
			bootbox.alert("请选择要"+title+"的项！");
		}
	}
		var showopt={
				id : "show_form",//表单id
				name : "show_form",//表单名
				method : "post",//表单method
				//action : "",//表单action
				ajaxSubmit : true,//是否使用ajax提交表单
				labelInline : true,
				rowEleNum : 1,
				beforeSubmit : function() {

				},
				ajaxSuccess : function() {
					modal.hide();
					grid.reload();
				},
				buttons : [ {
					type : 'button',
					text : '关闭',
					handle : function() {
						modal.hide();
					}
				} ],
				buttonsAlign : "center",
				//表单元素
				items : [
						{
							type : 'display',
							name : 'name',
							label : '姓名'//左边label
						},
						{
							type : 'display',
							name : 'phone',
							label : '手机'
						},{
							type : 'display',
							name : 'email',
							label : '邮箱'
						},{
							type : 'display',
							name : 'touser',
							label : '领导或部门'
						},
						{
							type : 'display',
							name : 'title',
							label : '标题'
						},{
							type : 'display',
							name : 'content',
							label : '内容'
						},{
							type : 'display',
							name : 'recontent',
							label : '回复'
						}						
						]	
		};
/****************添加*********************/	
	function showForm(){
		modal = $.dmModal({
			id : "siteForm",
			title : "添加",
			distroy : true
		});
		modal.show();
		
		var form = modal.$body.dmForm(replyForm);
		
	}
	
	/** **********普通新闻表格选项*************** */
	var options = {
		url : "./list", // ajax地址
		pageNum : 1,// 当前页码
		pageSize : 5,// 每页显示条数
		idFiled : "id",// id域指定
		showCheckbox : false,// 是否显示checkbox
		checkboxWidth : "3%",
		showIndexNum : true,
		indexNumWidth : "5%",
		pageSelect : [ 2, 15, 30, 50 ],
		cloums : [ {
			title : "名字",
			field : "name",
			sort : true
		}, {
			title : "职务",
			field : "occupation",
			sort : true
		}, {
			title : "分工",
			field : "division",
		}/* , {
			title : "领导分类",
			field : "type",
			format:function(i,d)
			{
				if(d.type=="1")
					return "县长";
					else if(d.type=="2")
						return "书记";
						return "";
			}
		} */,{
			title:'分类',
			field:'org'
		}, {
			title : "排序",
			field : "seq"
		}],
		actionCloumText : "操作",// 操作列文本
		actionCloumWidth : "15%",
		actionCloums : [ {
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
					id : "reply-form",
					title : "编辑-" + data.title,
					distroy : true
				});
				modal.show();
				var form = modal.$body.dmForm(replyForm);
				form.loadRemote("./load?id=" + data.id);
			}
		}, {
			text : "删除",
			cls : "red btn-sm",
			handle : function(i, c) {
				deleteItems(c.id);
			}
		} ],
		tools : [// 工具属性
		 {
			text : "添加",
			cls : "btn green btn-sm",// 按钮样式
			handle : function(grid) {
				showForm();
			}
		} ],
		search : {
			rowEleNum : 2,
			hide:false,
			// 搜索栏元素
			items : [ {
				type : "radioGroup",
				label : "分类",
				name : "org",
				id:'sorg',
				items:[{text:'全部',value:''}],
				itemsUrl:'../dict/getItems?code=C01'
			} ]
		}
	};
	// form
	/** **************普通内容表单选项*************** */
	jQuery(document).ready(function() {
		
		grid = $("#content_grid").dmGrid(options);
	});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
