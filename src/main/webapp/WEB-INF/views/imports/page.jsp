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
<!-- 						<div class="col-md-8 col-sm-8">  -->
							<div class="portlet light">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font hide"></i> <span
											class="caption-subject theme-font bold uppercase">自动导入</span>
										<span class="caption-helper"></span>
									</div>
								</div>
								<div class="portlet-body" id="import"></div>
							</div>
<!-- 						</div> -->
<!-- 					 <div class="col-md-4 col-sm-4"> -->
<!-- 							<div class="portlet light"> -->
								
<!-- 								<div class="portlet-body" id="importz"></div> -->
<!-- 							</div> -->
<!-- 						</div>  -->
						</div>
						<div class="col-md-12 col-sm-12">
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">导入记录</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="org_person_grid"></div>
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
		var form;
		var options = {
			url : "./logList", // ajax地址
			pageNum : 1,//当前页码
			pageSize : 5,//每页显示条数
			idFiled : "id",//id域指定
			showCheckbox : true,//是否显示checkbox
			checkboxWidth : "3%",
			showIndexNum : false,
			indexNumWidth : "5%",
			pageSelect : [ 2, 15, 30, 50 ],
			cloums : [ {
				title : "导入表",
				field : "tableName",
				width : "20%"
			}, {
				title : "导入时间",
				field : "insertTime",
				width : "20%",
				format:function(i,c){
					return dateTostr(c.importTime);
					
				}
			} ]
		};
		

		var formOpts = {
			id : "channel_form",//表单id
			name : "channel_form",//表单名
			action : "./import",//表单action
			ajaxSubmit : true,//是否使用ajax提交表单
			labelInline : true,
			rowEleNum : 1,
			beforeSubmit : function() {
				
			},
			ajaxSuccess : function(data) {
				form.setAction("./import");
				if(data.status=='1'){
					bootbox.alert("导入成功");
					//form.reset();
					grid.reload();
				}else
				if(data.status=='2'){
					//bootbox.alert(data.data);
					 modal = $.dmModal({
							id : "siteForm",
							title : "数据",
							distroy : true
						});
						modal.show(); 
						var html=$('<div class="col-md-12"></div>');
						for(var i=0;i<data.data.length;i++){
							var cls = ' label-info';
							if(i%2==0){
								cls=' label-default';
							}
							var one =$('<div class="col-md-4 col-sm-4 '+cls+'"></div>');
							var ht="";
							var that = data.data[i];
							for(var k in that) {
								ht+='<div class="form-group"><label class="control-label">'+k+":"+that[k]+'</label></div>';
							}
							one.html(ht);
							html.append(one);
						}
						modal.$body.append(html);
				}
				else{
					bootbox.alert(data.msg);
				}
				
			},
			submitText : "开始导入",//保存按钮的文本
			isValidate : true,//开启验证
			buttons : [ {
						type : 'submit',
						attribute:'role=submit',
						cls:'blue btn-lg',
						text : '测试',
						handle : function() {
							form.setAction("./test");
						}
			} ],
			isValidate : true,//开启验证
			buttonsAlign : "center",
			//表单元素
			items : [ {
				type : 'hidden',
				name : 'id',
				id : 'id'
			}, {
				type : "select",
				name : "confId",
				id : "confId",
				cls : 'input',
				label : "导入配置",
				items : [ {
					text : "请选择",
					value : ""
				} ],
				itemsUrl : "./confopts",
				rule : {
					required : true
				},
				message : {
					required : "请选择"
				}
			}, {
				type : 'file',
				id : 'filePath2',
				name : 'filePath',
				label : '上传文件',
				isAjaxUpload : true,
				uploadUrl : './fileupload',//
				onSuccess : function(data) {
					if (data.status == 1) {
						$("#filePath2").attr("value", data.path);
					} else {
						alert(data.msg);
					}
				},
				deleteHandle : function() {
					$("#filePath2").attr("value", "");
				},
				rule : {
					required : true
				},
				message : {
					required : "请上传文件"
				}
			} ]
		};
		var formOpt = {
			id : "chann_form",//表单id
			name : "chanl_form",//表单名
			method : "post",//表单method
			action : "./test",//表单action
			ajaxSubmit : true,//是否使用ajax提交表单
			labelInline : true,
			rowEleNum : 1,
			beforeSubmit : function() {

			},
			ajaxSuccess : function(data) {
				form.setAction("./import");
				if(data.status=='1'){
					bootbox.alert("导入成功");
					//form.reset();
					grid.reload();
				}else
				if(data.status=='2'){
					//bootbox.alert(data.data);
					 modal = $.dmModal({
							id : "siteForm",
							title : "数据",
							distroy : true
						});
						modal.show(); 
						var html=$('<div class="col-md-12"></div>');
						for(var i=0;i<data.data.length;i++){
							var cls = ' label-info';
							if(i%2==0){
								cls=' label-default';
							}
							var one =$('<div class="col-md-4 col-sm-4 '+cls+'"></div>');
							var ht="";
							var that = data.data[i];
							for(var k in that) {
								ht+='<div class="form-group"><label class="control-label">'+k+":"+that[k]+'</label></div>';
							}
							one.html(ht);
							html.append(one);
						}
						modal.$body.append(html);
				}
				else{
					bootbox.alert(data.msg);
				}
				
			},
			submitText : "开始导入",//保存按钮的文本
			isValidate : true,//开启验证
			buttons : [ {
						type : 'submit',
						attribute:'role=submit',
						cls:'blue btn-lg',
						text : '测试',
						handle : function() {
							form.setAction("./test");
						}
			} ],
			isValidate : true,//开启验证

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
				rule : {
					required : true
				},
				message : {
					required : "请填写"
				}

			}, {
				type : 'text',
				name : 'startRow',
				label : '开始行',
				rule : {
					required : true
				},
				message : {
					required : "请填写"
				}

			}, {
				type : 'text',
				name : 'endRow',
				label : '结束行'

			}, {
				type : 'text',
				name : 'tableName',
				label : '表名',
				rule : {
					required : true
				},
				message : {
					required : "请填写"
				}

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
		function deleteItem(id) {
			bootbox.confirm("确定删除吗？", function(result) {
				if (result) {
					$.ajax({
						type : "POST",
						data : "id=" + id,
						dataType : "json",
						url : "./delete",
						success : function(data) {
							if (data.status == 1) {
								grid.reload();
							} else {
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

		jQuery(document).ready(function() {
			grid = $("#org_person_grid").dmGrid(options);
			form = $("#import").dmForm(formOpts);
			//$("#import").dmForm(formOpt);
		});
		
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
