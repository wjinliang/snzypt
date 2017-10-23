<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%> --%>
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
<title>后台管理 | 配置</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<%-- <link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/select2/select2.css" />
<%@include file="../../includejsps/style.jsp"%>
<%@include file="../../includejsps/plugin-style.jsp"%> --%>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
	<!-- BEGIN HEADER -->

	<%-- <%@include file="../../includejsps/head.jsp"%>
	<!-- END HEADER -->
	<!-- BEGIN PAGE CONTAINER -->
	<div class="page-container">
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
										class="caption-subject theme-font bold uppercase">访谈配置</span>
									<span class="caption-helper"></span>
								</div>
							</div>--%>
							<div class="portlet-body" >
								
							<div class="tabbable tabs-left">
								<ul class="nav nav-tabs">
									<li class="active">
										<a href="#tab_6_1" data-toggle="tab">
										基本信息 </a>
									</li>
									<li>
										<a href="#tab_6_2" data-toggle="tab">
										相关信息 </a>
									</li>
									<li>
										<a href="#tab_6_3" data-toggle="tab">
										 访谈图片</a>
									</li>
									<!-- <li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">
										Dropdown <i class="fa fa-angle-down"></i>
										</a>
										<ul class="dropdown-menu" role="menu">
											<li>
												<a href="#tab_6_3" tabindex="-1" data-toggle="tab">
												Option 1 </a>
											</li>
											<li>
												<a href="#tab_6_4" tabindex="-1" data-toggle="tab">
												Option 2 </a>
											</li>
											<li>
												<a href="#tab_6_3" tabindex="-1" data-toggle="tab">
												Option 3 </a>
											</li>
											<li>
												<a href="#tab_6_4" tabindex="-1" data-toggle="tab">
												Option 4 </a>
											</li>
										</ul>
									</li> -->
									<li>
										<a href="#tab_6_4" data-toggle="tab">
										角色设置 </a>
									</li>
									<li>
										<a href="#tab_6_5" data-toggle="tab">
										访谈实录 </a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab_6_1"><!-- 基本信息 -->
										<!-- <div class="alert alert-danger">
											 Test
										</div> -->
										<p>
											
										<!-- BEGIN FORM-->
										<form action="#" class="form-horizontal" id="interviewForm">
											<div class="form-body">
												<div class="form-group">
												<input type="hidden" name="channelId" value="${model.channelId }"/>
												<input type="hidden" id="interviewId" name="id" value="${model.id }"/>
													<label class="col-md-3 control-label">主题</label>
													<div class="col-md-6">
														<input name="title" class="form-control" placeholder="主题信息" value="${model.title }" type="text">
														<span class="help-block">
														 </span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">主题说明</label>
													<div class="col-md-6">
														<input name="desc" class="form-control" placeholder="主题说明"value="${model.desc }" type="text">
														<span class="help-block">
														 </span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">开始时间</label>
													<div class="col-md-6">
														<input role="date-picker" name="startTime" value="${model.startTime}" class="form-control" placeholder="访谈开始时间" type="text">
														<span class="help-block">
														 </span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">结束时间</label>
													<div class="col-md-6">
														<input role="date-picker1" name="endTime" value="${model.endTime}" class="form-control" placeholder="访谈结束时间" type="text">
														<span class="help-block">
														 </span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">嘉宾</label>
													<div class="col-md-6">
														<input name="guests" value="${model.guests }" class="form-control" placeholder="嘉宾" type="text">
														<span class="help-block">
														 </span>
													</div>
												</div>
												<c:if test="${empty model.filed2}">
													<input type="hidden" value="0" name="filed2"/>
												</c:if>
												<c:if test="${model.filed2=='0'}"><!-- 录入 -->
												<div class="form-group last">
													<label class="col-md-3 control-label">类型</label>
													<div class="col-md-6">
														<p class="form-control-static">
															 后台录入
														</p>
													</div>
												</div>
												</c:if>
												<c:if test="${model.filed2=='1'}" ><!-- 申请 -->
												<div class="form-group last">
													<label class="col-md-3 control-label">申请单位</label>
													<div class="col-md-6">
														<p class="form-control-static">
															 ${model.proposerOrg }
														</p>
													</div>
												</div>
												<div class="form-group last">
													<label class="col-md-3 control-label">联系电话</label>
													<div class="col-md-6">
														<p class="form-control-static">
															 ${nodel.proposerPhone }
														</p>
													</div>
												</div>
												<div class="form-group last">
													<label class="col-md-3 control-label">联系人姓名</label>
													<div class="col-md-6">
														<p class="form-control-static">
															  ${nodel.proposer}
														</p>
													</div>
												</div>
												<div class="form-group last">
													<label class="col-md-3 control-label">申请时间</label>
													<div class="col-md-6">
														<p class="form-control-static">
															
												<fmt:formatDate value="${nodel.createTime }" pattern="yyyy-MM-dd"/>
														</p>
													</div>
												</div>
												<div class="form-group last">
													<label class="col-md-3 control-label">地址</label>
													<div class="col-md-6">
														<p class="form-control-static">
															 ${nodel. porposerAddress}
														</p>
													</div>
												</div>
												<div class="form-group last">
													<label class="col-md-3 control-label">联系邮箱</label>
													<div class="col-md-6">
														<p class="form-control-static">
															 ${nodel.filed1}
														</p>
													</div>
												</div>
												</c:if>
											</div>
											<div class="form-actions">
												<div class="row">
													<div class="col-md-offset-3 col-md-9">
														<button type="button" onclick="subInterview();" class="btn green">提交</button><!--  
														<button type="button" class="btn default"></button>-->
													</div>
												</div>
											</div>
										</form>
										<!-- END FORM-->
									
										</p>
									</div>
									<div class="tab-pane fade" id="tab_6_2">
										<p>
										<div class="portlet light">
											<div class="portlet-body" id="about_grid"></div>
										</div>
											</p>
									</div>
									<div class="tab-pane fade" id="tab_6_3">
										<p>
										<div class="portlet light">
											<div class="portlet-body" id="image_grid"></div>
										</div>
										</p>
									</div>
									<div class="tab-pane fade" id="tab_6_4">
										<p>
											<div class="portlet light">
											<div class="portlet-body" id="role_grid"></div>
										</div>

										</p>
									</div>
									<div class="tab-pane fade" id="tab_6_5">
										<p>
										<div class="portlet light">
											<div class="portlet-body" id="record_grid"></div>
										</div>

										</p>
									</div>
								</div>
							</div>
						
							 </div>
     							 
