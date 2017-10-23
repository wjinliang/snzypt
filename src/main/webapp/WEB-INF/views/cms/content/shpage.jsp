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
<script src="<%=basePath%>assets/dmcms/js/news-form-grid.js"
	     type="text/javascript"></script>
	<script src="<%=basePath%>assets/dmcms/js/video-form-grid.js"
	     type="text/javascript"></script>
	<script src="<%=basePath%>assets/dmcms/js/novel-form-grid.js"
     type="text/javascript"></script>
     <script src="<%=basePath%>assets/dmcms/js/audio-form-grid.js"
     type="text/javascript"></script>
      <script src="<%=basePath%>assets/dmcms/js/interview-form-grid.js"
     type="text/javascript"></script>
      <script src="<%=basePath%>assets/dmcms/js/vote-form-grid.js"
     type="text/javascript"></script>
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
				<div class="row margin-top-10">
					<div class="col-md-3 col-sm-12">
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<!-- BEGIN PORTLET-->
								<div class="portlet light">
									<div class="portlet-title">
										<div class="caption caption-md">
											<i class="icon-bar-chart theme-font hide"></i> <span
												class="caption-subject theme-font bold uppercase">选择站点</span>
											<span class="caption-helper"></span>
										</div>
										<div class="actions">
											<div class="btn-group btn-group-devided"
												data-toggle="buttons">
												<label
													class="btn btn-transparent grey-salsa btn-circle btn-sm active"
													onclick="refreshSite()"> <input name="options"
													class="toggle" id="option1" type="radio">刷新
												</label>
											</div>
										</div>
									</div>
									<div class="portlet-body form">
										<form action="javascript:;"
											class="form-horizontal form-row-sepe">
											<div class="form-body">
												<div class="form-group">
													<div class="col-md-12">
														<div class="input-group">
															<select name="select2_site" id="select2_site"
																class="form-control input-medium-me select2me"
																data-placeholder="请选择站点...">
															</select>
															<!-- <span class="input-group-addon" onclick="refreshSite()"
																style="cursor:pointer"> <i class="fa fa-refresh"></i>刷新
															</span> -->
														</div>
													</div>

												</div>
											</div>
										</form>
									</div>
								</div>
								<!-- END PORTLET-->
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<!-- BEGIN PORTLET-->
								<div class="portlet light">
									<div class="portlet-title">
										<div class="caption caption-md">
											<i class="icon-bar-chart theme-font hide"></i> <span
												class="caption-subject theme-font bold uppercase">频道树</span>
											<span class="caption-helper"></span>
										</div>
									</div>
									<div class="portlet-body">
										<div class="scroller" style="height:289px;"
											id="channel_tree_div" data-always-visible="1"
											data-rail-visible="1">
											<ul id="channel_tree" class="ztree"></ul>
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
										class="caption-subject theme-font bold uppercase">内容信息管理</span>
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
	<%@include file="../../includejsps/foot.jsp"%>
	<!-- END FOOTER-->
	<!-- BEGIN JAVASCRIPTS-->
	<%@include file="../../includejsps/js.jsp"%>
	<%@include file="../../includejsps/plugin-js.jsp"%>
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/select2/select2.min.js"></script>
	<script src="<%=basePath%>assets/dmcms/js/check-grid.js"
	     type="text/javascript"></script>
    <script type="text/javascript">	
	/**********内容操作函数****************/
		var root = '<%=basePath%>';
		var grid;
		var options;
		var channelTree;
		var currentSiteId;
		var currentChannelId;
		var currentChannelType;
		var currentChannelTypeName = "";
		var currentChannelTypeTitleName = "title";
		var base = "../content";

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
				beforeAsync : function(treeId, treeNode) {
					if (typeof (currentSiteId) == "undefined") {
						return false;
					} else {
						return true;
					}
				},
				onAsyncSuccess : function(event, treeId, treeNode, msg) {
					if (msg.length == 0) {
						Metronic.alert({
							message : "该频道下暂无频道！",
							type : "warning",
							container : "#channel_tree_div",
							place : "prepend",
							close : false,
							closeInSeconds : 5
						});
					}
					channelTree.expandAll(false);
				},
				onClick : function(event, treeId, treeNode) {
					currentChannelId = treeNode.id;
					if (currentChannelType == treeNode.type) {
						if (currentChannelType == '0') {
							grid.reload({
								url : "./list?status=1&channelId=" + currentChannelId
							});
						}else if (currentChannelType == '11') {
							grid.reload({
								url : "./list?status=1&channelId=" + currentChannelId
							});
						} else if (currentChannelType == '5') {
							grid.reload({
								url : "../video/list?status=1&channelId=" + currentChannelId
							});
						} else if (currentChannelType == '6') {
							grid.reload({
								url : "../audio/list?status=1&channelId=" + currentChannelId
							}); 
						}
						else if (currentChannelType == '7') {
							grid.reload({
								url : "../novel/list?status=1&channelId=" + currentChannelId
							});
					  }
						else if (currentChannelType == '8') {
							grid.reload({
								url : "../interview/list?status=1&channelId=" + currentChannelId
							});
					  }
						else if (currentChannelType == '9') {
							grid.reload({
								url : "../vote/list?status=1&channelId=" + currentChannelId
							});
					  }else if (currentChannelType == '10') {
							grid.reload({
								url : "./liszt?status=1&channelId=" + currentChannelId
							});
					  }
					}else {
						currentChannelType = treeNode.type;
						reBulidGrid(currentChannelType);
					}
				}
		}
	};
		function reBulidGrid(currentChannelType){
			if (currentChannelType == '0') {
				$("#content_grid").html("");
				options.url = "./list?status=1&channelId=" + currentChannelId;
				grid = $("#content_grid").dmGrid(options);
			} else if (currentChannelType == '11') {
				$("#content_grid").html("");
				options.url = "./list?status=1&channelId=" + currentChannelId;
				grid = $("#content_grid").dmGrid(options);
			} else if (currentChannelType == '5') {
				$("#content_grid").html("");
				videoOptions.url = "../video/list?status=1&channelId="
						+ currentChannelId;
				grid = $("#content_grid").dmGrid(videoOptions);
			} else if (currentChannelType == '6') {
				$("#content_grid").html("");
				audioOptions.url = "../audio/list?status=1&channelId="
						+ currentChannelId;
				grid = $("#content_grid").dmGrid(audioOptions);
			} 
			else if (currentChannelType == '7') {
				$("#content_grid").html("");
				novelOptions.url = "../novel/list?status=1&channelId="
						+ currentChannelId;
				grid = $("#content_grid").dmGrid(novelOptions);
			}
			else if (currentChannelType == '8') {
				$("#content_grid").html("");
				interviewOptions.url = "../interview/list?status=1&channelId=" + currentChannelId;
				grid = $("#content_grid").dmGrid(interviewOptions);
					
		  }
			else if (currentChannelType == '9') {
				$("#content_grid").html("");
				voteOptions.url =  "../vote/list?status=1&channelId=" + currentChannelId;
				grid = $("#content_grid").dmGrid(voteOptions);
		  }
			else if (currentChannelType == '10') {
				$("#content_grid").html("");
				fileoptions.url =  "../content/list?status=1&channelId=" + currentChannelId;
				grid = $("#content_grid").dmGrid(fileoptions);
		  }
		}
		function initSelect2Site() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "../site/selectOptions",
				success : function(data) {
					if (data.length == 0) {
						Metronic.alert({
							message : "<a href='../site/page'>请先新建频道！</a>",
							type : "warning",
							container : "#channel_tree_div",
							place : "prepend",
							close : true
						});
					}
					$.each(data, function(i, o) {
						var option = $("<option></option>");
						option.text(o.text);
						option.attr("value", o.value);
						$("#select2_site").append(option);
					});
					if (data.length > 0) {
						refreshSite();
					}
					$("#select2_site").change(function() {
						refreshSite();
					});
					$("#select2_site").select2({
						allowClear : true
					});
				}
			});
		}
		function refreshSite() {
			if (typeof (channelTree) == "undefined") {
				$.fn.zTree.init($("#channel_tree"), channelSetting, "");
				channelTree = $.fn.zTree.getZTreeObj("channel_tree");
			}
			currentSiteId = $("#select2_site").val();
			channelTree.setting.async.url = "../channel/tree?siteId="
					+ currentSiteId;
			channelTree.reAsyncChildNodes(null, "refresh");
		}
			
		function check(url,ids) {
			if (ids.length > 0 || ids>0) {
				Metronic.blockUI({
					target : this.$element
				});
				$.ajax({
					url : url,
					type : "POST",
					dataType : "json",
					success : function(res) {
						bootbox.alert(res.msg);
						grid.reload();
						Metronic.unblockUI(this.$element);
					},
					error : function() {
						bootbox.alert("请求异常！");
						Metronic.unblockUI(this.$element);
					}
				});
			} else {
				bootbox.alert("请先进行选择！");
			}
		}
		jQuery(document).ready(function() {
			initSelect2Site();
			grid = $("#content_grid").dmGrid(allOptions);
		});
		
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
