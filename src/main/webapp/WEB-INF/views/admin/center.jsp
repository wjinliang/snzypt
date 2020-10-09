<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c" %>
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
    <meta charset="utf-8"/>
    <title>基础平台管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@include file="../includejsps/style.jsp" %>
    <%@include file="../includejsps/plugin-style.jsp" %>
    <link href="<%=basePath%>assets/admin/pages/css/profile.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>assets/admin/pages/css/tasks.css" rel="stylesheet" type="text/css"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER -->
<%@include file="../includejsps/head.jsp" %>
		<div class="page-container">
			<!-- BEGIN PAGE CONTAINER-->
			
		<div class="container">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<!-- <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
							<h4 class="modal-title">Modal title</h4>
						</div>
						<div class="modal-body">
							 Widget settings form goes here
						</div>
						<div class="modal-footer">
							<button type="button" class="btn blue">Save changes</button>
							<button type="button" class="btn default" data-dismiss="modal">Close</button>
						</div>
					</div>
					/.modal-content
				</div>
				/.modal-dialog
			</div> -->
			<!-- /.modal -->
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<!-- BEGIN PAGE BREADCRUMB -->
			
			<!-- END PAGE BREADCRUMB -->
			<!-- BEGIN PAGE CONTENT INNER -->
			<div class="row profile">
				<div class="col-md-12">
					<!--BEGIN TABS-->
					<div class="tabbable tabbable-custom tabbable-noborder">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#tab_1_3" data-toggle="tab">
								个人账户 </a>
							</li>
							<li>
								<a href="#tab_1_6" data-toggle="tab">
								帮助 </a>
							</li>
						</ul>
						<div class="tab-content">
							<!--tab_1_2-->
							<div class="tab-pane active" id="tab_1_3">
								<div class="row profile-account">
									<div class="col-md-3">
										<ul class="ver-inline-menu tabbable margin-bottom-10">
											<li class="active">
												<a data-toggle="tab" href="#tab_1-1">
												<i class="fa fa-cog"></i> 账户信息 </a>
												<span class="after">
												</span>
											</li>
											<li class="">
												<a data-toggle="tab" href="#tab_2-2">
												<i class="fa fa-picture-o"></i>更改头像 </a>
											</li>
											<li>
												<a data-toggle="tab" href="#tab_3-3">
												<i class="fa fa-lock"></i>更改密码 </a>
											</li>
										</ul>
									</div>
									<div class="col-md-9">
										<div class="tab-content">
											<div id="tab_1-1" class="tab-pane active">
												<form role="form" id="userInfoForm" action="./updateUserInfo" method="post">
												    <div class="form-group">
														<label class="control-label">登录名</label>
														<input class="form-control" type="text" readonly="readonly" value="${currentUser.loginname}" />
													</div>
													<div class="form-group">
														<label class="control-label">姓名</label>
														<input  placeholder="姓名"  class="form-control" type="text" name="name" value="${currentUser.name}" />
													</div>
													
													<div class="form-group">
														<label class="control-label">邮箱</label>
														<input placeholder="xxx_sss@163.com" name="email" value="${currentUser.email}" class="form-control" type="text" />
													</div>
													<div class="form-group">
														<label class="control-label">出生日期</label>
														<input placeholder="1990-01-01" name="birthDate" value="${userAttr.birthDate}" class="form-control" type="text" />
													</div>
													<div class="form-group">
														<label>性别</label>
														<div class="radio-list">
															<label class="radio-inline">
															<input type="radio" name="gender" id="optionsRadios4" value="0" ${userAttr.gender==0?'checked':''}>女</label>
															<label class="radio-inline">
															<input type="radio" name="gender" id="optionsRadios5" value="1" ${userAttr.gender==1?'checked':''}>男</label>
														</div>
													</div>													
														<input type="hidden" name="code" value="${currentUser.code}"/>
														<input type="reset" style="display:none;" /> 
													<div class="form-group">
														<label class="control-label">个人简介</label>
														<textarea class="form-control" rows="3" name="introduce" placeholder="介绍一下自己">${userAttr.introduce}</textarea>
													</div>
													<div class="margiv-top-10">
														<a href="javaScript:formSubmit('userInfoForm');" class="btn green">
														更改 </a>
														<a href="javaScript:cancel('userInfoForm');" class="btn default">
														取消 </a>
													</div>
												</form>
											</div>
											<div id="tab_2-2"  class="tab-pane" style=" height:400px;">
												<form action="./file/uploadImage" ENFTYP="multipart/form-data" role="form" method="post" id="headpicForm">
													<div class="form-group">
														<div class="fileinput fileinput-new" data-provides="fileinput">
															<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
																<img src="${currentUser.headpic}" alt="">
															</div>
															<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
															</div>
															<div>
																<span class="btn default btn-file">
																<span class="fileinput-new">
																选择图像 </span>
																<span class="fileinput-exists">
																更换 </span>
																<input role="headpic" id="headpic" name="file" type="file">
																</span>
																<a href="#" class="btn default fileinput-exists" data-dismiss="fileinput">
																取消 </a>
																<a href="javaScript:uploadFile();" class="btn green fileinput-exists">
																保存 </a>
															</div>
														</div>
													</div>
													<!-- <div class="margin-top-10">
														<a href="#" class="btn green">
														提交 </a>
														<a href="#" class="btn default">
														取消</a>
													</div> -->
												</form>
											</div>
											<div id="tab_3-3" class="tab-pane" style=" height:400px;">
												<form id="passwordForm" action="./updatePassword" method="post">
													<div class="form-group">
														<label class="control-label">当前密码</label>
														<input class="form-control" id="oldpassword" name="oldpassword" type="password"/>
													</div>
													<div class="form-group">
														<label class="control-label">新密码</label>
														<input placeholder="新密码"  class="form-control" id="newpassword" name="newpassword" type="password"/>
													</div>
													<div class="form-group">
														<label class="control-label">重复新密码</label>
														<input placeholder="确认新密码"  class="form-control" id="cpassword" name="cpassword" type="password"/>
													</div>
													<input type="reset" style="display:none;" /> 
													<div class="margin-top-10">
													<input type="submit" value="修改密码" class="btn green"/>
