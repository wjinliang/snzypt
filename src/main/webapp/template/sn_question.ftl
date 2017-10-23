
<html>
<head>
<#include "/template/sn_head.ftl">
</head>
<body>

<div class="wrapper">
        <div class="container">
        	<!--涉农数据整合情况-->
        	<div class="row" style="    background-color: #F0F0F0;    margin-top: 20px; margin-bottom: 200px;    padding-bottom: 20px;
">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<center><div id="main" style="width: 1000px; min-height: 600px;" ></div></center>
		</div></div></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		function findDanjiJbxxCountUnderCounty() {
		   
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/questionList",
				success : function(data) {
						option = {
								title : {
									text : '各委办局需求类型所占比',
									x : 'left'
								},
								tooltip : {
									trigger : 'axis',
									  axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }

								},
								legend : {
									data :['数据','应用','接口']
								},
								toolbox: {
									show : true,
									feature : {
										mark : {show: true},
										dataView : {show: true, readOnly: true},
										magicType : {show: true, type: ['line', 'bar']},
										restore : {show: true},
										saveAsImage : {show: true}
									}
								},
								calculable : true,
							    grid:{
							    	bottom:105
							    },
								 xAxis : [
									{
										type : 'category',
										data : eval("("+data.weibanjus+")"),

										axisLabel : {  
						                    show:true, 
							                    
							                    interval: 0,    // {number}  
							                    rotate: 45  
							                   // margin: 8  
							                     
							                }
									},
									{
										type : 'category',
										axisLine: {show:false},
										axisTick: {show:false},
										axisLabel: {show:false},
										splitArea: {show:false},
										splitLine: {show:false},
										data : eval("("+data.weibanjus+")")
									}
								],
								yAxis : [
									{
										type : 'value'
									}
								],
								 series : [
									 {
							            name:'数据',
							            type:'bar',
							            itemStyle: {normal: {color:'rgba(193,35,43,1)', label:{show:true}}},
							            data:eval("("+data.shuju+")")
							        },
							        {
							            name:'应用',
							            type:'bar',
							            itemStyle: {normal: {color:'rgba(181,195,52,1)', label:{show:true,textStyle:{color:'#27727B'}}}},
							            data:eval("("+data.yingyong+")")
							        },
							        {
							            name:'接口',
							            type:'bar',
							            itemStyle: {normal: {color:'rgba(145,195,52,1)', label:{show:true,textStyle:{color:'#27727B'}}}},
							            data:eval("("+data.jiekou+")")
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
		findDanjiJbxxCountUnderCounty();
		// 使用刚指定的配置项和数据显示图表。
		
	</script>

</body>
</html>