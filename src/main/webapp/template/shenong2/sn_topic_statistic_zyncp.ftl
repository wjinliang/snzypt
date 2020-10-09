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
		                <a href="javascript:void(0);">主要农产品产量</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<pre style="overflow:hidden" >
 		<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>1.蔬菜、干鲜果品、猪牛羊肉产量2006年为农业普查衔接数据，1997年-2005年为历史修订数据。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>2.肉类产量1988年及以前为猪牛羊肉产量。	</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>3.2006年及以前水产品产量为淡水鱼产量，2007年以后含远洋捕捞量。水产品数据由北京市农业局提供。	</span>
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
				url : "ajax/zyncp",
				success : function(data) {
					option = {
							//backgroundColor:'#F0F0F0',
						    title: {
						    x:'center',
						        text: '主要农业产品产量',
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
						        data:['粮食','油料','蔬菜及食用菌','干鲜果品','牛奶','肉类','猪牛羊肉','禽蛋产量','水产品']
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
						        data: data.xAxis
						    },
						    yAxis: {
						    name:'产量(万吨)',
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
						            name:'粮食（万吨）',
						            type:'line',
						            stack: '总量',
						            data:data.seriesLs
						        },
						         {
						            name:'油料（万吨）',
						            type:'line',
						            stack: '总量',
						            data:data.seriesYl
						        },
						        {
						            name:'蔬菜及食用菌（万吨）',
						            type:'line',
						            stack: '总量',
						            data:data.seriesSc
						        },  
						         {
						            name:'干鲜果品（万吨）',
						            type:'line',
						            stack: '总量',
						            data:data.seriesGxgp
						        },
						        {
						            name:'牛奶（万吨）',
						            type:'line',
						            stack: '总量',
						            data:data.seriesNn
						        },
								{
						            name:'肉类（万吨）',
						            type:'line',
						            stack: '总量',
						            data:data.seriesRou
						        },
								{
						            name:'猪牛羊肉（万吨）',
						            type:'line',
						            stack: '总量',
						            data:data.seriesZuyr
						        },
								{
						            name:'禽蛋产量（万吨）',
						            type:'line',
						            stack: '总量',
						            data:data.seriesQindan
						        },

								
						          {
						            name:'水产品（万吨）',
						            type:'line',
						            stack: '总量',
						            data:data.seriesShuic
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