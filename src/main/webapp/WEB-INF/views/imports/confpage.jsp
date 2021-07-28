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
<title>基础平台管理系统</title>
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
	<div class="page-container">
		<!-- BEGIN PAGE HEAD -->
		 <%-- <div class="page-head">
			<div class="container">
				<!-- BEGIN PAGE TITLE -->
				<div class="page-title">
					<h1>频道管理</h1>
				</div>
				<!-- END PAGE TITLE -->
				<!-- BEGIN PAGE TOOLBAR -->
				<%@include file="../includejsps/toolbar.jsp"%>
				<!-- END PAGE TOOLBAR -->
			</div>
		</div>  --%>
		<!-- END PAGE HEAD -->
		<!-- BEGIN PAGE CONTENT -->
		<div class="page-content">
			<div class="container">
				<!-- BEGIN PAGE CONTENT INNER -->
				<div class="row margin-top-10">
					<div class="col-md-12 col-sm-12">
						<!-- BEGIN PORTLET-->
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">导入配置</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="import_conf"></div>
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
    var root = "<%=basePath%>";
		
		var grid;
		var model;
		var options = {
			url : "./list", // ajax地址
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
				title : "名称",
				field : "name",
				width : "20%"
			},{
				title : "表名",
				field : "tableName",
				width : "20%"
			},{
				title : "详细地址字段",
				field : "enName",
				width : "10%"
			}
			],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "30%",
			actionCloums : [
					 {
						text : "编辑",
						cls : "green btn-sm",
						handle : function(index, data) {
							replyModal(data);
						}
					},
					 {
						text : "处理地址",
						cls : "green btn-sm",
						handle : function(index, data) {
							$.ajax({
								url:"./doxzc",
								type:'POST',
								data:{id:data.id},
								success:function(data){
									if(data.status=="1"){
										bootbox.alert("已进入后台处理中...");
									}else{
										bootbox.alert("error");
									}
								}
								
							});
						}
					}
					,{
						
						text : "删除",
						cls : "btn red btn-sm",//按钮样式
						handle : function(i,c) {
							deleteItem(c.id);
						}
					},{
						
						text : "清空本表数据",
						cls : "btn red btn-sm",//按钮样式
						handle : function(i,c) {
							deleteData(c.id);							   
						}
					}
					],
			
			 tools : [ {
				text : "添加",
				cls : "btn green btn-sm",//按钮样式
				handle : function(grid) {
 					model = $.dmModal({
						id : "siteForm",
						title : "添加",
						distroy : true
					});
					model.show();
					var form = model.$body.dmForm(formOpts);
				}
			} ,{
				text : "导入",
				cls : "btn green btn-sm",//按钮样式
				handle : function(grid) {
 					model = $.dmModal({
						id : "siteForm",
						title : "导入",
						distroy : true
					});
					model.show();
					var form = model.$body.dmForm(formOpt);
				}
			} ]
		};
		var formOpt = {
				id : "chann_form",//表单id
				name : "chanl_form",//表单名
				method : "post",//表单method
				action : "./autoconf",//表单action
				ajaxSubmit : true,//是否使用ajax提交表单
				labelInline : true,
				rowEleNum : 1,
				beforeSubmit : function() {

				},
				ajaxSuccess : function(data) {
					if(data.status=='1'){
						bootbox.alert("导入成功");
						model.hide();
						grid.reload();
					}
					else{
						bootbox.alert(data.msg);
					}
					
				},
				submitText : "开始导入",//保存按钮的文本
				isValidate : true,//开启验证
				buttons : [ {
					type : 'button',
					text : '关闭',
					handle : function() {
						model.hide();
						
					}
				} ],
				buttonsAlign : "center",
				//表单元素
				items : [ {
					type : 'hidden',
					name : 'id',
					id : 'id'
				}, {
					type : 'text',
					name : 'titleRow',
					label : '标题行',
					placeholder:'默认为1'

				}, {
					type : 'text',
					name : 'startRow',
					label : '开始行',
					placeholder:'默认为2'
				}, {
					type : 'text',
					name : 'endRow',
					label : '结束行',
					placeholder:'默认为0'

				}, {
					type : 'text',
					name : 'tableName',
					label : '表名',
					placeholder:'默认为表格名称简拼'
				}, {
					type : 'file',
					id : 'filePath1',
					name : 'filePath',
					label : '模板路径',
					isAjaxUpload : true,
					uploadUrl : './fileupload',//
					onSuccess : function(data) {
						if (data.status == 1) {
							$("#filePath1").attr("value", data.path);
						} else {
							alert(data.message);
						}
					},
					deleteHandle : function() {
						$("#filePath1").attr("value", "");
					},
					cls : 'input',
					rule : {
						required : true
					},
					message : {
						required : "请上传文件"
					}
				} ]
			};
		function replyModal(data){
			 model = $.dmModal({
				id : "siteForm",
				title : "修改",
				distroy : true
			});
			model.show(); 
			
			var form = model.$body.dmForm(formOpts);
			form.loadLocal(data);
			
		}
		
		
			var formOpts = {
				id : "channel_form",//表单id
				name : "channel_form",//表单名
				method : "post",//表单method
				action : "./saveOrUpdate",//表单action
				ajaxSubmit : true,//是否使用ajax提交表单
				labelInline : true,
				rowEleNum : 1,
				beforeSubmit : function() {

				},
				ajaxSuccess : function() {
					model.hide();
					reGrid();
				},
				submitText : "提交",//保存按钮的文本
				isValidate : true,//开启验证
				buttons : [ {
					type : 'button',
					text : '关闭',
					handle : function() {
						model.hide();
						
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
					name : 'status',
					id : 'status'
				},{
					type : 'hidden',
					name : 'isdelta',
					id : 'isdelta'
				},{
					type : 'hidden',
					name : 'filePath',
					id : 'filePath'
				},{
					type : 'text',//类型
					name : 'name',//name
					id : 'name',//id
					label : '配置名称',//左边label
					cls : 'input-xlarge',
					rule : {
						required : true
					},
					message : {
						required : "请输入"
					}
				} ,{
					type : 'text',//类型
					name : 'enName',//name
					id : 'enName',//id
					label : '详细地址字段',//左边label
					cls : 'input-xlarge',
					placeholder:'与村关联的字段，一般为详细地址',
				} ,
					{
						type : 'text',//类型
						name : 'tableName',//name
						id : 'tableName',//id
						label : '表名',//左边label
						cls : 'input-xlarge',
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}
					},
					{
						type : 'text',//类型
						name : 'startRow',//name
						id : 'startRow',//id
						label : '开始行数',//左边label
						cls : 'input-xlarge',
						placeholder:'默认2,数据的开始行',
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}
					},{
						type : 'text',//类型
						name : 'endRow',//name
						id : 'endRow',//id
						label : '结束行数',//左边label
						cls : 'input-xlarge',
						placeholder:'默认为0，表示导入到最后一行',
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}
					},{
					
						type : 'textarea',//类型
						name : 'collectionIndexs',//name
						id : 'collectionIndex',//id
						label : '列下标',//左边label
						cls : 'input-xlarge',
						placeholder:'要导入的每一列的编号,从0开始,如：0,1,2,3,4,5,6',
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}
					},{
						type : 'textarea',//类型
						name : 'collectionNames',//name
						id : 'collectionName',//id
						label : '列名',//左边label
						cls : 'input-xlarge',
						placeholder:'每一列的名称逗号隔开',
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}
					},
					{
						type : 'textarea',//类型
						name : 'collectionTitles',//name
						id : 'collectionIndex',//id
						label : '列标题行',//左边label
						cls : 'input-xlarge',
						placeholder:'默认为1'
						
					},
					{
						type : 'textarea',//类型
						name : 'collectionKey',//name
						id : 'collectionKey',//id
						label : '主键字段',//左边label
						cls : 'input-xlarge',
						placeholder:'重复导入时可根据此字段确定更新还是添加'
						
					}
					]
			};
		function deleteItem(id) {
	        bootbox.confirm("确定删除吗？", function (result) {
	            if (result) {
	                $.ajax({
	                    type: "POST",
	                    data: "id=" + id,
	                    dataType: "json",
	                    url: "./delete",
	                    success: function(data){
	                    	if (data.status == 1) {
	                            grid.reload();
	                        }else{
	                        	bootbox.alert(data.msg);
	                        }
	                    }
	                });
	            }
	        });
	    }
	    function deleteItems(ids) {
	        if (ids.length > 0) {
	        	deleteItem(ids);
	        } else {
	            bootbox.alert("请选择要删除的选项！");
	        }
	    }
	    function deleteData(id) {
	        bootbox.confirm("确定清空文本数据吗？", function (result) {
	            if (result) {
	            	$.ajax({
						url:"./deldata",
						type:'POST',
						data:{id:id},
						success:function(data){
							if(data.status=="1"){
								bootbox.alert("清空数据成功");
							}else{
								bootbox.alert("删除失败");
							}
						}
						
					});
	            }
	        });
	    }
		jQuery(document).ready(function() {
			grid = $("#import_conf").dmGrid(options);
		});
		function reGrid(){
			model.hide();
			grid.reload();
		}
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
