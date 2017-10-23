
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
                        <a href="/${application!}/portal/initDatatopicPage">数据专题</a>
                            &nbsp;&gt;&nbsp;
                        <a href="/${application!}/portal/initDatatopicPage">村情信息服务专题</a>
                         &nbsp;&gt;&nbsp;
                        <a href="javascript:void(0);">自然资源</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<pre style="overflow:hidden" >
<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span> 统计北京自然资源中各区县保护区数目占比和保护区面积排名情况</span>
</p></pre>
	<center><div id="main" style="width: 800px; height: 400px;" ></div></center>
	<center><div id="main1" style="width: 800px; height: 400px;"></div></center>
	</div></div></div></div></div></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		function findVillageCountUnderCounty() {
			 var seriesData="";
			 var legendData="";
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/findnaturecount",
				success : function(data) {
					 seriesData=data.seriesData;
					 legendData=data.legendData;
					  seriesData = eval("("+seriesData+")");
					  legendData = eval("("+legendData+")");
						option = {
								title : {
								left:'left',
									text : '北京市各区自然保护区个数及占比',
									x : 'center'
								},
								tooltip : {
									trigger : 'item',
									formatter : "{a} <br/>{b} : {c}个 ({d}%)"
								},
								 toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true,
									optionToContent: function(opt) {
									var table = '<table id="dataviewl"  border="1" style="width:100%;text-align:center;overflow:scroll-y;"><tbody><tr>'
												 + '<td>所在区划</td>'
												 + '<td>自然保护区数量（个）</td>'
												 + '</tr>';
									for (var i = 0, l = legendData.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + legendData[i].name + '</td>'
												 + '<td>' + seriesData[i].value+ '</td>'
												 + '</tr>';
									}
									table += '</tbody></table>';
									setTimeout(function(){
										$('#dataviewl').parent().css('overflow-y','scroll');
									},100);
									
									return table;
								}
									},
						            saveAsImage : {show: true}
						        }
						    },
								legend : {
									orient : 'vertical',
									bottom : '45',
									right  : '10',
									data :legendData,
								},
								series : [ {
									name : '各区自然保护区个数及占比',
									type : 'pie',
									radius : '55%',
									center : [ '50%', '60%' ],
									data :seriesData,
									itemStyle : {
										emphasis : {
											shadowBlur : 10,
											shadowOffsetX : 0,
											shadowColor : 'rgba(0, 0, 0, 0.5)'
										}
									},
									label : {
										normal : {
											show : true,
											formatter:"{d}%"
										}
										
									}
								
								} ]
							};
						myChart.setOption(option);
				},
			   error :function(e){
				   alert("请求错误");
			   }
			});
			
		}
		findVillageCountUnderCounty();
		// 使用刚指定的配置项和数据显示图表。		
	</script>
	<script type="text/javascript">
	var myChart1 = echarts.init(document.getElementById('main1'));
	function getplantinfo(){
		var xarys="";
		var seriesData="";
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "ajax/spacecount",
			success : function(data) {
				 xarys=data.xray;
				seriesData=data.yvalue; 
			   /*  xarys=eval("("+data.xray+")");
				seriesData=eval("("+data.yvalue+")"); */
				 
					option = {
	            title: {
	                text: '北京市自然保护区面积排名'
	            },
	            tooltip : {
	                trigger: 'axis',
	                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                },      
	                formatter: function (params,data){
						        	var tio='';
							        	if(params[0].value==""||typeof(params[0].value)=='undefined'){
							        		params[0].value=0;
							        		}
		       					  	  tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[0].color+'"></span>'
		                		 	   + params[0].name + ' : ' + parseFloat(params[0].value).toFixed(0) +'公顷<br/>'
		       					  	
		       					  return tio;
		       					  }
	            },
				toolbox: {
									show : true,
									feature : {
										dataView : {show: true, readOnly: true},
										saveAsImage : {show: true}
									}
						        },
	            legend: {
	                data:['占地面积(公顷)']
	            },
	            xAxis: {
	            	name:'保护区',
	                data:xarys,
	                axisLabel : {  
	                    show:true, 
	                    
	                    interval: 0,    // {number}  
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
	                
	                //}
	            },
	        grid: { // 控制图的大小，调整下面这些值就可以，
	        		left:'20%',
	                x: 40,
	                x2: 100,
	                y2:150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
	            },
	            yAxis: [{
	              type: 'value',
	              nameGap:20,
            name: '面积（公顷）',
           // interval: 50,
            axisLabel: {
                formatter: '{value} 公顷'
            }
	            }],
	            series: [{
	                name: '面积（公顷）',
	                type: 'bar',
	                data: seriesData,
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
	            }]
	        };

	        // 使用刚指定的配置项和数据显示图表。
	        myChart1.setOption(option);
			},
		   error :function(e){
			   alert("请求错误");
		   }
		});


	}
	getplantinfo();
	//findVillageCountUnderCounty();
	</script>

<#include "/template/sn_footer.ftl">
</body>
</html>