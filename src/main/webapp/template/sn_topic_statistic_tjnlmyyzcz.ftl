
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
                        <a href="javascript:void(0);">农林牧渔业总产值</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<center><div id="main" style="width: 800px; height: 432px;"></div></center>
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
				url : "ajax/tjnlmyyzcz",
				success : function(data) {
					 xAxis=data.xAxis;
					 seriesSi=data.seriesSi;
					 seriesSan=data.seriesSan;
					 //alert(xAxis)
			option = {
				    title : {
				        text: '农林牧渔业总产值',
				        subtext: ''
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
				        data:['2014年产值(万元)','2013年产值(万元)','2014年为2013年百分比']
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
				        { name:'      项目',
				            type : 'category',
				            data : xAxis,
				             axisLabel : {  
	                    show:true, 
	                    interval: 0,      
	                    rotate: 45  
	                     
	                } 
				        }
				    ],
				    grid:{
				    	y2:80
				    },
				    yAxis : [
				        {
				        	name:'总产值(万元)',
				            type : 'value'
								        
				        },
				        {
				            type : 'value',
				            name:'百分比',
				            min:50,
							max:130,
							axisLabel: {
                      formatter: '{value} %'
            }					            
				        }
				    ],
				    series : [
				       
				        {
				            name:'2014年产值(万元)',
				            type:'bar',
				            data:seriesSi
				          
				        },
				        {
				            name:'2013年产值(万元)',
				            type:'bar',
				            data:seriesSan
				            },
				            {
				            name:'2014年为2013年百分比',
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