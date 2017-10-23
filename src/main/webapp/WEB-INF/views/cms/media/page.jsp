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
<title>后台管理 | 内容信息管理和发布</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/select2/select2.css" />
<%@include file="../../includejsps/style.jsp"%>
<%@include file="../../includejsps/plugin-style.jsp"%>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
	<!-- BEGIN HEADER -->
	<%@include file="../../includejsps/head.jsp"%>
	<!-- END HEADER -->
	<!-- BEGIN PAGE CONTAINER -->
	<%-- <div class="page-container">
		<!-- BEGIN PAGE HEAD -->
		<div class="page-head">
			<div class="container">
				<!-- BEGIN PAGE TITLE -->
				<div class="page-title">
					<h1>小说管理</h1>
				</div>
				<!-- END PAGE TITLE -->
				<!-- BEGIN PAGE TOOLBAR -->
				<%@include file="../../includejsps/toolbar.jsp"%>
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
								<div class="portlet light">
									<div class="portlet-title">
										<div class="caption caption-md">
											<i class="icon-bar-chart theme-font hide"></i> <span
												class="caption-subject theme-font bold uppercase">小说类型</span>
											<span class="caption-helper"></span>
										</div>
										<div class="actions">
                                            <div class="btn-group btn-group-devided" data-toggle="buttons">
                                                <label class="btn btn-transparent grey-salsa btn-circle btn-sm active" onclick="initMediaTypeTree()">
                                                    <input name="options" class="toggle" id="option1" type="radio">刷新
                                                </label> 
                                            </div>
                                        </div>
									</div>
									<div class="portlet-body">
										<div class="scroller" style="height:400px;"
											id="type_tree_div" data-always-visible="1"
											data-rail-visible="1">
											<ul id="type_tree" class="ztree"></ul>
										</div>
									</div>
								</div>
								<!-- END PORTLET-->
							</div>
						</div>
					</div>
					<div class="col-md-9 col-sm-12">
						<!-- BEGIN PORTLET-->
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">小说管理</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="media_grid"></div>
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
	<%@include file="../../includejsps/foot.jsp"%>
	<!-- END FOOTER-->
	<!-- BEGIN JAVASCRIPTS-->
	<%@include file="../../includejsps/js.jsp"%>
	<%@include file="../../includejsps/plugin-js.jsp"%>
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/select2/select2.min.js"></script>
	<script type="text/javascript">
    var root = '<%=basePath%>'
		var grid;

		var mediaTypeTree;
		var currentTypeId;
		var currentType;
		
		var channelSetting = {
			view : {
				showIcon : false,
				selectedMulti : false
			},
			edit : {
				enable : false,
				showRemoveBtn : false,
				showRenameBtn : false
			},
			check : {
				enable : false
			},
			data : {
				simpleData : {
					enable : true
				}
			},
			async : {
				enable : true,
				dataType : "json",
				url : "",
				autoParam : [ "id", "name", "pId" ]
			},
			callback : {
				onAsyncSuccess : function(event, treeId, treeNode, msg) {
					if (msg.length == 0) {
						Metronic.alert({
							message : "该频道下暂无频道！",
							type : "warning",
							container : "#type_tree_div",
							place : "prepend",
							close : false,
							closeInSeconds : 5
						});
					}
					mediaTypeTree.expandAll(false);
				},
				onClick : function(event, treeId, treeNode) {
					currentTypeId = treeNode.id;
					currentType = treeNode.name;
					grid.reload({
						url : "./list?typeId=" + currentTypeId
					});
				}
			}
		};
		function initMediaTypeTree() {
			if (typeof (mediaTypeTree) == "undefined") {
				$.fn.zTree.init($("#type_tree"), channelSetting, "");
				mediaTypeTree = $.fn.zTree.getZTreeObj("type_tree");
			}
			mediaTypeTree.setting.async.url = "./typeTree";
			mediaTypeTree.reAsyncChildNodes(null, "refresh");
		}
		var options = {
			url : "./list", // ajax地址
			pageNum : 1,//当前页码
			pageSize : 5,//每页显示条数
			idFiled : "id",//id域指定
			showCheckbox : true,//是否显示checkbox
			checkboxWidth : "3%",
			showIndexNum : true,
			indexNumWidth : "5%",
			pageSelect : [ 2, 15, 30, 50 ],
			cloums : [ {
				title : "标题",
				field : "name"
			},
			{
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
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "30%",
			actionCloums : [
					{
						text : "预览",
						cls : "green",
						icon : "fa fa-search",
						handle : function(index, data) {
							window.open(data.url);
						}
					}, {

						text : "编辑",
						cls : "green",
						visable : function(i, c) {
							if (c.status == "1")
								return false;
							return true;
						},
						handle : function(index, data) {
							//index为点击操作的行数
							//data为该行的数据
							modal = $.dmModal({
								id : "mediaForm",
								title : "编辑内容信息-" + data.title,
								distroy : true
							});
							modal.show();
							var form = modal.$body.dmForm(getForm(data.contentType));
							form.loadRemote("./load?id=" + data.id);
						}
					}
					/* , {text:"排序",
						cls:"yellow",
						handle:function (i,c){
							sortfun (i,c);
						}
					 }*/
					],
			tools : [//工具属性
			         {
							text : "添加",//按钮文本
							cls : "btn green",//按钮样式
							icon : "fa fa-cubes",
							handle : function(grid) {//按钮点击事件
								showForm(0,"添加小说");
							}
			},
			{
				text :"提交",
				cls : "btn green",
				handle : function(grid) {
					var ids = grid.getSelectIds();
					if(ids.length>0){
					var url = "./commit?ids="+ids;
						$.ajax({url:url,
							type:"POST",
							dataType:"json",
							success:function(res) {
								bootbox.alert(res.msg);
								grid.reload();
							},
							error:function(){
								bootbox.alert("请求异常！");
							}
						});
					}else{
						bootbox.alert("请选择要提交的项");
					}
				}
			}, {
				text : " 删 除",
				cls : "btn red ",//按钮样式
				handle : function(grid) {
					deleteItems(grid.getSelectIds());
				}
			} ],
			search : {
				rowEleNum : 2,
				//搜索栏元素
				items : [ {
					type : "text",
					label : "标题",
					name : "name",
					placeholder : "输入要搜索的标题"
				} ]
			}
		};
		var modal;
		function showForm(typeId,title){
			if(currentTypeId==undefined){
				bootbox.alert("请先选择类型");
				return;
			}
			modal = $.dmModal({
				id : "mediaForm",
				title : "添加-"+title,
				distroy : true
			});
			modal.show();
			var form = modal.$body.dmForm(getForm(typeId));
			form.setValue("typeId", currentTypeId);
			form.setValue("type",currentType);
		}
		//form
		function getForm(typeId) {
			var items=[{
							type : 'hidden',
							name : 'id',
							id : 'id'
						},
						{
							type : 'hidden',
							name : 'typeId',
							id : 'typeId'
						},
						{
							type : 'hidden',
							name : 'type',
							id : 'type'
						},
						{
							type : 'text',//类型
							name : 'name',//name
							id : 'name',//id
							label : '小说标题',//左边label
							cls : 'input-large',
							rule : {
								required : true,
								maxlength : 32
							},
							message : {
								required : "请输入小说标题",
								maxlength : "最多输入32字节"
							}
						},
						{
							type : 'text',//类型
							name : 'author',//name
							id : 'author',//id
							label : '作者',//左边label
							cls : 'input-large',
							rule : {
								required : true,
								maxlength : 10
							},
							message : {
								required : "请输入作者",
								maxlength : "最多输入10字节"
							}
						},
						{
							type : 'textarea',//类型
							row : 3,
							name : 'description',//name
							id : 'brief',//id
							label : '摘要',//左边label
							cls : 'input-large',
							rule : {
								required : true,
								maxlength : 500
							},
							message : {
								required : "请输入内容信息摘要",
								maxlength : "最多输入500字节"
							}
						}];
			var titleImg={
					type : 'image',
					id : 'titleImgUrl',
					name : 'titleImgUrl',
					label : '标题图',
					isAjaxUpload : true,
					autoUpload : true,
					uploadUrl : '../attachment/singleUpload',
					onSuccess : function(data) {
						if (data.status == "1") {
							$("#titleImgUrl").attr("value",
									data.attachment.attachmentUrl);
						} else {
							alert(data.msg);
						}
					},
					deleteHandle : function() {
						$("#titleImgUrl").attr("value", "");
					}
				};
			var file={
				type : 'file',
				id : 'attachmentIds',
				name : 'attachmentIds',
				label : '小说文本',
				isAjaxUpload : true,
				allowType : ".txt",//用,分开
				uploadUrl : '../attachment/mediaUpload',//
				onSuccess : function(data) {
					if (data.status == 1) {
						$("#attachmentIds").attr("value", data.path);
					} else {
						alert(data.message);
					}
				},
				deleteHandle : function() {
					$("#attachmentIds").attr("value", data.id);
				},
				rule : {
					required : true
				},
				message : {
					required : "请上传文件"
				}
			};
			var offic = {
				type : 'files',
				id : 'attachmentIds',
				name : 'attachmentIds',
				limit : 1,
				allowType : ".txt",//用,分开
				uploadUrl : "../attachment/mediaUpload?typeId="+typeId,
				convertData : function(data) {
					var arrays = [];
					arrays.push(data.attachment.id);
					arrays.push(data.attachment.attachmentName);
					arrays.push(data.attachment.attachmentUrl);
					return arrays;
				},
				fileInfoUrl : "../attachment/detail",
				dataParam : "attachmentId",
				label : '上传附件',
				detail : "",
				rule : {
					required : true
				},
				message : {
					required : "上传附件",
				}
			};
				items.push(titleImg);
				items.push(offic);
			var formOpts = {
				id : "media_form",//表单id
				name : "media_form",//表单名
				method : "post",//表单method
				action : "./insertOrUpdate",//表单action
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
				items : items
			};
			return formOpts;
		}

		function deleteItems(ids) {
			if (ids.length > 0) {
				bootbox.confirm("确定删除吗？", function(result) {
					if (result) {
						$.ajax({
							type : "POST",
							data : "ids=" + ids,
							dataType : "json",
							url : "./delete",
							success : function(data) {
								if (data.status == 1) {
									grid.reload();
								}
							}
						});
					}
				});
			} else {
				bootbox.alert("请选择要删除的选项！");
			}
		}
		function sortfun (i,c){
			seqModal = $.dmModal({
				id : "seqForm",
				title : "编辑顺序-" + c.title,
				distroy : true,
				width:"800px"
			});
			seqModal.show();
			var seqForm = seqModal.$body.dmForm(seqFormOpts);
			c.seq = '';
			seqForm.loadLocal(c);
		}
		var seqModal;
		//form
		var seqFormOpts = {
				id : "sort_form",//表单id
				name : "sort_form",//表单名
				method : "post",//表单method
				action : "./sort",//表单action
				ajaxSubmit : true,//是否使用ajax提交表单
				labelInline : true,
				rowEleNum : 1,
				beforeSubmit : function() {
					
				},
				ajaxSuccess : function() {
					seqModal.hide();
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
						seqModal.hide();
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
							name : 'seq',//name
							id : 'seq',//id
							label : '顺序',//左边label
							cls : 'input-large',
							rule : {
								required : true,
								number : true,
								range:[1,10]
							},
							message : {
								required : "请输入1-10之间的数字",
								number : "请输入1-10之间的数字",
								range:"请输入1-10之间的数字"
							}
						}]
		}
		jQuery(document).ready(function() {
			initMediaTypeTree();
			grid = $("#media_grid").dmGrid(options);
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
