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
<title>后台管理 | 角色管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
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
	<div class="page-container">
		<!-- BEGIN PAGE HEAD -->
		<%-- <div class="page-head">
			<div class="container">
				<!-- BEGIN PAGE TITLE -->
				<div class="page-title">
					<h1>角色管理</h1>
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
					<div class="col-md-12 col-sm-12">
						<!-- BEGIN PORTLET-->
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">角色管理</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="role_grid"></div>
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
	<script type="text/javascript">
		var grid;
		var options = {
			url : "./ajaxList", // ajax地址
			pageNum : 1,//当前页码
			pageSize : 5,//每页显示条数
			idFiled : "code",//id域指定
			showCheckbox : true,//是否显示checkbox
			checkboxWidth : "3%",
			showIndexNum : true,
			indexNumWidth : "5%",
			pageSelect : [ 2, 15, 30, 50 ],
			cloums : [ {
				title : "角色名",
				field : "name",
				sort : true
			}, {
				title : "跳转主页",
				field : "homePage",
				sort : true
			} ],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "30%",
			actionCloums : [ {
				text : "编辑",
				cls : "green btn-sm",
				handle : function(index, data) {
					//index为点击操作的行数
					//data为该行的数据
					modal = $.dmModal({
						id : "roleForm",
						title : "表单",
						distroy : true
					});
					modal.show();
					var form = modal.$body.dmForm(formOpts);
					form.loadRemote("./ajaxLoad?roleId=" + data.code);
				}
			},
			/* {
				text : "设置菜单组",
				cls : "green btn-sm",
				handle : function(index, data) {
					modal = $.dmModal({
						id : "menuGroupForm",
						title : "设置菜单组",
						distroy : true
					});
					modal.show();
					var form = modal.$body.dmForm(mgFormOpts);
					form.loadRemote("./ajaxLoad?roleId=" + data.code);
				}
			}, */
			{
				text : "删除",
				cls : "red btn-sm",
				handle : function(index, data) {
					deleteItem(data.code);
				}
			} ],
			tools : [
			//工具属性
			{
				text : " 添 加",//按钮文本
				cls : "btn green btn-sm",//按钮样式
				icon : "fa fa-cubes",
				handle : function(grid) {//按钮点击事件
					modal = $.dmModal({
						id : "roleForm",
						title : "表单",
						distroy : true
					});
					modal.show();
					var form = modal.$body.dmForm(formOpts);
				}
			}, {
				text : " 删 除",
				cls : "btn red btn-sm",//按钮样式
				handle : function(grid) {
					deleteItems(grid.getSelectIds());
				}
			} ],
			search : {
				rowEleNum : 4,
				//搜索栏元素
				items : [ {
					type : "text",
					label : "角色名",
					name : "name",
					placeholder : "输入要搜索的角色名"
				}]
			}
		};
		var modal;
		//form
		var formOpts = {
			id : "role_form",//表单id
			name : "role_form",//表单名
			method : "post",//表单method
			action : "./ajaxSave",//表单action
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
			items : [ {
				type : 'hidden',
				name : 'code',
				id : 'code'
			}, {
				type : 'text',//类型
				name : 'name',//name
				id : 'name',//id
				label : '角色名',//左边label
				cls : 'input-large',
				rule : {
					required : true
				},
				message : {
					required : "请输入角色名"
				}
			}, {
				type : 'text',//类型
				name : 'homePage',//name
				id : 'homePage',//id
				label : '跳转路径',//左边label
				cls : 'input-large',
				rule : {
					required : true
				},
				message : {
					required : "请输入跳转路径"
				}
			}, {
				type : 'textarea',//类型
				name : 'detail',//name
				id : 'detail',//id
				label : '说明',
				cls : 'input-large'
			}, {
				type : 'tree',//类型
				name : 'menuIds',//name
				id : 'menuIds',//id
				label : '菜单',//左边label
				url : "../usermenu/loadMenus",
				expandAll : true,
				autoParam : [ "id", "name", "pId" ],
				chkStyle : "checkbox",
				rule : {
					required : true
				},
				message : {
					required : "请选择至少一项菜单"
				}
			} ]
		};
		
		var mgFormOpts = {
			id : "mg_form",//表单id
			name : "mg_form",//表单名
			method : "post",//表单method
			action : "./ajaxSetMenuGroups",//表单action
			ajaxSubmit : true,//是否使用ajax提交表单
			labelInline : true,
			rowEleNum : 1,
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
			items : [ {
				type : 'hidden',
				name : 'code',
				id : 'code'
			},{
				type : 'tree',//类型
				name : 'menuGroupIds',//name
				id : 'menuGroupIds',//id
				label : '菜单组',//左边label
				url : "../menugroup/ajaxLoadMenuGroups",
				expandAll : true,
				autoParam : [ "id", "name", "pId" ],
				chkStyle : "checkbox",
				rule : {
					required : true
				},
				message : {
					required : "请选择至少一项菜单"
				}
			} ]
		};



		function deleteItem(id) {
			bootbox.confirm("确定删除吗？", function(result) {
				if (result) {
					$.ajax({
						type : "POST",
						data : "roleId=" + id,
						dataType : "json",
						url : "./ajaxDelete",
						success : function(data) {
							if (data.status == 1) {
								bootbox.alert("删除成功!");
								grid.reload();
							}else{
								bootbox.alert("删除失败!");
							}
						}
					});
				}
			});
		}
		function deleteItems(ids) {
			if (ids.length > 0) {
				bootbox.confirm("确定删除吗？", function(result) {
					if (result) {
						$.ajax({
							type : "POST",
							data : "roleId=" + ids,
							dataType : "json",
							url : "./ajaxDelete",
							success : function(data) {
								if (data.status == 1) {
									bootbox.alert("删除成功!");
									grid.reload();
								}else{
									bootbox.alert("删除失败!");
								}
							}
						});
					}
				});
			} else {
				bootbox.alert("请选择要删除的选项！");
			}
		}
		
		jQuery(document).ready(function() {
			grid = $("#role_grid").dmGrid(options);
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
