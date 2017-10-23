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
    <title>后台管理 | 站点管理</title>
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
                                    class="caption-subject theme-font bold uppercase">站点管理</span>
                                <span class="caption-helper"></span>
                            </div>
                        </div>
                        <div class="portlet-body" id="site_grid"></div>
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
                    field: "displayName",
                    width:"8%",
                    sort: true
                }, {
                    title: "站点域名",
                    field: "domain",
                    width:"5%",
                    sort: true
                }, {
                    title: "修改时间",
                    field: "updateTime",
                    width:"10%",
                    format: function (i,data) {
                       return new Date(parseInt(data.updateTime)).toLocaleString().replace(/年|月/g, "-").replace(/日/g, " ");
                    }
                }
                ],
                actionCloumText: "操作",//操作列文本
                actionCloumWidth: "30%",
                actionCloums: [{
                    text: "预览",
                    cls: "green btn-sm",
                    icon : "fa fa-search",
                    handle: function (index, data) {
                        window.open(data.url);
                    }
                },{
                    text: "编辑",
                    cls: "green btn-sm",
                    handle: function (index, data) {
                        //index为点击操作的行数
                        //data为该行的数据
                        modal = $.dmModal({
                            id: "siteForm",
                            title: "表单",
                            distroy: true
                        });
                        modal.show();
                        var form = modal.$body.dmForm(formOpts);
                        form.loadRemote("./load?siteId=" + data.id);
                    }
                },
                    {
                        text: "删除",
                        cls: "red btn-sm",
                        handle: function (index, data) {
                            deleteItem(data.id);
                        }
                    },
                    {
                        text: "一站静态化",
                        cls: "green btn-sm",
                        handle: function (index, data) {
                        	generatorHtmlSite(data.id);
                        }
                    },
                {
                    text: "静态化",
                    cls: "green btn-sm",
                    visable:function(index,data)
					{
						if(data.isHtml)
							{
							   return false;
							}
						return true;
						
					},
                    handle: function (index, data) {
                        generatorHtml(data.id);
                    }
                },{
                    text: "取消静态化",
                    cls: "red btn-sm",
                    visable:function(index,data)
					{
						if(data.isHtml)
							{
							   return true;
							}
						return false;
						
					},
                    handle: function (index, data) {
                    	$.post("./cancelGeneratorHtml", {
							siteId : data.id
						}, function(res) {
							/* if (res.status == 1) {
								bootbox.alert("静态化成功!");
							} else {
								bootbox.alert("静态化失败!");
							} */
							bootbox.alert(res.msg);
							grid.reload();
						});
                    }
                },
                {
                    text: "导出",
                    cls: "green btn-sm",
                    handle: function (index, data) {
                        window.open("./exportData?siteId="+data.id);
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
                                id: "siteForm",
                                title: "添加",
                                distroy: true
                            });
                            modal.show();
                            var form = modal.$body.dmForm(formOpts);
                        }
                    }, {
                        text: " 删 除",
                        cls: "btn btn-sm red ",//按钮样式
                        handle: function (grid) {
                            deleteItems(grid.getSelectIds());
                        }
                    }, {
                        text: " 导入",
                        cls: "btn btn-sm green",//按钮样式
                        handle: function (grid) {
                        	modal = $.dmModal({
                                id: "importForm",
                                title: "导入",
                                distroy: true,
                                width: "700px"
                            });
                            modal.show();
                            var form = modal.$body.dmForm(importOpts);
                        }
                    }],
                search: {
                    rowEleNum: 4,
                    //搜索栏元素
                    items: [{
                        type: "text",
                        label: "名称",
                        name: "displayName",
                        placeholder: "输入要搜索的站点名称"
                    }]
                }
            };
    var modal;
    //form
    var formOpts = {
        id: "site_form",//表单id
        name: "site_form",//表单名
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
            name: 'displayName',//name
            id: 'displayName',//id
            label: '站点名称',//左边label
            cls: 'input-large',
            rule: {
                required: true
            },
            message: {
                required: "站点名称"
            }
        }, {
            type: 'text',//类型
            name: 'domain',//name
            id: 'domain',//id
            label: '站点域名',//左边label
            cls: 'input-large',
            rule: {
                required: true
            },
            message: {
                required: "请输入站点域名"
            }
        },{
            type: 'select',
            name: 'templateId',
            id: 'templateId',
            label: '页面模板',
            cls: 'input-large',
            items: [{
                value: '',
                text: '请选择'
            }],
            itemsUrl: "../template/selects?templateType=0"
        }]
    };
    
    var generatorformOpts = {
            id: "generator_form",//表单id
            name: "generator_form",//表单名
            method: "post",//表单method
            action: "./generatorHtmlSite",//表单action
            ajaxSubmit: true,//是否使用ajax提交表单
            labelInline: true,
            rowEleNum: 1,
            beforeSubmit: function () {
            	Metronic.blockUI({
                    target: this.$element
                	});
            },
            ajaxSuccess: function (data) {
            	bootbox.alert(data.msg);
        		grid.reload();
        		modal.hide();
                Metronic.unblockUI(this.$element);
            },
            submitText: "确定",//保存按钮的文本
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
                type: 'checkboxGroup',//类型
                name: 'siteChannelContent',//name
                id: 'siteChannelContent',//id
                label: '请选择',//左边label
                items:[
					 {
					  	text:"内容(新稿)",
					  	value:"content0"
					  },
					  {
						  	text:"内容(审核中)",
						  	value:"content1"
					  },
					  {
	                    	text:"内容(已发布)",
	                    	value:"content2"
	                  },
                      {
                    	text:"频道",
                    	value:"channel"
                      }
                    ],
                rule: {
                    required: true
                },
                message: {
                    required: "请选择"
                }
            }]
        };

    function deleteItem(id) {
        bootbox.confirm("确定删除吗？", function (result) {
            if (result) {
                $.ajax({
                    type: "POST",
                    data: "siteId=" + id,
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
    
    function generatorHtmlSite(id)
    {	
    	modal = $.dmModal({
            id: "generatorForm",
            title: "一站静态化",
            distroy: true,
            width: "700px"
//             height:"350px"
        });
        modal.show();
        generatorformOpts.action = "./generatorHtmlSite?siteId=" + id;
    	var form = modal.$body.dmForm(generatorformOpts);
        //form.loadRemote("./generatorHtmlSite?siteId=" + id);
    	/* Metronic.blockUI({
        target: this.$element
    	});
    $.ajax({
        type: "POST",
        dataType: "json",
        data: {siteId:id},
        url: "./generatorHtmlSite",
        
        success: function (data) {
        	bootbox.alert(data.msg);
    		grid.reload();
            Metronic.unblockUI(this.$element);
        },
        error: function (jqXHR, textStatus, errorMsg) {
            alert("请求异常！");
            Metronic.unblockUI(this.$element);
        } 
    });*/
    }
    
    function generatorHtml(id)
    {
    	$.post("./generatorHtml",{siteId:id},function(result){
    		bootbox.alert(result.msg);
    		grid.reload();
    	})
    }
    
    function deleteItems(ids) {
        if (ids.length > 0) {
        	deleteItem(ids);
        } else {
            bootbox.alert("请选择要删除的选项！");
        }
    }
    var importOpts = {
    		id : "import_form",//表单id
			name : "import_form",//表单名
			method : "post",//表单method
			action : "./importData",//表单action
			ajaxSubmit : true,//是否使用ajax提交表单
			labelInline : true,
			rowEleNum : 1,
			beforeSubmit : function() {
				Metronic.blockUI({target: this.$element});
			},
			ajaxSuccess : function(data) {
				Metronic.unblockUI(this.$element);
				modal.hide();
				grid.reload();
				alert(data.msg);
			},
			submitText : "导入",//保存按钮的文本
			showReset : false,//是否显示重置按钮
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
			items : [{
			        	type : 'radioGroup',//类型
						name : 'importType',//name
						id : 'importType',//id
						label : '导入方式',//左边label
						cls : 'input-large',
						items:[
						       {
						    	  value:0,
			                      text:"覆盖现有站点"
						       },
						       {
						    	  value:1,
			                      text:"作为新站点导入",
			                      checked:true
							    }
						       ],
						rule : {
							required : true
						},
						message : {
							required : "选择"
						}
					},{
						type : 'file',
						id : 'filePath',
						name : 'filePath',
						label : '选择文件',
						isAjaxUpload : true,
						uploadUrl : './upload',//
						onSuccess : function(data) {
							if (data.status == 1) {
								$("#filePath").attr("value", data.path);
							} else {
								alert(data.message);
							}
							grid.reload();
						},
						deleteHandle : function() {
							$("#filePath").attr("value", "");
						},
						rule : {
							required : true
						},
						message : {
							required : "请上传文件"
						}
					} ]	
    }

    jQuery(document).ready(function () {
        grid = $("#site_grid").dmGrid(options);
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
