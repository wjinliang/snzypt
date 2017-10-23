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
                        <a href="javascript:void(0);">农村基本信息</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<pre style="overflow:hidden" >
<p><span>说明:<span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>1.从业人员指标1998年以前为乡村劳动力。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>2.乡政府个数、镇政府个数、村民委员会个数由北京市民政局提供。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>3.2006年乡镇及行政村人口和从业人员为农业普查数据；2007年以后乡镇及行政村人口和从业人员为农业普查口径，包含居住半年以上外来人口。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>4.2006年乡镇及行政村户数为农业普查数据，为自然户口径；2007年以后为居住一年以上的户口径。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>5.数据为0的可能为未采集的数据。</span>
		</p></pre>
	<center><div id="main" style="width: 100%; height: 80%;"></div></center>
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
				url : "ajax/villagebase",
				success : function(data) {
					option = {
							//backgroundColor:'#F0F0F0',
						    title: {
						    x:'center',
						        text: '农村基本情况(1978-2014年)',
						    },
						    tooltip: {
						        trigger: 'axis',
						         textStyle:{
								　　align:'${tooltipalign}'
								　　},
								formatter: function (params,data){
						        	
						        	var tio= params[0].name + '年<br/>';
						        	for(var i=0;i<params.length;i++){
						        	if(!params[i].value){
						        		params[i].value=0;
						        	}
						        	if(i<3){
			       					  	  tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
			                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(0) +'<br/>'
		       					  		}else{
		       					  		 tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(1) +'<br/>'
		       					  		}
		       					  	}
		       					  return tio;
		       					  
		       					 
		       					
		                  		  
		       					  
                  		  }
						    },
						    legend: {
						    	top:'6%',
						        data:['乡政府(个)','镇政府(个)','村民委员会(个)','乡镇及行政村常住户数(万户)','乡镇及行政村常住人口(万人)','乡镇及行政村从业人员(万人)']
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
						    xAxis: {
						    name:'年份',
						        type: 'category',
						        boundaryGap: false,
						        data: eval("("+data.tjnfList+")"),
						        axisLabel: {
						                formatter: '{value}年'
						            }
						    },
						    grid:{
						    	y:120
						    },
						    yAxis: {
						    name:'数量',
							top:'10%',
						        type: 'value'
						    },
						    dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:100,  //结束值为60%
						    },
						    series: [
						          {
						            name:'乡政府(个)',
						            type:'line',
						            stack: '总量',
						            data:eval("("+data.xzfList+")")
						        },
						         {
						            name:'镇政府(个)',
						            type:'line',
						            stack: '总量',
						            data:eval("("+data.zzfList+")")
						        },
						        {
						            name:'村民委员会(个)',
						            type:'line',
						            stack: '总量',
						            data:eval("("+data.cmwyhList+")")
						        },  
						         {
						            name:'乡镇及行政村常住户数(万户)',
						            type:'line',
						            stack: '总量',
						            data:eval("("+data.xzjxzxxzhsList+")")
						        },
						        {
						            name:'乡镇及行政村常住人口(万人)',
						            type:'line',
						            stack: '总量',
						            data:eval("("+data.xzjxzcczrkList+")")
						        }, 
						          {
						            name:'乡镇及行政村从业人员(万人)',
						            type:'line',
						            stack: '总量',
						            data: eval("("+data.xzjxzccyryList+")")
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