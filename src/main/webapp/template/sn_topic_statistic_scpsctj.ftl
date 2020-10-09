
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
                        <a href="javascript:void(0);"> 水产品生产条件</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<pre style="overflow:hidden" >
 		<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>1.2006年从业人员为农普数据，2007年以后为农业普查口径，含居住半年以上的外来人口。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>2.2006年农林牧渔业总产值及分行业产值为与农业普查衔接的数据，1997-2005年为历史修订数据。</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>3.2010年按照新的《统计用产品分类目录》，将原归属林业产值的核桃、板栗等林产品调整至农业产值，并对2009年数据作了调整。</span>		
</p></pre>
	<center><div id="main" style="width: 800px; height:500px;" ></div></center>
	<center><div id="main2" style="width:800px; height: 500px;" ></div></center>
	</div></div></div></div></div></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
			var myChart2 = echarts.init(document.getElementById('main2'));
		// 指定图表的配置项和数据 (乡镇企业)
		function findxzqy() {
			 xarys="";
			 seriesSi="";//2017产量
			 seriesSan="";//2016产量
			 serisZb="";//2017年为2016年%
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/scpsctj",
				success : function(data) {
				     xarys=data.xAxis;
					 seriesSi=data.seriesSi;
					 seriesSan=data.seriesSan;
					 serisZb=data.serisZb;
					 
					 xarys1=data.xAxis1;
					 seriesSi1=data.seriesSi1;
					 seriesSan1=data.seriesSan1;
					 serisZb1=data.serisZb1;
				option = {
    title : {
        text: '水产品面积',
        subtext: '单位:公顷'
    },
    tooltip : {
        trigger: 'axis',
         axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                },
	                 
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
    grid:{
    left:'15%'
    },
    legend: {
        data:['2017年(公顷)','2016年(公顷)','2017年为2016年百分比']
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
												 + '<td>2017年</td>'
												 + '<td>2016年</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxis.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxis[i] + '</td>'
												 + '<td>' + data.seriesSi[i]+ data.serisDw[i]  + '</td>'
												 + '<td>' + data.seriesSan[i] + data.serisDw[i] + '</td>'
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
        {   name:'      项目',
            type : 'category',
            data : xarys,
             axisLabel : {  
		                    show:true, 
		                   
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }  
        }
    ],
    grid: { // 控制图的大小，调整下面这些值就可以，
             x: 100,
             x2: 100,
             y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
         },
    yAxis : [
        {
            type : 'value',
             axisLabel: {
                formatter: '{value} 公顷'
            }
        },
        {
            type : 'value',
            min:80,
             axisLabel: {
                formatter: '{value} %'
            }
        },
    ],
    series : [
        {
            name:'2017年(公顷)',
            type:'bar',
            data:seriesSi
            
        },
        {
            name:'2016年(公顷)',
            type:'bar',
            data:seriesSan
        
        },
        {
            name:'2017年为2016年百分比',
            type:'line',
            yAxisIndex: 1,
            data:serisZb
        
        }
    ]
};	       
	      option2 = {
    title : {
        text: '水产品产量',
        subtext: '单位:吨'
    },
    tooltip : {
        trigger: 'axis',
         axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                },
	                 
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
        data:['2017年(吨)','2016年(吨)','2017年为2016年百分比']
    },
      grid:{
    left:'15%'
    },
     toolbox: {
						    	show : true,
						        feature : {
						            dataView : {
									show: true,
									readOnly: true,
									optionToContent: function(opt) {
									var table = '<table id="dataviewl1"  border="1" style="width:100%;text-align:center;overflow:scroll-y;"><tbody><tr>'
												 + '<td>项目</td>'
												 + '<td>2017年</td>'
												 + '<td>2016年</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxis1.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxis1[i] + '</td>'
												 + '<td>' + data.seriesSi1[i]+ data.serisDw1[i]  + '</td>'
												 + '<td>' + data.seriesSan1[i] + data.serisDw1[i] + '</td>'
												 + '</tr>';
									}
									table += '</tbody></table>';
									setTimeout(function(){
										$('#dataviewl1').parent().css('overflow-y','scroll');
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
          name:'      项目',
            type : 'category',
            data : xarys1,
             axisLabel : {  
		                    show:true, 
		                   
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }  
        }
    ],
    yAxis : [
        {
            type : 'value',
             axisLabel: {
                formatter: '{value} 吨'
            }
        },
        {
            type : 'value',
            min:80,
             axisLabel: {
                formatter: '{value} %'
            }
        },
    ],
    series : [
        {
            name:'2017年(吨)',
            type:'bar',
            data:seriesSi1
            
        },
        {
            name:'2016年(吨)',
            type:'bar',
            data:seriesSan1
        
        },
         {
            name:'2017年为2016年百分比',
            type:'line',
            yAxisIndex: 1,
            data:serisZb1
        
        }
    ]
};	       

			 myChart.setOption(option);
			 myChart2.setOption(option2);
				},
			   error :function(e){
				   alert("请求错误");
			   }
			});
			
		}
		findxzqy();
		// 使用刚指定的配置项和数据显示图表。		
	</script>
<#include "/template/sn_footer.ftl">
</body>
</html>