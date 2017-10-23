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
										<div class="scroller"  style="min-height:289px;"
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
										class="caption-subject theme-font bold uppercase">频道列表</span>
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
		var channelTree;
		var currentSiteId;
		var currentChannelId;

		var channelSetting = {
			view : {
				showIcon : false,
				selectedMulti : false
// 				addHoverDom: addHoverDom,
// 				removeHoverDom: removeHoverDom
			},
			edit : {
				drag:{
					isCopy: false,
					isMove:true,
					prev:true,
					next:true,
					inner:false
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
				url : "",
				autoParam : [ "id", "name", "pId" ]
			},
			callback : {
				beforeAsync : function(treeId, treeNode) {
					if (typeof (currentSiteId) == "undefined") {
						return false;
					} else {
						return true;
					}
				},
				
				onAsyncSuccess : function(event, treeId, treeNode, msg) {
					if (msg.length == 0) {
						Metronic.alert({
							message : "该频道下暂无频道！",
							type : "warning",
							container : "#channel_tree_div",
							place : "prepend",
							close : false,
							closeInSeconds : 5
						});
					}
					channelTree.expandAll(true);
				},
				onClick : function(event, treeId, treeNode) {
					currentChannelId = treeNode.id;
					grid.reload({
						url : "./list?id=" + currentChannelId
					});
				},beforeDrop:beforeDrop,
				beforeDrag:beforeDrag
			}
		};
		//拖拽前执行
		  var dragId;
		  function beforeDrag(treeId, treeNodes) {
		      for (var i=0,l=treeNodes.length; i<l; i++) {
		          dragId = treeNodes[i].pId;
		        if (treeNodes[i].drag === false) {
		          return false;
		       }
		     }
		      return true;
		  }
		//拖拽释放之后执行  
		function beforeDrop(treeId, treeNodes, targetNode, moveType) {  
		        if(targetNode.pId == dragId){
		             var data = {id:treeNodes[0].id,targetId:targetNode.id,pid:treeNodes[0].pId,moveType:moveType};  
		             var confirmVal = false;  
		             $.ajax({  
		                  async: false,  
		                  type: "post",  
		                  data:data,  
		                  url:"./sort",  
		                  success: function(json){  
		                        if(json.status=="1" ){  
		                        	confirmVal = true;
		                        } else{  
		                        	bootbox.alert('操作失败');  
		                        }  
		                  },  
		                  error: function(){  
		                	  bootbox.alert('亲，网络有点不给力呀！');  
		                  }  
		             });  
		            return confirmVal;  
		        } else{  
					//bootbox.alert('亲，只能进行同级排序！');  
		             return false;  
		      }  
		}  
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
				field : "displayName",
				width : "15%"
			}, {
				title : "频道类型",
				field : "channelType",
				format:function(i,c){
					if(c.channelType==0)
							return "普通频道";
					if(c.channelType==11)
						return "可发布热点新闻频道";
					if(c.channelType==1)
						return "图片频道";
					if(c.channelType==2)
						return "链接频道";
					if(c.channelType==3)
						return "单页频道";
					 if(c.channelType==4)
						return "下载频道"; 
					if(c.channelType==5)
						return "视频频道";
					/* if(c.channelType==6)
						return "音频频道";
					if(c.channelType==7)
						return "小说频道"; */
					//if(c.channelType==8)
					////	return "访谈频道";
					//if(c.channelType==9)
					//	return "投票频道";
					//if(c.channelType==10)
					//	return "公开文件";
					//if(c.channelType==11)
					//	return "可发布头条频道";
					return "普通频道";
				},
				width : "10%"
			},{
				title : "每页条数",
				field : "pageSize",
				width : "3%",
				format:function(i,c){
					if(c.channelType==3){
						return "--";
					}
					return c.pageSize;
				}
			}, {
				title : "状态",
				field : "forbidden",
				width : "5%",
				format : function(i, c) {
					if (c.forbidden == "1") {
						return "隐藏";
					}
					return "启用";
				}
			} ],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "10%",
			actionCloums : [
					{
						text : "预览",
						cls : "green btn-sm",
						icon : "fa fa-search",
						handle : function(index, data) {
							window.open(data.url);
						}
					},  {
						text : "编辑",
						cls : "green btn-sm",
						handle : function(index, data) {
							modal = $.dmModal({
								id : "siteForm",
								title : "编辑",
								distroy : true
							});
							modal.show();
							var form = modal.$body.dmForm(getFormOptions(data.channelType));
							form.loadRemote("./load?channelId=" + data.id);
						}
					} ,{
						text : "静态化",
						cls : "green btn-sm",
						visable:function(index,data)
						{
							if(data.isHtml)
								{
								   return false;
								}
							return true;
							
						},
						handle : function(index, data) {
							$.post("./generatorHtml", {
								channelId : data.id
							}, function(res) {
								bootbox.alert(res.msg);
								grid.reload();

							});

						}
					},{
						text : "取消静态化",
						cls : "red btn-sm",
						visable:function(index,data)
						{
							if(data.isHtml)
								{
								   return true;
								}
							return false;
							
						},
						handle : function(index, data) {
							$.post("./cancelGeneratorHtml", {
								channelId : data.id
							}, function(res) {
								bootbox.alert(res.msg);
								grid.reload();

							});

						}
					} 
					],
			dropdowns:{
			    text:"添加",     
			    cls:"green btn-sm",
			    items:[{
					text : "普通频道",//按钮文本
					cls : "btn green",//按钮样式
					icon : "fa fa-cubes",
					handle : function(grid) {//按钮点击事件
						showForm('0',"普通频道");
					}
				},
				{
					text : "可发布热点新闻频道",//按钮文本
					cls : "btn green",//按钮样式
					icon : "fa fa-cubes",
					handle : function(grid) {//按钮点击事件
						showForm('11',"普通频道");
					}
				},
				{
					text : "链接频道",//按钮文本
					cls : "btn green btn-sm",//按钮样式
					icon : "fa fa-cubes",
					handle : function(grid) {//按钮点击事件
						showForm('2',"链接频道");
					}
				},{
					text : "单页频道",//按钮文本
					cls : "btn green btn-sm",//按钮样式
					icon : "fa fa-cubes",
					handle : function(grid) {//按钮点击事件
						showForm('3',"单页频道");
					}
				},{
					text : "下载频道",//按钮文本
					cls : "btn green btn-sm",//按钮样式
					icon : "fa fa-cubes",
					handle : function(grid) {//按钮点击事件
						showForm('4',"下载频道");
					}
				},
				{
					text : "视频频道",//按钮文本
					cls : "btn green btn-sm",//按钮样式
					icon : "fa fa-cubes",
					handle : function(grid) {//按钮点击事件
						showForm('5',"视频频道");
					}
				},
				/* {
					text : "访谈频道",//按钮文本
					cls : "btn green btn-sm",//按钮样式
					icon : "fa fa-cubes",
					handle : function(grid) {//按钮点击事件
						showForm('8',"访谈频道");
					}
				}, 
				{
					text : "投票频道",//按钮文本
					cls : "btn green btn-sm",//按钮样式
					icon : "fa fa-cubes",
					handle : function(grid) {//按钮点击事件
						showForm('9',"投票频道");
					}
				},{
					text : "文件频道",//按钮文本
					cls : "btn green btn-sm",//按钮样式
					icon : "fa fa-cubes",
					handle : function(grid) {//按钮点击事件
						showForm('10',"文件频道");
					}
				}*//* ,{
					text : "音频频道",//按钮文本
					cls : "btn green btn-sm",//按钮样式
					icon : "fa fa-cubes",
					handle : function(grid) {//按钮点击事件
						showForm('6',"音乐频道");
					}
				},{
					text : "小说频道",//按钮文本
					cls : "btn green btn-sm",//按钮样式
					icon : "fa fa-cubes",
					handle : function(grid) {//按钮点击事件
						showForm('7',"小说频道");
					}
				} */
				]
			},
			tools : [ {
				text : " 删 除",
				cls : "btn red btn-sm",//按钮样式
				handle : function(grid) {
					deleteItems(grid.getSelectIds());
				}
			} ],
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
		var getFormOptions = function(channelType) {
			var items=[ {
				type : 'hidden',
				name : 'id',
				id : 'id'
			},{
				type:'hidden',
				name:'channelType',
				id:'channelType'
			}, {
				type : "tree",
				name : "siteId",
				id : "siteId",
				label : "所属站点",
				url : "../site/tree",
				autoParam : [ "id", "name", "pId" ],
				chkStyle : "radio",
				expandAll : false,
				rule : {
					required : true
				},
				message : {
					required : "请选择所属站点"
				}
			}, {
				type : "tree",
				name : "pid",
				id : "pid",
				label : "所属频道",
				detail : "顶级节点不选择",
				url : "./tree?siteId=" + currentSiteId,
				autoParam : [ "id", "name", "pId" ],
				expandAll : false,
				chkStyle : "radio"
			}, {
				type : 'text',//类型
				name : 'displayName',//name
				id : 'displayName',//id
				label : '频道名称',//左边label
				cls : 'input-xlarge',
				rule : {
					required : true
				},
				message : {
					required : "频道名称"
				}
			}, {
				type : 'textarea',//类型
				name : 'desc',//name
				id : 'desc',//id
				label : '频道描述',//左边label
				cls : 'input-xlarge'
			},{
				type : 'image',
				id : 'channelIcon',
				name : 'channelIcon',
				label : '频道图标',
				isAjaxUpload : true,
				autoUpload : true,
				uploadUrl : '../attachment/singleUpload',
				onSuccess : function(data) {
					if (data.status == "1") {
						$("#channelIcon")
								.attr("value", data.attachment.attachmentUrl);
					} else {
						alert(data.msg);
					}
				},
				deleteHandle : function() {
					$("#channelIcon").attr("value", "");
				}
			} ];
			var forbidden={
				type:'radioGroup',
				name:'forbidden',
				id:'forbidden',
				label:'状态',
				cls:'input-xlarge',
				items : [ {
							value : '0',
							text : '启用',
							checked:true
						},{
							value:'1',
							text:'隐藏'
						} 
					],
				rule : {
					required : true
				},
				message : {
					required : "请选择模板启用状态"
				}
			};
			var eName = {
					type : 'text',//类型
					name : 'enName',//name
					id : 'enName',//id
					label : '英文标示',//左边label
					cls : 'input-xlarge',
					rule : {
						required : true
					},
					message : {
						required : "请输入英文标示"
					}
				};
				var pageSize = {
					type : 'text',//类型
					name : 'pageSize',//name
					id : 'pageSize',//id
					label : '每页条数',//左边label
					cls : 'input-xlarge',
					rule : {
						required : true,
						number:true
					},
					message : {
						required : "请输入",
						number:"数字"
					}
				};
				var templateType = {
					type : 'select',
					name : 'templateId',
					id : 'templateId',
					label : '页面模板',
					cls : 'input-xlarge',
					items : [ {
						value : '',
						text : '默认模板'
					} ],
					itemsUrl : "../template/selects?templateType=1&siteId="+currentSiteId
				};
				var url = {
						type : 'text',//类型
						name : 'url',//name
						id : 'url',//id
						label : '链接地址',//左边label
						cls : 'input-xlarge',
						rule : {
							required : true
						},
						message : {
							required : "请输入"
						}	
				};
				var doc={
						type : 'kindEditor',
						name : 'contentText',
						id : 'contentText',
						label : '内容文本',
						height : "300px",
						width : "500px",
						rule : {
							required : true
						},
						message : {
							required : "请输入内容文本"
						}
				};
			if(channelType==0){//普通频道
				items.push(eName);
				items.push(pageSize);
				items.push(templateType);
			}else if(channelType==11){//发布头条频道
				items.push(eName);
				items.push(pageSize);
				items.push(templateType);
			}else if(channelType==1){//视频频道
				items.push(eName);
				items.push(pageSize);
				items.push(templateType);
			}else if(channelType==2){//链接频道
				items.push(url);
				items.push(eName);
				//items.push(templateType);
			}
			else if(channelType==3){//单页频道
				items.push(eName);
				items.push(doc);
				items.push(templateType);
			}else if(channelType==4){//下载频道
				items.push(eName);
				items.push(pageSize);
				items.push(templateType);
			}else if(channelType==5){//小说频道
				items.push(eName);
				items.push(pageSize);
 				items.push(templateType);
			}
			else if(channelType==6){//音乐频道
				items.push(eName);
				items.push(pageSize);
 				items.push(templateType);
			}
			else if(channelType==7){//视频频道
				items.push(eName);
				items.push(pageSize);
 				items.push(templateType);
			}
			else if(channelType==8){//访谈频道
				items.push(eName);
				items.push(pageSize);
 				items.push(templateType);
			}
			else if(channelType==9){//访谈频道
				items.push(eName);
				items.push(pageSize);
 				items.push(templateType);
			}
			else if(channelType==10){//文件频道
				items.push(eName);
				items.push(pageSize);
 				items.push(templateType);
			}
			items.push(forbidden);
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
					//channelTree.reAsyncChildNodes(null, "refresh");
				},
				submitText : "保存",//保存按钮的文本
				showReset : true,//是否显示重置按钮
				resetText : "重置",//重置按钮文本
				isValidate : true,//开启验证
				buttons : [ {
					type : 'button',
					text : '关闭',
					handle : function() {
						modal.hide();
						//channelTree.reAsyncChildNodes(null, "refresh");
					}
				} ],
				buttonsAlign : "center",
				//表单元素
				items : items
			};
			return formOpts;
		}
		function deleteItem(id) {
	        bootbox.confirm("删除后该频道下的内容将无法显示,确定删除吗？", function (result) {
	            if (result) {
	                $.ajax({
	                    type: "POST",
	                    data: "ids=" + id,
	                    dataType: "json",
	                    url: "./delete",
	                    success: function(data){
	                    	if (data.status == 1) {
	                            grid.reload();
	                            channelTree.reAsyncChildNodes(null, "refresh");
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
							message : "<a href='../site/page'>请先新建频道！</a>",
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
		function showForm(channelType,title){
			if (currentSiteId == null) {
				alert("请先选择站点！");
				return false;
			}
			modal = $.dmModal({
				id : "siteForm",
				title : "添加"+title,
				distroy : true
			});
			modal.show();
			var form = modal.$body.dmForm(getFormOptions(channelType));
			form.setValue("siteId", currentSiteId);
			form.setValue("pid", currentChannelId);
			form.setValue("channelType", channelType);
			channelTree.reAsyncChildNodes(null, "refresh");
		}
		function refreshSite() {
			if (typeof (channelTree) == "undefined") {
				$.fn.zTree.init($("#channel_tree"), channelSetting, "");
				channelTree = $.fn.zTree.getZTreeObj("channel_tree");
			}
			currentSiteId = $("#select2_site").val();
			channelTree.setting.async.url = "./tree?siteId=" + currentSiteId;
			channelTree.reAsyncChildNodes(null, "refresh");
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
