
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
                        <a href="javascript:void(0);">乡镇企业出口供货情况</a>
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
		var seriesSi="";
		var seriesSan="";
		function initVillageIndex() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/xaqyjck",
				success : function(data) {
					 xAxis=data.xAxis;
					 seriesSi=data.seriesSi;
					 seriesSan=data.seriesSan;
					 //alert(xAxis)
			option = {
				    title : {
				    x:'center',
				        text: ' 乡镇企业出口供货情况',
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        top:'6%',
				        data:['2014年收入(万元)','2013年收入(万元)']
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
				             name:'项目',
				            type : 'category',
				            data : xAxis
				        }
				    ],
				    	    grid: { // 控制图的大小，调整下面这些值就可以，
             x: 80,
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
				        }
				    ],
				    series : [
				       
				        {
				            name:'2014年收入(万元)',
				            type:'bar',
				            data:seriesSi,
				        },
				        {
				            name:'2013年收入(万元)',
				            type:'bar',
				            data:seriesSan,
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