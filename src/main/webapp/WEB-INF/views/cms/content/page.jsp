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
			<div class="container" style="width:1300px;">
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
										<div class="scroller" style="min-height:289px;"
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
     <%--  <script src="<%=basePath%>assets/dmcms/js/interview-about.js"
     type="text/javascript"></script>
      <script src="<%=basePath%>assets/dmcms/js/interview-role.js"
     type="text/javascript"></script>
      <script src="<%=basePath%>assets/dmcms/js/interview-image.js"
     type="text/javascript"></script>
      <script src="<%=basePath%>assets/dmcms/js/interview-record.js"
     type="text/javascript"></script>
	  --%><script type="text/javascript">
	/**********普通内容操作函数****************/
	var hasPublishRole = '${hasPublishRole}';
	var hasShenheRole = '${hasShenheRole}';
	function deleteItems(ids) {
		if (ids.length > 0) {
			bootbox.confirm("确定删除吗？", function(result) {
				var url;
				if (result) {
					if(currentChannelType=='0')
					{
					url = "../content/delete?contentId="+ids;
					}
					else if(currentChannelType=='11')
					{
					url = "../content/delete?contentId="+ids;
					}
					else if(currentChannelType=='4')
					{
						url = "../content/delete?contentId="+ids;
						}
					else if(currentChannelType=='5')
					{
					url = "../video/delete?videoIds=" + ids;	
					}
					else if(currentChannelType=='6')
					{
					url = "../audio/delete?audioIds=" + ids;	
					}
					else if(currentChannelType=='7')
					{
					url = "../novel/delete?novelIds=" + ids;	
					}
					else if(currentChannelType=='8')
					{
					url = "../interview/delete?ids=" + ids;	
					}
					else if(currentChannelType=='9')
					{
					url = "../vote/delete?voteIds=" + ids;	
					}else if(currentChannelType=='10')
					{
						url = "../content/delete?contentId="+ids;
					}
					$.ajax({
						type : "POST",
						dataType : "json",
						url : url,
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
	function sortfun (i,c,title){
		seqModal = $.dmModal({
			id : "seqForm",
			title : "编辑顺序-"+title,
			distroy : true,
			width:"800px"
		});
		seqModal.show();
		if(currentChannelType=='0')
		{
		url = "../content/sort";
		}
		if(currentChannelType=='10')
		{
		url = "../content/sort";
		}
		if(currentChannelType=='11')
		{
		url = "../content/sort";
		}
		else if(currentChannelType=='5')
		{
		url = "../video/sort";	
		}
		else if(currentChannelType=='6')
		{
		url = "../audio/sort";	
		}
		else if(currentChannelType=='7')
		{
		url = "../novel/sort";	
		}
		var seqForm = seqModal.$body.dmForm(getSeqFormOpts(url));
		c.seq = '';
		seqForm.loadLocal(c);
	}
	var seqModal;
	//form
	function getSeqFormOpts(url){
	var seqFormOpts = {
			id : "sort_form",//表单id
			name : "sort_form",//表单名
			method : "post",//表单method
			action : url,//表单action
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
						cls : 'input-xlarge',
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
	return seqFormOpts;
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
	function getcutOrCopyForm(type,url){
		var opt={
				id : "cutOrCopyModal_form",//表单id
				name : "cutOrCopyModal_form",//表单名
				method : "post",//表单method
				action : url,//表单action
				ajaxSubmit : true,//是否使用ajax提交表单
				labelInline : true,
				rowEleNum : 1,
				beforeSubmit : function() {

				},
				ajaxSuccess : function() {
					cutOrCopyModal.hide();
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
						cutOrCopyModal.hide();
					}
				} ],
				buttonsAlign : "center",
				//表单元素
				items : [
						{
							type : 'hidden',
							name : 'ids',
							id : 'ids'
						},
						{
							type : "tree",
							name : "channelId",
							id : "channelId",
							label : "频道",
							url : "../channel/tree?siteId=" + currentSiteId+"&channelType="+currentChannelType,
							autoParam : [ "id", "name", "pId" ],
							expandAll : false,
							chkboxType:{"Y": "s","N": ""},
							beforeCheck:function(treeId, treeNode) {
									if (treeNode.isParent) {
										return false;
									}
							},
							chkStyle : type
						}]	
		};
		return opt;
	}
/****************添加*********************/	
	var modal;
	/* function showForm(contentType,title){
		modal = $.dmModal({
			id : "siteForm",
			title : "添加-"+title,
			distroy : true
		});
		modal.show();
		var formOption;
		if(currentChannelType == '0')
			{
			formOption = getForm(contentType);
			}
		else if(currentChannelType == '5')
		{
		formOption = getVideoForm(contentType);
		}
		else if(currentChannelType == '6')
		{
		formOption = getAudioForm(contentType);
		}
		else if(currentChannelType == '7')
			{
			formOption = getNovelForm(contentType);
			}
		else if(currentChannelType == '8')
		{
		formOption = getInterviewForm(contentType);
		}
		else if(currentChannelType == '9')
		{
		formOption = getVoteForm(contentType);
		}
		else if(currentChannelType == '10')
		{
		formOption = getFileForm(contentType);
		}
		var form = modal.$body.dmForm(formOption);
		form.setValue("channelId", currentChannelId);
		form.setValue("contentType",contentType);
	} */
	function showForm(contentType,title){
		var formOption;
		if(currentChannelType == '0')
		{
		formOption = getForm(contentType,hasPublishRole,hasShenheRole);
		}
		else if(contentType == '2')
		{
			formOption = getForm(contentType,hasPublishRole,hasShenheRole);
		}
	else if(currentChannelType == '5')
	{
	formOption = getVideoForm(contentType,hasPublishRole,hasShenheRole);
	}
	else if(currentChannelType == '6')
	{
	formOption = getAudioForm(contentType,hasPublishRole,hasShenheRole);
	}
	else if(currentChannelType == '7')
		{
		formOption = getNovelForm(contentType,hasPublishRole,hasShenheRole);
		}
	else if(currentChannelType == '8')
	{
	formOption = getInterviewForm(contentType,hasPublishRole,hasShenheRole);
	}
	else if(currentChannelType == '9')
	{
	formOption = getVoteForm(contentType,hasPublishRole,hasShenheRole);
	}
		$("#content_grid").html("");
		form = $("#content_grid").dmForm(formOption);
		form.setValue("channelId", currentChannelId);
		form.setValue("contentType",contentType);
	}
	var form;
	jQuery(document).ready(function() {
		initSelect2Site();
		grid = $("#content_grid").dmGrid(getnewsoption("./list",getnewsoption));
	});
	
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
