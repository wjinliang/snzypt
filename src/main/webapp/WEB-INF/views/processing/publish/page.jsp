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
    <title>后台管理 | 数据处理配置</title>
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
   <%--  <div class="page-head">
        <div class="container">
            <!-- BEGIN PAGE TITLE -->
            <div class="page-title">
                <h1>站点管理</h1>
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
                                    class="caption-subject theme-font bold uppercase">发布配置</span>
                                <span class="caption-helper"></span>
                            </div>
                        </div>
                        <div class="portlet-body" id="contentPublish_grid"></div>
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
    var root = "<%=basePath%>"
    var grid;
    var options = {
                url: "./list", // ajax地址
                pageNum: 1,//当前页码
                pageSize: 5,//每页显示条数
                idFiled: "id",//id域指定
                showCheckbox: true,//是否显示checkbox
                checkboxWidth: "3%",
                showIndexNum: true,
                indexNumWidth: "5%",
                pageSelect: [2, 15, 30, 50],
                cloums: [{
                    title: "名称",
                    field: "name",
                    width:"20%",
                    sort: true
                }, {
                    title: "集合",
                    field: "collection",
                    width:"20%",
                    sort: true
                }, {
                    title: "类型",
                    field: "type",
                    width:"10%"
                }
                ],
                actionCloumText: "操作",//操作列文本
                actionCloumWidth: "30%",
                actionCloums: [{
                    text: "编辑",
                    cls: "green btn-sm",
                    handle: function (index, data) {
                        //index为点击操作的行数
                        //data为该行的数据
                        modal = $.dmModal({
                            id: "contentPublishForm",
                            title: "编辑",
                            distroy: true
                        });
                        modal.show();
                        var form = modal.$body.dmForm(formOpts);
                        $("#type").bind("change",function(){
                        	var type = $(this).val();
                        	dowItem(type);
                        })
                        form.loadRemote("./load?valiageCollId=" + data.id,function(res){
                        	var type = res.type;
                        	dowItem(type);
                        });
                        
                    }
                },
                {
                    text: "立即执行",
                    cls: "green btn-sm",
                    handle: function (index, data) {
                        var url = "./start?id=" + data.id;
                        $.ajax({url:url,type:"post",success:function(res){
                        	bootbox.alert("后台执行中，请稍后。");
                        }})
                        
                    }
                },
                    {
                        text: "删除",
                        cls: "red btn-sm",
                        handle: function (index, data) {
                            deleteItem(data.id);
                        }
                    }
                ],
                tools: [
                    //工具属性
                    {
                        text: " 添 加",//按钮文本
                        cls: "btn btn-sm green",//按钮样式
                        icon: "fa fa-cubes",
                        handle: function (grid) {//按钮点击事件
                            modal = $.dmModal({
                                id: "contentPublishForm",
                                title: "添加",
                                distroy: true
                            });
                            modal.show();
                            var form = modal.$body.dmForm(formOpts);
                            dowItem("1");
                            $("#type").bind("change",function(){
                            	var type = $(this).val();
                            	dowItem(type);
                            })
                        }
                    }, {
                        text: " 删 除",
                        cls: "btn btn-sm red ",//按钮样式
                        handle: function (grid) {
                            deleteItems(grid.getSelectIds());
                        }
                    }]
            };
    var modal;
    //form
    var formOpts = {
        id: "contentPublish_form",//表单id
        name: "contentPublish_form",//表单名
        method: "post",//表单method
        action: "./insertOrUpdate",//表单action
        ajaxSubmit: true,//是否使用ajax提交表单
        labelInline: true,
        rowEleNum: 1,
        beforeSubmit: function () {

        },
        ajaxSuccess: function () {
            modal.hide();
            grid.reload();
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
        }, {
            type: 'text',//类型
            name: 'name',//name
            id: 'name',//id
            label: '名称',//左边label
            cls: 'input-large',
            rule: {
                required: true
            },
            message: {
                required: "请输入名称"
            }
        }, {
            type: 'text',//类型
            name: 'collection',//name
            id: 'collection',//id
            label: '集合',//左边label
            cls: 'input-large',
            rule: {
                required: true
            },
            message: {
                required: "请输入集合名"
            }
        },{
        	type: 'text',//类型
            name: 'tableid',//name
            id: 'tableid',//id
            label: '主键',//左边label
            cls: 'input-large'
        },{
        	type: 'text',//类型
            name: 'title',//name
            id: 'title',//id
            label: '标题字段',//左边label
            cls: 'input-large'
        },{
        	type: 'text',//类型
            name: 'content',//name
            id: 'content',//id
            label: '内容字段',//左边label
            cls: 'input-large'
        },{
        	type: 'text',//类型
            name: 'author',//name
            id: 'author',//id
            label: '作者字段',//左边label
            cls: 'input-large'
        },{
        	type: 'text',//类型
            name: 'publishTime',//name
            id: 'publishTime',//id
            label: '发布时间字段',//左边label
            cls: 'input-large'
        },{
        	type: 'text',//类型
            name: 'publishTimeFormat',//name
            id: 'publishTimeFormat',//id
            label: '发布时间字段格式化',//左边label
            cls: 'input-large'
        },{
        	type: 'text',//类型
            name: 'origion',//name
            id: 'origion',//id
            label: '来源字段',//左边label
            cls: 'input-large'
        }, {
			type : 'radioGroup',//类型
			name : 'channelId',//name
			id : 'channelId',//id
			label : '发布到频道',//左边label
			items:[{value:11,text:'农村资讯'}
				,{value:12,text:'农经资讯'}
				,{value:13,text:'农业资讯'}
				,{value:14,text:'热点聚焦'}
				,{value:15,text:'红色预警'}
				,{value:16,text:'热点专题'}
				,{value:17,text:'事件追踪'}
			]
		}, {
			type : 'radioGroup',//类型
			name : 'templateId',//name
			id : 'templateId',//id
			label : '模板类型',//左边label
			items:[{value:12,text:'新闻通用模板'}]
		}]
    };
   

    function deleteItem(id) {
        bootbox.confirm("确定删除吗？", function (result) {
            if (result) {
                $.ajax({
                    type: "POST",
                    data: "id=" + id,
                    dataType: "json",
                    url: "./delete",
                    success: function (data) {
                        if (data.status == 1) {
                            grid.reload();
                        }else{
                        	grid.reload();
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

    jQuery(document).ready(function () {
        grid = $("#contentPublish_grid").dmGrid(options);
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
