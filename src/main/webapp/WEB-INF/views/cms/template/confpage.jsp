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
<title>后台管理 | 模板设置</title>
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
					<h1>模板设置</h1>
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
                                            <div class="btn-group btn-group-devided" data-toggle="buttons">
                                                <label class="btn btn-transparent grey-salsa btn-circle btn-sm active" onclick="refreshSite()">
                                                    <input name="options" class="toggle" id="option1" type="radio">刷新
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
															</select> <!-- <span class="input-group-addon" onclick="refreshSite()"
																style="cursor:pointer"> <i class="fa fa-refresh"></i>刷新 
															</span>-->
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
										<div class="scroller"  style="height:289px;"
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
										class="caption-subject theme-font bold uppercase">设置默认模板</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="channel_conf"></div>
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
		var channelTree;
		var currentSiteId;
		var currentChannelId;

		var channelSetting = {
			view : {
				showIcon : false,
				selectedMulti : false
			},
			edit : {
				drag:{
					isCopy: false,
					isMove:false,
					prev:false,
					next:false,
					inner:false
				},
				enable : true,
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
					$("#channel_conf").html('');
		 			form = $("#channel_conf").dmForm(getFormOptions(2));
		 			form.loadRemote("./loadconf?channelId=" + currentChannelId);
				}
			}
		};
		var grid;
		var getFormOptions = function(type) {
			var siteTemplate = {
					type : 'select',
					name : 'siteTemplateId',
					id : 'siteTemplateId',
					label : '默认站点模板',
					cls : 'input-large',
					items : [ {
						value : '',
						text : '请选择'
					} ],
					itemsUrl : "../template/selects?templateType=0",
					rule : {
						required : true
					},
					message : {
						required : "请选择模板"
					}};
			var items=[ {
				type : 'hidden',
				name : 'siteId',
				id : 'siteId'
			},{
				type : 'hidden',
				name : 'channelId',
				id : 'channelId'
			}, {
				type : 'select',
				name : 'channelTemplateId',
				id : 'channelTemplateId',
				label : '默认频道模板',
				cls : 'input-large',
				items : [ {
					value : '',
					text : '请选择'
				} ],
				itemsUrl : "../template/selects?templateType=1&siteId="+currentSiteId,
				rule : {
					required : true
				},
				message : {
					required : "请选择页面模板"
				}
			}, {
				type : 'select',
				name : 'contentTemplateId',
				id : 'contentTemplateId',
				label : '默认内容模板',
				cls : 'input-large',
				items : [ {
					value : '',
					text : '请选择'
				} ],
				itemsUrl : "../template/selects?templateType=2&siteId="+currentSiteId,
				rule : {
					required : true
				},
				message : {
					required : "请选择页面模板"
				}
			}];
			var formOpts = {
				id : "channel_form",//表单id
				name : "channel_form",//表单名
				method : "post",//表单method
				action : "./set",//表单action
				ajaxSubmit : true,//是否使用ajax提交表单
				labelInline : true,
				rowEleNum : 1,
				beforeSubmit : function() {

				},
				ajaxSuccess : function(data) {
					if(data.status=='1'){
						bootbox.alert("更新成功!");
					}else{
						bootbox.alert("操作失败，请重试!");
					}
				},
				submitText : "更新",//保存按钮的文本
				showReset : false,//是否显示重置按钮
				isValidate : true,//开启验证
				buttonsAlign : "center",
				//表单元素
				items : items
			};
			return formOpts;
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
			channelTree.setting.async.url = "../channel/tree?siteId=" + currentSiteId;
			channelTree.reAsyncChildNodes(null, "refresh");
			$("#channel_conf").html('');
 			form = $("#channel_conf").dmForm(getFormOptions(1));
 			form.loadRemote("./loadconf?siteId=" + currentSiteId);
		}
		jQuery(document).ready(function() {
			initSelect2Site();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
