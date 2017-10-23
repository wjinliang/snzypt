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
<title>后台管理 | 广告管理</title>
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
										class="caption-subject theme-font bold uppercase">广告列表</span>
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
				title : "名称",
				field : "name",
				width : "10%"
			}, {
				title : "链接",
				field : "link",
				width : "10%"
			},{
				title : "图片",
				field : "",
				width : "10%",
				format:function(i,c){
					if(c.imageUrl=='null' ||c.imageUrl==null || c.imageUrl==''){
						return '[暂无]';
					}
					return '<image src="'+c.imageUrl+'" title="'+c.name+'" style="width:90px;"/>';
				}
			},{
				title : "位置",
				field : "",
				width : "10%",
				format:function(i,c){
					if(c.type=='AD1')
						return "位置1";
					if(c.type=='AD2')
						return "位置2";
					if(c.type=='AD3')
						return "位置3";
					if(c.type=='ADFLOAT')
						return "浮动";
				}
			},{
				title:'永久展示',
				field:'',
				width:'10%',
				format:function(i,c){
					if(c.alwaysShow)
						return '是';
					return '否';
					
				}
			},{title:'暂停使用',
				field:'',
				width:'10%',
				format:function(i,c){
					if(c.layUp)
						return '是';
					return '否';
					
				}
			}/* ,{
				title : "是否展示",
				field : "",
				width : "10%",
				format:function(i,c){
					if(c.enabled){
						return "是";
					}
					return "否";
				}
			}  */],
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
					/* ,{
						
						textHandle : function(i,c){
							if(c.enabled){
								return "设置为不展示";
							}
							return "设置为展示";
						},
						cls : "btn yellow btn-sm",//按钮样式
						handle : function(i,c) {
							$.ajax(){
								
							}
						}
					}, {
						
						text : "删除",
						cls : "btn red btn-sm",//按钮样式
						handle : function(i,c) {
							deleteItem(c.id);
						}
					}*/
					],
			
			 tools : [ {
				text : "添加",
				cls : "btn green btn-sm",//按钮样式
				handle : function(grid) {
					modal = $.dmModal({
						id : "siteForm",
						title : "添加",
						distroy : true
					});
					modal.show();
					var form = modal.$body.dmForm(getFormOptions());
					form.loadLocal({siteId:currentSiteId});
				}
			},{
				text : "立即生效",
				cls : "btn green btn-sm",//按钮样式
				handle : function(grid) {
					generatorHtml();
				}
			} ], 
			search : {
				rowEleNum : 1,
				hide:false,
				//搜索栏元素
				items : [ {
					type : "text",
					label : "名称",
					name : "name",
					cls:"form-control input-large",
					placeholder : "输入要搜索的名称"
				},{type:"radioGroup",
					label:"位置",
					name:'type',
					items:[],
					itemsUrl:'../../dict/getItems?code=C03'
				} ]
			}
		};
		function replyModal(data){
			modal = $.dmModal({
				id : "siteForm",
				title : "修改",
				distroy : true
			});
			modal.show();
			var form = modal.$body.dmForm(getFormOptions());
			form.loadRemote("./load?id="+data.id);
		}
		var getFormOptions = function() {
			var items=[ {
				type : 'hidden',
				name : 'id',
				id : 'id'
			},{
				type : 'hidden',
				name : 'siteId',
				id : 'siteId'
			},{
					type : 'text',//类型
					name : 'name',//name
					id : 'name',//id
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
				name : 'link',//name
				id : 'link',//id
				label : '链接地址',//左边label
				cls : 'input-large',
				rule : {
					required : true
				},
				message : {
					required : "请输入"
				}
			},{
				type : 'image',
				id : 'imageUrl',
				name : 'imageUrl',
				label : '广告图片',
				isAjaxUpload : true,
				autoUpload : true,
				uploadUrl : '../attachment/singleUpload',
				onSuccess : function(data) {
					if (data.status == "1") {
						$("#imageUrl")
								.attr("value", data.attachment.attachmentUrl);
					} else {
						alert(data.msg);
					}
				},
				deleteHandle : function() {
					$("#imageUrl").attr("value", "");
				}
			},{
				type:"radioGroup",
				name:"type",
				id :"type",
				label:"位置",
				items:[],
				itemsUrl:'../../dict/getItems?code=C03',
				rule : {
					required : true
				},
				message : {
					required : "请选择"
				}
			},{
				type : 'datepicker',//类型
				name : 'startime',//name
				id : 'startime',//id
				label : '开始时间',//左边label
				cls : 'input-large',
				rule : {
					required : true
				},
				message : {
					required : "请输入"
				}
			},{
				type : 'datepicker',//类型
				name : 'endtime',//name
				id : 'endtime',//id
				label : '结束时间',//左边label
				cls : 'input-large',
				rule : {
					required : true
				},
				message : {
					required : "请输入"
				}
			},{
				type:"radioGroup",
				name:"alwaysShow",
				id :"alwaysShow",
				label:"永久展示",
				items:[{text:"是",value:true},{text:"否",value:false,checked:true}]
			},{
				type:"radioGroup",
				name:"layUp",
				id :"layUp",
				label:"暂停使用",
				items:[{text:"是",value:true},{text:"否",value:false,checked:true}]
			},{
				type : 'text',//类型
				name : 'imageWidth',//name
				id : 'imageWidth',//id
				label : '图片宽度',//左边label
				cls : 'input-large',
				placeHolder:"例:200px"
			},{
				type : 'text',//类型
				name : 'imageHeight',//name
				id : 'imageHeight',//id
				label : '图片高度',//左边label
				cls : 'input-large'
			},{type:'text',
				name:'seq',
				id:'seq',
				label:'顺序',
				cls:'input-large',
				rule : {
					required : true
				},
				message : {
					required : "请输入"
				}
				}];
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
					modal.hide();
					grid.reload();
				},
				submitText : "提交",//保存按钮的文本
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
		function generatorHtml()
	    {
	    	$.post("../site/generatorHtml",{siteId:currentSiteId},function(result){
	    		if(result.status='1'){
	    			bootbox.alert("操作成功");
	    		}else{
	    			bootbox.alert("操作失败");
	    		}
	    	})
	    }
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
