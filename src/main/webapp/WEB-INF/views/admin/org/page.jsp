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
    <title>后台管理 | 部门管理</title>
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

       /*  ul.ztree {
            height: 290px;
        } */

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
        /* .form-body {
		    max-height: 1000px!important;
		    padding-left: 0;
		    padding-right: 0;
		} */

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
                <h1>部门管理</h1>
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
                <div class="col-md-3 col-sm-12"></div>
                <div class="col-md-6 col-sm-12">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font hide"></i> <span
                                    class="caption-subject theme-font bold uppercase">部门管理</span>
                                <span class="caption-helper"></span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="note note-info">
                                <div class="controls">
                                    <div class="success-toggle-button popovers"
                                         data-trigger="hover" data-container="body"
                                         data-placement="right" data-content="开启拖拽功能，通过拖拽调整部门结构"
                                         data-original-title="拖拽开关">
                                        <input type="checkbox" class="toggle" id="isdrag"
                                               onchange="changeGrag()"/>
                                    </div>
                                </div>
                            </div>
                            <div class="scroller" style="height:300px;" id="org_tree"
                                 data-always-visible="1" data-rail-visible="1">
                                <ul id="treeOrg" class="ztree"></ul>
                            </div>
                        </div>
                    </div>
                    <!-- END PORTLET-->
                </div>
                <div class="col-md-3 col-sm-12"></div>
            </div>
            <!-- END PAGE CONTENT INNER -->
        </div>
    </div>
    <!-- END PAGE CONTENT -->
