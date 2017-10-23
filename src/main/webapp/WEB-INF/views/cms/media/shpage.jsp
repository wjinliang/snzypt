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
					grid.reload({
						url : "./list?status=1&typeId=" + currentTypeId
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
					},{
						text : "审核通过",
						cls : "green",
						handle : function(i, c) {
							var url = "./publish";
							updateIds(url,"通过",""+c.id);
						}
					}, {
						text : "驳回",
						cls : "yellow",
						handle : function(i, c) {
							var url = "./back";
							updateIds(url,"驳回",""+c.id);
						}
					}
					],
			tools : [//工具属性
			{
				text :"一键通过",
				cls : "btn green",
				handle : function(grid) {
					updateIds(url,"通过",""+c.id);
				}
			}, {
				text : " 一键驳回",
				cls : "btn red ",//按钮样式
				handle : function(grid) {
					updateIds(url,"驳回",""+c.id);
				}
			} ],
			search : {
				rowEleNum : 2,
				//搜索栏元素
				items : [ {
					type : "text",
					label : "标题",
					name : "name",
					placeholder : "输入要搜索的内容信息标题"
				} ]
			}
		};
		function updateIds(url,title,ids){
			if(ids.length>0){
				Metronic.blockUI({target: this.$element});
				$.ajax(
					{url:url+"?ids="+ids,
					type:"POST",
					dataType:"json",
					success:function(res) {
						bootbox.alert(res.msg);
						grid.reload();
						Metronic.unblockUI(this.$element);
					},
					error:function(){
						bootbox.alert("请求异常！");
						Metronic.unblockUI(this.$element);
					}
				});
			} else {
				bootbox.alert("请选择要"+title+"的项！");
			}
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
