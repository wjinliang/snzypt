
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
                        <a href="javascript:void(0);">种业信息</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<center><div id="main" style="width: 700px; height: 432px;"></div></center>
	<center><div id="main1" style="width: 700px; height: 432px;"></div></center>
	</div></div></div></div></div></div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->

	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		var xAxis="";
		var seriesclSi="";
		var seriesclSan="";
		function initVillageIndex() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/tjzzsccl",
				success : function(data) {
					 xAxis=data.xAxis;
					 seriesclSi=data.seriesclSi;
					 seriesclSan=data.seriesclSan;
					 danwei=data.seriesclDw;
					 //alert(xAxis)
			option = {
				    title : {
				    x:'center',
				        text: '种业产量信息',
				    },
				    tooltip : {
				   	 	textStyle:{
							align:'${tooltipalign}'
						},
				        trigger: 'axis',
				        formatter: function (params,data){
				        	if(params[0].value==""){
				        		params[0].value=0;
				        	}
       					  return params[0].name + '<br/>'
       					  +'<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[0].color+'"></span>'
                		  + params[0].seriesName + ' : ' + parseFloat(params[0].value).toFixed(1) +danwei[params[0].dataIndex] +'<br/>'
                  		  +'<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[1].color+'"></span>'
                  		  +params[1].seriesName + ' : ' + parseFloat(params[1].value + params[0].value).toFixed(1)+danwei[params[1].dataIndex];
       					  
                  		  }
				    },
				    legend: {
				    top:'6%',
				        data:['2017年产量','2016年产量']
				    },
				    toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true,
									optionToContent: function(opt) {
									var table = '<table id="dataviewl"  border="1" style="width:100%;text-align:center;overflow:scroll-y;"><tbody><tr>'
												 + '<td>种类</td>'
												 + '<td>2017年产量</td>'
												 + '<td>2016年产量</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxis.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxis[i] + '</td>'
												 + '<td>' + data.seriesclSi[i]+ data.seriesclDw[i]  + '</td>'
												 + '<td>' + data.seriesclSan[i] + data.seriesclDw[i] + '</td>'
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
				        {
				           name:'种类',
				            type : 'category',
				            data : xAxis,
				             axisLabel: {
						               show:true,
						               interval:'0',
						               rotate: 45  
						            }
				            
				        }
				    ],
				    yAxis : [
				        {
				        name:'产量',
				            type : 'value'    
				        }
				    ],
				    series : [
				       
				        {
				            name:'2017年产量',
				            type:'bar',
				            data:data.seriesclSi 
				        },
				        {
				            name:'2016年产量',
				            type:'bar',
				            data:data.seriesclSan 
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
	var xAxis="";
	var seriessiSr="";
	var seriesclsanSr="";
	function initVillageIndex1() {
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "ajax/tjzzsccl",
			success : function(data) {
				 xAxis=data.xAxis;
				 seriesclSi=data.seriesclSi;
				 seriesclSan=data.seriesclSan;
				 //alert(xAxis)
		option = {
			    title : {
			    x:'center',
			        text: '种业收入信息',
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			    top:'6%',
			        data:['2017年收入(万元)','2016年收入(万元)']
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
			        {
			         name:'种类',
			            type : 'category',
			            data : xAxis,
			             axisLabel: {
						               show:true,
						               interval:'0',
						               rotate: 45  
						            }
			        }
			    ],
			    yAxis : [
			        {name:'收入(万元)',
			            type : 'value'
			        }
			    ],
			    series : [
			       
			        {
			            name:'2017年收入(万元)',
			            type:'bar',
			            data:data.seriessiSr 
			        },
			        {
			            name:'2016年收入(万元)',
			            type:'bar',
			            data:data.seriesclsanSr 
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