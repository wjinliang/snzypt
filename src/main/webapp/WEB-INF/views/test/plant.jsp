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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>plant</title>
<script src="<%=basePath%>assets/global/plugins/echart/echarts.js"
	type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
<!-- echart容器，echart -->
<div id="main" style="width: 600px; height: 400px;"></div>
<div id="main1" style="width: 600px; height: 400px;"></div>
 
<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
function getplantinfo(){
	seriesData="";
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "<%=basePath%>portal/ajax/counts",
		success : function(data) {
			seriesData=data;
			 
				option = {
            title: {
                text: '北京农村种植生产基本情况'
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data:['数量']
            },
            xAxis: {
            	
                data: ["苗圃基地","果园基地","花卉基地","观光果园","国有林场","三品基地","设施农业","涉农企业","龙头企业"],
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
                name: '数量',
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
        myChart.setOption(option);
		},
	   error :function(e){
		   alert("请求错误");
	   }
	});


}
getplantinfo();
</script> 
<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var myChart1 = echarts.init(document.getElementById('main1'));
function getplantinfo1(){
	xarys="";
	seriesData="";
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "<%=basePath%>portal/ajax/products",
		success : function(data) {
			 xarys=data.xray;
			seriesData=data.yvalue; 
		   /*  xarys=eval("("+data.xray+")");
			seriesData=eval("("+data.yvalue+")"); */
			 
				option = {
            title: {
                text: '北京农村苗圃面积企业排名'
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data:['占地面积']
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
                name: '亩',
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
getplantinfo1();
</script> 
</body>
</html>