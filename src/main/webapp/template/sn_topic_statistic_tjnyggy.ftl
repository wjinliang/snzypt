
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
                        <a href="javascript:void(0);">农业观光园</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<center><div id="main" style="width: 700px; height: 432px;"></div></center>
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
				url : "ajax/tjnyggy",
				success : function(data) {
					 xAxis=data.xAxis;
					 seriesSi=data.seriesSi;
					 seriesSan=data.seriesSan;
					 seriesDw=data.seriesDw;
					 //alert(xAxis)
			option = {
				    title : {
				    x:'center',
				        text: ' 农业观光园',
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
						        	for(var i=0;i<params.length-1;i++){
							        	if(params[i].value==""||typeof(params[i].value)=='undefined'){
							        		params[i].value=0;
							        	}
							        	if(params[2].value==""||typeof(params[2].value)=='undefined'){
							        		params[2].value=0;
							        	}
							        	if(seriesDw[params[i].dataIndex]=='(个)'||seriesDw[params[i].dataIndex]=='(人)'){
							        		tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(0) +seriesDw[params[i].dataIndex]+'<br/>'
							        	}else{
							        		tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(1) +seriesDw[params[i].dataIndex]+'<br/>'
							        	}						
		       					  	  
		       					  	}
		       					  	tio+='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[2].color+'"></span>'
		                		 	   + params[2].seriesName + ' : ' + parseFloat(params[2].value).toFixed(1) +'%<br/>'
		       					  return tio;
		       					  }
				    },
				    legend: {
				    top:'6%',
				        data:['2017年','2016年','2017年为2016年百分比']
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
												 + '<td>2017年</td>'
												 + '<td>2016年</td>'
												  + '<td>2017为2016百分比</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxis.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxis[i] + '</td>'
												 + '<td>' + data.seriesSi[i]+ data.seriesDw[i]  + '</td>'
												 + '<td>' + data.seriesSan[i] + data.seriesDw[i] + '</td>'
												  + '<td>' + data.serisZb[i] +'%'+ '</td>'
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
				    xAxis : [
				        {   name:'       项目',
				            type : 'category',
				            data : xAxis
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        },
				        {
				            type : 'value',
				            min:50,
							max:130,
							axisLabel: {
                      formatter: '{value} %'
            }					            
				        }
				    ],
				    series : [
				       
				        {
				            name:'2017年',
				            type:'bar',
				            data:seriesSi
				          
				        },
				        {
				            name:'2016年',
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
	
<#include "/template/sn_footer.ftl">
</body>
</html>