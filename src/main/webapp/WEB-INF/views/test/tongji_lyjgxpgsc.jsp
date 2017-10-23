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
<title>Echarts</title>
<script src="<%=basePath%>assets/global/plugins/echart/echarts.js"
	type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<center><div id="main" style="width: 700px; height: 432px;"></div></center>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		var xAxis="";
		var seriesclSi="";
		var seriesclSan="";
		function initVillageIndex() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "<%=basePath%>portal/statistic/ajax/lyjgxgpsc",
				success : function(data) {
					 xAxis=data.xAxis;
					 seriesSi=data.seriesSi;
					 seriesSan=data.seriesSan;
			option = {
				    title : {
				        text: '林业及干鲜果品生产',
				        subtext: '林业及干鲜果品生产'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['2014产量','2013产量']
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
				    calculable : true,
				  
				    xAxis : 
			        {
			            type : 'category',
			            data : xAxis,
			            axisLabel : {  
		                    show:true, 
		                    
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }    
			        },
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    series : [
				       
				        {
				            name:'2014产量',
				            type:'bar',
				            data:data.seriesSi,
				        },
				        {
				            name:'2013产量',
				            type:'bar',
				            data:data.seriesSan,
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