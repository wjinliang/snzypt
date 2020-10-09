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
									class="caption-subject theme-font bold uppercase" id="gridName">数据表格</span>
								<span id="helper" class="caption-helper"></span>
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
		/**********普通内容操作函数****************/
		var currentTableId = $.cookie(COOKIE_LASRNODEID);
		var tableTree;
		var form;
		var grid;
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
					url : "./list?tableId=" + currentTableId
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
					//双击不操作
					/* if (treeNode.clickTimeout) {
				        clearTimeout(treeNode.clickTimeout);
				        treeNode.clickTimeout = null;
				    } else {
				    	treeNode.clickTimeout = setTimeout(function() { */
				    		treeOnClike(event,treeId,treeNode);
				    	/* },250);
				    } */
				},
				onDblClick:function(event, treeId, treeNode){
					/* var form  = generForm(treeNode.s);
					form.loadRemote("./load?id=" + treeNode.id); */
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
		function treeOnClike(event,treeId,treeNode){
		currentTableId = treeNode.id;
		$.cookie(COOKIE_LASRNODEID,currentTableId,{expires:7});
		currentTableType = treeNode.s;
		if(treeNode.s =='0'){
		beforReload(currentTableId,function(data){
			$('#gridName').html(data.info.gridName);
			//$('#helper').html(data.info.info);
			var helper = '';
			helper += '</br>数据名称:'+(data.info.gridName== null ?'':data.info.gridName );
			helper += '</br>数据来源:'+(data.info.origin== null ?'':data.info.origin );
			//helper += '</br>数据采集时间:'+(data.info.dataTime== null ?'':data.info.dataTime ) ;
			helper += '</br>数据描述:'+(data.info.info== null ?'':data.info.info ) ;;
			$('#helper').html(helper);
			//console.log(data);
				formOpts.items = data.formItem;
				if(typeof data.gridItem =='undefined'){
					bootbox.alert("未配置");
					return;//未定义
				}
				 formOpts.items.push({
					type : 'hidden',
					name : data.id,
					id : data.id
				}); 
				formOpts.action = "./insertOrUpdate?tableId=" + currentTableId;//表单action
		
				var searchSize = data.searchItem.length;
				var searchItem = {
					rowEleNum : searchSize,
					//搜索栏元素
					items : data.searchItem
					
				}
				//console.log(data);
				if(searchSize<=0){
					searchItem = undefined;
				}else if(searchSize<=3){
					searchItem.rowEleNum=3;
				}
				var tools;
				if(data.info.isInsert){
					tools=inserttoolsButton;
				}else{
					tools=undefined;
				}
				var actionCloums=[];
				
					actionCloums.push(detailButton);
				//console.log(data.info);
				if(data.info.isUpdate){
					actionCloums.push(updateButton);
				}
				if(data.info.isDelete){
					actionCloums.push(deleteButton);
				}
				if(data.info.tableName.indexOf("cms_")==0){
					//alert(data.info.tableName.indexOf("cmsContent"));
					actionCloums.push(publishButton);
					
				}
				grid.reload({
					url : "./list?tableId=" + currentTableId,
					cloums:data.gridItem,
					pageNum:1,
				 	idFiled : data.id,//id域指定
				 	search : searchItem,
				 	tools:tools,
				 	actionCloums:actionCloums
				});
				//console.log(searchItem);
			});}
	    	
		}; 
		  var detailButton = {
			text : "查看",
			cls : "green btn-sm",
			handle : function(index, data,id) {
				//index为点击操作的行数
				//data为该行的数据
				modal = $.dmModal({
					id : "detailForm",
					title : "查看",
					distroy : true,
					width : "800px"
				});
				modal.show();
				//console.log(formOpts);
				var form = modal.$body.dmForm(formOpts);
				//form.loadLocal(data);
				form.loadRemote("./load?tableId="+currentTableId+"&id=" + id,function(){
					$("#detailForm").find("input").attr("readonly","true");
					//$(":input").attr("disabled","true");
					$("#detailForm").find("button[role='reset']").remove();
					$("#detailForm").find("button[role='submit']").remove();
				});
			}
		};
		  var publishButton = {
					text : "发布到新闻",
					cls : "green btn-sm",
					handle : function(index, data,id) {
						modal = $.dmModal({
							id : "siteForm",
							title : "表单",
							distroy : true,
							width : "800px"
						});
						modal.show();
						//console.log(formOpts);
						var form = modal.$body.dmForm(publishformOpts);
						form.loadLocal({tableId:currentTableId,id:id});
						/* $.ajax({
							url:"./publish?tableId="+currentTableId+"&id=" + id,
							type:'POST',
							success:function(res){
								if(res.status=='1'){
									bootbox.alert("操作成功");
								}
							}
						}); */
					}
				};
		var updateButton = {
			text : "编辑",
			cls : "green btn-sm",
			handle : function(index, data,id) {
				//index为点击操作的行数
				//data为该行的数据
				modal = $.dmModal({
					id : "siteForm",
					title : "表单",
					distroy : true,
					width : "800px"
				});
				modal.show();
				//console.log(formOpts);
				var form = modal.$body.dmForm(formOpts);
				//form.loadLocal(data);
				form.loadRemote("./load?tableId="+currentTableId+"&id=" + id);
			}
		};
		
		var deleteButton = {
			text : "删除",
			cls : "red btn-sm",
			handle : function(index, data,id) {
				deleteItem(id);
			}
		};
		var inserttoolsButton = [
					//工具属性
					{
						text : " 添 加",//按钮文本
						cls : "btn btn-sm green",//按钮样式
						icon : "fa fa-cubes",
						handle : function(grid) {//按钮点击事件
							if(currentTableType == '0'){
								modal = $.dmModal({
									id : "siteForm",
									title : "添加",
									distroy : true,
									width : "800px"
								});
								modal.show();
								var form = modal.$body.dmForm(formOpts);
								form.loadLocal({"tableId":currentTableId});
							}else{
								bootbox("请选择数据表!");
							}
						}
					}/* , {
						text : " 删 除",
						cls : "btn btn-sm red ",//按钮样式
						handle : function(grid) {
							deleteItems(grid.getSelectIds());
						}
					} */ ];
		var gridOption = {
			url : "./list", // ajax地址
			pageNum : 1,//当前页码
			pageSize : 10,//每页显示条数
			idFiled : "id",//id域指定
			showCheckbox : false,//是否显示checkbox
			checkboxWidth : "3%",
			showIndexNum : true,
			indexNumWidth : "5%",
			pageSelect : [ 5, 15, 30, 50 ],
			cloums : [
					{
						title : "名称",
						field : "title",
						width : "10%",
						sort : true
					},
					{
						title : " 字段",
						field : "name",
						width : "10%",
						sort : true
					}
					 ],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "25%",
			actionCloums:[detailButton]
		};
		var modal;

		var publishformOpts  = {
			id : "table_form",//表单id
			name : "table_form",//表单名
			method : "post",//表单method
			action : "./publish",//表单action
			ajaxSubmit : true,//是否使用ajax提交表单
			labelInline : true,
			rowEleNum : 1,
			beforeSubmit : function() {

			},
			ajaxSuccess : function(data) {
				if(data.status=='1'){
					modal.hide();
					grid.reload();
					alert(data.msg);
				}else{
					alert(data.msg);
				}
				
				//refreshTree();
			},
			submitText : "发布",//保存按钮的文本
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
				name : 'tableId',
				id : 'tableId'
			}, {
				type : 'radioGroup',//类型
				name : 'channelId',//name
				id : 'channelId',//id
				label : '频道',//左边label
				items:[{value:11,text:'农村资讯'}
					,{value:12,text:'农经资讯'}
					,{value:13,text:'农业资讯'}
					,{value:14,text:'热点聚焦'}
					,{value:15,text:'红色预警'}
					,{value:16,text:'热点专题'}
					,{value:17,text:'事件追踪'}
				]
			}]};
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
			ajaxSuccess : function(data) {
				if(data.status=='1'){
					modal.hide();
					grid.reload();
				}else{
					alert(data.msg);
				}
				
				//refreshTree();
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
				name : 'tableId',
				id : 'tableId'
			}, {
				type : 'text',//类型
				name : 'aTitle',//name
				id : 'aTitle',//id
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
				name : 'aField',//name
				id : 'aField',//id
				label : '数据表字段',//左边label
				cls : 'input-large',
				rule : {
					required : true
				},
				message : {
					required : "请输入"
				}
			}, {
				type : 'text',//类型
				name : 'aWidth',//name
				id : 'aWidth',//id
				label : '默认宽度',//左边label
				cls : 'input-large'
				
			}, {
				type : "radioGroup",
				name : "gridShow",
				id : "gridShow",
				label : '列表中展示',
				items : [ {
					text : '是',
					value : "1",
					checked : true
				}, {
					text : '否',
					value : "0"
				} ],
				//itemsUrl:'../dict/getItems?code=C05',
				rule : {
					required : true
				},
				message : {
					required : "请选择"
				}
			}, {
				type : "radioGroup",
				name : "detailShow",
				id : "detailShow",
				label : '详情页展示',
				items : [ {
					text : '是',
					value : "1",
					checked : true
				}, {
					text : '否',
					value : "0"
				} ],
				//itemsUrl:'../dict/getItems?code=C05',
				rule : {
					required : true
				},
				message : {
					required : "请选择"
				}
			} ]
		};
		function beforReload(currentTableId,callbak){
			$.ajax({
				url:'./beforlist?tableId='+ currentTableId,
				async:true,
				type:'GET',
				dataType:'json',
				success:function(data){
					callbak(data);
				},
				error:function(){
					alert("操作异常");
				}
			});
			//alert(data);
			//return data;
		}
		function deleteItem(id){
			bootbox.confirm("确认删除?",function(res){
				if(res){
					$.ajax({
						url:'./delete?tableId='+currentTableId+'&id='+id,
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
