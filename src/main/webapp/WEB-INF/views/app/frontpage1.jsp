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
<title></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/select2/select2.css" />

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<%-- <link href="<%=basePath%>assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> --%>
<link href="<%=basePath%>assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
 <link href="<%=basePath%>assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"> 
<link href="<%=basePath%>assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->

<link href="<%=basePath%>assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/global/css/news.css" rel="stylesheet" type="text/css">
<%-- <link href="<%=basePath%>assets/global/css/plugins.css" rel="stylesheet" type="text/css"> --%>
<link href="<%=basePath%>assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="<%=basePath%>assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">

<!-- END THEME STYLES -->
<link rel="shortcut icon" href="<%=basePath%>favicon.ico">

<!-- BEGIN PAGE LEVEL STYLES -->
<link href="<%=basePath%>assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" >
<%-- <link href="<%=basePath%>assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css"> --%>
<%-- <link href="<%=basePath%>assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css"> --%>
<%-- <link href="<%=basePath%>assets/global/plugins/jquery-tags-input/jquery.tagsinput.css" rel="stylesheet" type="text/css" > --%>
<%-- <link href="<%=basePath%>assets/global/plugins/jquery-minicolors/jquery.minicolors.css" rel="stylesheet" type="text/css"> --%>
<link href="<%=basePath%>assets/dmcms/plugins/zTree/css/zTreeStyle/sn_zTreeStyle.css" type="text/css"  rel="stylesheet" >	
<link href="<%=basePath%>assets/dmcms/css/shake.css" type="text/css"  rel="stylesheet" >	
	<%-- 
	
<%@include file="../../includejsps/style.jsp"%>
<%@include file="../../includejsps/plugin-style.jsp"%> --%>
<style>
	 .page-content {
    background: #6C8CB3;
    padding: 15px 0 15px;
	}
	.portlet > .portlet-title {
    border-bottom: 1px solid #213E70;
	}  
	.actions{
	        float: right;
    		display: inline-block;
    	    padding: 5px 5px 0 0 ;
		}
		.current{
			padding: 5px; box-shadow: rgba(69, 182, 175) 0px 0px 12px; outline-offset: 19px; outline: 0px;
		}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
	
	<div class="page-content">
		<div class="container" style="">
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
											class="caption-subject theme-font bold uppercase">区划树</span>
										<span class="caption-helper"></span>
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
									class="caption-subject theme-font bold uppercase" id="gridName">数据详情</span>
								<span id="helper" class="caption-helper"></span>
							</div>
						</div>
						<div class="portlet-body" id="content_pannel" style="height: 500px;overflow-y:scroll"></div>
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

	<!-- BEGIN JAVASCRIPTS-->
<%-- 	<%@include file="../../includejsps/js.jsp"%> --%>
<%-- 	<%@include file="../../includejsps/plugin-js.jsp"%> --%>
<!-- BEGIN CORE PLUGINS -->
<script type="text/javascript">
    //根路径
    var dm_root = "<%=basePath%>";
</script>
<!--[if lt IE 9]>
<script src="<%=basePath%>assets/global/plugins/respond.min.js"></script>
<script src="<%=basePath%>assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="<%=basePath%>assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>assets/global/plugins/jquery.tmpl.min.js"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=basePath%>assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/admin/layout3/scripts/theme.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    bootbox.setDefaults({
        locale: "zh_CN"
    });
    $(document).ready(function () {
        Metronic.init(); // init metronic core componets
        Layout.init(); // init layout
        Theme.init();
    });
