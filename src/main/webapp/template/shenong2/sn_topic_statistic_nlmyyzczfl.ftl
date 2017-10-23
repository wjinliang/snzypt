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
                        <a href="javascript:void(0);">农林牧渔业总产值(1978-2014年)</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<pre style="overflow:hidden" >
	<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>1.农林牧渔业总产值绝对数按现价计算，从2003年起执行新《国民经济行业分类标准》，农林牧渔业总产值中含农林牧渔服务业产值。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>2.2003年以后，计算农林牧渔业总产值使用的价格从农产品综合平均价调整为农产品生产价格。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>3.2006年为与农业普查衔接的数据，1997-2005年为历史修订数据。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>4.2010年按照新的《统计用产品分类目录》，将原归属林业产值的核桃、板栗等林产品调整至农业产值，并对2009年数据作了调整。</span>
</p></pre>
	<center><div id="main" style="width: 100%; height: 80%;"></div>
	</center>
	<center><div id="main1" style="width: 100%; height: 80%;"></div></center>
	</div></div></div></div></div></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		
		function initVillageIndex() {
			 seriesData="";
			 legendData="";
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/tjnlmyyzczfl",
				success : function(data) {
			
					option = {
							//backgroundColor:'#F0F0F0',
						    title: {
						    x:'center',
						        text: '农林牧渔业总产值(1978-2014年)',
								
						    },
						    tooltip: {
						         trigger: 'axis',
						         textStyle:{
								　　align:'${tooltipalign}'
								　　},
								formatter: function (params,data){
						        	console.log(params);
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
						        data:['农林牧渔业总产值','农业','林业','牧业','渔业']
						    },
						 
						    toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true,
									optionToContent: function(opt) {
									var table = '<table id="dataviewl"  border="1" style="width:100%;text-align:center;overflow:scroll-y;"><tbody><tr>'
												 + '<td>年份</td>'
												 + '<td>农林牧渔页总产值</td>'
												 + '<td>农业</td>'
												 + '<td>林业</td>'
												 + '<td>牧业</td>'
												 + '<td>渔业</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxisTjnf.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxisTjnf[i] + '</td>'
												 + '<td>' + data.seriesNlmyyzcz[i] + '</td>'
												 + '<td>' + data.seriesNl[i] + '</td>'
												  + '<td>' +data.seriesLy[i] + '</td>'
												 + '<td>' + data.seriesMy[i] + '</td>'
												 + '<td>' + data.seriesYy[i] + '</td>'
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
						    xAxis: {
						        type: 'category',
						        boundaryGap: false,
						        data: data.xAxisTjnf,
						        name:'年份'
						    },
						    yAxis: {
							name:'产值',
							top:'10%',
						    type: 'value',
						    axisLabel: {
                                  formatter: '{value} 亿元'
                                  } 
						    },
						    dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:100,  //结束值为60%
						    },
						    series: [
						          {
						            name:'农林牧渔业总产(亿元)',
						            type:'line',
						         
						            data:data.seriesNlmyyzcz
						        },
						         {
						            name:'农业(亿元)',
						            type:'line',
						         
						            data:data.seriesNl
						        },
						        {
						            name:'林业(亿元)',
						            type:'line',
						           
						            data:data.seriesLy
						        },  
						         {
						            name:'牧业(亿元)',
						            type:'line',
						         
						            data:data.seriesMy
						        },
						        {
						            name:'渔业(亿元)',
						            type:'line',
						          
						            data:data.seriesYy
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
		
		function initVillageIndex1() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/tjnlmyyzczfl",
				success : function(data) {
			
					option = {
    title : {
         x:'center',
        text: '农林牧渔业总产值比上年增长百分比',
    },
    tooltip : {
         trigger: 'axis',
						         textStyle:{
								　　align:'${tooltipalign}'
								　　},
								formatter: function (params,data){
						        	
						        	var tio= params[0].name + '年（农林牧渔业总产值比上年增长百分比）<br/>';
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
        data:['农林牧渔业现价计算','农林牧渔业可比价计算']
    },
    
      toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true,
									optionToContent: function(opt) {
									var table = '<table id="dataview2"  border="1" style="width:100%;text-align:center;overflow:scroll-y;"><tbody><tr>'
												 + '<td>年份</td>'
												 + '<td>按现价计算</td>'
												 + '<td>按可比价计算</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxisTjnf.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxisTjnf[i] + '</td>'
												 + '<td>' + data.seriesAxjjs[i] + '</td>'
												 + '<td>' + data.seriesAkbjjs[i] + '</td>'
												 + '</tr>';
									}
									table += '</tbody></table>';
									setTimeout(function(){
										$('#dataview2').parent().css('overflow-y','scroll');
									},100);
									return table;
									}
									},
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
    xAxis : [
        {
            type : 'category',
            data : data.xAxisTjnf,
			name:'年份'
        }
    ],
    legend: {
						    	top:'6%',
						        data:['按现价计算','按可比价计算']
						    },
    yAxis : [
        {
		 name:'百分比',
            type : 'value',
                axisLabel: {
                                  formatter: '{value}%'
                                  } 
			
        }
    ],
							    
    series : [
        {
            name:'按现价计算(%)',
            type:'bar',
            data:data.seriesAxjjs,
            
        },
        {
            name:'按可比价计算(%)',
            type:'bar',
            data:data.seriesAkbjjs,
            
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