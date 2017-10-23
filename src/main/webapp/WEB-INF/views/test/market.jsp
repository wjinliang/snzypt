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
	<div id="main" style="width: 600px; height: 400px;" ></div>
	<div id="main1" style="width: 600px; height: 400px;"></div>
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
				url : "<%=basePath%>portal/ajax/findmarketcount",
				success : function(data) {
					 seriesData=data.seriesData;
					 legendData=data.legendData;
					  seriesData = eval("("+seriesData+")");
					  legendData = eval("("+legendData+")");
						option = {
								title : {
									text : '北京市各区农副市场占比',
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
									name : '北京市各区农副市场占比',
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
	<script type="text/javascript">
	var myChart1 = echarts.init(document.getElementById('main1'));
	function getplantinfo(){
		xarys="";
		seriesData="";
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "<%=basePath%>portal/ajax/reCapital",
			success : function(data) {
				 xarys=data.xray;
				seriesData=data.yvalue; 
			   /*  xarys=eval("("+data.xray+")");
				seriesData=eval("("+data.yvalue+")"); */
				 
					option = {
	            title: {
	                text: '北京农副市场注册资本排名(千元)'
	            },
	            tooltip : {
	                trigger: 'axis',
	                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                }
	            },
	            legend: {
	                data:['注册资本(千元)']
	            },
	            xAxis: {
	            	
	                data:xarys,
	                axisLabel : {  
	                    show:true, 
	                    
	                    interval: 0,    // {number}  
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
	                
	                //}
	            },
	        grid: { // 控制图的大小，调整下面这些值就可以，
	                x: 40,
	                x2: 100,
	                y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
	            },
	            yAxis: {},
	            series: [{
	                name: '万元',
	                type: 'bar',
	                data: seriesData,
	                itemStyle: {
	                    normal: {
	                        color: function(params) {
	                            // build a color map as your need.
	                            var colorList = [
	                              '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
	                               '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
	                               '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
	                            ];
	                            return colorList[params.dataIndex]
	                        }
	                    }
	                }
	            }]
	        };

	        // 使用刚指定的配置项和数据显示图表。
	        myChart1.setOption(option);
			},
		   error :function(e){
			   alert("请求错误");
		   }
		});


	}
	getplantinfo();
	//findVillageCountUnderCounty();
	</script>

</body>
</html>