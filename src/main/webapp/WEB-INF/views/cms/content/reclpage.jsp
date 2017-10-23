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
<title>后台管理 | 新闻回收站</title>
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
					<h1>内容信息管理</h1>
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
						<!-- BEGIN PORTLET-->
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">新闻列表</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="content_grid"></div>
						</div>
						<!-- END PORTLET-->
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
	/**********内容操作函数****************/
		jQuery(document).ready(function() {
			grid = $("#content_grid").dmGrid(reclOption);
			
		});
	var reclOption={
			url : "./rlist", // ajax地址
			pageNum : 1,// 当前页码
			pageSize : 5,// 每页显示条数
			idFiled : "id",// id域指定
			showCheckbox : true,// 是否显示checkbox
			checkboxWidth : "3%",
			showIndexNum : true,
			indexNumWidth : "5%",
			pageSelect : [ 2, 15, 30, 50 ],
			cloums : [ {
				title : "标题",
				field : "title" 
			}, {
				title : "来源",
				field : "origin" 
			}, {
				title : "所属频道",
				field : "channelEnName" 
			}  ],
			actionCloumText : "操作",// 操作列文本
			actionCloumWidth : "20%",
			actionCloums : [ {
				text : "预览",
				cls : "green btn-sm",
				icon : "fa fa-search",
				handle : function(index, data) {
					window.open(data.url);
				}
			},{
				text : "还原",
				cls : "green btn-sm",
				icon : "fa fa-search",
				handle : function(index, data) {
					restore(data.id);
				}
			},{
				text : "彻底删除",
				cls : "red btn-sm",
				icon : "fa fa-search",
				handle : function(index, data) {
					deleteItem(data.id);
				}
			} 
			 ],
			/* tools : [ {
				text : " 删 除",
				cls : "btn red btn-sm",// 按钮样式
				handle : function(grid) {
					deleteItems(grid.getSelectIds());
				}
			} ], */
			search : {
				rowEleNum : 2,
				// 搜索栏元素
				items : [ {
					type : "text",
					label : "标题",
					name : "title",
					placeholder : "输入要搜索的内容信息标题"
				} ]
			}
		};
	function deleteItem(ids){
		bootbox.confirm("确认彻底删除?",function(res){
			if(res){
				var url = "./rdelete";
				$.ajax({
					url:url,
					data:{contentId:ids},
					type:'POST',
					success:function(re){
							bootbox.alert(re.msg);
							grid.reload();
					}
				});
					
			}
		});
	}
	function restore(ids){
		bootbox.confirm("确认还原? ",function(res){
			if(res){
		var url = "./restore";
		$.ajax({
			url:url,
			data:{contentId:ids},
			type:'POST',
			success:function(re){
					bootbox.alert(re.msg);
					grid.reload();
			}
		});
	}});
	}
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
