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
<title>后台管理 | 部门主要负责人</title>
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
				<%@include file="../../includejsps/toolbar.jsp"%>
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
										class="caption-subject theme-font bold uppercase">部门主要负责人列表</span>
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
    var root = "<%=basePath%>";
		var currentSiteId;

		
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
				title : "部门",
				field : "orgName",
				width : "20%"
			},{
				title : "职务",
				field : "duty",
				width : "20%"
			},{
				title : "负责人",
				field : "person",
				width : "20%"
			},{
				title : "排序",
				field : "seq",
				width : "10%",
			}
			],
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
/* 					modal = $.dmModal({
						id : "siteForm",
						title : "添加",
						distroy : true
					});
					modal.show();
					var form = modal.$body.dmForm(getFormOptions()); */
					$("#org_person_grid").html("");
					var form = $("#org_person_grid").dmForm(formOpts);
				}
			} ]
		};
		function replyModal(data){
			/* modal = $.dmModal({
				id : "siteForm",
				title : "修改",
				distroy : true
			});
			modal.show(); 
			
			var form = modal.$body.dmForm(getFormOptions());
			form.loadRemote("./load?id="+data.id);*/
			$("#org_person_grid").html("");
			var form = $("#org_person_grid").dmForm(formOpts);
			form.loadRemote("./load?id="+data.id)
		}
		
		
			var formOpts = {
				id : "channel_form",//表单id
				name : "channel_form",//表单名
				method : "post",//表单method
				action : "./insertOrUpdate",//表单action
				ajaxSubmit : true,//是否使用ajax提交表单
				labelInline : true,
				rowEleNum : 1,
				beforeSubmit : function() {

				},
				ajaxSuccess : function() {
					reGrid();
				},
				submitText : "提交",//保存按钮的文本
				isValidate : true,//开启验证
				buttons : [ {
					type : 'button',
					text : '关闭',
					handle : function() {
						reGrid();
					}
				} ],
				buttonsAlign : "center",
				//表单元素
				items : [ {
					type : 'hidden',
					name : 'id',
					id : 'id'
				},{
					type:"select",
					name:"orgId",
					id :"orgId",
					cls : 'input-xlarge',
					label:"部门",
					items:[{text:"请选择",value:""}],
					itemsUrl:"./orgoption",
					rule : {
						required : true
					},
					message : {
						required : "请选择部门"
					}
				},{
					type : 'text',//类型
					name : 'duty',//name
					id : 'duty',//id
					label : '职务',//左边label
					cls : 'input-xlarge',
					rule : {
						required : true
					},
					message : {
						required : "请输入职务"
					}
				},
					{
						type : 'text',//类型
						name : 'person',//name
						id : 'person',//id
						label : '负责人',//左边label
						cls : 'input-xlarge',
						rule : {
							required : true
						},
						message : {
							required : "请输入负责人"
						}
					},
					{
						type : 'text',//类型
						name : 'seq',//name
						id : 'seq',//id
						label : '排序',//左边label
						cls : 'input-xlarge',
						rule : {
							required : true,
							number:true
						},
						message : {
							required : "请输入排序号",
							number:"请输入正确的排序号"
						}
					}]
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
		
		jQuery(document).ready(function() {
			grid = $("#org_person_grid").dmGrid(options);
		});
		function reGrid(){
			$("#org_person_grid").html('');
			grid = $("#org_person_grid").dmGrid(options);
		}
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
