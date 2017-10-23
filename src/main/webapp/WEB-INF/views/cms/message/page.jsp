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
<title>后台管理 | 频道管理</title>
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
					</div>

					<div class="col-md-12 col-sm-12">
						<!-- BEGIN PORTLET-->
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">留言列表</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="channel_grid"></div>
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
				title : "标题",
				field : "msgTitle",
				width : "10%"
			}, {
				title : "内容",
				field : "msgContent",
				width : "10%"
			},{
				title : "是否已读",
				field : "isRead",
				width : "3%",
				format:function(i,c){
					if(c.isRead){
						return "已读";
					}
					return "未读";
				}
			},{
				title : "是否已回复",
				field : "isReplied",
				width : "3%",
				format:function(i,c){
					if(c.isReplied){
						return "已回复";
					}
					return "未回复";
				}
			}, {
				title : "状态",
				field : "status",
				width : "5%",
				format : function(i, c) {
					if (c.status=="0") {
						return "未公开";
					}
					if (c.status=="2") {
						return "已公开";
					}
					if (c.status=="9") {
						return "已作废";
					}
					return "- -";
				}
			} ],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "20%",
			actionCloums : [
					{	visable:function(index,data)
						{
						if(data.status==9)
							{
							   return false;
							}
						if(data.isRead){
							return false;
						}
						return true;
						
						},
						text : "标为已读",
						cls : "green btn-sm",
						icon : "fa fa-search",
						handle : function(index, data) {
							setRead(data);
						}
					},{	visable:function(index,data)
						{
						if(data.status==9)
							{
							   return false;
							}
						if(!data.isRead){
							return false;
						}
						return true;
						
						},
						text : "标为未读",
						cls : "yellow btn-sm",
						icon : "fa fa-search",
						handle : function(index, data) {
							setRead(data);
						}
					},  {
						visable:function(index,data)
						{
							if(data.status==9)
								{
								   return false;
								}
							return true;
							
						},
						text : "查看 回复",
						cls : "green btn-sm",
						handle : function(index, data) {
							replyModal(data);
						}
					}
					,  {
						visable:function(index,data)
						{
							if(data.status==9)
								{
								   return false;
								}
							if(data.status==2)
							{
							   return false;
							}
							return true;
							
						},
						text : "公开",
						cls : "green btn-sm",
						handle : function(index, data) {
							publish(data);
						}
					},{
						visable:function(index,data)
						{
							if(data.status==9)
								{
								   return false;
								}
							return true;
							
						},
						text : "废弃",
						cls : "btn red btn-sm",//按钮样式
						handle : function(i,c) {
							deleteItem(c.id);
						}
					}
					],
			
			/* tools : [ {
				text : " 删 除",
				cls : "btn red btn-sm",//按钮样式
				handle : function(grid) {
					deleteItems(grid.getSelectIds());
				}
			} ], */
			search : {
				rowEleNum : 2,
				//搜索栏元素
				items : [ {
					type : "text",
					label : "名称",
					name : "displayName",
					placeholder : "输入要搜索的频道名称"
				} ]
			}
		};
		function setRead(data){
			var url="./toread";
			if(data.isRead){
				url ="./tonotread";
			}
			$.ajax({
				url:url,
				data:{id:data.id},
				success:function(res){
					if(res.status==0){
						alert(res.msg);
					}
					grid.reload();
				}
			});
		}
		function publish(data){
			bootbox.confirm("确定公开吗？", function (result) {
				if(result){
					var url="./publish";
					$.ajax({
						url:url,
						data:{id:data.id},
						success:function(res){
							if(res.status==0){
								alert(res.msg);
							}
							grid.reload();
						}
					});
				}
			});
		}
		function replyModal(data){
			modal = $.dmModal({
				id : "siteForm",
				title : "查看",
				distroy : true
			});
			modal.show();
			var form = modal.$body.dmForm(getFormOptions());
			$.ajax({
				url:"./load",
				data:{msgId:data.id},
				success:function(result){
					var html=$("<div></div>");
					var msgtitle = '<div class="col-md-12"><div class="form-group"><label class="control-label col-md-3">留言标题</label><div class="col-md-9"><p class="form-control-static">'
					+result.msgTitle+'</p></div></div></div>';
					var msgContent='<div class="col-md-12"><div class="form-group"><label class="control-label col-md-3">留言内容</label><div class="col-md-9"><p class="form-control-static">'
					+result.msgContent+'</p></div></div></div>';
					var msgReplies='';
					for(var i=0;i<result.cmsReplys.length;i++){
						var index=i+1;
						msgReplies += '<div class="col-md-12"><div class="form-group"><label class="control-label col-md-3">回复'+index+'</label><div class="col-md-9"><p class="form-control-static">'
						+result.cmsReplys[i].replyContent+'</br>回复时间:'
						+ new Date(parseInt(result.cmsReplys[i].replyDatetime)).toLocaleString().replace(/年|月/g,"-").replace(/日/g," ")
						+'</p></div></div></div>';
					}
					html.append(msgtitle);
					html.append(msgContent);
					html.append(msgReplies);
					$("#form_msg_id").before(html);
					$("#form_msg_id").val(result.id);
				}
			});
		}
		var getFormOptions = function(channelType) {
			var items=[ {
				type : 'hidden',
				name : 'msgId',
				id : 'form_msg_id'
			},{
				type:'hidden',
				name:'channelType',
				id:'channelType'
			} ];
			var eName = {
					type : 'textarea',//类型
					name : 'replyContent',//name
					id : 'replyContent',//id
					label : '回复内容',//左边label
					cls : 'input-large',
					rule : {
						required : true
					},
					message : {
						required : "请输入"
					}
				};
				items.push(eName);
			var formOpts = {
				id : "channel_form",//表单id
				name : "channel_form",//表单名
				method : "post",//表单method
				action : "./reply",//表单action
				ajaxSubmit : true,//是否使用ajax提交表单
				labelInline : true,
				rowEleNum : 1,
				beforeSubmit : function() {

				},
				ajaxSuccess : function() {
					modal.hide();
					grid.reload();
				},
				submitText : "回复",//保存按钮的文本
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
		function deleteItem(id) {
	        bootbox.confirm("确定作废吗？", function (result) {
	            if (result) {
	                $.ajax({
	                    type: "POST",
	                    data: "ids=" + id,
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
		function initSelect2Site() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "../site/selectOptions",
				success : function(data) {
					if (data.length == 0) {
						Metronic.alert({
							message : "<a href='../site/page'>请先新建站点！</a>",
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
		function showForm(title){
			if (currentSiteId == null) {
				alert("请先选择站点！");
				return false;
			}
			modal = $.dmModal({
				id : "siteForm",
				title : title,
				distroy : true
			});
			modal.show();
			var form = modal.$body.dmForm(getFormOptions());
			form.setValue("siteId", currentSiteId);
		}
		function refreshSite() {
			currentSiteId = $("#select2_site").val();
			grid.reload({
				url : "./list?siteId=" + currentSiteId
			});
		}
		jQuery(document).ready(function() {
			initSelect2Site();
			grid = $("#channel_grid").dmGrid(options);
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
