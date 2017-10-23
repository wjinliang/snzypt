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
                        <a href="javascript:void(0);">农村固定资产投资情况(2014年)</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<pre style="overflow:hidden" >
 		<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>1.本表非农户固定资产投资为全面调查；农户固定资产投资为抽样调查。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>2.行业划分执行2011年国民经济行业分类标准(GB/T 4754-2011)。</span>
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
				url : "ajax/ncgdzctzqk",
				success : function(data) {
					option = {
    title : {
        x:'left',
        text: '农村固定资产投资情况(2014年)统计年鉴',
     
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
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(0) +'<br/>'
		       					  	}
		       					  return tio;
		       					  }
    },
    legend: {
    top:'6%',
        data:['合计(万元)','非农业(万元)','农业(万元)']
    },
    toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: true},
            magicType : {show: true, type: ['bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },dataZoom:{
			 orient:"horizontal", //水平显示
			show:true, //显示滚动条
			 start:0, //起始值为20%
			 end:40,  //结束值为60%
						    },
    calculable : true,
    xAxis : [
   
        {
            name:'项目',
            type : 'category',
            data : data.xAxis,
            axisLabel : {  
		                    show:true, 
		                   
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }   
        }
    ],
    grid: { // 控制图的大小，调整下面这些值就可以，
	                x: 80,
	                x2: 100,
	                y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
	            },
    yAxis : [
        {
   		 name:'金额(万元)',
            type : 'value',
        }
    ],
    series : [
	    {
            name:'合计(万元)',
            type:'bar',
            data:data.seriesHj,
           
        },
        {
            name:'非农业(万元)',
            type:'bar',
            data:data.seriesFny,
           
        },
        {
            name:'农业(万元)',
            type:'bar',
            data:data.seriesNy,
           
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