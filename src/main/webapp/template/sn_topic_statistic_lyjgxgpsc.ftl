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
                        <a href="javascript:void(0);">林业及干鲜果品生产</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<center><div id="main" style="width:800px; height: 432px;"></div></center>
	<center><div id="main1" style="width: 800px; height: 432px;"></div></center>
	</div></div></div></div></div></div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		var myChart1 = echarts.init(document.getElementById('main1'));
		// 指定图表的配置项和数据
		var xAxis="";
		var seriesclSi="";
		var seriesclSan="";
		var seriesZb="";
		function initVillageIndex() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/lyjgxgpsc",
				success : function(data) {
					 xAxis=data.xAxis;
					 seriesSi=data.seriesSi;
					 seriesSan=data.seriesSan;
					 seriesZb=data.seriesZb;
					 //干鲜果
					 xAxis1=data.xAxis;
					 seriesSi1=data.seriesSi;
					 seriesSan1=data.seriesSan;
					 seriesZb1=data.seriesZb;
			option = {
				    title : {
				        x:'center',
				        text: '林业生产',
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
				    grid: {
				    left:'20%'
				    },
				    legend: {
				    top:'6%',
				    
				        data:['2017年产量(吨)','2016年产量(吨)','2017年为2016年百分比']
				    },
				      toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true,
									optionToContent: function(opt) {
									var table = '<table id="dataviewl"  border="1" style="width:100%;text-align:center;overflow:scroll-y;"><tbody><tr>'
												 + '<td>项目</td>'
												 + '<td>2017年产量</td>'
												 + '<td>2016年产量</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxis.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxis[i] + '</td>'
												 + '<td>' + data.seriesSi[i] +data.seriesDw1[i]+ '</td>'
												 + '<td>' + data.seriesSan[i] +data.seriesDw1[i]+ '</td>'
												 + '</tr>';
									}
									table += '</tbody></table>';
									setTimeout(function(){
									
										$('#dataviewl').parent().css('overflow-y','scroll');
									},100);
									
									return table;
								}
									},
						            magicType : {show: true, type: ['line', 'bar']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
				    calculable : true,
				  
				    xAxis : 
			        {
					name:'       项目',
			            type : 'category',
			            data : xAxis,
			            axisLabel : {  
		                    show:true, 
		                   
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }    
			        },
				        grid: {  
							left: '10%',  
							bottom:'35%'  
							},  
				    yAxis : [
				        {	name:'产量',
				            type : 'value',
				           
				             axisLabel: {
                    formatter: '{value} 吨'
                                  }
				        },
				        {	name:'比例',
				            type : 'value',
				              min: 30,
                              max: 180,
				             axisLabel: {
                    formatter: '{value} %'
                                  }
				        }
				    ],
				    series : [
				       
				        {
				            name:'2017年产量(吨)',
				            type:'bar',
				            data:data.seriesSi1,
				        },
				        {
				            name:'2016年产量(吨)',
				            type:'bar',
				            data:data.seriesSan1,
				        },
				        {
				            name:'2017年为2016年百分比',
				            type:'line',
				             yAxisIndex: 1,
				            data:data.seriesZb1,
				        }
				        
				    ]
				};
				option1 = {
				    title : {
				        x:'center',
				        text: '干鲜果品生产',
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
				    grid: {
				    left:'10%'
				    },
				    legend: {
				    top:'6%',
				    
				        data:['2017年产量(吨)','2016年产量(吨)','2017年为2016年百分比']
				    },
				      toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true,
									optionToContent: function(opt) {
									var table = '<table id="dataviewl"  border="1" style="width:100%;text-align:center;overflow:scroll-y;"><tbody><tr>'
												 + '<td>项目</td>'
												 + '<td>2017年产量</td>'
												 + '<td>2016年产量</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxis.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxis1[i] + '</td>'
												 + '<td>' + data.seriesSi1[i] +data.seriesDw1[i]+ '</td>'
												 + '<td>' + data.seriesSan1[i] +data.seriesDw1[i]+ '</td>'
												 + '</tr>';
									}
									table += '</tbody></table>';
									setTimeout(function(){
									
										$('#dataviewl').parent().css('overflow-y','scroll');
									},100);
									
									return table;
								}
									},
						            magicType : {show: true, type: ['line', 'bar']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
				    calculable : true,
				  
				    xAxis : 
			        {
					name:'       项目',
			            type : 'category',
			            data : data.xAxis1,
			            axisLabel : {  
		                    show:true, 
		                   
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }    
			        },
				    yAxis : [
				        {	name:'产量',
				            type : 'value',
				           
				             axisLabel: {
                    formatter: '{value} 吨'
                                  }
				        },
				        {	name:'比例',
				            type : 'value',
				              min: 30,
                              max: 120,
				             axisLabel: {
                    formatter: '{value} %'
                                  }
				        }
				    ],
				    series : [
				       
				        {
				            name:'2017年产量(吨)',
				            type:'bar',
				            data:data.seriesSi1,
				        },
				        {
				            name:'2016年产量(吨)',
				            type:'bar',
				            data:data.seriesSan1,
				        },
				        {
				            name:'2017年为2016年百分比',
				            type:'line',
				             yAxisIndex: 1,
				            data:data.seriesZb1,
				        }
				        
				    ]
				};
			myChart.setOption(option);
			myChart1.setOption(option1);
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