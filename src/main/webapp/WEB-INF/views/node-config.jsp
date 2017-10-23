<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
    <title>后台管理 | 节点配置管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@include file="./includejsps/style.jsp" %>
    <%@include file="./includejsps/plugin-style.jsp" %>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER -->
<%@include file="./includejsps/head.jsp" %>
<!-- END HEADER -->
<!-- BEGIN PAGE CONTAINER -->
<div class="page-container">
    <!-- BEGIN PAGE HEAD -->
   <%--  <div class="page-head">
        <div class="container">
            <!-- BEGIN PAGE TITLE -->
            <div class="page-title">
                <h1>搜索管理</h1>
            </div>
            <!-- END PAGE TITLE -->
            <!-- BEGIN PAGE TOOLBAR -->
            <%@include file="./includejsps/toolbar.jsp" %>
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
                                    class="caption-subject theme-font bold uppercase">节点配置管理</span>
                                <span class="caption-helper"></span>
                            </div>
                        </div>
                        <div class="portlet-body form">
	                        <form class="form-horizontal" id="searchConfig" action="#">
	                          <div class="form-body" id="config">
	                               <div class="form-group">
			                           <div class="col-md-3">
			                               <input class="form-control" id="isKeywords" type="checkbox" onchange="showKeywords(this);" <c:if test="${taskConfig.isKeywords==true}">checked="checked"</c:if> /> 
			                               <label class="control-label">是否开启关键字</label>
			                           </div>
			                       </div>
	                               <div id="keywords" class="form-group" style="display:none">
			                           <div class="col-md-3">
			                               <input class="form-control" type="text" name="keywords" value="${taskConfig.keywords}" /> 
			                           </div>
			                           <label class="control-label">关键字（多个请以逗号隔开）</label>
			                       </div>
			                       <div class="form-group">
			                           <div class="col-md-3">
			                               <input class="form-control" type="checkbox" id="isVisited" <c:if test="${taskConfig.isVisited==true}">checked="checked"</c:if> /> 
			                               <label class="control-label">是否按照访问量同步</label>
			                           </div>
			                       </div>
			                       <div class="form-group">
			                       <label class="control-label">选择同步频道</label>
										<div class="col-md-3" id="channel_tree_div" data-always-visible="1"
											data-rail-visible="1">
											<ul id="channel_tree" class="ztree"></ul>
										</div>
									</div>
									<input type="hidden" value="${taskConfig.channelIds}" id="channelIds" />
									
			                       <div class="form-group">
			                          <div class="col-md-3"><input id="onekeyBtn" type="button" class="btn green" value="一键配置"/>
			                       </div>
	                       </form>
	                    </div>   
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
<%@include file="./includejsps/foot.jsp" %>
<!-- END FOOTER-->
<!-- BEGIN JAVASCRIPTS-->
<%@include file="./includejsps/js.jsp" %>
<%@include file="./includejsps/plugin-js.jsp" %>

<script>
var channelTree;
function checkedNodes()
{
	var nodes = channelTree.getNodes();
	for(i=0;i<nodes.length;i++)
		{
		   if($("#channelIds").val().contains(nodes[i].id))
			   {
			    channelTree.checkNode(nodes[i], true, true);
			   }
		}
}
var channelSetting = {
		view : {
			showIcon : false,
			selectedMulti : false
//				addHoverDom: addHoverDom,
//				removeHoverDom: removeHoverDom
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
			enable : true
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
				channelTree.expandAll(false);
				checkedNodes();
			},
			onClick : function(event, treeId, treeNode) {
				currentChannelId = treeNode.id;
			}
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

    function showKeywords(htmlElement){
    	if(htmlElement.checked)
    		{
    		     $("#keywords").show();
    		}
    	else
    		{
    		$("#keywords").hide();
    		}
    }
    $("#onekeyBtn").click(function(){
    	 bootbox.confirm("确定配置?", function (result) 
	       {
    		 if(result)
    			{
    			 var nodes = channelTree.getCheckedNodes();
    		    	var ids="";
    		    	for(var i=0;i<nodes.length;i++)
    		    		{
    		    		  if(i==nodes.length-1)
    		    			  {
    		    			  ids=ids+nodes[i].id; 
    		    			  }
    		    		  else
    		    			  {
    		    		     ids=ids+nodes[i].id+",";  
    		    			  }
    		    		}
    		    	var isVisited = $("#isVisited").get(0).checked;
    		    	var isKeywords =  $("#isKeywords").get(0).checked;
			         $.ajax({
			           url:"./insertOrUpdate",
			           data:$("#searchConfig").serialize()+"&channelIds="+ids+"&isVisited="+isVisited+"&isKeywords="+isKeywords,
			           type:"post",
			           dataType:"json",
			           success:function(result)
			           {
			        	   bootbox.alert(result.msg);
			           }
			         });
    			}
	       });
    });
    
    function refreshSite() {
		if (typeof (channelTree) == "undefined") {
			$.fn.zTree.init($("#channel_tree"), channelSetting, "");
			channelTree = $.fn.zTree.getZTreeObj("channel_tree");
		}
		currentSiteId = $("#select2_site").val();
		currentSiteId = 2;
		channelTree.setting.async.url = "../../cms/channel/tree?siteId=" + currentSiteId;
		channelTree.reAsyncChildNodes(null, "refresh");
	}
    
    $(document).ready(function(){
    	refreshSite();
    	console.log($("#isKeywords").get(0).checked);
    	if($("#isKeywords").get(0).checked)
    		{
    	     $("#keywords").show();
    		}
    })
    
</script>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
