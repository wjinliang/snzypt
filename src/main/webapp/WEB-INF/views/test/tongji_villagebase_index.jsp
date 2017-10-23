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
	<div id="main" style="width: 1000px; height: 618px;"></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		
		function initVillageIndex() {
			 seriesData="";
			 legendData="";
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "<%=basePath%>portal/statistic/ajax/villagebase",
				success : function(data) {
					option = {
							//backgroundColor:'#F0F0F0',
						    title: {
						        text: '农村基本情况(1978-2014年)'
						    },
						    tooltip: {
						        trigger: 'axis'
						    },
						    legend: {
						    	top:'5%',
						        data:['乡镇府','镇政府','村民委员会','乡镇及行政村常 住 户 数(万户)','乡镇及行政村常 住 人 口(万户)','乡镇及行政村从 业 人 员(万户)']
						    },
						 
						    toolbox: {
						    	show : true,
						        feature : {
						            dataView : {show: true, readOnly: false},
						            magicType : {show: true, type: ['line', 'bar']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
						    xAxis: {
						        type: 'category',
						        boundaryGap: false,
						        data: eval("("+data.tjnfList+")")
						    },
						    yAxis: {
						        type: 'value'
						    },
						    dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:100,  //结束值为60%
						    },
						    series: [
						          {
						            name:'乡镇府',
						            type:'line',
						            stack: '总量',
						            data:eval("("+data.xzfList+")")
						        },
						         {
						            name:'镇政府',
						            type:'line',
						            stack: '总量',
						            data:eval("("+data.zzfList+")")
						        },
						        {
						            name:'村民委员会',
						            type:'line',
						            stack: '总量',
						            data:eval("("+data.cmwyhList+")")
						        },  
						         {
						            name:'乡镇及行政村常 住 户 数(万户)',
						            type:'line',
						            stack: '总量',
						            data:eval("("+data.xzjxzxxzhsList+")")
						        },
						        {
						            name:'乡镇及行政村常 住 人 口(万户)',
						            type:'line',
						            stack: '总量',
						            data:eval("("+data.xzjxzcczrkList+")")
						        }, 
						          {
						            name:'乡镇及行政村从 业 人 员(万户)',
						            type:'line',
						            stack: '总量',
						            data: eval("("+data.xzjxzccyryList+")")
						        }  
						    ]
						};

												myChart.setOption(option);
					
					
				},
				   error :function(e){
					   alert("请求错误");
				   }
				});
		}
		// 使用刚指定的配置项和数据显示图表。
		initVillageIndex();
	</script>

</body>
</html>