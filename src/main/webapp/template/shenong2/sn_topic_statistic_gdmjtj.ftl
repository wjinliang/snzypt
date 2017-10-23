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
                        <a href="javascript:void(0);">耕地数据</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<pre style="overflow:hidden" >
	<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>2009年耕地面积相关数据为第二次全国土地调查数据，2010-2013年为各年土地变更调查数据。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>资料来源：北京市国土资源局。</span>
		</p></pre>
	<center><div id="main" style="width: 800px; height: 432px;"></div></center>
	</div></div></div></div></div></div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		var xAxis="";
		function initVillageIndex() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/gdmj",
				success : function(data) {
					 xAxis=data.xAxis;
			option = {
				    title : {
				         x:'center',
				        text: '2009-2013耕地面积(公顷)',
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
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(1) +'(公顷)<br/>'
		       					  	}
		       					  return tio;
		       					  
                  		  }
				    },
				    legend: {
				    top:'6%',
				        data:['2009年','2010年','2011年','2012年','2013年']
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
			        name:'项目',
			            type : 'category',
			            data : xAxis,
			            axisLabel : {  
		                    show:true, 
		                    
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }    
			        },
				    yAxis : [
				        {
				           name:'面积',
				            type : 'value',
				             axisLabel: {
                                formatter: '{value} 公顷'
                               }
				        }
				    ],
				    series : [
				       
				        {
				            name:'2009年',
				            type:'bar',
				            data:data.elljYears,
				        },
				        {
				            name:'2010年',
				            type:'bar',
				            data:data.elyjYears,
				        },{
				            name:'2011年',
				            type:'bar',
				            data:data.elyyYears,
				        },{
				        	name:'2012年',
				            type:'bar',
				            data:data.elyeYears,
				        },{
				        	name:'2013年',
				            type:'bar',
				            data:data.elysYears,
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