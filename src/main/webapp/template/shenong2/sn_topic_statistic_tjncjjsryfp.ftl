
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
                        <a href="javascript:void(0);"> 农村经济收入与分配</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<center><div id="main" style="width: 80%; height: 60%;"></div></center>
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
				url : "ajax/tjncjjsryfp",
				success : function(data) {
					 xAxis=data.xAxis;
					 seriesSi=data.seriesSi;
					 seriesSan=data.seriesSan;
			option = {
				    title : {
				         x:'center',
				        text: '农村经济收入与分配'
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
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(1)+'<br/>'
		       					  	}
		       					  return tio;
		       					  }
				  
				    },
				    legend: {
				    top:'6%',
				        data:['2014年收入(万元)','2013年收入(万元)','2014年为2013年收入百分比']
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
												 + '<td>2014年收入</td>'
												 + '<td>2013年收入</td>'
												  + '<td>2014年为2013年收入百分比</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxis.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxis[i] + '</td>'
												 + '<td>' + data.seriesSi[i]+ "万元"  + '</td>'
												 + '<td>' + data.seriesSan[i] + "万元" + '</td>'
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
				            data : xAxis,
				            axisLabel:{interval: 0, rotate: 45}
				           
				        }
				    ],
				    grid: { // 控制图的大小，调整下面这些值就可以，
             x: 100,
             x2: 100,
             y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
         },
				    yAxis : [
				        {
				        	name:'收入(万元)',
				            type : 'value',
				            axisLabel: {
                      formatter: '{value} 万元'
            }				
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
				            name:'2014年收入(万元)',
				            type:'bar',
				            data:seriesSi
				          
				        },
				        {
				            name:'2013年收入(万元)',
				            type:'bar',
				            data:seriesSan
				            },
				            {
				            name:'2014年为2013年收入百分比',
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