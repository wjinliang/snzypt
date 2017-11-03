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
<title>后台管理 | 资源管理</title>
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
				<div class="col-md-3 col-sm-12">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<!-- BEGIN PORTLET-->
							<div class="portlet light">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font hide"></i> <span
											class="caption-subject theme-font bold uppercase">资源树</span>
										<span class="caption-helper">  可以鼠标拖动排序</span>
									</div>
									<div class="actions">
                                            <div class="btn-group btn-group-devided" data-toggle="buttons">
                                                <label class="btn btn-transparent grey-salsa btn-circle btn-sm active" onclick="refreshTree()">
                                                    <input name="options" class="toggle" id="option1" type="radio">刷新
                                                </label> 
                                            </div>
                                        </div>
								</div>
								<div class="portlet-body">
									<div class="scroller" style="min-height: 500px;"
										id="table_tree_div" data-always-visible="1"
										data-rail-visible="1">
										<ul id="table_tree" class="ztree"></ul>
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
									class="caption-subject theme-font bold uppercase">资源信息管理</span>
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
	var COOKIE_LASRNODEID = "last_node_id";
		/**********普通内容操作函数****************/
		var tableTree;
		var form;
		var grid;
		var currentTableId = $.cookie(COOKIE_LASRNODEID);
		function refreshTree() {

			if (typeof (tableTree) == "undefined") {
				$.fn.zTree.init($("#table_tree"), tableSetting, "");
				tableTree = $.fn.zTree.getZTreeObj("table_tree");
			} else {
				tableTree.reAsyncChildNodes(null, "refresh");
			}
			if (typeof (grid) != "undefined") {
				grid.reload({
					url : "./gridlist?pId=" + currentTableId
				});
			}
		}
		var tableSetting = {
			view : {
				showIcon : false,
				selectedMulti : false,
				dblClickExpand : false//,
				//nameIsHTML:true//名称支持html格式
			// 				addHoverDom: addHoverDom,
			// 				removeHoverDom: removeHoverDom
			},
			edit : {
				drag:{
					isCopy: false,
					isMove:true,
					prev:true,
					next:true,
					inner:true
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
				url : "./tree",
				autoParam : [ "id", "name", "pId" ]
			},
			callback : {
				/* beforeAsync : function(treeId, treeNode) {
					if (typeof (currentSiteId) == "undefined") {
						return false;
					} else {
						return true;
					}
				}, */

				onAsyncSuccess : function(event, treeId, treeNode, msg) {
					if (msg.length == 0) {
						Metronic.alert({
							message : "没有信息！",
							type : "warning",
							container : "#table_tree_div",
							place : "prepend",
							close : false,
							closeInSeconds : 5
						});
					}
					tableTree.expandAll(false);
					var node = tableTree.getNodeByParam('id', currentTableId);//获取id为1的点  
					//tableTree.selectNode(node);//选择点  
					if(node){
						 if(!node.isParent){
							node = node.getParentNode();
						}
					}
					tableTree.expandNode(node, true, false);//指定选中ID节点展开  
				},
				onClick : function(event, treeId, treeNode) {
					// 用于解决双击时候会调用两次单击事件的问题
					if (treeNode.clickTimeout) {
						clearTimeout(treeNode.clickTimeout);
						treeNode.clickTimeout = null;
					} else {
						treeNode.clickTimeout = setTimeout(function() {
							currentTableId = treeNode.id;
							$.cookie(COOKIE_LASRNODEID,currentTableId,{expires:7});
							grid.reload({
								url : "./gridlist?pId=" + currentTableId
							});
							treeNode.clickTimeout = null;
						}, 250);
					}

				},
				onDblClick : function(event, treeId, treeNode) {
					var form = generForm(treeNode.s);
					form.loadRemote("./load?id=" + treeNode.id);
				},
				beforeDrop : beforeDrop,
				beforeDrag : beforeDrag
			}
		};
		//拖拽前执行
		var dragId;
		function beforeDrag(treeId, treeNodes) {
			for (var i = 0, l = treeNodes.length; i < l; i++) {
				dragId = treeNodes[i].pId;
				if (treeNodes[i].drag === false) {
					return false;
				}
			}
			return true;
		}
		//拖拽释放之后执行  
		function beforeDrop(treeId, treeNodes, targetNode, moveType) {
			//if (targetNode.pId == dragId) {
				var data = {
					id : treeNodes[0].id,
					targetId : targetNode.id,
					pid : treeNodes[0].pId,
					moveType : moveType
				};
				var confirmVal = false;
				$.ajax({
					async : false,
					type : "post",
					data : data,
					url : "./sort",
					success : function(json) {
						if (json.status == "1") {
							confirmVal = true;
						} else {
							bootbox.alert('操作失败');
						}
					},
					error : function() {
						bootbox.alert('亲，网络错误！');
					}
				});
				return confirmVal;
			/* } else {
				//bootbox.alert('亲，只能进行同级排序！');  
				return false;
			} */
		}
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
						title : "名称",
						field : "gridName",
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
						title : "所属部门",
						field : "org",
						width : "10%",
						sort : true
					},
					{
						title : "状态",
						field : "status",
						width : "10%",
						format : function(i, data) {
							return data.status == '0' ? '隐藏'
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
					var form = generForm(data.type);
					form.loadLocal(data);
					//form.loadRemote("./load?siteId=" + data.id);
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
				text : "添加分类",//按钮文本
				cls : "btn btn-sm green",//按钮样式
				icon : "fa fa-cubes",
				handle : function(grid) {//按钮点击事件
					var form = generForm("1");
					form.loadLocal({
						"pId" : currentTableId,
						"type" : "1"
					});

				}
			},
			//工具属性
			{
				text : "添加数据表",//按钮文本
				cls : "btn btn-sm green",//按钮样式
				icon : "fa fa-cubes",
				handle : function(grid) {//按钮点击事件
					var form = generForm("0");
					form.loadLocal({
						"pId" : currentTableId,
						"type" : "0"
					});
				}
			} ],
			search : {
				rowEleNum : 4,
				//搜索栏元素
				items : [ {
					type : "text",
					label : "名称",
					name : "gridName",
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
				//grid.reload();
				refreshTree();
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
			type : "hidden",
			name : "pId",
			id : "pId"
		}, {
			type : "hidden",
			name : "seq",
			id : "seq"
		}, {
			label : '类型',//左边label
			type : "hidden",
			name : "type",
			id : "type"
		}, {
			type : 'text',//类型
			name : 'gridName',//name
			id : 'gridName',//id
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
			type : 'text',//类型
			name : 'idField',//name
			id : 'idField',//id
			label : '主键ID',//左边label
			cls : 'input-large',
			rule : {
				required : true
			},
			message : {
				required : "请输入"
			}
		}, {
			type : 'select',//类型
			name : 'org',//name
			id : 'org',//id
			label : '所属部门',//左边label
			cls : 'input-large',
			items : [
			         ],
			itemsUrl:'../dict/getItems?code=C06'
		}, {
			type : 'select',//类型
			name : 'origin',//name
			id : 'origin',//id
			label : '数据来源',//左边label
			cls : 'input-large',
			items:[],
			itemsUrl:'../dict/getItems?code=C07'
		}, {
			type : 'text',//类型
			name : 'dataTime',//name
			id : 'dataTime',//id
			label : '数据采集时间',//左边label
			cls : 'input-large'
		}, {
			type : 'textarea',//类型
			name : 'info',//name
			id : 'info',//id
			label : '说明',//左边label
			cls : 'input-large'
		}, {
			type : 'textarea',//类型
			name : 'showDataQuery',//name
			id : 'showDataQuery',//id
			label : '数据示例query',//左边label
			cls : 'input-large'
		}, {
			type : 'text',//类型
			name : 'sortField',//name
			id : 'sortField',//id
			label : '默认排序字段',//左边label
			cls : 'input-large'
		}, {
			type : 'text',//类型
			name : 'whereField',//name
			id : 'whereField',//id
			label : '过滤条件',//左边label
			cls : 'input-large'
		}, {
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
				text : '隐藏',
				value : '0'
			} ]
		}, {
			type : 'checkboxGroup',//类型
			name : 'set',//name
			id : 'set',//id
			label : '设置按钮',//左边label
			cls : 'input-large',
			items : [ {
				text : '查看',
				value : 'isDetail',
				checked:true,
				disabled:true
			}, {
				text : '更新',
				value : 'isUpdate'
			}, {
				text : '添加',
				value : 'isInsert'
			}, {
				text : '删除',
				value : 'isDelete'
			} ]
		} ];
		//分类设置
		var tItems = [ {
			type : 'hidden',
			name : 'id',
			id : 'id'
		}, {
			type : "hidden",
			name : "pId",
			id : "pId"
		}, {
			type : "hidden",
			name : "seq",
			id : "seq"
		}, {
			label : '类型',//左边label
			type : "hidden",
			name : "type",
			id : "type"
		}, {
			type : 'text',//类型
			name : 'gridName',//name
			id : 'gridName',//id
			label : '名称',//左边label
			cls : 'input-large',
			rule : {
				required : true
			},
			message : {
				required : "请输入"
			}
		}, {
			type : 'textarea',//类型
			name : 'info',//name
			id : 'info',//id
			label : '说明',//左边label
			cls : 'input-large'
		}, {
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
				text : '禁用',
				value : '0'
			} ]
		} ];
		function generForm(type) {
			modal = $.dmModal({
				id : "siteForm",
				title : "添加",
				distroy : true,
				width : '850px'
			});
			modal.show();
			if (type == '0') {
				formOpts.items = aItems;//表设置
				return modal.$body.dmForm(formOpts);
			} else {
				formOpts.items = tItems;//分类
				return modal.$body.dmForm(formOpts);
			}
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
			refreshTree();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
