<%@ page language="java" import="java.util.*,com.dm.platform.util.TDictUtil" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String name="TOPIECMS";
	/* if(TDictUtil.getJsonByTDictCode("ZD.01")!=null){
		name =TDictUtil.getJsonByTDictCode("ZD.01");
	} */
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
<title>后台管理  | 字典管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
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
		<%--  <div class="page-head">
        <div class="container">
            <!-- BEGIN PAGE TITLE -->
            <div class="page-title">
                <h1>字典管理</h1>
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
										class="caption-subject theme-font bold uppercase">字典管理</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="dict_grid"></div>
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
	<script type="text/javascript">
    var root = "<%=basePath%>"
		var grid;
		var options = {
			url : "./ajaxList", // ajax地址
			pageNum : 1,//当前页码
			pageSize : 5,//每页显示条数
			idFiled : "dictId",//id域指定
			showCheckbox : true,//是否显示checkbox
			checkboxWidth : "3%",
			showIndexNum : true,
			indexNumWidth : "5%",
			pageSelect : [ 5, 15, 30, 50 ],
			cloums : [ {
				title : "名称",
				field : "dictName"
			}, {
				title : "字典码",
				field : "dictCode"
			}, {
				title : "说明",
				field : "dictDesc"
			} , {
				title : "状态",
				format:function(i,c){
					if(c.dictStatus==1)
						return "启用";
					return "禁用";
				}
			} ],
			actionCloumText : "操作",//操作列文本
			actionCloumWidth : "30%",
			actionCloums : [ {
				text : "维护",
				cls : "green",
				icon : "fa fa-search",
				handle : function(index, data) {
					location.href="./dict/"+data.dictId;				}
			}, {
				text : "编辑",
				cls : "green",
				handle : function(index, data) {
					//index为点击操作的行数
					//data为该行的数据
					modal = $.dmModal({
						id : "dictForm",
						title : "编辑",
						distroy : true
					});
					modal.show();
					var form = modal.$body.dmForm(formOpts);
					form.loadLocal(data);
				}
			}, {
				text : "删除",
				cls : "red",
				handle : function(index, data) {
					deleteItem(data.dictId);
				}
			}, {
				text : "刷新缓存",
				cls : "green",
				handle : function(index, data) {
					$.ajax({
						type : "POST",
						data : "dictId=" + data.dictId,
						dataType : "json",
						url : "./refreshCache",
						success : function(data) {
							bootbox.alert(data.msg);
						}
					});
				}
			} ],
			tools : [
			//工具属性
			{
				text : " 添 加",//按钮文本
				cls : "btn green",//按钮样式
				icon : "fa fa-cubes",
				handle : function(grid) {//按钮点击事件
					modal = $.dmModal({
						id : "dictForm",
						title : "添加",
						distroy : true
					});
					modal.show();
					var form = modal.$body.dmForm(formOpts);
				}
			} ],
			search : {
				rowEleNum : 4,
				//搜索栏元素
				items : [ {
					type : "text",
					label : "名称",
					name : "dictName",
					placeholder : "输入要搜索的名称"
				} ]
			}
		};
		var modal;
		//form
		var formOpts = {
			id : "dict_form",//表单id
			name : "dict_form",//表单名
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
			},
			submitText : "保存",//保存按钮的文本
			showReset : true,//是否显示重置按钮
			resetText : "重置",//重置按钮文本
			isValidate : true,//开启验证
			buttons : [ {
				type : 'button',
				text : '关闭',
				handle : function(data) {
						modal.hide();
				}
			} ],
			buttonsAlign : "center",
			//表单元素
			items : [ {
				type : 'hidden',
				name : 'dictId',
				id : 'dictId'
			}, {
				type : 'text',//类型
				name : 'dictName',//name
				id : 'dictName',//id
				label : '名称',//左边label
				cls : 'input-large',
				rule : {
					required : true
				},
				message : {
					required : "名称"
				}
			}, {
				type : 'text',//类型
				name : 'dictCode',//name
				id : 'dictCode',//id
				label : '字典码',//左边label
				cls : 'input-large',
				rule : {
					required : true
				},
				message : {
					required : "字典码"
				}
			},{
				type : 'text',//类型
				name : 'dictDesc',//name
				id : 'dictDesc',//id
				label : '说明',//左边label
				cls : 'input-large',
				rule : {
					required : true
				},
				message : {
					required : "说明"
				}
			},{
				type : 'radioGroup',//类型
				name : 'dictStatus',//name
				id : 'dictStatus',//id
				label : '状态',//左边label
				cls : 'input-large',
				items:[
				       {
				    	  value:1,
	                      text:"启用",
	                      checked:true
				       },
				       {
					    	  value:0,
		                      text:"禁用"
					       }
				       ],
				rule : {
					required : true
				},
				message : {
					required : "说明"
				}
			},{
				type : 'text',
				name : 'dictType',
				id : 'dictType',
				label : '类型',
				cls : 'input-large'
			} /* {
				type : 'select',
				name : 'dictType',
				id : 'dictType',
				label : '类型',
				cls : 'input-large',
				items : [ {
					value : '',
					text : '类型'
				},
				{
					value : '1',
					text : 'A'
				},
				{
					value : '2',
					text : 'B'
				}]
			} */ ]
		};

		function deleteItem(id) {
			bootbox.confirm("确定删除吗？", function(result) {
				if (result) {
					$.ajax({
						type : "POST",
						data : "id=" + id,
						dataType : "json",
						url : "./delete",
						success : function(data) {
							if (data.status == 1) {
								grid.reload();
							}else{
								bootbox.alert(data.msg);
							}
						}
					});
				}
			});
		}


		jQuery(document).ready(function() {
			grid = $("#dict_grid").dmGrid(options);
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
