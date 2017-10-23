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
    <title>后台管理 | 文件管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>assets/global/plugins/jstree/themes/default/style.min.css"/>
    <%@include file="../../includejsps/style.jsp" %>
    <%@include file="../../includejsps/plugin-style.jsp" %>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
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
                <h1>文件管理</h1>
            </div>
            <!-- END PAGE TITLE -->
            <!-- BEGIN PAGE TOOLBAR -->
            <%@include file="../../includejsps/toolbar.jsp" %>
            <!-- END PAGE TOOLBAR -->
        </div>
    </div> --%>
    <!-- END PAGE HEAD -->
    <div class="page-content">
        <div class="container">
            <div class="row margin-top-10">
                <div class="col-md-12 col-sm-12">
                    <div class="portlet light">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font hide"></i> <span
                                    class="caption-subject theme-font bold uppercase">文件管理</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="row">
                                <div class="col-md-3 col-sm-12">
                                    <div class="portlet box yellow-crusta">
                                        <div class="portlet-title">
                                            <div class="caption">
                                                <i class="fa fa-gift"></i>资源目录
                                            </div>
                                            <div class="tools">
                                                <a href="javascript:;" class="collapse"
                                                   data-original-title="" title="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <div id="tree" class="tree-demo scroller"
                                                 data-always-visible="1"
                                                 data-rail-visible="1" style="height: 350px;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9 col-sm-12" id="main2">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END PAGE CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file="../../includejsps/foot.jsp" %>
<!-- END FOOTER-->
<!-- BEGIN JAVASCRIPTS-->
<%@include file="../../includejsps/js.jsp" %>
<%@include file="../../includejsps/plugin-js.jsp" %>
<script src="<%=basePath%>/assets/global/plugins/bootstrap-contextmenu/bootstrap-contextmenu.js"></script>
<script src="<%=basePath%>assets/global/plugins/jstree/jstree.min.js"></script>
<script src="<%=basePath%>/assets/admin/pages/scripts/ui-tree.js"></script>
<script type="text/javascript">
    var root = "<%=basePath%>";
    var modal;
    var fileManager = $("#main2").fileManager({
        contextMenuOption: {
            id: "cMenu",
            items: [
                {
                    text: "上传",
                    onClick: function (currentFolder) {
                        modal = $.dmModal({
                            id: "uploadForm",
                            title: "上传",
                            width: "600px",
                            distroy: true
                        });
                        modal.show();
                        modal.$body.dmForm(getFormOption(currentFolder.currentPath, function () {
                            currentFolder.refresh();
                        }));
                    },
                    showType: "desk"
                }
            ]
        }
    });

    function getFormOption(folderPath, callback) {
        var formOpts = {
            id: "template_form",//表单id
            name: "template_form",//表单名
            method: "post",//表单method
            action: "./upload",//表单action
            ajaxSubmit: true,//是否使用ajax提交表单
            labelInline: true,
            rowEleNum: 1,
            beforeSubmit: function () {
            },
            ajaxSuccess: function () {
                modal.hide();
            },
            submitText: "上传",//保存按钮的文本
            showSubmit: false,
            showReset: false,//是否显示重置按钮
            resetText: "重置",//重置按钮文本
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
                type: 'file',
                id: 'file',
                name: 'file',
                label: '上传文件',
                isAjaxUpload: true,
                uploadUrl: './upload?folderPath=' + folderPath,
                onSuccess: function (data) {
                    if (data.status == 1) {
                        modal.hide();
                        callback();
                    }
                },
                deleteHandle: function () {
                },
                rule: {
                    required: true
                },
                message: {
                    required: "请上传文件"
                }
            }]
        };
        return formOpts;
    }
    jQuery(document).ready(function () {
        $("#tree").jstree({
            "core": {
                "themes": {
                    "responsive": false
                },
                // so that create works
                "check_callback": true,
                'data': {
                    'url': function (node) {
                        return './jstreeJson';
                    },
                    'data': function (node) {
                        return {'parent': node.id};
                    }
                }
            },
            "types": {
                "default": {
                    "icon": "fa fa-folder icon-state-warning icon-lg"
                },
                "file": {
                    "icon": "fa fa-file icon-state-warning icon-lg"
                }
            },
            "state": {"key": "tree"},
            "plugins": ["state", "types"]
        });
    });
    $('#tree').on('select_node.jstree', function (e, data) {
        if (data.node.original.directory)
            fileManager.enterFolder(data.selected[0]);
    });
</script>
</body>
<!-- END BODY -->
</html>
