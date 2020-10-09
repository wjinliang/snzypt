<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c" %>
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
    <meta charset="utf-8"/>
    <title>基础平台管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@include file="../../includejsps/style.jsp" %>
    <%@include file="../../includejsps/plugin-style.jsp" %>
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
    <%-- <div class="page-head">
        <div class="container">
            <!-- BEGIN PAGE TITLE -->
            <div class="page-title">
                <h1>日志管理</h1>
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
                                    class="caption-subject theme-font bold uppercase">数据申请</span>
                                <span class="caption-helper"></span>
                            </div>
                        </div>
                        <div class="portlet-body" id="log_grid"></div>
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
<script type="text/javascript">
    var grid;
    var options = {
        url: "./checkList", // ajax地址
        pageNum: 1,//当前页码
        pageSize: 15,//每页显示条数
        idFiled: "id",//id域指定
        showCheckbox: true,//是否显示checkbox
        checkboxWidth: "3%",
        dataLength:60,
        showIndexNum: true,
        indexNumWidth: "5%",
        pageSelect: [2, 15, 30, 50],
        cloums: [{
            title: "用户",
            field: "applyUser",
            width: "10%"
        }, {
            title: "申请类型",
            field: "applyType",
            width: "10%",
            format:function(index,data){
            	var value = data.applyType;
	            if (value == "interface") {
	                return "应用接口申请";
	            } else if(value=='data') {
	                return "基础数据申请";
	            }else if(value=='service') {
	                return "应用服务申请";
	            }
            }
        }, {
            title: "申请时间",
            field: "applyTime",
            width: "20%",
            format:function(index,data){
            	return dateTostr(data.applyTime)
            }
        },{
            title: "审核时间",
            field: "checkTime",
            width: "20%",
            format:function(index,data){
            	if(data.checkTime){
            	return dateTostr(data.checkTime)
            	}
            	return "- -";
            }
        },{
            title: "审核状态",
            field: "checkStatus",
            width: "20%",
            format:function(index,data){
            	var value = data.checkStatus;
	            if (value == "check") {
	                return "待审核";
	            } else if(value=='pass') {
	                return "审核通过";
	            }else if(value=='back') {
	                return "审核退回";
	            }
            }
        }],
        actionCloumText: "操作",//操作列文本
        actionCloumWidth: "15%",
        actionCloums: [{
            text: "查看",
            cls: "green btn-sm",
            handle: function (index, data) {
                detail(data);
            }
        },{
            text: "审核",
            cls: "green btn-sm",
            handle: function (index, data) {
                check(data);
            }
        }],
        search: {
            rowEleNum: 3,
            //搜索栏元素
            items: [{
                type: "text",
                label: "申请人",
                name: "applyUser",
                placeholder: "输入要搜索的用户名"
            }, {
                type: "text",
                label: "内容",
                name: "content"
            }]
        }
    };
    function detail(data){
		modal = $.dmModal({
            title: "查看",
            distroy: true
        });
        modal.show();
        var form = modal.$body.dmForm(formOption);
        form.loadLocal(data);
		
	}
	var modal;
	var formOption={
			id: "view_form",//表单id
	        name: "view_form",//表单名
	        method: "post",//表单method
	        action: "./ajsve",//表单action
	        ajaxSubmit: true,//是否使用ajax提交表单
	        labelInline: true,
	        rowEleNum: 1,
	        showReset: false,//是否显示重置按钮
	        showSubmit: false,//是否显示重置按钮
	        isValidate: true,//开启验证
	        buttons: [{
	            type: 'button',
	            text: '关闭',
	            handle: function () {
	                modal.hide();
	            }
	        }],
	        buttonsAlign: "center",
	        //表单元素
	        items: [{
	            type: 'display',//类型
	            name: 'applyType',//name
	            id: 'applyType',//id
	            label: '申请类型',//左边label
	            cls: 'input-large',
	            format: function (value) {
	                if (value == "interface") {
	                    return "应用接口申请";
	                } else if(value=='data') {
	                    return "基础数据申请";
	                }else if(value=='service') {
	                    return "应用服务申请";
	                }
	            }
	        }, {
	            type: 'display',//类型
	            name: 'applyTime',//name
	            id: 'applyTime',//id
	            label: '申请时间',//左边label
	            cls: 'input-large',
	            format: function (value) {
	                return dateTostr(value);
	            }
	        }, {
	            type: 'display',//类型
	            name: 'applyUser',//name
	            id: 'applyUser',//id
	            label: '申请人',//左边label
	            cls: 'input-large'
	        }, {
	            type: 'display',//类型
	            name: 'resourceName',//name
	            id: 'resourceName',//id
	            label: '申请资源',//左边label
	            cls: 'input-large'
	        }, {
	            type: 'display',//类型
	            name: 'applyContent',//name
	            id: 'applyContent',//id
	            label: '需求描述',//左边label
	            cls: 'input-large'
	        }, {
	            type: 'display',
	            name: 'applyLink',
	            id: 'applyLink',
	            label: '联系方式'
	        }]	
	};
    jQuery(document).ready(function () {
        grid = $("#log_grid").dmGrid(options);
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