<script type="text/javascript">
	var subInterview = function(){
		var data = $('#interviewForm').serialize();
		$.ajax({
			url:"../interview/insertOrUpdate",
			data:data,
			type:"POST",
			success:function(res){
				if(res.status==1){
					bootbox.alert("操作成功");
					currentInterviewId=res.interviewId;
				}else{
					bootbox.alert("操作失败");
				}
			},
			error:function(){
				bootbox.alert("操作异常");
			}
			
		});
	}
	var in_modal;
	var currentInterviewId='';
	jQuery(document).ready(function() {
		$('input[role="date-picker"]').on("click", function () {
            laydate({
                istime: true,
                format: 'YYYY-MM-DD hh:mm:ss'
            });
        });
		$('input[role="date-picker1"]').on("click", function () {
            laydate({
                istime: true,
                format: 'YYYY-MM-DD hh:mm:ss'
            });
        });
		currentInterviewId='${model.id}';
		about_grid = $("#about_grid").dmGrid(aboutoptions(currentInterviewId));
		image_grid = $("#image_grid").dmGrid(imageoptions(currentInterviewId));
		role_grid = $("#role_grid").dmGrid(roleoptions(currentInterviewId));
		record_grid = $("#record_grid").dmGrid(recordoptions(currentInterviewId));
	});
	
	function aboutoptions(id){
		var option = {
			url : "../interview/listAbout?interviewId="+id,//${model.id}", // ajax地址
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
				field : "title",
				width : "20%"
			}, {
				title : "新闻地址",
				field : "url",
				width : "10%"
				
			}],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "20%",
			actionCloums : [
					 {
						text : "编辑",
						cls : "green btn-sm",
						handle : function(index, data) {
							inFoMode(aboutFormOpt,data);
							
						}
					}
					,{
						
						text : "删除",
						cls : "btn red btn-sm",//按钮样式
						handle : function(i,c) {
							$.ajax({
								url:"../interview/deleteAbout?aboutId="+c.id,
								type:'POST',
								success:function(res){
									if(res.status==1)
										about_grid.reload();
									else{
										bootbox.alert("操作失败");
									}
								},
								error:function(){
									bootbox.alert('异常');
								}
							})
						}
					}
					],
			
			 tools : [ {
				text : "添加",
				cls : "btn green btn-sm",//按钮样式
				handle : function(grid) {
					if(currentInterviewId==''){
						bootbox.alert('请先添加基本信息!');
						return false;
					}
					inFoMode(aboutFormOpt,{interviewId:currentInterviewId});
				}
			} ]
			
	};
		return option;
	}
	var aboutFormOpt = {
					id : "channel_form",//表单id
					name : "channel_form",//表单名
					method : "post",//表单method
					action : "../interview/insertOrUpdateAbout",//表单action
					ajaxSubmit : true,//是否使用ajax提交表单
					labelInline : true,
					rowEleNum : 1,
					beforeSubmit : function() {

					},
					ajaxSuccess : function() {
						in_modal.hide();
						about_grid.reload();
					},
					submitText : "提交",//保存按钮的文本
					isValidate : true,//开启验证
					buttons : [ {
						type : 'button',
						text : '关闭',
						handle : function() {
							in_modal.hide();
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
						name : 'interviewId',
						id : 'interviewId'
					},{
							type : 'text',//类型
							name : 'title',//name
							id : 'title',//id
							label : '名称',//左边label
							cls : 'input-large',
							rule : {
								required : true
							},
							message : {
								required : "请输入"
							}
						}
					,{
						type : 'text',//类型
						name : 'url',//name
						id : 'url',//id
						label : '链接地址',//左边label
						cls : 'input-large',
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}
					}]
				};

	var about_grid;
	function imageoptions(id){
		var opt={

			url : "../interview/listImage?interviewId="+id, // ajax地址
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
				field : "title",
				width : "20%"
			},{
				title : "图片",
				field : "",
				width : "20%",
				format:function(i,c){
					if(c.imgUrl=='null' ||c.imgUrl==null || c.imgUrl==''){
						return '[暂无]';
					}
					return '<image alt="图片" src="'+c.imgUrl+'" title="'+c.titile+'" style="height:40px;"/>';
				}
			} ],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "20%",
			actionCloums : [
					 {
						text : "编辑",
						cls : "green btn-sm",
						handle : function(index, data) {
							inFoMode(imageFormOpt,data);
						}
					}
					,{
						
						text : "删除",
						cls : "btn red btn-sm",//按钮样式
						handle : function(i,c) {
							bootbox.confirm("确定删除?",function(r){
								if(r){
							$.ajax({
								url:"../interview/deleteImage?imageId="+c.id,
								type:'POST',
								success:function(res){
									if(res.status==1)
										image_grid.reload();
									else{
										bootbox.alert("操作失败");
									}
								},
								error:function(){
									bootbox.alert('异常');
								}
							})
								}
							})
						}
					}
					],
			
			 tools : [ {
				text : "添加",
				cls : "btn green btn-sm",//按钮样式
				handle : function(grid) {
					if(currentInterviewId==''){
						bootbox.alert('请先添加基本信息!');
						return false;
					}
					inFoMode(imageFormOpt,{interviewId:currentInterviewId});
				}
			} ]
		};
		return opt;
	}
	function inFoMode(aboutFormOpt,data){
		in_modal = $.dmModal({
			id : "siteForm",
			title : "添加",
			height:"500px",
			width:"800px",
			distroy : true
		});
		in_modal.show();
		var form = in_modal.$body.dmForm(aboutFormOpt);
		form.loadLocal(data);
	}
	var imageFormOpt = {
			id : "channel_form",//表单id
			name : "channel_form",//表单名
			method : "post",//表单method
			action : "../interview/insertOrUpdateImage",//表单action
			ajaxSubmit : true,//是否使用ajax提交表单
			labelInline : true,
			rowEleNum : 1,
			beforeSubmit : function() {

			},
			ajaxSuccess : function() {
				in_modal.hide();
				image_grid.reload();
			},
			submitText : "提交",//保存按钮的文本
			isValidate : true,//开启验证
			buttons : [ {
				type : 'button',
				text : '关闭',
				handle : function() {
					in_modal.hide();
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
				name : 'interviewId',
				id : 'interviewId'
			},{
					type : 'text',//类型
					name : 'title',//name
					id : 'title',//id
					label : '标题',//左边label
					cls : 'input-large',
					rule : {
						required : true
					},
					message : {
						required : "请输入"
					}
				}
			,{	type : 'image',
				id : 'imgUrl',
				name : 'imgUrl',
				label : '图片',
				isAjaxUpload : true,
				autoUpload : true,
				uploadUrl : '../attachment/singleUpload',
				onSuccess : function(data) {
					if (data.status == "1") {
						$("#imgUrl")
								.attr("value", data.attachment.attachmentUrl);
					} else {
						alert(data.msg);
					}
				},
				deleteHandle : function() {
					$("#imgUrl").attr("value", "");
				}
				}]
		};
	//var in_model;
	var image_grid;
	;
	function roleoptions(id){
		var o={
			url : "../interview/listRole?interviewId="+id, // ajax地址
			pageNum : 1,//当前页码
			pageSize : 10,//每页显示条数
			idFiled : "id",//id域指定
			showCheckbox : true,//是否显示checkbox
			checkboxWidth : "3%",
			showIndexNum : false,
			indexNumWidth : "5%",
			pageSelect : [ 2, 15, 30, 50 ],
			cloums : [ 
			{
				title : "角色",
				field : "roleName",
				width : "20%"
			},{
				title : "姓名",
				field : "personName",
				width : "10%"
				
			} ],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "20%",
			actionCloums : [
					 {
						text : "编辑",
						cls : "green btn-sm",
						handle : function(index, data) {

							inFoMode(roleFormOpt,data);
						}
					}
					,{
						
						text : "删除",
						cls : "btn red btn-sm",//按钮样式
						handle : function(i,c) {
							bootbox.confirm("确定删除?",function(r){
								if(r){
							$.ajax({
								url:"../interview/deleteRole?roleId="+c.id,
								type:'POST',
								success:function(res){
									if(res.status==1)
										role_grid.reload();
									else{
										bootbox.alert("操作失败");
									}
								},
								error:function(){
									bootbox.alert('异常');
								}
							})
								}
							})
						}
					}
					],
			
			 tools : [ {
				text : "添加",
				cls : "btn green btn-sm",//按钮样式
				handle : function(grid) {

					inFoMode(roleFormOpt,{interviewId:currentInterviewId});
				}
			} ]	
	};
		return o;
	}
	var roleFormOpt = {
					id : "channel_form",//表单id
					name : "channel_form",//表单名
					method : "post",//表单method
					action : "../interview/insertOrUpdateRole",//表单action
					ajaxSubmit : true,//是否使用ajax提交表单
					labelInline : true,
					rowEleNum : 1,
					beforeSubmit : function() {

					},
					ajaxSuccess : function() {
						in_modal.hide();
						role_grid.reload();
					},
					submitText : "提交",//保存按钮的文本
					isValidate : true,//开启验证
					buttons : [ {
						type : 'button',
						text : '关闭',
						handle : function() {
							in_modal.hide();
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
						name : 'interviewId',
						id : 'interviewId'
					},{
							type : 'text',//类型
							name : 'roleName',//name
							id : 'roleName',//id
							label : '角色',//左边label
							cls : 'input-large',
							rule : {
								required : true
							},
							message : {
								required : "请输入"
							}
						}
					,{
						type : 'text',//类型
						name : 'personName',//name
						id : 'personName',//id
						label : '姓名',//左边label
						cls : 'input-large',
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}
					
						}]
				};
	//var in_model;
	var role_grid;
	function recordoptions(id){
			var op={
			url : "../interview/listRecord?interviewId="+id, // ajax地址
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
				title : "发言人",
				field : "roleId",
				width : "20%"
			},{
				title : "发言时间",
				field : "createTime",
				width : "20%"
			},{
				title:"内容",
				field :"content",
				width:"20%"
				
			}
			 ],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "20%",
			actionCloums : [
					 {
						text : "编辑",
						cls : "green btn-sm",
						handle : function(index, data) {
							inFoMode(recordFormOpt(currentInterviewId),data);
						}
					}
					,{
						
						text : "删除",
						cls : "btn red btn-sm",//按钮样式
						handle : function(i,c) {
							bootbox.confirm("确定删除?",function(r){
								if(r){
							$.ajax({
								url:"../interview/deleteRecord?recordId="+c.id,
								type:'POST',
								success:function(res){
									if(res.status==1)
										role_grid.reload();
									else{
										bootbox.alert("操作失败");
									}
								},
								error:function(){
									bootbox.alert('异常');
								}
							})
								}
							})
						}
					}
					],
			
			 tools : [ {
				text : "添加",
				cls : "btn green btn-sm",//按钮样式
				handle : function(grid) {
					inFoMode(recordFormOpt(currentInterviewId),{interviewId:currentInterviewId});
				}
			} ]
			
	};
			return op;
	}
	function recordFormOpt (id) {
		var opt ={
					id : "channel_form",//表单id
					name : "channel_form",//表单名
					method : "post",//表单method
					action : "../interview/insertOrUpdateRecord",//表单action
					ajaxSubmit : true,//是否使用ajax提交表单
					labelInline : true,
					rowEleNum : 1,
					beforeSubmit : function() {

					},
					ajaxSuccess : function() {
						in_modal.hide();
						record_grid.reload();
					},
					submitText : "提交",//保存按钮的文本
					isValidate : true,//开启验证
					buttons : [ {
						type : 'button',
						text : '关闭',
						handle : function() {
							in_modal.hide();
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
						name : 'interviewId',
						id : 'interviewId'
					},{
							type : 'text',//类型
							name : 'content',//name
							id : 'content',//id
							label : '内容',//左边label
							cls : 'input-large',
							rule : {
								required : true
							},
							message : {
								required : "请输入"
							}
						}
					,{
						type : 'radioGroup',//类型
						name : 'roleId',//name
						id : 'roleId',//id
						label : '发言人',//左边label
						cls : 'input-large',
						item:[],
						itmeUrl:"../interview/loadRolesRadio?interviewId="+id,
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}
					}
					,{	type : 'datepicker',//类型
						name : 'publishTime',//name
						id : 'publishTime',//id
						label : '发布时间',//左边label
						cls : 'input-large',
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}
						}]
				};
		return opt;
	}
	//var in_model;
	var record_grid;

	</script>
						
</body>
<!-- END BODY -->
</html>
