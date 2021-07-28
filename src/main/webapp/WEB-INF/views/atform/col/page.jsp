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
				<div class="col-md-3 col-sm-12">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<!-- BEGIN PORTLET-->
							<div class="portlet light">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font hide"></i> <span
											class="caption-subject theme-font bold uppercase">资源树</span>
										<span class="caption-helper"></span>
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
									class="caption-subject theme-font bold uppercase">资源信息配置</span>
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
		/**********普通内容操作函数****************/
		var COOKIE_LASRNODEID = "last_node_id";
		var tableTree;
		var form;
		var grid;
		var currentTableId = $.cookie(COOKIE_LASRNODEID);
		var currentTableType;
		function refreshTree() {

			if (typeof (tableTree) == "undefined") {
				$.fn.zTree.init($("#table_tree"), tableSetting, "");
				tableTree = $.fn.zTree.getZTreeObj("table_tree");
			}else{
				tableTree.reAsyncChildNodes(null, "refresh");
			}
			if (typeof (grid) != "undefined") {
				grid.reload({
					url : "./gridlist?tableId=" + currentTableId
				});
			}
		}
		var tableSetting = {
			view : {
				showIcon : false,
				selectedMulti : false
			// 				addHoverDom: addHoverDom,
			// 				removeHoverDom: removeHoverDom
			},
			edit : {
				drag : {
					isCopy : false,
					isMove : false,
					prev : true,
					next : true,
					inner : false
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
				url : "../table/tree",
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
					//console.log(node);
					tableTree.expandNode(node, true, false);//指定选中ID节点展开  
				
				},
				onClick : function(event, treeId, treeNode) {
					currentTableId = treeNode.id;
					$.cookie(COOKIE_LASRNODEID,currentTableId,{expires:7});
					currentTableType = treeNode.s;
					grid.reload({
						url : "./gridlist?tableId=" + currentTableId
					});
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
			if (targetNode.pId == dragId) {
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
						bootbox.alert('亲，网络有点不给力呀！');
					}
				});
				return confirmVal;
			} else {
				//bootbox.alert('亲，只能进行同级排序！');  
				return false;
			}
		}
		var gridOption = {
			url : "./gridlist", // ajax地址
			pageNum : 1,//当前页码
			pageSize : 15,//每页显示条数
			idFiled : "id",//id域指定
			showCheckbox : true,//是否显示checkbox
			checkboxWidth : "3%",
			showIndexNum : true,
			indexNumWidth : "5%",
			pageSelect : [ 5, 15, 30, 50 ],
			cloums : [
					{
						title : "名称",
						field : "aTitle",
						width : "10%",
						sort : true
					},
					{
						title : "数据表字段",
						field : "aField",
						width : "10%",
						sort : true
					},
					{
						title : "列表中展示",
						field : "gridShow",
						width : "10%",
						format : function(i, data) {
							return data.gridShow ? '是'
									: '否' ;
						}
					} ,
					{
						title : "详情页展示",
						field : "detailShow",
						width : "10%",
						format : function(i, data) {
							return data.detailShow ? '是'
									: '否' ;
						}
					} ],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "20%",
			actionCloums : [ {
				text : "编辑",
				cls : "green btn-sm",
				handle : function(index, data) {
					//index为点击操作的行数
					//data为该行的数据
					modal = $.dmModal({
						id : "siteForm",
						title : "表单",
						distroy : true
					});
					modal.show();
					var form = modal.$body.dmForm(formOpts);
					form.loadLocal(data);
					//form.loadRemote("./load?siteId=" + data.id);
				}
			}, {
				text : "上移",
				cls : "green btn-sm",
				visable:function(index){
					if(index==0){
						return false;
					}
					return true;
				},
				handle : function(index, data,id,ele) {
					var tid = $(ele).parent().parent().prev().find(".checkboxes").val();
					seq(id,tid);
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
				text : " 添 加",//按钮文本
				cls : "btn btn-sm green",//按钮样式
				icon : "fa fa-cubes",
				handle : function(grid) {//按钮点击事件
					if(currentTableId && currentTableType=='0'){
						modal = $.dmModal({
							id : "siteForm",
							title : "添加",
							distroy : true
						});
						modal.show();
						var form = modal.$body.dmForm(formOpts);
						form.loadLocal({"tableId":currentTableId});
					}else{
						bootbox.alert("请先选中左侧具体的分类");
					}
				}
			}/* , {
				text : " 删 除",
				cls : "btn btn-sm red ",//按钮样式
				handle : function(grid) {
					deleteItems(grid.getSelectIds());
				}
			} */ ],
			search : {
				rowEleNum : 4,
				//搜索栏元素
				items : [ {
					type : "text",
					label : "名称",
					name : "aTitle",
					placeholder : "输入要搜索的名称"
				}, {
					type : "text",
					label : "数据库字段名",
					name : "aField",
					placeholder : "输入要搜索的名称"
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
			items : [ {
				type : 'hidden',
				name : 'id',
				id : 'id'
			},{
				type : 'hidden',
				name : 'aSeq',
				id : 'aSeq'
			},{
				type : 'hidden',
				name : 'tableId',
				id : 'tableId'
			}, {
				type : 'text',//类型
				name : 'aTitle',//name
				id : 'aTitle',//id
				label : '名称',//左边label
				cls : 'input-large',
				placeholder:'名称',
				rule : {
					required : true
				},
				message : {
					required : "请输入"
				}
			}, {
				type : 'text',//类型
				name : 'aField',//name
				id : 'aField',//id
				label : '数据表字段',//左边label
				cls : 'input-large',
				placeholder:'name',
				rule : {
					required : true
				},
				message : {
					required : "请输入"
				}
			}, {
				type : 'text',//类型
				name : 'aFormat',//name
				id : 'aFormat',//id
				label : '格式化数据',//左边label
				cls : 'input-large',
				placeholder:'1_a_2_b'
				
			}, {
				type : 'text',//类型
				name : 'aWidth',//name
				id : 'aWidth',//id
				cls : 'input-large',
				label : '默认宽度',//左边label
				cls : 'input-large',
				placeholder:'10%'
				
			}, {
				type : "select",
				name : "aType",
				id : "aType",
				cls : 'input-large',
				label : '类型',
				items : [ {
					text : '输入框',
					value : "text",
					checked : true
				},{
					text : '文本框',
					value : "textarea"
				},{
					text : '隐藏域',
					value : "hidden"
				}
				,{
					text : '时间框',
					value : "datepicker"
				}, {
					text : '单选框',
					value : "radioGroup"
				}, {
					text : '复选框',
					value : "checkboxGroup"
				}, {
					text : '下拉框',
					value : "select"
				} ]
				
			}, {
				type : "checkboxGroup",
				name : "set", 
				id : "set",
				label : '设置',
				items : [ {
					text : '列表中展示',
					value : "grid",
					checked : false
				}, {
					text : '表单中展示',
					value : "form",
					checked : true
				}, {
					text : '可排序',
					value : "sort",
					checked : false
				}, {
					text : '可检索',
					value : "search",
					checked : false
				} ]
				
			} ]
		};
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
								bootbox.alert(data.msg);
							}
						}
					});
				}
			})
		}
		function seq(id ,tid){
			$.ajax({
				type:"post",
				url:'./seq',
				data:{id:id,tid:tid},
				success:function(res){
					if(res.status==1){
						grid.reload();
					}else{
						bootbox.alert("错误");
					}
					
				}
				
			});
			
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
