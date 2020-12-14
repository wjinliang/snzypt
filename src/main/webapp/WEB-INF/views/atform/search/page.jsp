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
					<h1>信息管理</h1>
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
		<div class="container" style="width: 1300px;">
			<!-- BEGIN PAGE CONTENT INNER -->
			<div class="row margin-top-10">
				<div class="col-md-12 col-sm-12">
					<!-- BEGIN PORTLET-->
					<div class="portlet light">
						<div class="portlet-title">
							<div class="caption caption-md">
								<i class="icon-bar-chart theme-font hide"></i> <span
									class="caption-subject theme-font bold uppercase">数据查询接口管理</span>
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
	<script type="text/javascript">
	
		var form;
		var grid;
		var gridOption = {
			url : "./gridlist", // ajax地址
			pageNum : 1,//当前页码
			pageSize : 5,//每页显示条数
			idFiled : "id",//id域指定
			showCheckbox : true,//是否显示checkbox
			checkboxWidth : "3%",
			showIndexNum : true,
			indexNumWidth : "5%",
			pageSelect : [ 5, 15, 30, 50 ],
			cloums : [
						{
							title : "编码",
							field : "code",
							width : "10%",
							sort : true
						},
					{
						title : "名称",
						field : "searchName",
						width : "8%",
						sort : true
					},
					{
						title : "数据表",
						field : "tableName",
						width : "5%",
						sort : true
					},
					{
						title : "状态",
						field : "status",
						width : "10%",
						format : function(i, data) {
							return data.status == '0' ? '关闭'
									: data.status == '1' ? '启用' : '--';
						}
					} ],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "30%",
			actionCloums : [ {
				text : "编辑",
				cls : "green btn-sm",
				handle : function(index, data) {
					//index为点击操作的行数
					//data为该行的数据
					var form = generForm();
					form.loadLocal(data);
					//form.loadRemote("./load?siteId=" + data.id);
				}
			},{
				text : "查询数据",
				cls : "green btn-sm",
				handle : function(index, row) {
					if(row.code){
						$.ajax({
							url:"./data/"+row.code,
							success:function(data){
								if(data.status==1){	
									var modalshow = $.dmModal({
										id : "siteForm",
										title : row.searchName+"_"+row.code,
										distroy : true
									});
									modalshow.show(); 
									var html=$('<div class="col-md-12"></div>');
									html.append("<h1>数据总条数："+data.total+"</h1>");
									for(var i=0;i<data.data.length;i++){
										var cls = ' label-info';
										if(i%2==0){
											cls=' label-default';
										}
										var one =$('<div class="col-md-4 col-sm-4 '+cls+'"></div>');
										var ht="";
										var that = data.data[i];
										for(var k in that) {
											ht+='<div class="form-group"><label class="control-label">'+k+":"+that[k]+'</label></div>';
										}
										one.html(ht);
										html.append(one);
									}
									modalshow.$body.append(html);
								}else{
									alert(data.msg);
								}
							}
						})
					}else{
						bootbox.alert('请先设置code');
					}
				}
			}, {
				text : "删除",
				cls : "red btn-sm",
				handle : function(index, data) {
					deleteItem(data.id);
				}
			} ],
			tools : [
			//工具属性
			{
				text : "添加",//按钮文本
				cls : "btn btn-sm green",//按钮样式
				icon : "fa fa-cubes",
				handle : function(grid) {//按钮点击事件
					var form = generForm();
				}
			} ],
			search : {
				rowEleNum : 4,
				//搜索栏元素
				items : [ {
					type : "text",
					label : "接口编码",
					name : "code",
					placeholder : "输入要搜索的编码"
				}, {
					type : "text",
					label : "名称",
					name : "searchName",
					placeholder : "输入要搜索的名称"
				}, {
					type : "text",
					label : "表名",
					name : "tableName",
					placeholder : "输入要搜索的表名称"
				} ]
			}
		};
		var modal;
		var formOpts = {
			id : "table_form",//表单id
			name : "table_form",//表单名
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
		};
		//表设置
		var aItems = [ {
			type : 'hidden',
			name : 'id',
			id : 'id'
		}, {
			type : 'text',//类型
			name : 'code',//name
			id : 'code',//id
			label : '接口编码',//左边label
			cls : 'input-large',
			rule : {
				required : true
			},
			message : {
				required : "请输入"
			}
		}, {
			type : 'text',//类型
			name : 'searchName',//name
			id : 'searchName',//id
			label : '名称',//左边label
			cls : 'input-large',
			rule : {
				required : true
			},
			message : {
				required : "请输入"
			}
		}, {
			type : 'text',//类型
			name : 'tableName',//name
			id : 'tableName',//id
			label : '数据表',//左边label
			cls : 'input-large',
			//				items:[],
			//				itemsUrl:'./loadCollections',
			rule : {
				required : true
			},
			message : {
				required : "请输入"
			}
		}, {
			type : 'textarea',//类型
			name : 'searchField',//name
			id : 'searchField',//id
			label : '结果字段',//左边label
			cls : 'input-large'
		}, {
			type : 'textarea',//类型
			name : 'whereField',//name
			id : 'whereField',//id
			label : '过滤条件',//左边label
			cls : 'input-large'
		},{
			type : 'text',//类型
			name : 'sortField',//name
			id : 'sortField',//id
			label : '默认排序字段',//左边label
			cls : 'input-large'
		},  {
			type : 'radioGroup',//类型
			name : 'status',//name
			id : 'status',//id
			label : '状态',//左边label
			cls : 'input-large',
			items : [ {
				text : '启用',
				value : '1',
				checked:true
			}, {
				text : '关闭',
				value : '0'
			} ]
		},{
			type : 'textarea',//类型
			name : 'info',//name
			id : 'info',//id
			label : '说明',//左边label
			cls : 'input-large'
		} ];
		
		function generForm() {
			modal = $.dmModal({
				id : "siteForm",
				title : "添加",
				distroy : true,
				width : '850px'
			});
			modal.show();
			formOpts.items = aItems;//表设置
			return modal.$body.dmForm(formOpts);
		}
		function deleteItem(id){
			bootbox.confirm("确认删除?",function(res){
				if(res){
					$.ajax({
						url:'./delete?id='+id,
						type:'get',
						dataType:'json',
						error:function(){
							alert('网络错误!');
						},
						success:function(data){
							if(data.status=='1'){
								grid.reload();
							}else{
								alert(data.msg);
							}
						}
					});
				}
			})
		}
		jQuery(document).ready(function() {
			grid = $("#content_grid").dmGrid(gridOption);
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
