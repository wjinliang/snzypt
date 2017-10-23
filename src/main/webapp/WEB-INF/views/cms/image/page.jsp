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
    <title>后台管理 |水印管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@include file="../../includejsps/style.jsp" %>
    <%@include file="../../includejsps/plugin-style.jsp" %>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>assets/global/plugins/toggle/bootstrap-toggle-buttons.css"/>
    <style>
        div#context-menu {
            position: absolute;
            visibility: hidden;
            top: 0;
            text-align: center;
            padding: 2px;
        }
        div#context-menu ul li {
            cursor: pointer;
        }
        ul.ztree {
            height: 290px;
        }
        .ztree li span.button.add {
            margin-left: 2px;
            margin-right: -1px;
            background-position: -144px 0;
            vertical-align: top;
            *vertical-align: middle
        }
        .ztree li span.button2 {
            line-height: 0;
            margin: 0;
            width: 16px;
            height: 16px;
            display: inline-block;
            vertical-align: middle;
            border: 0 none;
            cursor: pointer;
            outline: none;
            background-color: transparent;
            background-repeat: no-repeat;
            background-attachment: scroll;
        }
        .ztree li span.button2.up {
            background-image: url("<%=basePath%>assets/dmcms/plugins/zTree/css/zTreeStyle/img/diy/arrow_up.png");
        }
        .ztree li span.button2.down {
            background-image: url("<%=basePath%>assets/dmcms/plugins/zTree/css/zTreeStyle/img/diy/arrow_down.png");
        }
        .ztree li span.button2.edit {
            background-image: url("<%=basePath%>assets/dmcms/plugins/zTree/css/zTreeStyle/img/diy/page_edit.png");
        }
        .ztree li span.button2.add {
            background-image: url("<%=basePath%>assets/dmcms/plugins/zTree/css/zTreeStyle/img/diy/page_add.png");
        }
        .ztree li span.button2.delete {
            background-image: url("<%=basePath%>assets/dmcms/plugins/zTree/css/zTreeStyle/img/diy/page_delete.png");
        }
        .ztree li span.button2.view {
            background-image: url("<%=basePath%>assets/dmcms/plugins/zTree/css/zTreeStyle/img/diy/page.png");
        }
    </style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER -->
<%@include file="../../includejsps/head.jsp" %>
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
            <%@include file="../../includejsps/toolbar.jsp" %>
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
                                    class="caption-subject theme-font bold uppercase">水印管理</span>
                                <span class="caption-helper"></span>
                            </div>
                        </div>
                        <div class="portlet-body">
                                <div class="note note-info">
                                <div class="controls">
                                    <div class="success-toggle-button popovers"
                                         data-trigger="hover" data-container="body"
                                         data-placement="right" data-content="开启拖拽功能，通过拖拽调整菜单结构"
                                         data-original-title="拖拽开关">
                                        <input type="checkbox" class="toggle" id="isdrag" onchange="changeGrag(this)"/>
                                    </div>
                                </div>
                                </div>
	                          <div class="form-body" id="config" style="display:none">
	                           <form class="form-horizontal" id="searchConfig" action="#">
			                        <div class="form-group">
														<div class="fileinput fileinput-new" data-provides="fileinput">
															<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
																<img src="${searchConfig.coreName}" alt="" />
															</div>
															<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
															</div>
															<div>
																<span class="btn default btn-file">
																<span class="fileinput-new">
																选择图像 </span>
																<span class="fileinput-exists">
																更换 </span>
																<input role="headpic" id="headpic" name="file" type="file">
																</span>
																<a href="#" class="btn default fileinput-exists" data-dismiss="fileinput">
																取消 </a>
																<a href="javaScript:uploadFile();" class="btn green fileinput-exists">
																保存 </a>
															</div>
														</div>
									</div>
			                       <input type="hidden" id="highlight" name="highlight"  value="${searchConfig.highlight}"/>
			                       
			                       <input type="hidden" name="id" value="${searchConfig.id}"/>
			                       
			                       <input type="hidden" id="coreName" name="coreName" value="${searchConfig.coreName}"/>
			                       
			                       <input type="hidden" id="ipAddress" name="ipAddress" value="${searchConfig.ipAddress}"/>
			                      
			                       <div class="form-group">
			                           <div class="col-md-3">
			                               <select name="snippets" class="form-control">
			                                <option value=1 <c:if test="${searchConfig.snippets==1}">selected="selected"</c:if>>右下</option>
			                                <option value=2 <c:if test="${searchConfig.snippets==2}">selected="selected"</c:if>>右上</option>
			                                <option value=3 <c:if test="${searchConfig.snippets==3}">selected="selected"</c:if>>左下</option>
			                                <option value=4 <c:if test="${searchConfig.snippets==4}">selected="selected"</c:if>>左上</option>
			                           </select>
			                           </div>
			                           <label class="control-label">水印位置</label>
			                       </div>
			                       <div class="form-group">
			                          <div class="col-md-3"><input id="onekeyBtn"  type="button" class="btn green" value="一键配置"/>
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
<%@include file="../../includejsps/foot.jsp" %>
<!-- END FOOTER-->
<!-- BEGIN JAVASCRIPTS-->
<%@include file="../../includejsps/js.jsp" %>
<%@include file="../../includejsps/plugin-js.jsp" %>
<script type="text/javascript"
        src="<%=basePath%>assets/global/plugins/toggle/jquery.toggle.buttons.js"></script>
<script>
function changeGrag(ch) {
	if(ch.checked)
		{
	bootbox.confirm("确定开始吗,开启后所有新上传图片将添加水印？", function(result) {
		if(result)
			{
			$("#config").show();
			$("#highlight").val("1");
			}
		else
			{
			ch.click();
			$("#highlight").val("0");
			$("#config").hide();
			}
	 });
	}
	else
		{
		$("#highlight").val("0");
		 $("#onekeyBtn").click();
		$("#config").hide();
		}
	
	
}
    $("#onekeyBtn").click(function(){
    	 bootbox.confirm("确定操作吗?", function (result) 
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
    
    var uploadFile = function () {
        var file = $("#searchConfig").find("[role='headpic']").val();
    if (file == "") {
        return;
    } else {
        var type = file.substring(file.lastIndexOf("."));
        if (!(type.toLowerCase() == ".jpg"
            || type.toLowerCase() == ".png"
            || type.toLowerCase() == ".bmp" || type
                .toLowerCase() == ".jpeg")) {
            alert("必须是.jpp,.png,.bmp,.jpeg格式中的一种");
            return;
        }
    }
    Metronic.blockUI({target: this.$element});
    $.ajaxFileUpload({
            url: "../../cms/attachment/singleUpload",
            type: "POST",
            secureuri: false,
            fileElementId: "headpic",
            dataType: "json",
            success: function (json, status) {
            	Metronic.unblockUI(this.$element);
                alert(json.msg);
                console.log(json);
                $("#ipAddress").val(json.fileUrl);
                $("#coreName").val(json.attachment.attachmentUrl);
            },
            error: function (data, status, e) {
            	Metronic.unblockUI(this.$element);
                alert(e);
            }
        });
    }
    jQuery(document).ready(function () {
    	if($("#highlight").val()=='true')
    		{
    		$("#config").show();
    		$('#isdrag')[0].checked=true;
    		}
    	
        $('.success-toggle-button').toggleButtons({
            style: {
                enabled: "success",
                disabled: "info"
            }
        });
    });
</script>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
