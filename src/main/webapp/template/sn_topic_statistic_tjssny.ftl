
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
                        <a href="javascript:void(0);"> 设施农业(2014年)</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<!--<h2 style='color:black'><center><blod>设施农业</blod></center></h2><br/><br/> -->
	<center><div id="main" style="width: 100%; height: 432px" ></div></center>
	<center><div id="main1" style="width: 100%; height: 432px"></div></center>
	<center><div id="main2" style="width: 100%; height: 432px"></div></center>
	</div></div></div></div></div></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
			var myChart1 = echarts.init(document.getElementById('main1'));
			var myChart2 = echarts.init(document.getElementById('main2'));
		// 指定图表的配置项和数据 (乡镇企业)
		function findxzqy() {
			 xarys="";
			 seriesMj="";//设施农业播种面积(公顷)
			 seriesCl="";//设施农业产量(吨)
			 seriesSr="";//设施农业收入(万元)
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/tjssny",
				success : function(data) {
				     xarys=data.xAxis;
					 seriesMj=data.seriesMj;
					 seriesCl=data.seriesCl;
					 seriesSr=data.seriesSr;
				option = {
	            title: {
	            x:'center',
	                text: '设施农业播种面积',
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
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(1)+'<br/>'
		       					  	}
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
	            top:'6%',
	            right:'20%',
	                data:['公顷']
	            },
	            xAxis: {
	            	name:'项目',
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
	                x: 40,
	                x2: 100,
	               left:'30%',
	                y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
	            },
	            yAxis: {
	            type: 'value',
                 name: '设施农业播种面积',
	            axisLabel: {
	             
                formatter: '{value}公顷'
            }
            },
	            series: [{
	                name: '设施农业播种面积(公顷)',
	                type: 'bar',
	                data: seriesMj,
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
	        option1 = {
	            title: {
	            x:'center',
	                text: '设施农业产量',
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
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(1)+'<br/>'
		       					  	}
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
	            top:'6%',
	                data:['设施农业产量(吨)']
	            },
	            xAxis: {
	            	
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
	                x: 40,
	                left:'30%',
	                x2: 100,
	                y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
	            },
	            yAxis: {
	             type: 'value',
                 name: '设施农业产量',
	            axisLabel: {
	             
                formatter: '{value}吨'
            }
	            },
	            series: [{
	                name: '产量（吨）',
	                type: 'bar',
	                data: seriesCl,
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
	        option2 = {
	            title: {
	            x:'center',
	                text: '设施农业收入',
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
		                		 	   + params[i].seriesName + ' : ' + parseFloat(params[i].value).toFixed(1)+'<br/>'
		       					  	}
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
	            	name:'项目',
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
	                x: 40,
	                x2: 100,
	                left:'30%',
	                y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
	            },
	            yAxis: {
	              type: 'value',
                 name: '设施农业收入',
	            axisLabel: {
	             
                formatter: '{value}万元'
            }
	            },
	            series: [{
	                name: '收入（万元）',
	                type: 'bar',
	                data: seriesSr,
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

			 myChart.setOption(option);
			 myChart1.setOption(option1);
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