</script>

	
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=basePath%>assets/dmcms/js/jquery.timers-1.1.2.js"></script>
<script src="<%=basePath%>assets/dmcms/js/checkdata.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<%-- <script type="text/javascript" src="<%=basePath%>assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js"></script> --%>
<%-- <script type="text/javascript" src="<%=basePath%>assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script> --%>
<%-- <script type="text/javascript" src="<%=basePath%>assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script> --%>
<%-- <script src="<%=basePath%>assets/global/plugins/jquery-tags-input/jquery.tagsinput.min.js" type="text/javascript"></script> --%>
<%-- <script src="<%=basePath%>assets/global/plugins/jquery-minicolors/jquery.minicolors.min.js" type="text/javascript"></script> --%>
<%-- <script type="text/javascript" src="<%=basePath%>assets/dmcms/plugins/datePicker/laydate.js"></script> --%>
<script type="text/javascript" src="<%=basePath%>assets/dmcms/plugins/zTree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/dmcms/plugins/zTree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/dmcms/plugins/zTree/js/jquery.ztree.exedit-3.5.js"></script>
<%-- <script charset="utf-8" src="<%=basePath%>assets/dmcms/plugins/kindeditor-4.1.10/kindeditor.js"></script> --%>
<%-- <script charset="utf-8" src="<%=basePath%>assets/dmcms/plugins/kindeditor-4.1.10/lang/zh_CN.js"></script> --%>
<%-- <script type="text/javascript" src="<%=basePath%>assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>  --%>
<%-- <script type="text/javascript" src="<%=basePath%>assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script> --%>
<%-- <script src="<%=basePath%>assets/dmcms/js/ajaxfileupload.js" type="text/javascript"></script> --%>
<%-- <script src="<%=basePath%>assets/dmcms/js/inbox.js" type="text/javascript"></script> --%>
<%-- <script src="<%=basePath%>assets/dmcms/js/grid.js" type="text/javascript"></script> --%>
<%-- <script src="<%=basePath%>assets/dmcms/js/form.js" type="text/javascript"></script> --%>
<script src="<%=basePath%>assets/dmcms/js/modal.js" type="text/javascript"></script>
<%-- <script src="<%=basePath%>assets/dmcms/js/file-manager.js?v=1" type="text/javascript"></script> --%>
<!-- END PAGE LEVEL PLUGINS -->
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/select2/select2.min.js"></script>
	<script type="text/javascript">
		/**********普通内容操作函数****************/
		var root ='<%=basePath%>';
		var tableTree;
		var form;
		var grid;
		var currentTableId='';
		var currentTableType;
		function refreshTree() {

			if (typeof (tableTree) == "undefined") {
				$.fn.zTree.init($("#table_tree"), tableSetting, "");
				tableTree = $.fn.zTree.getZTreeObj("table_tree");
			}else{
				tableTree.reAsyncChildNodes(null, "refresh");
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
				url :  root+"portal/regtree",
				autoParam : [ "id", "name", "pId" ]
			},
			callback : {
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
				} 
			}
		};
		function treeOnClike(event,treeId,treeNode){
			addTip("content_pannel",treeId,treeNode.name,treeNode.name,treeNode.i,"tree");
			$("#content_pannel").scrollTop(5000000000);
		}
		function addTip(currentEleId,name,value,title,level,content,type,json){
			var id = ("item_"+Math.random()).replace('.','');
			var content = getcontent(id,name,value,level,type);	
			tip(currentEleId,id,name,title,content,type)
		}
		function getColor(type){
			return 'danger';//[success,default,worning,primary,default,info]
		}
		function template(templ,data){
			$.each(data,function(key,value){
				key="{"+key+"}";
				var reg =new RegExp(key,"g");
				templ = templ.replace(reg,value);
			});
			return templ;
		}
		var blocks = '<div class="col-md-4 {shake_}" id="{id_}" >'
		+'<div class="actions"><a class="btn btn-circle btn-icon-only btn-default" href="javascript:removethis(\'{id_}\');">'
			+'<i class="icon-trash"></i>'
			+'</a></div><div class="note note-{color_} note-bordered">'
		+'<h4 class="block">{title_}</h4>'
		+'<p>{content_}'
		+'</p>'
		+'</div></div>';
		function getcontent(eleId,name,value,level,type){
			if(type=='tree'){
				var nongji ='<a href="javascript:nongji(\''+eleId+'\','+level+',\''+value+'\')">基本信息</a>';
				var qiye ='<a href="javascript:qiye(\''+eleId+'\','+level+',\''+value+'\')">基本信息</a>';
				var nongji ='<a href="javascript:nongji(\''+eleId+'\','+level+',\''+value+'\')">基本信息</a>';
				var data= {"data":[{"农机服务组织":nongji},{"涉农企业":qiye},{"农机服务组织":nongji}],"status":'1'};
				return randderRow(eleId,data,level,type);
			}else{
				
			}
			
			return randderRow([{name:'张三'}]);
		}
		function qiye(eleid,level,name,id){
			var data={ss:name};
			if(level==0){
				data = {'QX_MC':name};
			}
			if(level==1){
				data = {'XZ_MC':name};
			}
			if(level==2){
				data = {'XZC_MC':name};
			}
			if(id){
				data = {'_id':id};
			}
			$.post('./qiyeinfo',data,function(res){
				addQiyeTip(eleid,res,name+"(涉农企业)",level);
			});
		}
		function nongji(eleid,level,name,id){
			var data={ss:name};
			if(level==0){
				data = {'QX_MC':name};
			}
			if(level==1){
				data = {'XZ_MC':name};
			}
			if(level==2){
				data = {'XZC_MC':name};
			}
			if(id){
				data = {'_id':id};
			}
			$.post('./njffinfo',data,function(res){
				addNongjiTip(eleid,res,name+"(农机)",level);
			});
		}
		function addNongjiTip(currentEleId,data,name,level){
			var id = ("item_"+Math.random()).replace('.','');
			var content = randderRow(id,data,level);
			tip(currentEleId,id,name,name,content);
		}
		function addQiyeTip(currentEleId,data,name,level){
			var id = ("item_"+Math.random()).replace('.','');
			var content = randderQiyeRow(id,data,level);
			tip(currentEleId,id,name,name,content);
		}
		function tip(currentEleId,id,name,title,content){
			var color = getColor(name);//'danger';//[success,default,worning,primary,default,info]
			var $greenpannel = $(template(blocks, {
                "id_": id,
                "title_": title,                
                "shake_": 'shake shake-slow',
                "color_":color,//[success,default,worning,primary,default,info]
				"content_":content
            }));
			setTimeout(function(){$greenpannel.removeClass("shake shake-slow");},300);
			if(currentEleId=='content_pannel'){
				$("#content_pannel").append($greenpannel);
			}else{
				$('#'+currentEleId).after($greenpannel);
			}
		}
		function randderRow(eleId,data,level,type){
			if(data.status=='1'){
				if(type=='tree'){
					if(data.data.length==1){
						var items = randOne(eleId,data.data[0]);
						return template(rowsTemplate,{
							"items_":items
						});
					}else{
						var items = randAll(eleId,data.data,level,null);
						return template(rowsTemplate,{
							"items_":items
						});
					}
				}
				if(type=='nongji'){
					if(data.data.length==1){
						var items = randOne(eleId,data.data[0],type);
						return template(rowsTemplate,{
							"items_":items
						});
					}else{
						var items = randAll(eleId,data.data,level,type);
						return template(rowsTemplate,{
							"items_":items
						});
					}
				}
				
			}if(data.status=='0'){
				throw error(data.msg);
			}
		}
		
		function error(msg){
			alert(msg);
		}
		function randAll(eleId,list,level,type){
			if(type=='tree'){
				level = 2;
				var items ='';
				for(var i=0;i<list.length;i++){
					items+= randOne(eleId,list[i],level);
				}
				return items;
			}
			if(type=='nongji'){
				randNongjiAll(eleId,list,level);
			}
			
		}
		function randNongjiAll(eleId,list,level){
			level = 2;
			var items ='';
			for(var i=0;i<list.length;i++){
				items+= randOneforList(eleId,list[i],level);
			}
			return items;
		}
		function randOneforList(eleId,one,level){
			//level = paseint(level)+1;
			var item ='';
			var key = '';
			var value = one['mc']==undefined?one["xzcMc"]==undefined?one["qxMc"]:one["xzcMc"]:one['mc'];
			var id = one.id;
			var nongji ='<a href="javascript:nongji(\''+eleId+'\','+level+',\''+value+'\',\''+id+'\')">'+value+'</a>';
			item+=template(rowTemplate,{
					"name_":key,
					"value_":nongji
			});
			console.log(item);
			return item;
		}
		function randOne(eleId,one,level,type){
			if(type=='tree'){
				var item = '';
				$.each(one,function(key,value){
					item+=template(rowTemplate,{
						"name_":key,
						"value_":value
					});
				});
				return item;
			}
			if(type=='nongji'){
				var item = '';
				$.each(one,function(key,value){
					item+=template(rowTemplate,{
						"name_":key,
						"value_":value
					});
				});
				return item;
			}
		}
		
		
		
		var rowsTemplate = '<div class="portlet blue-hoki box">'
			+'<div class="portlet-body">{items_}'
			+'</div>'
			+'</div>';
		var rowTemplate = '<div class="row static-info">'
				+'<div class="col-md-5 name">'
				+'{name_}:'
				+'</div>'
				+'<div class="col-md-7 value">'
				+'{value_}'
				+'</div>'
			+'</div>';
		
		function removethis(id){
			var that = $('#'+id);
			that.css("overflow-y","scroll");
			//that.addClass("shake shake-hard");
			setInterval("tomin('"+id+"')",10);
			setTimeout(function(){$('#'+id).remove();},200);
		}
		function tomin(id){
			var that = $('#'+id);
			var wi = that.css('width');
			var he = that.css('height');
			that.css('width',parseInt(wi)-10);
			that.css('height',parseInt(he)-13);
		}
		jQuery(document).ready(function() {
			refreshTree();
		});
		
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
