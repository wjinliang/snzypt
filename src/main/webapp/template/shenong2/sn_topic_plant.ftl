
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
                        <a href="javascript:void(0);">种植信息</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<pre style="overflow:hidden" >
<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>统计北京种植信息</span>
</p></pre>
	<center><div id="main" style="width: 800px; height: 400px;" ></div></center>
	<center><div id="main1" style="width: 800px; height: 400px;"></div></center>
	</div></div></div></div></div></div>
	<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
function getplantinfo(){
	seriesData="";
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "ajax/counts",
		success : function(data) {
			seriesData=data;
			 
				option = {
            title: {
                text: '北京市农村种植生产基本情况'
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
		                		 	   + params[0].name + ' : ' + parseFloat(params[0].value).toFixed(0) +'个<br/>'
		       					  	
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
            xAxis: {
            	name:'基地',
                data: ["苗圃基地","果园基地","花卉基地","观光果园","国有林场","三品基地","设施农业","涉农企业","龙头企业"],
                axisLabel : {  
                    show:true, 
                    
                    interval: 0,    // {number}  
                    rotate: 45  
                   // margin: 8  
                     
                }
                
                //}
            },
            grid: { // 控制图的大小，调整下面这些值就可以，
            	left:'15%',
                x: 40,
                x2: 100,
                y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
            },
            yAxis: [{
            name:'数量（个）',
            type:'value',
             axisLabel: {
                formatter: '{value} 个'
            }
            }],
            series: [{
                name:'数量（个）',
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
        myChart.setOption(option);
		},
	   error :function(e){
		   alert("请求错误");
	   }
	});


}
getplantinfo();
</script> 
<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var myChart1 = echarts.init(document.getElementById('main1'));
function getplantinfo1(){
	xarys="";
	seriesData="";
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "ajax/products",
		success : function(data) {
			 xarys=data.xray;
			seriesData=data.yvalue; 
		   /*  xarys=eval("("+data.xray+")");
			seriesData=eval("("+data.yvalue+")"); */
			 
				option = {
            title: {
                text: '北京市农村苗圃面积前十企业面积信息'
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
		                		 	   + params[0].name + ' : ' + parseFloat(params[0].value).toFixed(0) +'亩<br/>'
		       					  	
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
            
            xAxis: {
            	name:'苗圃名称',
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
            	left:'10%',
                x: 40,
                x2: 100,
                y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
            },
              yAxis: [{
              name:'占地面积（亩）',
            type:'value',
             axisLabel: {
                formatter: '{value} 亩'
            }
            }],
            series: [{
                name:'占地面积（亩）',
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
getplantinfo1();
</script> 
<#include "/template/sn_footer.ftl">
</body>
</html>