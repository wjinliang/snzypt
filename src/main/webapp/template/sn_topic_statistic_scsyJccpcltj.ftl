
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
                        <a href="javascript:void(0);"> 牲畜饲养及畜产品产量</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<center><div id="main" style="width: 100%; height: 80%;" ></div></center>
	<center><div id="main2" style="width: 100%; height: 80%;"></div></center>
	</div></div></div></div></div></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
			var myChart2 = echarts.init(document.getElementById('main2'));
		// 指定图表的配置项和数据 (乡镇企业)
		function findxzqy() {
			//牲畜
			 xarys="";
			 seriesSi="";//2014
			 seriesSan="";//2013
			 serisZb="";//2014年为2013年%
			 //产量
			  xarys1="";
			 seriesSi1="";//2014产量
			 seriesSan1="";//2013产量
			 serisZb1="";//2014年为2013年%
			 
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "ajax/scsyJccpcltj",
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
	            title: {
	               x:'center',
	                text: '牲畜饲养数量统计信息',
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
			        top:'10%',
	                data:['2014年数量(万头)','2013年数量(万头)','2014年为2013年百分比']
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
												 + '<td>2014年</td>'
												 + '<td>2013年</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxis.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxis[i] + '</td>'
												 + '<td>' + data.seriesSi[i]+'(万头)'+ '</td>'
												 + '<td>' + data.seriesSan[i] +'(万头)'+ '</td>'
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
	        
	            xAxis: {
			name:'       项目',
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
	                x: 80,
	                x2: 100,
	                y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
	            },
	            yAxis: [
	            {
            type: 'value',
            name: '牲畜饲养数量',
            axisLabel: {
                formatter: '{value}万头'
            }
        },
        {
            type: 'value',
            name: '2014年为2013年百分比',
            interval: 5,
            min:60,
            axisLabel: {
                formatter: '{value} %'
            }
        }
	            ],
	            series: [{
	            name:'2014年数量(万头)',
	                type: 'bar',
	                data: data.seriesSi
	            },
	            {
	                name: '2013年数量(万头)',
	                type: 'bar',
	                data: seriesSan
	            },
	            {
	                name: '2014年为2013年百分比',
	                yAxisIndex: 1,
	                type: 'line',
	                data: serisZb
	            }
	            ]
	            
	            
	        };	       
	        	option2 = {
	            title: {
	               x:'center',
	                text: '畜产品产量统计信息',
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
			        top:'10%',
	                data:['2014年产量(万吨)','2013年产量(万吨)','2014年为2013年百分比']
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
												 + '<td>2014年</td>'
												 + '<td>2013年</td>'
												 + '</tr>';
									for (var i = 0, l = data.xAxis1.length; i < l; i++) {
										table += '<tr>'
												 + '<td>' + data.xAxis1[i] + '</td>'
												 + '<td>' + data.seriesSi1[i]+'(万吨)'+ '</td>'
												 + '<td>' + data.seriesSan1[i] +'(万吨)'+ '</td>'
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
	        
	            xAxis: {
			name:'       项目',
	                data:xarys1,
	                axisLabel : {  
	                    show:true, 
	                    interval: 0,    // {number}  
	                    rotate: 45  
	                   // margin: 8  
	                     
	                } 
	                
	                //}
	            },
	        grid: { // 控制图的大小，调整下面这些值就可以，
	                x: 50,
	                x2: 100,
	                y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
	            },
	            yAxis: [
	            {
            type: 'value',
            name: '畜产品产量',
            interval: 50,
            axisLabel: {
                formatter: '{value}万吨'
            }
        },
        {
            type: 'value',
            name: '2014年为2013年百分比',
            interval: 5,
            min:60,
            axisLabel: {
                formatter: '{value} %'
            }
        }
	            ],
	            series: [{
	            name:'2014年产量(万吨)',
	                type: 'bar',
	                data: seriesSi1
	            },
	            {
	                name: '2013年产量(万吨)',
	                type: 'bar',
	                data: seriesSan1
	            },
	            {
	                name: '2014年为2013年百分比',
	                yAxisIndex: 1,
	                type: 'line',
	                data: serisZb1
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