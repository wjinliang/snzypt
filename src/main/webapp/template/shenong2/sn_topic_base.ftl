
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
                        <a href="${application!}/portal/initDatatopicPage">数据专题</a>
                            &nbsp;&gt;&nbsp;
                        <a href="${application!}/portal/initDatatopicPage">村情信息服务专题</a>
                         &nbsp;&gt;&nbsp;
                        <a href="javascript:void(0);">基本信息</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<pre style="overflow:hidden" >
<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>统计北京市各个区县农村的总数及其所占北京市农村总数的百分比。</span>
</p></pre>
		
	<center><div id="main" style="width: 800px; height: 400px;" ></div></center>
	</div></div></div></div></div></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		function findVillageCountUnderCounty() {
			 seriesData="";
			 legendData="";
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/findvillagecountundercounty",
				success : function(data) {
					 seriesData=data.seriesData;
					 legendData=data.legendData;
					  seriesData = eval("("+seriesData+")");
					  legendData = eval("("+legendData+")");
						option = {
								title : {
								    left:'left',
									text : '北京市各区农村数量及占比',
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
												 + '<td>区县</td>'
												 + '<td>农村数量(个)</td>'
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
									name : '各区农村数量及占比',
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
<#include "/template/sn_footer.ftl">
</body>
</html>