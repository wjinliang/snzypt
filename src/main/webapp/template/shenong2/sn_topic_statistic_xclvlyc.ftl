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
                        <a href="javascript:void(0);">乡村旅游</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		    		<pre style="overflow:hidden" >
<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>         北京市乡村旅游各区县的民俗旅游村、民俗旅游户、农业园区的数量图(0为空数据或未采集到信息)
</span>
</p></pre>
	<center><div id="main1" style="width: 800px; height: 432px;"></div></center>	
	<center><div id="main" style="width: 800px; height: 432px;"></div></center>
	<center><div id="main2" style="width: 800px; height: 432px;"></div></center>
	</div></div></div></div></div></div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart1 = echarts.init(document.getElementById('main1'));
		// 指定图表的配置项和数据
		var xAxis="";
		function initVillageIndex1() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/xclylvctest",
				success : function(data) {
			 xAxis=data.quxian;
			option = {
				    title : {
				         x:'center',
				        text: '全市民俗旅游村',
				    },
				    tooltip : {
				        trigger: 'axis',
				         formatter: function (params,data){
						        	var tio= "";
						        	for(var i=0;i<params.length;i++){
							        	if(params[i].value==""||typeof(params[i].value)=='undefined'){
							        		params[i].value=0;
							        	}
		       					  	  tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].name + ' : ' + parseFloat(params[i].value).toFixed(0) +'个<br/>'
		       					  	}
		       					  return tio;
		       					  }
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
			        name:'所在区划',
			            type : 'category',
			            data : ['朝阳区','海淀区','丰台区','石景山区','门头沟区','房山区','通州区','顺义区','大兴区','昌平区','平谷区','怀柔区','密云区','延庆区'],
			            axisLabel : {  
		                    show:true, 
		                    
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }    
			        },
				    yAxis : [
				        {
				           name:'数量（个）',
				            type : 'value',
				             axisLabel: {
                                formatter: '{value} 个'
                               }
				        }
				    ],
				    series : [
				       
				        {name:'数量（个）',
				             label: { normal: {  show: true,  position: 'inside' } },
				            type:'bar',
				            data:data,
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
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		var xAxis="";
		function initVillageIndex() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/xulvlyh",
				success : function(data) {
				
			 xAxis=data.quxian;
			option = {
				    title : {
				         x:'center',
				        text: '北京市民俗旅游户',
				    },
				    tooltip : {
				        trigger: 'axis',
				        formatter: function (params,data){
						        	var tio= "";
						        	for(var i=0;i<params.length;i++){
							        	if(params[i].value==""||typeof(params[i].value)=='undefined'){
							        		params[i].value=0;
							        	}
		       					  	  tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].name + ' : ' + parseFloat(params[i].value).toFixed(0) +'个<br/>'
		       					  	}
		       					  return tio;
		       					  }
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
			        name:'所在区划',
			            type : 'category',
			            data : ['朝阳区','海淀区','丰台区','石景山区','门头沟区','房山区','通州区','顺义区','大兴区','昌平区','平谷区','怀柔区','密云区','延庆区'],
			            axisLabel : {  
		                    show:true, 
		                    
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }
		                
			        },
				    yAxis : [
				        {
				           name:'数量（个）',
				            type : 'value',
				             axisLabel: {
					     show:true, 
						formatter: '{value} 个'
					       },
				        }
				    ],
				    series : [
				       
				        {
				            name:'数量（个）',
				            type:'bar',
					     label: { normal: {  show: true,  position: 'inside' } },
				            data:data,
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
		var myChart2 = echarts.init(document.getElementById('main2'));
		// 指定图表的配置项和数据
		var xAxis="";
		function initVillageIndex2() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/xclylvyuanqu",
				success : function(data) {
				
			 xAxis=data.quxian;
			option = {
				    title : {
				         x:'center',
				        text: '全市休闲农业园区',
				    },
				    tooltip : {
				        trigger: 'axis',
				        			        formatter: function (params,data){
						        	var tio= "";
						        	for(var i=0;i<params.length;i++){
							        	if(params[i].value==""||typeof(params[i].value)=='undefined'){
							        		params[i].value=0;
							        	}
		       					  	  tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].name + ' : ' + parseFloat(params[i].value).toFixed(0) +'个<br/>'
		       					  	}
		       					  return tio;
		       					  }
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
			        name:'所在区划',
			            type : 'category',
			            data : ['朝阳区','海淀区','丰台区','石景山区','门头沟区','房山区','通州区','顺义区','大兴区','昌平区','平谷区','怀柔区','密云区','延庆区'],
			            axisLabel : {  
		                    show:true, 
		                    
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }    
			        },
				    yAxis : [
				        {
				           name:'数量（个）',
				            type : 'value',
				             axisLabel: {
                                formatter: '{value} 个'
                               }
				        }
				    ],
				    series : [
				       
				        {
				            name:'数量（个）',
				            type:'bar', 
					    label: { normal: {  show: true,  position: 'inside' } },
				            data:data,
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