</div>
<div id="context-menu">
    <ul class="dropdown-menu">
        <li class="nav-header" id="m_add" onclick="addOrg();"><a>增加子级部门</a>
        </li>
        <li class="nav-header" id="m_addroot" onclick="addTopOrg();"><a>增加顶级部门</a>
        </li>
        <li class="nav-header" id="m_del" onclick="deleteOrg();"><a>删除部门</a>
        </li>
        <li class="nav-header" id="m_edit" onclick="editOrg();"><a>编辑部门</a>
        </li>
    </ul>
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
<script type="text/javascript">
    jQuery(document).ready(function () {
        $.fn.zTree.init($("#treeOrg"), settingOrg, "");
        zTree = $.fn.zTree.getZTreeObj("treeOrg");
        zTree.setting.edit.drag.isCopy = false;
        zTree.setting.edit.drag.isMove = true;
        zTree.setting.edit.drag.prev = true;
        zTree.setting.edit.drag.inner = true;
        zTree.setting.edit.drag.next = true;
        rMenu = $("#context-menu");
        $('.success-toggle-button').toggleButtons({
            style: {
                enabled: "success",
                disabled: "info"
            }
        });
    });
    var zTree;
    var rMenu;
    var settingOrg = {
        view: {
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,
            showIcon: false,
            selectedMulti: false
        },
        edit: {
            enable: false,
            showRemoveBtn: false,
            showRenameBtn: false
        },
        check: {
            enable: false
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        async: {
            enable: true,
            dataType: "json",
            url: "./loadOrgs",
            autoParam: ["id", "name", "pId"]
        },
        callback: {
            onRightClick: OnRightClick,
            beforeDrag: beforeDrag,
            beforeDrop: beforeDrop,
            onDrop: onDrop,
            onAsyncSuccess: function (event, treeId, treeNode, msg) {
                var zTree = $.fn.zTree.getZTreeObj(treeId);
                zTree.expandAll(true);
            }
        }
    };

    function changeGrag() {
        var fl = document.getElementById("isdrag").checked;
        zTree.setting.edit.enable = fl;
    }

    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
        var addStr = "<span class='button2 add' id='addBtn_" + treeNode.tId
                + "' title='增加子级部门' onfocus='this.blur();'></span>" +
                "<span class='button2 edit' id='editBtn_" + treeNode.tId
                + "' title='编辑部门' onfocus='this.blur();'></span>" +
                "<span class='button2 view' id='viewBtn_" + treeNode.tId
                + "' title='查看部门' onfocus='this.blur();'></span>" +
                "<span class='button2 delete' id='removeBtn_" + treeNode.tId
                + "' title='删除部门' onfocus='this.blur();'></span>" +
                "<span class='button2 up' id='upBtn_" + treeNode.tId
                + "' title='上移' onfocus='this.blur();'></span>" +
                "<span class='button2 down' id='downBtn_" + treeNode.tId
                + "' title='下移' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_" + treeNode.tId);
        if (btn) btn.bind("click", function () {
            zTree.selectNode(treeNode);
            addOrg();
            return false;
        });
        var btn2 = $("#editBtn_" + treeNode.tId);
        if (btn2) btn2.bind("click", function () {
            zTree.selectNode(treeNode);
            editOrg();
            return false;
        });
        var btn3 = $("#removeBtn_" + treeNode.tId);
        if (btn3) btn3.bind("click", function () {
            zTree.selectNode(treeNode);
            deleteOrg();
            return false;
        });
        var btn4 = $("#viewBtn_" + treeNode.tId);
        if (btn4) btn4.bind("click", function () {
            zTree.selectNode(treeNode);
            viewOrg();
            return false;
        });
        var btn5 = $("#upBtn_" + treeNode.tId);
        if (btn5) btn5.bind("click", function () {
            zTree.selectNode(treeNode);
            moveUp();
            return false;
        });
        var btn6 = $("#downBtn_" + treeNode.tId);
        if (btn6) btn6.bind("click", function () {
            zTree.selectNode(treeNode);
            moveDown();
            return false;
        });
    }
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_" + treeNode.tId).unbind().remove();
        $("#editBtn_" + treeNode.tId).unbind().remove();
        $("#removeBtn_" + treeNode.tId).unbind().remove();
        $("#viewBtn_" + treeNode.tId).unbind().remove();
        $("#upBtn_" + treeNode.tId).unbind().remove();
        $("#downBtn_" + treeNode.tId).unbind().remove();
    }

    function beforeDrag(treeId, treeNodes) {
        for (var i = 0, l = treeNodes.length; i < l; i++) {
            if (treeNodes[i].drag === false) {
                return false;
            }
        }
        return true;
    }
    var moveMode;
    function beforeDrop(treeId, treeNodes, targetNode, moveType) {
        if (treeNodes[0].getParentNode() != null && targetNode.getParentNode() != null) {
            if (treeNodes[0].getParentNode().id == targetNode.getParentNode().id) {
                moveMode = "same";
            } else {
                moveMode = "diffrent";
            }
        } else if (treeNodes[0].getParentNode() == null && targetNode.getParentNode() == null) {
            moveMode = "same";
        } else {
            moveMode = "diffrent";
        }
        return targetNode ? targetNode.drop !== false : true;

    }
    function moveUp() {
        var Node = zTree.getSelectedNodes()[0];
        if (Node) {
            if (Node.isFirstNode) {
                return;
            } else {
                $.ajax({
                    type: "POST",
                    data: "currentid=" + Node.id + "&targetid=" + Node.getPreNode().id + "&moveType=prev&moveMode=same",
                    url: './setSeq',
                    dataType: "json",
                    success: function (data) {
                        if (data.status == 1) {
                            refreshorgtree();
                        }
                    }
                });
            }
        }
    }


    function moveDown() {
        var Node = zTree.getSelectedNodes()[0];
        if (Node) {
            if (Node.isLastNode) {
                return;
            } else {
                $.ajax({
                    type: "POST",
                    data: "currentid=" + Node.id + "&targetid=" + Node.getNextNode().id + "&moveType=next&moveMode=same",
                    url: './setSeq',
                    dataType: "json",
                    success: function (data) {
                        if (data.status == "1") {
                            refreshorgtree();
                        }
                    }
                });
            }
        }
    }

    function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
        if (targetNode != null) {
            $.ajax({
                type: "POST",
                data: "currentid=" + treeNodes[0].id + "&targetid=" + targetNode.id + "&moveType=" + moveType + "&moveMode=" + moveMode,
                url: './setSeq',
                dataType: "json",
                success: function (data) {
                    if (data.status == "1") {
                        refreshorgtree();
                    }
                }
            });
        }
    }

    function OnRightClick(event, treeId, treeNode) {
        var x = event.pageX || (event.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
        var y = event.pageY || (event.clientY + (document.documentElement.scrollTop || document.body.scrollTop));
        if (!treeNode && event.target.tagName.toLowerCase() != "button"
                && $(event.target).parents("a").length == 0) {
            zTree.cancelSelectedNode();
            showRMenu("root", x, y);
        } else if (treeNode && !treeNode.noR) {
            zTree.selectNode(treeNode);
            showRMenu("node", x, y);
        }
    }
    function showRMenu(type, x, y) {
        $("#context-menu ul").show();
        if (type == "root") {
            $("#m_del").hide();
            $("#m_edit").hide();
            $("#m_add").hide();
            $("#m_addroot").show();
        } else {
            $("#m_del").show();
            $("#m_edit").show();
            $("#m_add").show();
            $("#m_addroot").hide();
        }
        rMenu.css({
            "top": y + "px",
            "left": x + "px",
            "visibility": "visible"
        });
        $("body").bind("mousedown", onBodyMouseDown);
    }
    function hideRMenu() {
        if (rMenu)
            rMenu.css({
                "visibility": "hidden"
            });
        $("body").unbind("mousedown", onBodyMouseDown);
    }
    function onBodyMouseDown(event) {
        if (!(event.target.id == "context-menu" || $(event.target).parents("#context-menu").length > 0)) {
            rMenu.css({
                "visibility": "hidden"
            });
        }
    }


    var modal;
    var formOpts = {
        id: "org_form",//表单id
        name: "org_form",//表单名
        method: "post",//表单method
        action: "./ajaxSave",//表单action
        ajaxSubmit: true,//是否使用ajax提交表单
        labelInline: true,
        rowEleNum: 1,
        beforeSubmit: function () {

        },
        ajaxSuccess: function () {
            modal.hide();
            refreshorgtree();
        },
        submitText: "保存",//保存按钮的文本
        showReset: true,//是否显示重置按钮
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
            type: 'hidden',
            name: 'id',
            id: 'id'
        },
            {
                type: 'hidden',
                name: 'pId',
                id: 'pId'
            }, {
                type: 'text',//类型
                name: 'name',//name
                id: 'name',//id
                label: '部门名称',//左边label
                cls: 'input-large',
                rule: {
                    required: true
                },
                message: {
                    required: "请输部门构"
                }
            }, 
            {
                type: 'text',//类型
                name: 'orgPerson',//name
                id: 'orgPerson',//id
                label: '部门负责人',//左边label
                cls: 'input-large'
            }, 
            {
                type: 'text',//类型
                name: 'orgDuty',//name
                id: 'orgDuty',//id
                label: '负责人职务',//左边label
                showIcon: true,
                cls: 'input-large',
            },
            {
                type: 'text',//类型
                name: 'seq',//name
                id: 'seq',//id
                label: '序号',//左边label
                showIcon: true,
                cls: 'input-large',
                rule: {
                    required: true,
                    number: true
                },
                message: {
                    required: "请输入图标",
                    number: "请输入数字"
                }
            }, 
            {
                type: 'tree',//类型
                name: 'userIds',//name
                id: 'userIds',//id
                label: '用户',//左边label
                url: "../useraccount/loadAllUsers",
                expandAll: true,
                autoParam: ["id", "name", "pId"],
                chkStyle: "checkbox"
            }]
    };
    var viewFormOpts = {
        id: "view_org_form",//表单id
        name: "view_org_form",//表单名
        method: "post",//表单method
        action: "./ajaxSave",//表单action
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
            name: 'name',//name
            id: 'name',//id
            label: '部门名',//左边label
            cls: 'input-large'
        }, {
            type: 'display',//类型
            name: 'seq',//name
            id: 'seq',//id
            label: '序号',//左边label
            showIcon: true,
            cls: 'input-large'
        }]
    };
    function addOrg() {
        hideRMenu();
        if (zTree.getSelectedNodes()[0]) {
            var pId = zTree.getSelectedNodes()[0].id;
            modal = $.dmModal({
                title: "添加子部门",
                distroy: true
            });
            var form = modal.$body.dmForm(formOpts, function () {
                $("#pId").val(pId);
            setTimeout("modal.show();",500);
            });
        } else {
            alert("请选中父部门节点");
        }
    }
    function addTopOrg() {
        hideRMenu();
        modal = $.dmModal({
            title: "添加顶级部门",
            distroy: true
        });
        modal.show();
        var form = modal.$body.dmForm(formOpts);
    }
    function editOrg() {
        hideRMenu();
        if (zTree.getSelectedNodes()[0]) {
            var orgId = zTree.getSelectedNodes()[0].id;
            modal = $.dmModal({
                title: "编辑部门",
                distroy: true
            });
            var form = modal.$body.dmForm(formOpts);
            form.loadRemote("./ajaxLoad?orgId=" + orgId);
            modal.show();
        }
    }
    function viewOrg() {
        hideRMenu();
        if (zTree.getSelectedNodes()[0]) {
            var orgId = zTree.getSelectedNodes()[0].id;
            modal = $.dmModal({
                title: "查看部门",
                distroy: true
            });
            var form = modal.$body.dmForm(viewFormOpts);
            form.loadRemote("./ajaxLoad?orgId=" + orgId);
            modal.show();
        }
    }
    function refreshorgtree() {
        var zTree2 = $.fn.zTree.getZTreeObj("treeOrg");
        zTree2.reAsyncChildNodes(null, "refresh");
    }
    function expandAll(flag) {
        zTree.expandAll(flag);
    }
    function deleteOrg() {
        hideRMenu();
        bootbox.confirm("确定删除吗？", function (result) {
            if (result) {
                if (zTree.getSelectedNodes()[0]) {
                    var orgId = zTree.getSelectedNodes()[0].id;
                    $.ajax({
                        type: "POST",
                        data: "orgId=" + orgId,
                        url: './ajaxDelete',
                        dataType: "json",
                        success: function (data) {
                        	if (data.status == 1) {
								bootbox.alert("删除成功!");
								refreshorgtree();
							}else{
								bootbox.alert("删除失败!");
							}
                        }
                    });
                }
            }
        });
    }
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
