<html>
<head>
<#include "/template/sn_head.ftl">
</head>
<body>
<#include "/template/sn_header.ftl">
<div class="wrapper">
    	<div class="container">
        	<div class="row">
            	<div class="interact-item">
                	<div class="position-info">
                        <span>当前位置：</span>
                        <a href="${site.url!}">首页</a>
                            &nbsp;&gt;&nbsp;
                        <a href="javascript:void(0);">观察点农村统计</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<pre style="overflow:hidden" >
	<p>   北京市各区县的村庄观察点的村庄和农户数量图
		</p></pre>
	<center><div id="main" style="width: 800px; height: 432px;"></div></center>
	<center><div id="main1" style="width: 800px; height: 432px;"></div></center>
	</div></div></div></div></div></div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		var xAxis="";
		function initVillageIndex() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/czguanchadian",
				success : function(data) {
				
			 xAxis=data.quxian;
			option = {
				    title : {
				         x:'center',
				        text: '村庄观察点(村庄)',
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				    top:'6%'
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            dataView : {show: true, readOnly: true},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:100,  //结束值为60%
						    },
				    calculable : true,
				     grid:{
					    	bottom:105
				    },
				    xAxis : 
			        {
			        name:'所在区县',
			            type : 'category',
			            data : data.xAxis,
			            axisLabel : {  
		                    show:true, 
		                    
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }    
			        },
				    yAxis : [
				        {
				           name:'个数',
				            type : 'value',
				             axisLabel: {
                                formatter: '{value} 个'
                               }
				        }
				    ],
				    series : [
				       
				        {
				            
				            type:'bar',
				            data:data.counts
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
	
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart1 = echarts.init(document.getElementById('main1'));
		// 指定图表的配置项和数据
		var xAxis="";
		function initVillageIndex1() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/nhguanchadian",
				success : function(data) {
				
			 xAxis=data.quxian;
			option = {
				    title : {
				         x:'center',
				        text: '村庄观察点(农户)',
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				    top:'6%'
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            dataView : {show: true, readOnly: true},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:100,  //结束值为60%
						    },
				    calculable : true,
				     grid:{
					    	bottom:105
				    },
				    xAxis : 
			        {
			        name:'所在区县',
			            type : 'category',
			            data : data.xAxis,
			            axisLabel : {  
		                    show:true, 
		                    
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }    
			        },
				    yAxis : [
				        {
				           name:'个数',
				            type : 'value',
				             axisLabel: {
                                formatter: '{value} 个'
                               }
				        }
				    ],
				    series : [
				       
				        {
				            
				            type:'bar',
				            data:data.counts
				        }
				        
				    ]
				};
			myChart1.setOption(option);
		},
		 error :function(e){
			   alert("请求错误");
		   }
		});
			}
		// 使用刚指定的配置项和数据显示图表。
		initVillageIndex1();
	</script>
	
<#include "/template/sn_footer.ftl">
</body>
</html>