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
    <title>后台管理 | 搜索管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@include file="../includejsps/style.jsp" %>
    <%@include file="../includejsps/plugin-style.jsp" %>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER -->
<%@include file="../includejsps/head.jsp" %>
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
            <%@include file="../includejsps/toolbar.jsp" %>
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
                                    class="caption-subject theme-font bold uppercase">搜索管理</span>
                                <span class="caption-helper"></span>
                            </div>
                        </div>
                        <div class="portlet-body form">
	                        <form class="form-horizontal" id="searchConfig" action="#">
	                          <div class="form-body" id="config">
	                              <div class="form-group">
			                           <div class="col-md-3">
			                               <input class="form-control" type="text" name="ipAddress" value="${searchConfig.ipAddress}" /> 
			                           </div>
			                           <label class="control-label">搜索服务器地址</label>
			                       </div>
			                       <div class="form-group">
			                       <div class="col-md-3"><input  type="checkbox" <c:if test="${searchConfig.cmsContent==true}">checked="checked"</c:if> name="cmsContent" value=true />检索cms内容 </div>
			                       <!-- <div class="col-md-3"><input  type="checkbox" <c:if test="${searchConfig.attachment==true}">checked="checked"</c:if> name="attachment" value=true />检索附件文档 </div></div> -->
			                       <div class="form-group"><div class="col-md-3"><input  type="checkbox" name="highlight" <c:if test="${searchConfig.highlight==true}">checked="checked"</c:if> value=true />高亮显示 </div>
			                       </div>
			                       <input type="hidden" name="id" value="${searchConfig.id}"/>
			                       <div class="form-group"><div class="col-md-3">
			                           <select name="snippets" class="form-control">
			                                <option value=1 <c:if test="${searchConfig.snippets==1}">selected="selected"</c:if>>1</option>
			                                <option value=2 <c:if test="${searchConfig.snippets==2}">selected="selected"</c:if>>2</option>
			                                <option value=3 <c:if test="${searchConfig.snippets==3}">selected="selected"</c:if>>3</option>
			                           </select></div><label class="control-label">显示片段</label></div>
			                       </div>
			                       <div class="form-group">
			                           <div class="col-md-3">
			                               <input class="form-control" type="text" name="snippetsNum" value="${searchConfig.snippetsNum}" /> 
			                           </div>
			                           <label class="control-label">片段字符数</label>
			                       </div>
			                       <div class="form-group">
				                      <div class="col-md-3"> 
				                          <input type="text" class="form-control" id="colorPicker" name="highlightcolor" value="${searchConfig.highlightcolor}"/>
				                       </div>
				                       <label class="control-label">高亮颜色</label>
			                       </div>
			                       <div class="form-group">
			                          <div class="col-md-3"><input id="onekeyBtn"  type="button" class="btn green" value="一键配置"/>
			                          <input id="frontView"  type="button" class="btn green" onclick="window.open('../portal/jinhu/index.htm')" value="前台预览"/></div>
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
<%@include file="../includejsps/foot.jsp" %>
<!-- END FOOTER-->
<!-- BEGIN JAVASCRIPTS-->
<%@include file="../includejsps/js.jsp" %>
<%@include file="../includejsps/plugin-js.jsp" %>

<script>
    $("#onekeyBtn").click(function(){
    	 bootbox.confirm("确定配置?", function (result) 
	       {
    		 if(result)
    			{
			         $.ajax({
			           url:"./insertOrUpdate",
			           data:$("#searchConfig").serialize(),
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
    $('#colorPicker').minicolors({theme: 'bootstrap'});
</script>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
