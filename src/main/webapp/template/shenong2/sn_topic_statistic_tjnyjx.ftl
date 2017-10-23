
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
			    <a href="javascript:void(0);">热门专题</a>
                         &nbsp;&gt;&nbsp;
                        <a href="javascript:void(0);">农业机械</a>
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
		var jiXieNums="";
		function initVillageIndex() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/nyjxcount",
				success : function(data) {
					 xAxis=data.xAxis;
					 jiXieNums=data.jiXieNums;
					 //alert(xAxis)
			option = {
				    title : {
				    x:'center',
				        text: ' 农业机械统计',
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    grid : {
				    bottom:'25%'
				    },
				    legend: {
				    top:'6%',
				        data:['台数']
				    },
				    toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true,
									optionToContent: function(opt) {
									var table = '<table id="dataviewl"  border="1" style="width:100%;text-align:center;overflow:scroll-y;"><tbody><tr>'
												 + '<td>机械名称</td>'
												 + '<td>数量</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxis.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxis[i] + '</td>'
												 + '<td>' +  data.jiXieNums[i]  + '</td>'
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
				        name:'名称',
				            type : 'category',
				            data : data.xAxis,
				                 axisLabel : {  
	                    show:true, 
	                    
	                    interval: 0,      
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
				            
				        
				        }
				    ],
				    yAxis : [
				       
				        {
				            type : 'value',
				            
							axisLabel: {
                      formatter: '{value} 台'
            }					            
				        }
				    ],
				    series : [
				       
				      
				            {
				            name:'台数',
				            type:'bar',
				            data:data.jiXieNums,
				            itemStyle: {
	                    normal: {
	                        color: function(params) {
	                            // build a color map as your need.
	                            var colorList = [
	                              '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
	                               '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
	                               '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
	                            ];
	                            return colorList[params.dataIndex]
	                        }
	                    }
	                }
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