<!-- 														<a href="javaScript:void(0);" id="uppassword" class="btn green"> -->
<!-- 														 修改密码</a> -->
														<a href="javaScript:cancel('passwordForm');" class="btn default">
														取消</a>
													</div>
												</form>
											</div>
										</div>
									</div>
									<!--end col-md-9-->
								</div>
							</div>
							<!--end tab-pane-->
							
							<!--end tab-pane-->
							<div class="tab-pane" id="tab_1_6">
								<div class="row">
									<div class="col-md-3">
										<ul class="ver-inline-menu tabbable margin-bottom-10">
											<li class="active">
												<a data-toggle="tab" href="#tab_1">
												<i class="fa fa-briefcase"></i>用户手册 </a>
												<span class="after">
												</span>
											</li>
											<li>
												<a data-toggle="tab" href="#tab_2">
												<i class="fa fa-group"></i>置标文档 </a>
											</li>
										</ul>
									</div>
									<div class="col-md-9">
										<div class="tab-content">
											<div id="tab_1" class="tab-pane active">
												<div id="accordion1" class="panel-group">
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_1">
															1. 用户管理 </a>
															</h4>
														</div>
														<div id="accordion1_1" class="panel-collapse collapse in">
															<div class="panel-body">
																用户管理，系统维护人员可以管理用户的账号、正常还是锁定的状态、分配组织机构、重置密码、查看在线IP地址等。
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_2">
															2. 站点管理</a>
															</h4>
														</div>
														<div id="accordion1_2" class="panel-collapse collapse">
															<div class="panel-body">
																 站点管理，维护站点的域名、添加站点、站点属性、发布站点。
															</div>
														</div>
													</div>
													<div class="panel panel-success">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_3">
															3.频道管理 </a>
															</h4>
														</div>
														<div id="accordion1_3" class="panel-collapse collapse">
															<div class="panel-body">
																 频道管理，维护各个站点下所有频道、添加、删除、发布。
															</div>
														</div>
													</div>
													<div class="panel panel-warning">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_4">
															4. 内容管理</a>
															</h4>
														</div>
														<div id="accordion1_4" class="panel-collapse collapse">
															<div class="panel-body">
																内容管理，维护网站所有文章，添加、删除与发布。
															</div>
														</div>
													</div>
													<div class="panel panel-danger">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_5">
															5.模板管理</a>
															</h4>
														</div>
														<div id="accordion1_5" class="panel-collapse collapse">
															<div class="panel-body">
																模板管理，维护站点、频道、内容的不同风格的模板，
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_6">
															6. 资源管理</a>
															</h4>
														</div>
														<div id="accordion1_6" class="panel-collapse collapse">
															<div class="panel-body">
																 资源管理，上传文件、视频、音频等资源管理器。
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_7">
															7. 检索管理</a>
															</h4>
														</div>
														<div id="accordion1_7" class="panel-collapse collapse">
															<div class="panel-body">
																 检索管理，配置检索属性过滤、检索风格等。
															</div>
														</div>
													</div>
												</div>
											</div>
											<div id="tab_2" class="tab-pane">
												<div id="accordion2" class="panel-group">
													<div class="panel panel-warning">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_1">
															1.频道置标</a>
															</h4>
														</div>
														<div id="accordion2_1" class="panel-collapse collapse in">
															<div class="panel-body">
																<p> 读取单个频道的信息属性。</p>
																<p>	&lt;@channelDirective&gt;</p>
																<p>	&lt;/@channeDirective&gt;</p>
																
															</div>
														</div>
													</div>
													<div class="panel panel-danger">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_2">
															2.频道列表</a>
															</h4>
														</div>
														<div id="accordion2_2" class="panel-collapse collapse">
															<div class="panel-body">
																 <p> 读取站点或频道下的频道的信息属性。</p>
																<p>	&lt;@channelListDirective&gt;</p>
																<p>	&lt;/@channeDirective&gt;</p>
																
															</div>
														</div>
													</div>
													<div class="panel panel-success">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_3">
															3.内容置标 </a>
															</h4>
														</div>
														<div id="accordion2_3" class="panel-collapse collapse">
															<div class="panel-body">
																<p> 读取单个内容详细的信息属性。</p>
																<p>	&lt;@contentirective  &gt;</p>
																<p>	&lt;/@contentirective  &gt;</p>
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_4">
															4.内容列表 </a>
															</h4>
														</div>
														<div id="accordion2_4" class="panel-collapse collapse">
															<div class="panel-body">
																 <p> 读取某个频道下的内容信息属性。</p>
																<p>	&lt;@contentListDirective &gt;</p>
																<p>	&lt;/@contentListDirective &gt;</p>
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_6">
															5. 当前位置置标 </a>
															</h4>
														</div>
														<div id="accordion2_6" class="panel-collapse collapse">
															<div class="panel-body">
															<p> 获取当前位置。</p>
																<p>	&lt;@currentLocationDirective &gt;</p>
																<p>	&lt;/@currentLocationDirective &gt;</p>
																  
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
															<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_7">
															6. 点击排行置标 </a>
															</h4>
														</div>
														<div id="accordion2_7" class="panel-collapse collapse">
															<div class="panel-body">
																 <p> 获取总站 或站点 或频道下的内容点击排行。</p>
																<p>	&lt;@contentVisitListDirective  &gt;</p>
																<p>	&lt;/@contentVisitListDirective  &gt;</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--end tab-pane-->
						</div>
					</div>
					<!--END TABS-->
				</div>
			</div>
			<!-- END PAGE CONTENT INNER -->
		</div>
	
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	<!-- BEGIN FOOTER -->
	<%@include file="../includejsps/foot.jsp" %>
	<!-- END FOOTER -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<%@include file="../includejsps/js.jsp" %>
    <%@include file="../includejsps/plugin-js.jsp" %>
	<!-- END JAVASCRIPTS -->
	<script>
	jQuery.validator.addMethod("isPassword", function(value, element) {    
	    var tel = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+`\-={} :";'<>?,.\/]).{8,30}$/;
	    return this.optional(element) || (tel.test(value));
	}, "必须字母数字符号混合且大于8位");
		jQuery(document).ready(
				function() {
					$('#passwordForm').validate(
							{
								errorElement : 'label', //default input error message container
								errorClass : 'help-inline', // default input error message class
								focusInvalid : false, // do not focus the last invalid input
								rules : {
									oldpassword : {
										required : true
									},
									newpassword : {
										required : true,
										isPassword:true
									},
									cpassword : {
										required : true,
										equalTo : "#newpassword"
									}
								},

								messages : {
									oldpassword : {
										required : "请输入当前密码"
									},
									newpassword : {
										required : "请输入新密码"
									},
									cpassword : {
										required : "请输入确认密码",
										equalTo : "两次密码不一致"
									}
								},

								highlight : function(element) { // hightlight error inputs
									$(element).closest('.help-inline')
											.removeClass('ok'); // display OK icon
									$(element).closest('.control-group')
											.removeClass('success').addClass(
													'error'); // set error class to the control group
								},

								unhighlight : function(element) { // revert the change dony by hightlight
									$(element).closest('.control-group')
											.removeClass('error'); // set error class to the control group
								},

								success : function(label) {
									label.addClass('valid').addClass(
											'help-inline ok') // mark the current input as valid and display OK icon
									.closest('.control-group').removeClass(
											'error').addClass('success'); // set success class to the control group
								},

								submitHandler : function(form) {
									Metronic.blockUI({target: this.$element});
									$.ajax({
										url: './updatePassword',     //后台处理程序
									     type: 'post',               //数据发送方式
									     dataType: 'json',           //接受数据格式  
									     data:$(form).serialize(),
									     success : function(data) {
									    	 if(data.status==0){
									    		 bootbox.alert(data.msg);
									    		 cancel('passwordForm');
									    		 Metronic.unblockUI(this.$element);
									    	 }
									    	 if(data.status==1){
									    		 bootbox.alert(data.msg,function(){
									    			 window.location.replace("${basePath}logout");
										    		 Metronic.unblockUI(this.$element);
									    		 });
									    	 }
									     },
									     error : function(data) {
									    	 alert("出错了！");
									    	 Metronic.unblockUI(this.$element);
									     }
										
									});
									
								}
							});
				});
	function formSubmit(id){
		$("#"+id).submit();	
	}
	function cancel(id){
// 		$("#"+id+" :input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");//核心
		 $("#"+id+" :input[type='reset']").trigger("click");
	}
	// 上传
    var uploadFile = function () {
            var file = $("#headpicForm").find("[role='headpic']").val();
        if (file == "") {
            return;
        } else {
            var type = file.substring(file.lastIndexOf("."));
            if (!(type.toLowerCase() == ".jpg"
                || type.toLowerCase() == ".png"
                || type.toLowerCase() == ".bmp" || type
                    .toLowerCase() == ".jpeg")) {
                alert("必须是.jpp,.png,.bmp,.jpeg格式中的一种");
                return;
            }
        }
        Metronic.blockUI({target: this.$element});
        $.ajaxFileUpload({
                url: "./headpicUpload",
                type: "POST",
                secureuri: false,
                fileElementId: "headpic",
                dataType: "json",
                success: function (json, status) {
                	Metronic.unblockUI(this.$element);
                    bootbox.alert(json.msg+"重新登陆后启用",function(){
//                     	window.location.replace("${basePath}center#tab2-2");
                    });
                },
                error: function (data, status, e) {
                	Metronic.unblockUI(this.$element);
                    alert(e);
                }
            });
    };
	</script>
</html>
