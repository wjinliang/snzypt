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
	<center><div id="main1" style="width: 700px; height: 432px;"></div></center>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		
		function initVillageIndex() {
			option = {
				    title : {
				        text: '种业生产',
				        subtext: '2015'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['2014收入','2013收入']
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
				    xAxis : [
				        {
				            type : 'category',
				            data : ['小麦种','玉米种','蔬菜种']
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    series : [
				       
				        {
				            name:'2014收入',
				            type:'bar',
				            data:[429.7, 339.4, 1642.2],
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        },
				        {
				            name:'2013收入',
				            type:'bar',
				            data:[850.5, 290.8, 1290.1],
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        }
				        
				    ]
				};
			myChart.setOption(option);
		}
		// 使用刚指定的配置项和数据显示图表。
		initVillageIndex();
	</script>
	<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	var myChart1 = echarts.init(document.getElementById('main1'));
	// 指定图表的配置项和数据
	
	function initVillageIndex1() {
		option = {
			    title : {
			        text: '种业生产(产量)',
			        subtext: '2015'
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
			    xAxis : [
			        {
			            type : 'category',
			            data : ['小麦种','玉米种','蔬菜种']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			       
			              {
					            name:'2014产量',
					            type:'bar',
					            data:[1470993, 493627, 165130],
					            markPoint : {
					                data : [
					                    {type : 'max', name: '最大值'},
					                    {type : 'min', name: '最小值'}
					                ]
					            },
					            markLine : {
					                data : [
					                    {type : 'average', name: '平均值'}
					                ]
					            }
					        },
					        {
					            name:'2013产量',
					            type:'bar',
					            data:[4434263, 486735, 91055],
					            markPoint : {
					                data : [
					                    {type : 'max', name: '最大值'},
					                    {type : 'min', name: '最小值'}
					                ]
					            },
					            markLine : {
					                data : [
					                    {type : 'average', name: '平均值'}
					                ]
					            }
					        }		        
			    ]
			};
		myChart1.setOption(option);
	}
	// 使用刚指定的配置项和数据显示图表。
	initVillageIndex1();
	</script>

</body>
</html>