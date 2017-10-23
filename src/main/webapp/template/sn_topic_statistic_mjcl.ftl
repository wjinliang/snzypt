
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
                        <a href="javascript:void(0);">农作物播种面积及产量</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<center><div id="main" style="width: 80%; height: 60%;"></div></center>
	<center><div id="main1" style="width: 80%; height: 60%;"></div></center>
	<center><div id="main2" style="width: 80%; height: 60%;"></div></center>
	</div></div></div></div></div></div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->

	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		var seriesmjSi="";
		var seriesmjsan="";
		function initVillageIndex() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/mjcl",
				success : function(data) {
					 xAxis=data.xAxis;
					 seriesmjSi=data.seriesmjSi;
					 seriesmjsan=data.seriesmjsan;
					 //alert(xAxis)
			option = {
				    title : {
				    x:'center',
				        text: '主要农作物播种面积',
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
						        	console.log(params);
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
				        top:'6%',
				        data:['2014年面积(公顷)','2013年面积(公顷)']
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
				    xAxis : [
				        {
				        name:'植物种类',
				            type : 'category',
				            data : xAxis,
				           axisLabel : {  
	                    show:true, 
	                    
	                    interval: 0,      
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
				            
				        }
				    ],
				    yAxis : [
				        {
				           name:'播种面积(公顷)',
				            type : 'value'
				        }
				    ],
				    series : [
				       
				        {
				            name:'2014年面积(公顷)',
				            type:'bar',
				            data:data.seriesmjSi
				        },
				        {
				            name:'2013年面积(公顷)',
				            type:'bar',
				            data:data.seriesmjsan
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
	var seriesdcSi="";
	var seriesdcsan="";
	function initVillageIndex1() {
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "ajax/mjcl",
			success : function(data) {
				 xAxis=data.xAxis;
				 seriesdcSi=data.seriesdcSi;
				 seriesdcsan=data.seriesdcsan;
				 //alert(xAxis)
		option = {
			    title : {
			    x:'center',
			        text: '主要农作物单产量',
			    },
			    tooltip : {
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
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(1) +'<br/>'
		       					  	}
		       					  return tio;
		       					  }
			    },
			    legend: {
			        top:'6%',
			        data:['2014年单产(公斤/公顷)','2013年单产(公斤/公顷)']
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
			    xAxis : [
			        {
			         name:'种类',
			            type : 'category',
			            data : xAxis,
			            axisLabel: {
						       show:true,
						       interval:'0',
						       rotate:'45'
						        }
			        }
			    ],
			    yAxis : [
			        {
			         name:'单产量(公斤/公顷)',
			            type : 'value'
			        }
			    ],
			    series : [
			       
			        {
			            name:'2014年单产(公斤/公顷)',
			            type:'bar',
			            data:data.seriesdcSi
			        },
			        {
			            name:'2013年单产(公斤/公顷)',
			            type:'bar',
			            data:data.seriesdcsan
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
		<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	var myChart2 = echarts.init(document.getElementById('main2'));
	// 指定图表的配置项和数据
	var xAxis="";
	var serieszcSi="";
	var serieszcsan="";
	function initVillageIndex2() {
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "ajax/mjcl",
			success : function(data) {
				 xAxis=data.xAxis;
				 serieszcSi=data.serieszcSi;
				 serieszcsan=data.serieszcsan;
				 //alert(xAxis)
		option = {
			    title : {
			    x:'center',
			        text: '主要农作物总产量',
			    },
			    tooltip : {
			        trigger: 'axis',
			        textStyle:{
								　　align:'${tooltipalign}'
								　　},
								formatter: function (params,data){
						        	console.log(params);
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
			        top:'6%',
			        data:['2014年总产量(吨)','2013年总产量(吨)']
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
			    xAxis : [
			        {
			        name:'种类',
			            type : 'category',
			            data : xAxis,
			         axisLabel: {
						       show:true,
						       interval:'0',
						       rotate:'45'
						        }
			        }
			    ],
			    yAxis : [
			        {
			         name:'总产量(吨)',
			            type : 'value'
			        }
			    ],
			    series : [
			       
			        {
			            name:'2014年总产量(吨)',
			            type:'bar',
			            data:data.serieszcSi
			           
			        },
			        {
			            name:'2013年总产量(吨)',
			            type:'bar',
			            data:data.serieszcsan
			        }
			        
			    ]
			};
		myChart2.setOption(option);
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