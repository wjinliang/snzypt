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
<title>后台管理 | 问卷管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/select2/select2.css" />
<%@include file="../../includejsps/style.jsp"%>
<%@include file="../../includejsps/plugin-style.jsp"%>
<style type="text/css">
.color1
{ 
background-color:#ff7f00;
}
.color2
{ 
background-color:#adeaea;
}
.color3
{ 
background-color:#ff2400
}
.color4
{ 
background-color:#d19275;
}
.color5
{ 
background-color:black;
}
.color6
{ 
background-color:green;
}
</style>
</head>
<body>
	<%@include file="../../includejsps/head.jsp"%>
	<div class="page-container">
		<div class="page-content">
			<div class="container">
				<div class="row margin-top-10">
					<div class="col-md-12 col-sm-12">
						<!-- BEGIN PORTLET-->
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">问卷选项统计列表</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="org_person_grid">
							<div  class="portlet-body" >
								<div style="border-bottom:1px solid #eeeeff;padding:5px 0 10px;">
								
									<c:forEach items="${topicList}" var="topicList" varStatus="i">
										<c:if test="${'2' eq topicList.topicType }">
											<div style="margin:5px 0;line-height: 24px;"><span><h3>第${i.index+1}题:${topicList.topicName }</h3></span>
											<span style="color:#0066FF;"><a href="javascript:getOptions('${topicList.topicId}');">查看回答列表</a></span>
											</div>
										</c:if>
										<c:if test="${'2' ne topicList.topicType }">
											<div style="margin:5px 0;line-height: 24px;"><span><h3>第${i.index+1}题:${topicList.topicName }</h3></span>
										<table cellspacing="0" cellpadding="3" border="1" style=" width: 100%; border-collapse: collapse; display: table;">
										<tbody>
										<tr style="font-weight:bold;" align="center"><td>选项</td><td>小记</td><td>比例</td> </tr>
										<c:forEach items="${ topicList.options }" var="options" varStatus="j">
										<tr >
											<td width="30%" >${options.optionName}</td>
											<td width="10%" align="center">${options.num}</td>
											<td width="60%" ><div style="width:${options.percent}%;margin-top:10px;height:20px;" class="color${j.index+1 }" ></div><div>${options.percent}%</div></td>
										</tr>	
										</c:forEach>
										</tbody>
										</table>
										</div>
										</c:if>
										
									</c:forEach>
								</div>
								</div>
								<!-- <div id="optionsChart" style="width:500px;height:300px;float:left;">
								</div> -->
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<%@include file="../../includejsps/foot.jsp"%>
	<%@include file="../../includejsps/js.jsp"%>
	<%@include file="../../includejsps/plugin-js.jsp"%>
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/select2/select2.min.js"></script>
		<script type="text/javascript"
		src="<%=basePath%>assets/dmcms/plugins/echarts/echarts.common.min.js"></script>
		<script>
		$(function(){
			$("tr:even").css("background","#F9F9F9");
			$("tr:odd").css("background","white");
			
		})
		function getOptions(id){
			window.open('../questionManager/getNameOptions?id='+id,'newwindow', 'height=600, width=900, top=2000, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no');
		}
	/* 
		function getOptions(id){
			$.ajax({
				url:"../questionManager/getOptionPercent?id="+id,
				dataTyp:"json",
				success:function(data){
					loadPie(data);
				}
			});
		}
		
		function loadPie(data){
			var myChart = echarts.init(document.getElementById('optionsChart'));
			 var arr=[];
			 var arr1=[];
		      var selfme=null;
		      var 	legendname=null;
		      for(var i=0;i<data.length;i++){
		        	selfme={value:data[i].num,name:data[i].name};
		        	legendname={icon : 'rect',name:data[i].name};
		        	arr.push(selfme);
		        	arr1.push(legendname);
		        }
			var option = {
					title : {
						text : '问卷选项百分比 ',
						x : 'left'
					},
					tooltip : {
						trigger : 'item',
						formatter : "{a} <br/>{b} : {c} ({d}%)"
					},
					legend : {
						orient : 'vertical',
						x : 'right',
						y : 'bottom',
						data : arr1
					},
					toolbox : {
						show : false
					},
					calculable : false,
					series : [ {
						name : '问卷选项百分比',
						type : 'pie',
						radius : '60%',
						center : [ '50%', '60%' ],
						data :arr
					} ]
				};
				    // 使用刚指定的配置项和数据显示图表。
				    myChart.setOption(option);
			   
		} */
	</script>
</body>
</html>