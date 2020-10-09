
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
                        <a href="javascript:void(0);">农业生产条件</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<center><div id="main" style="width: 800px; height: 432px;"></div></center>
		<center><div id="main1" style="width: 800px; height: 432px;"></div></center>
		<center><div id="main2" style="width: 800px; height: 432px;"></div></center>
	</div></div></div></div></div></div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->

	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		var xAxis="";
		var seriesSi="";
		var seriesSan="";
		function initVillageIndex() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/tjnyjx",
				success : function(data) {
					 xAxis=data.xAxis;
					 seriesSi=data.seriesSi;
					 seriesSan=data.seriesSan;
					 //alert(xAxis)
			option = {
				    title : {
				        text: '机械设备使用量',
				        subtext: ''
				    },
				    tooltip : {
	                trigger: 'axis',
	                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                },
	                
			        textStyle:{
								　　align:'${tooltipalign}'
								　　},
								formatter: function (params,data){
						        	var tio= params[0].name + '<br/>';
						        	for(var i=0;i<params.length;i++){
							        	if(params[i].value==""||typeof(params[i].value)=='undefined'){
							        		params[i].value=0;
							        	}
		       					  	  tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(0) +'<br/>'
		       					  	}
		       					  return tio;
		       					  }
	            },
				    legend: {
				        data:['2017年(台)','2016年(台)','2017年为2016年百分比']
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
				    calculable : true,
				    xAxis: {
	            	
	            	name:'       项目',
	                data:xAxis,
	                axisLabel : {  
	                    show:true, 
	                    
	                    interval: 0,    // {number}  
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
	                
	                //}
	            },
	    grid: { // 控制图的大小，调整下面这些值就可以，
             x: 100,
             x2: 120,
             y2: 100,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
         },
				    yAxis : [
				        {
				        name:'产量',
				            type : 'value',
				            			axisLabel: {
                      formatter: '{value}台'
            }	
				            
				        },
				        {
				            type : 'value',
				            name:'百分比',
				            min:50,
							max:130,
							axisLabel: {
                      formatter: '{value} %'
            }					            
				        }
				    ],
				    series : [
				       
				        {
				            name:'2017年(台)',
				            type:'bar',
				            data:seriesSi
				          
				        },
				        {
				            name:'2016年(台)',
				            type:'bar',
				            data:seriesSan
				            },
				            {
				            name:'2017年为2016年百分比',
				            type:'line',
				            yAxisIndex: 1,
				            data:data.serisZb
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
		var seriesSi="";
		var seriesSan="";
		function initVillageIndex1() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/tjnyhf",
				success : function(data) {
					 xAxis=data.xAxis;
					 seriesSi=data.seriesSi;
					 seriesSan=data.seriesSan;
					 //alert(xAxis)
			option1 = {
				    title : {
				        text: ' 化肥施用量',
				        subtext: ''
				    },
				    tooltip : {
	                trigger: 'axis',
	                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                },
	                
			        textStyle:{
								　　align:'${tooltipalign}'
								　　},
								formatter: function (params,data){
						        	var tio= params[0].name + '<br/>';
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
				        data:['2017年(吨)','2016年(吨)','2017年为2016年百分比']
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
				    calculable : true,
				    xAxis: {
	            	name:'       项目',
	                data:xAxis,
	                axisLabel : {  
	                    show:true, 
	                    
	                    interval: 0,    // {number}  
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
	                
	                //}
	            }, grid: { // 控制图的大小，调整下面这些值就可以，
             x: 100,
             x2: 120,
             y2: 100,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
         },

				    yAxis : [
				        {
				        name:'施用量',
				            type : 'value',
				            			axisLabel: {
                      formatter: '{value}吨'
            }	
				            
				        },
				        {
				            type : 'value',
				            name:'百分比',
				            min:50,
							max:130,
							axisLabel: {
                      formatter: '{value} %'
            }					            
				        }
				    ],
				    series : [
				       
				        {
				            name:'2017年(吨)',
				            type:'bar',
				            data:seriesSi
				          
				        },
				        {
				            name:'2016年(吨)',
				            type:'bar',
				            data:seriesSan
				            },
				            {
				            name:'2017年为2016年百分比',
				            type:'line',
				            yAxisIndex: 1,
				            data:data.serisZb
				            }
				           ]
				     
				};
			myChart1.setOption(option1);
		},
		 error :function(e){
			   alert("请求错误");
		   }
		});
			}
		// 使用刚指定的配置项和数据显示图表。
		initVillageIndex1();
	</script>
	
<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var colors = ['#5793f3', '#d14a61', '#675bba','#B5C334'];
		var myChart2 = echarts.init(document.getElementById('main2'));
		// 指定图表的配置项和数据
		var xAxis="";
		var seriesSi="";
		var seriesSan="";
		function initVillageIndex2() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/tjnymj",
				success : function(data) {
			option2 = {
    color: colors,
	title : {
				        text: '各种面积占比',
				        subtext: ''
				    },
    tooltip: {
        trigger: 'axis',
			        textStyle:{
								　　align:'${tooltipalign}'
								　　},
								formatter: function (params,data){
						        	var tio= params[0].name + '<br/>';
						        	for(var i=0;i<params.length;i++){
							        	if(params[i].value==""||typeof(params[i].value)=='undefined'){
							        		params[i].value=0;
							        	}
		       					  	  tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].seriesName + ':' + parseFloat(params[i].value).toFixed(1) +'<br/>'
		       					  	}
		       					  return tio;
		       					  }
    },
    grid: { // 控制图的大小，调整下面这些值就可以，
             x: 100,
             x2: 120,
             y2: 100,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
         },
    toolbox: {
        feature: {
            dataView: {show: true, readOnly: true},
            restore: {show: true},
            saveAsImage: {show: true}
        }
    },
    legend: {
        data:['2017年(公顷)','2016年(公顷)','2017年为2016年百分比']
    },
    xAxis: [
        {
	    name:'       项目',
            type: 'category',
            axisTick: {
                alignWithLabel: true
            },
            data: data.xAxis
        }
    ],
    yAxis: [
        {	name:'面积',
            type: 'value',
            min: 8000,
            max: 150000,
            axisLabel: {
                formatter: '{value} 公顷'
            }
        },
        {
            type: 'value',
            name: '百分比(%)',
            min: 0,
            max: 100,
            axisLabel: {
                formatter: '{value} %'
            }
        }
    ],
    series: [
        {
            name:'2017年(公顷)',
            type:'bar',
            data:data.seriesSi
        },
        {
            name:'2016年(公顷)',
            type:'bar',
            data:data.seriesSan
        },
          {
            name:'2017年为2016年百分比',
            type:'line',
     		yAxisIndex: 1,
            data:data.serisZb
        }
    ]
};
			myChart2.setOption(option2);
		},
		 error :function(e){
			   alert("请求错误");
		   }
		});
			}
		// 使用刚指定的配置项和数据显示图表。
		initVillageIndex2();
	</script>	
	

	
<#include "/template/sn_footer.ftl">
</body>
</html>