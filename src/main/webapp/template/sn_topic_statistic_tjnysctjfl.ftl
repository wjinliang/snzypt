<html>
<head>
<#include "/template/sn_head.ftl">
</head>
<body>
<#include "/template/sn_header.ftl">
<style>
#main > div:nth-child(3) > div:nth-child(2){
overflow: scroll;
}
</style>
<div class="wrapper">
    	<div class="container">
        	<div class="row">
            	<div class="interact-item">
                	<div class="position-info">
                        <span>当前位置：</span>
                        <a href="${site.url!}">首页</a>
                            &nbsp;&gt;&nbsp;
                        <a href="javascript:void(0);">农业生产条件</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<pre style="overflow:hidden" >
 		<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>1.化肥施用量为折纯量。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>2.2003年以前农村用电量由原北京市供电局提供。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>3.农业机械总动力数据由北京市农业局提供。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>4.1991-2001年有效灌溉面积由北京市水务局提供。</span>
</p></pre>
	<div id="main" style="width: 100%; height: 80%;"></div>
	<div id="main2" style="width: 100%; height: 80%;"></div>
	<div id="main3" style="width: 100%; height: 80%;"></div>
	<div id="main4" style="width: 100%; height: 80%;"></div>
	<div id="main5" style="width: 100%; height: 80%;"></div>
	</div></div></div></div></div></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
			var myChart2 = echarts.init(document.getElementById('main2'));
			var myChart3 = echarts.init(document.getElementById('main3'));
			var myChart4 = echarts.init(document.getElementById('main4'));
			var myChart5 = echarts.init(document.getElementById('main5'));
		// 指定图表的配置项和数据
		
		function initVillageIndex() {
			 
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/tjnysctjfl",
				success : function(data) {
					option = {
							//backgroundColor:'#F0F0F0',
						    title: {
						    x:'center',
						        text: '年末实有耕地面积',
						    },
						    tooltip: {
						        trigger: 'axis',
						        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                },
			        textStyle:{
								　　align:'${tooltipalign}'
								　　},
								formatter: function (params,data){
						        	var tio= params[0].name + '年<br/>';
						        	for(var i=0;i<params.length;i++){
							        	if(params[i].value==""||typeof(params[i].value)=='undefined'){
							        		params[i].value=0;
							        	}
		       					  	  tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(1) +'<br/>'
		       					  	}
		       					  return tio;
		       					  }
						    },
						    legend: {
						    	top:'6%',
						        data:['年末实有耕地面积（万公顷）']
						    },
						    toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true
									
									},
						            magicType : {show: true, type: ['bar','line']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
						    xAxis: {
						    name:'年份',
						        type: 'category',
						        boundaryGap: false,
						        data: data.xAxis,
						            axisLabel : {  
	                    show:true, 
	                    
	                    interval: 0,      
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
						    },
						    yAxis: {
							name:'年末实有耕地面积',
							top:'10%',
						    type: 'value',
						    axisLabel: {
                            formatter: '{value} 万公顷'
                                       }   
						    },
						    dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:50,  //结束值为60%
						    },
						    series: [
						          {
						            name:'年末实有耕地面积(万公顷)',
						            type:'line',
						            data:data.seriesNmsygdmj
						            
						        }
						      
						    ]
						};
						
										
				option2 = {
							//backgroundColor:'#F0F0F0',
						    title: {
						     x:'center',
						        text: '有效灌溉面积',
						    },
						    tooltip: {
						        trigger: 'axis',
						        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                }
						    },
						    legend: {
						    	top:'6%',
						        data:['seriesYxggmj']
						    },
						 
						    toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true
									
									},
						            magicType : {show: true, type: ['bar','line']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
						    xAxis: {
						     name:'年份',
						        type: 'category',
						        boundaryGap: false,
						        data: data.xAxis,
						            axisLabel : {  
	                    show:true, 
	                    
	                    interval: 0,      
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
						    },
						    yAxis: {
							name:'有效灌溉面积',
							top:'10%',
						    type: 'value',
						    axisLabel: {
                            formatter: '{value} 千公顷'
                                       }   
						    
						    },
						    dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:50,  //结束值为60%
						    },
						    series: [
						          {
						            name:'有效灌溉面积（千公顷）',
						            type:'line',
						            data:data.seriesYxggmj
						            
						        }
						      
						    ]
						};
						
						
				option3 = {
							//backgroundColor:'#F0F0F0',
						    title: {
						    x:'center',
						        text: '农用机械总动力',
								subtext:''
						    },
						    tooltip: {
						        trigger: 'axis',
						        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                }
						    },
						    legend: {
						    	top:'6%',
						        data:['农用机械总动力']
						    },
						 
						    toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true
									
									},
						            magicType : {show: true, type: ['bar','line']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
						    xAxis: {
						     name:'年份',
						        type: 'category',
						        boundaryGap: false,
						        data: data.xAxis,
						            axisLabel : {  
	                    show:true, 
	                    
	                    interval: 0,      
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
						    },
						    yAxis: {
							name:'机械总动力',
							top:'10%',
						    type: 'value',
						    axisLabel: {
                            formatter: '{value} 万千瓦'
                                       }  
						    },
						    dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:50,  //结束值为60%
						    },
						    series: [
						          {
						            name:'农用机械总动力(万千瓦)',
						            type:'line',
						            data:data.seriesNyjxzdl
						            
						        }
						      
						    ]
						};
						
						
				option4 = {
							//backgroundColor:'#F0F0F0',
						    title: {
						    x:'center',
						        text: '农村用电量',
								subtext:''
						    },
						    tooltip: {
						        trigger: 'axis',
						        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                }
						    },
						    legend: {
						    	top:'6%',
						        data:['农村用电量']
						    },
						 
						    toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true
									
									},
						            magicType : {show: true, type: ['bar','line']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
						    xAxis: {
						     name:'年份',
						        type: 'category',
						        boundaryGap: false,
						        data: data.xAxis,
						            axisLabel : {  
	                    show:true, 
	                    
	                    interval: 0,      
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
						    },
						        grid: { // 控制图的大小，调整下面这些值就可以，
             x: 120,
             x2: 120,
             y2: 120,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
         },
						    yAxis: {
							name:'农村用电量',
							top:'10%',
						    type: 'value',
						    axisLabel: {
                            formatter: '{value} 万千瓦小时'}
						         
						    },
						    dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:50,  //结束值为60%
						    },
						    series: [
						          {
						            name:'农村用电量（万千瓦小时）',
						            type:'line',
						            data:data.seriesNcydl
						            
						        }
						      
						    ]
						};
						
						
				option5 = {
							//backgroundColor:'#F0F0F0',
						    title: {
						     x:'center',
						        text: '化肥施用量',
						    },
						    tooltip: {
						        trigger: 'axis',
						        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                }
						    },
						    legend: {
						    	top:'6%',
						        data:['化肥施用量']
						    },
						 
						    toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true
									
									},
						            magicType : {show: true, type: ['bar','line']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
						    xAxis: {
						     name:'年份',
						        type: 'category',
						        boundaryGap: false,
						        data: data.xAxis,
						            axisLabel : {  
	                    show:true, 
	                    
	                    interval: 0,      
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
						    },
						    yAxis: {
							name:'化肥施用量',
							top:'10%',
						    type: 'value',
						     axisLabel: {
                            formatter: '{value} 万吨'
                                       }
						    },
						    dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:50,  //结束值为60%
						    },
						    series: [
						          {
						            name:'化肥施用量(万吨)',
						            type:'line',
						            data:data.seriesHfsyl
						            
						        }
						      
						    ]
						};				

							myChart.setOption(option);
							myChart2.setOption(option2);
							myChart3.setOption(option3);
							myChart4.setOption(option4);
							myChart5.setOption(option5);
					
					
				},
				   error :function(e){
					   alert("请求错误");
				   }
				});
		}
		// 使用刚指定的配置项和数据显示图表。
		initVillageIndex();
	</script>
	
<#include "/template/sn_footer.ftl">
</body>
</html>