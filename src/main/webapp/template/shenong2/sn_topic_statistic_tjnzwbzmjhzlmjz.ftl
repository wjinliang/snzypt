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
                        <a href="javascript:void(0);">农作物播种面积和造林面积</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<pre style="overflow:hidden" >
 		<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>1．蔬菜播种面积2006年为农业普查衔接数据，1997年-2005年为历史修订数据。</span>	
&nbsp;&nbsp;&nbsp;&nbsp;<span>2．造林面积2009年以前为人工造林面积，2009年起调整为荒山荒(沙)地造林面积，包括人工造林、无林地和疏林地新封面积。</span>
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
				url : "ajax/tjnzwbzmjhzlmj",
				success : function(data) {
					option = {
							//backgroundColor:'#F0F0F0',
						    title: {
						    x:'center',
						        text: '农作物播种面积和造林面积',
						    },
						    tooltip: {
						        trigger: 'axis',
						        
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
						        data:['播种面积','粮食作物','玉米','小麦','油料','蔬菜及食用菌','瓜类及草莓','饲料','造林面积']
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
							name:'面积',
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
						            name:'播种面积(万公顷)',
						            type:'line',
						         
						            data:data.seriesNzwbzmj
						        },
						         {
						            name:'粮食作物(万公顷)',
						            type:'line',
						         
						            data:data.seriesLszw
						        },
						        {
						            name:'玉米(万公顷)',
						            type:'line',
						           
						            data:data.seriesYm
						        },  
						         {
						            name:'小麦(万公顷)',
						            type:'line',
						         
						            data:data.seriesXm
						        },
						        {
						            name:'油料(万公顷)',
						            type:'line',
						          
						            data:data.seriesYl
						        },
						        {
						            name:'蔬菜及食用菌(万公顷)',
						            type:'line',
						          
						            data:data.seriesScjsyj
						        },
						        {
						            name:'瓜类及草莓(万公顷)',
						            type:'line',
						          
						            data:data.seriesGljcm
						        },
						        {
						            name:'饲料(万公顷)',
						            type:'line',
						            data:data.seriesSl
						        },
						        {
						            name:'造林面积(万公顷)',
						            type:'line',
						            data:data.seriesZlmj
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