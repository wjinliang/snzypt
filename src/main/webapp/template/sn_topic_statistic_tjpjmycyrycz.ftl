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
                        <a href="javascript:void(0);">平均每一从业人员创造农、林、牧、渔业产值</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<pre style="overflow:hidden" >
 		<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>1.2006年从业人员为农普数据，2007年以后为农业普查口径，含居住半年以上的外来人口。</span>	
&nbsp;&nbsp;&nbsp;&nbsp;<span>2.2006年农林牧渔业总产值及分行业产值为与农业普查衔接的数据，1997-2005年为历史修订数据。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>3.2010年按照新的《统计用产品分类目录》，将原归属林业产值的核桃、板栗等林产品调整至农业产值，并对2009年数据作了调整。</span>
		</p></pre>
	<center><div id="main" style="width: 100%; height: 80%;"></div></center>
	</div></div></div></div></div></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		
		function initVillageIndex() {
			 
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/tjpjmycyrycz",
				success : function(data) {
			
					option = {
							//backgroundColor:'#F0F0F0',
						    title: {
						    x:'center',
						        text: '平均每一从业人员创造农、林、牧、渔业产值',
						    },
						    tooltip: {
						        trigger: 'axis',
						        
			        textStyle:{
								　　align:'${tooltipalign}'
								　　},
								formatter: function (params,data){
								console.log(params);
						        	var tio= params[0].name + '年（平均每一从业人员创造产值）<br/>';
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
						        data:['农林牧渔业总产值(元)','农业(元)','林业(元)','畜牧业(元)','渔业(元)']
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
						        data: data.xAxisTjnf,
						        axisLabel : {  
		                    show:true, 
		                   
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }    
						    },
						    yAxis: {
							name:'金额',
							top:'10%',
						        type: 'value',
						    axisLabel: {
                    formatter: '{value} 元'
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
						            name:'农林牧渔业总产值(元)',
						            type:'line',
						         
						            data:data.seriesNlmyyzcz
						        },
						         {
						            name:'农业(元)',
						            type:'line',
						         
						            data:data.seriesNy
						        },
						        {
						            name:'林业(元)',
						            type:'line',
						           
						            data:data.seriesLy
						        },  
						         {
						            name:'畜牧业(元)',
						            type:'line',
						         
						            data:data.seriesXmy
						        },
						        {
						            name:'渔业(元)',
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
	
<#include "/template/sn_footer.ftl">
</body>
</html>