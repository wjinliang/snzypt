<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Echart</title>
<script src="<%=basePath%>assets/global/plugins/echart/echarts.js"
	type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 600px; height: 400px;"></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		function findVillageCountUnderCounty() {
			 seriesData="";
			 legendData="";
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "<%=basePath%>portal/ajax/findvillagecountundercounty",
				success : function(data) {
					 seriesData=data.seriesData;
					 legendData=data.legendData;
					  seriesData = eval("("+seriesData+")");
					  legendData = eval("("+legendData+")");
						option = {
								title : {
									text : '北京市各区农村占比',
									x : 'center'
								},
								tooltip : {
									trigger : 'item',
									formatter : "{a} <br/>{b} : {c} ({d}%)"
								},
								legend : {
									orient : 'vertical',
									bottom : '45',
									right  : '10',
									data :legendData,
								},
								series : [ {
									name : '各区农村占比',
									type : 'pie',
									radius : '55%',
									center : [ '50%', '60%' ],
									data :seriesData,
									itemStyle : {
										emphasis : {
											shadowBlur : 10,
											shadowOffsetX : 0,
											shadowColor : 'rgba(0, 0, 0, 0.5)'
										}
									},
									label : {
										normal : {
											show : true,
											formatter:"{d}%"
										}
										
									}
								
								} ]
							};
						myChart.setOption(option);
				},
			   error :function(e){
				   alert("请求错误");
			   }
			});
			
		}
		findVillageCountUnderCounty();
		// 使用刚指定的配置项和数据显示图表。
		
	</script>

</body>
</html>