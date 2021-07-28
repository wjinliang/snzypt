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
<title>基础平台管理系统</title>
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
					<h1>用户管理</h1>
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
										class="caption-subject theme-font bold uppercase">用户管理</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="useraccount_grid"></div>
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
	jQuery.validator.addMethod("isPassword", function(value, element) {    
	    var tel = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+`\-={} :";'<>?,.\/]).{8,30}$/;
	    return this.optional(element) || (tel.test(value));
	}, "必须字母数字符号混合且大于8位");
	   var configForm = '<form id="configMailForm">'
	   +'<div style="float:left;margin-left:100px;">'
	   +'配置用户:<select id="leadIds" name="leadIds" multiple="multiple" class="form-control input-large">';
        
	   function loadLeaderAndOrg()
	   {
		$.ajax({
			 url:'../portal/leader/list?code=',
			 type:"post",
			 success:function(data)
			 {
				 for(var i=0;i<data.length;i++)
					 {
				 configForm = configForm + '<option value="'+data[i].id+'">'+data[i].name+'</option>';
					 }
				 configForm = configForm +'</select></div>';
		configForm = configForm+ '<div style="float:left;margin-left:100px;">配置部门:<select id="orgIds" name="orgIds" multiple="multiple" class="form-control input-large">';
				 $.ajax({
					 url:'../org/loadOrgs ',
					 type:"post",
					 success:function(data)
					 {
						 for(var i=0;i<data.length;i++)
							 {
						 configForm = configForm + '<option value="'+data[i].id+'">'+data[i].name+'</option>';
							 }
						 
						 configForm = configForm +'</select></div><div style="float:left;margin-left:100px;">显示ip:<input type="checkbox" name="isShowIp" value="1" /></div>'
						              +'<div class="form-actions" style="text-align:center;">'
						              +'<button class="btn blue btn-lg" role="submit" type="button" onclick="configSave()">保存</button>'
						              //+'<button class="btn default btn-lg" type="button">关闭</button>'
						             + '<input type="hidden" name="userId" id="userId" />'
						              +'</form></div>';
						 
					 }
				 });
			 }
		 }); 
	   }
	
	   function configSave()
	   {
		   $.ajax({
			  url:"../email/config/addOrUpdate",
			  type:"post",
			  data:$("#configMailForm").serialize(),
			  success:function(data)
			  {
				  alert(data.msg);
				 modal.hide(); 
			  }
		   });
	   }
	   
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
				title : "用户名",
				field : "name",
				sort : true
			}, {
				title : "组织结构",
				field : "orgName",
				sort : true
			}, {
				title : "上次登录时间",
				field : "lastLoginTime",
				width:"8%",
				sort : true
			}, {
				title : "上次登录IP",
				field : "remoteIpAddr",
				width:"6%",
				sort : true
			}, {
				title : "登录次数",
				field : "loginCount",
				width:"5%",
				sort : true
			}, {
				title : "状态",
				field : "nonLocked",
				sort : true,
				width:"6%",
				format : function(i, data) {
					if (data.nonLocked) {
						return "开启";
					} else {
						return "锁定";
					}
				}
			}],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "30%",
			actionCloums : [ {
				text : "编辑",
				cls : "green btn-sm",
				handle : function(index, data) {
					//index为点击操作的行数
					//data为该行的数据
					modal = $.dmModal({
						id : "userAccountForm",
						title : "表单",
						distroy : true
					});
					modal.show();
					var form = modal.$body.dmForm(formOpts);
					form.loadRemote("./ajaxLoad?userAccountId=" + data.code);
				}
			}, {
				text : "开启",
				cls : "blue btn-sm",
				handle : function(index, data) {
					unLockUser(data.code);
				},
				visable : function(index, data) {
					return !data.nonLocked;
				}
			}, {
				text : "锁定",
				cls : "yellow btn-sm",
				handle : function(index, data) {
					lockUser(data.code);
				},
				visable : function(index, data) {
					return data.nonLocked;
				}
			}, {
				text : "删除",
				cls : "red btn-sm",
				handle : function(index, data) {
					deleteItem(data.code);
				}
			}, {
				text : "重置密码",
				cls : "green btn-sm",
				handle : function(index, data) {
					bootbox.prompt("请输入重置密码(空白则生成随机密码)", function(result){
						if(result!=null){
							resetPassword(data.code,result);
						}
					});
				}}
// 			},{
// 				text : "配置信箱",
// 				cls : "red btn-sm",
// 				handle : function(index, data) {
// 					configMail(data.code);
// 				}
// 			}
			],
			tools : [
			//工具属性
			{
				text : " 添 加",//按钮文本
				cls : "btn green btn-sm",//按钮样式
				icon : "fa fa-cubes",
				handle : function(grid) {//按钮点击事件
					popAddWin();
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
					label : "用户名",
					name : "name",
					placeholder : "用户名"
				}, {
					type : "text",
					label : "组织机构",
					name : "orgName"
				} ]
			}
		};
		var modal;
		//form
		var formOpts = {
			id : "useraccount_form",//表单id
			name : "useraccount_form",//表单名
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
			showReset : false,//是否显示重置按钮
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
				label : '用户名',//左边label
				cls : 'input-medium'
			}, {
				type : 'text',//类型
				name : 'loginName',//name
				id : 'loginName',//id
				label : '登录名',//左边label
				cls : 'input-medium',
				rule : {//验证规则
					required : true,
					remote : {
						type : "post",
						url : "./checkLoginName",
						data : {
							loginName : function() {
								return $("#loginName").val();
							},
							code : function() {
								return $("#code").val();
							}
						},
						dataType : "json",
						dataFilter : function(data, type) {
							return data;
						}
					}
				},
				message : {//对应验证提示信息
					required : "请输入文本",
					remote : "名字被占用"
				}
			}, {
				type : 'radioGroup',
				name : 'enabled',
				id : 'enabled',
				label : '是否有效',
				items : [ {
					value : true,
					text : '有效'
				}, {
					value : false,
					text : '失效'
				} ]
			}, {
				type : 'radioGroup',
				name : 'nonLocked',
				id : 'nonLocked',
				label : '账号状态',
				items : [ {
					value : true,
					text : '开启'
				}, {
					value : false,
					text : '锁定'
				} ]
			}, {
				type : 'text',//类型
				name : 'mobile',//name
				id : 'mobile',//id
				label : '电话',//左边label
				cls : 'input-medium'
			}, {
				type : 'text',//类型
				name : 'email',//name
				id : 'email',//id
				label : '邮箱',//左边label
				cls : 'input-medium'
			}, {
				type : 'tree',//类型
				name : 'orgId',//name
				id : 'orgId',//id
				label : '组织',//左边label
				url : "./loadOrg",
				autoParam : [ "id", "name", "pId" ],
				chkStyle : "radio",
				expandAll : true
			}, {
				type : 'tree',//类型
				name : 'roleIds',//name
				id : 'roleIds',//id
				label : '角色',//左边label
				url : "./loadRoles",
				autoParam : [ "id", "name", "pId" ],
				chkStyle : "checkbox"
			} ]
		};

		
		
		var addFormOpts = {
			id : "useraccount_form2",//表单id
			name : "useraccount_form2",//表单名
			method : "post",//表单method
			action : "./ajaxSave",//表单action
			ajaxSubmit : true,//是否使用ajax提交表单
			labelInline : true,
			rowEleNum : 1,
			beforeSubmit : function() {
				$('button[role="submit"]').attr('disabled',true);
			},
			ajaxSuccess : function(res) {
				if(res.status=="1"){
					bootbox.alert("保存成功!");
					modal.hide();
					grid.reload();
				}else{
					bootbox.alert("操作失败!");
				}
				$('button[role="submit"]').attr('disabled',false);
			},
			submitText : "保存",//保存按钮的文本
			showReset : false,//是否显示重置按钮
			resetText : "reset",//重置按钮文本
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
				label : '用户名',//左边label
				cls : 'input-medium',
				rule : {
					required : true
				},
				message : {
					required : "请输入用户名"
				}
			}, {
				type : 'text',//类型
				name : 'loginName',//name
				id : 'loginName',//id
				label : '登录名',//左边label
				cls : 'input-medium',
				rule : {//验证规则
					required : true,
					remote : {
						type : "post",
						url : "./checkLoginName",
						data : {
							loginName : function() {
								return $("#loginName").val();
							},
							code : function() {
								return $("#code").val();
							}
						},
						dataType : "json",
						dataFilter : function(data, type) {
							return data;
						}
					}
				},
				message : {//对应验证提示信息
					required : "请输入登录名",
					remote : "登录名被占用"
				}
			}, {
				type : 'password',//类型
				name : 'password',//name
				id : 'password',//id
				label : '密码',//左边label
				cls : 'input-medium',
				rule : {
					required : true,
					isPassword:true
				},
				message : {
					required : "请输入密码"
				}
			}, {
				type : 'password',//类型
				name : 'password2',//name
				id : 'password2',//id
				label : '确认密码',//左边label
				cls : 'input-medium',
				rule : {
					required : true,
					equalTo : "#password"
				},
				message : {
					required : "请输入确认密码密码",
					equalTo : "与密码不一致"
				}
			}, {
				type : 'radioGroup',
				name : 'enabled',
				id : 'enabled',
				label : '是否有效',
				items : [ {
					value : true,
					text : '有效',
					checked:true
				}, {
					value : false,
					text : '失效'
				} ],
				rule : {
					required : true
				},
				message : {
					required : "请选择"
				}
			}, {
				type : 'radioGroup',
				name : 'nonLocked',
				id : 'nonLocked',
				label : '账号状态',
				items : [ {
					value : true,
					text : '开启',
					checked:true
				}, {
					value : false,
					text : '锁定'
				} ],
				rule : {
					required : true
				},
				message : {
					required : "请选择"
				}
			}, {
				type : 'text',//类型
				name : 'mobile',//name
				id : 'mobile',//id
				label : '电话',//左边label
				cls : 'input-medium'
			}, {
				type : 'text',//类型
				name : 'email',//name
				id : 'email',//id
				label : '邮箱',//左边label
				cls : 'input-medium'
			}, {
				type : 'tree',//类型
				name : 'orgId',//name
				id : 'orgId',//id
				label : '组织',//左边label
				url : "./loadOrg",
				autoParam : [ "id", "name", "pId" ],
				chkStyle : "radio"
			}, {
				type : 'tree',//类型
				name : 'roleIds',//name
				id : 'roleIds',//id
				label : '角色',//左边label
				url : "./loadRoles",
				autoParam : [ "id", "name", "pId" ],
				chkStyle : "checkbox",
				rule : {
					required : true
				},
				message : {
					required : "请选择"
				}
			} ]
		};

		function popWin() {
			modal = $.dmModal({
				id : "form",
				title : "表单",
				distroy : true
			});
			modal.show();
			modal.$body.dmForm(formOpts);
		}

		function popAddWin() {
			modal = $.dmModal({
				id : "form2",
				title : "添加用户",
				distroy : true
			});
			modal.show();
			modal.$body.dmForm(addFormOpts);
		}

		
		function configMail(id) {
			modal = $.dmModal({
				id : "configMail",
				title : "信箱配置",
				distroy : true
			});
			modal.show();
			var form = modal.$body.dmForm(configFormOpt);
			form.loadRemote("../email/config/loadByUserId?userId="+id);
			/*  modal.$body.html(configForm);
			 $("#userId").val(id);
			$.ajax({url:"../email/config/loadByUserId",
				    data:{userId:id},
					success:function(data){
					if(data)
						{
						if(data.leaderId)
				         {
							$("#leadIds").val(data.leaderId.split(","));
				         }
						if(data.orgId)
						 {
				          $("#orgIds").val(data.orgId.split(","));
						 }
						if(data.isShowIp=="1")
						 {
				          $("[name='isShowIp']").attr("checked", true);
						 }
						}
			         }
		         }); */
			}
		var configFormOpt={
						id : "config_form2",//表单id
						name : "config_form2",//表单名
						method : "post",//表单method
						action : "../email/config/addOrUpdate",//表单action
						ajaxSubmit : true,//是否使用ajax提交表单
						labelInline : true,
						rowEleNum : 1,
						beforeSubmit : function() {

						},
						ajaxSuccess : function(res) {
							if(res.status=="1"){
								bootbox.alert("保存成功!");
								modal.hide();
							}else{
								bootbox.alert("操作失败!");	
							}
						},
						submitText : "配置",//保存按钮的文本
						showReset : false,//是否显示重置按钮
						resetText : "reset",//重置按钮文本
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
							name : 'id',
							id : 'id'
						},{
							type : 'hidden',
							name : 'userId',
							id : 'userId'
						}, {
							type : 'checkboxGroup',//类型
							name : 'leaderId',//name
							id : 'leaderId',//id
							label : '拥有权限',//左边label
							items:[{text:'县长信箱',value:'1'}
							,{text:'书记信箱',value:'2'}
							,{text:'镇和部门信箱',value:'3'}]
						}/* ,{
							type : 'tree',//类型
							name : 'orgId',//name
							id : 'orgId',//id
							label : '可查看部门信箱',//左边label
							url:'../org/loadOrgs',
							autoParam : [ "id", "name", "pId" ],
							expandAll : true,
							chkboxType:{"Y":"s","N":"s"}, 
							chkStyle : "checkbox"
						} */, {
							type : 'radioGroup',//类型
							name : 'isShowIp',//name
							id : 'isShowIp',//id
							label : '是否可查看IP',
							items:[{text:'是',value:'1'}
							,{text:'否',value:'0'}]
						}]
				
		};
		function deleteItem(id) {
			bootbox.confirm("确定删除吗？", function(result) {
				if (result) {
					$.ajax({
						type : "POST",
						data : "userId=" + id,
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
							data : "userId=" + ids,
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
		function lockUser(id) {
			$.ajax({
				type : "POST",
				data : "useraccountid=" + id,
				dataType : "json",
				url : './lockUser',
				success : function(data) {
					if (data.status == 1) {
						bootbox.alert("锁定成功!");
						grid.reload();
					}else{
						bootbox.alert("操作失败!");
					}
				}
			});
		}

		function unLockUser(id) {
			$.ajax({
				type : "POST",
				data : "useraccountid=" + id,
				dataType : "json",
				url : './unLockUser',
				success : function(data) {
					if (data.status == 1) {
						bootbox.alert("解锁成功!");
						grid.reload();
					}else{
						bootbox.alert("解锁失败!");
					}
				}
			});
		}
		function resetPassword(id,newPassword) {
			$.ajax({
				type : "POST",
				data : {
					"useraccountId" : id,
					"newPassword" : newPassword
				},
				url : './resetPassword',
				success : function(data) {
					if (data.status == 1) {//邮件发送成功
						//grid.reload();
						bootbox.alert("重置密码为：" + data.password);
					}
					if (data.status == 2) {//邮件发送失败
							//grid.reload();
							bootbox.alert("重置密码为：" + data.password);
					}if (data.status == 0) {
						//grid.reload();
						bootbox.alert("操作失败");
					}
				}
			});
		}
		jQuery(document).ready(function() {
			grid = $("#useraccount_grid").dmGrid(options);
			loadLeaderAndOrg();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
