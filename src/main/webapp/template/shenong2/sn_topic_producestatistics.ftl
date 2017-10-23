
<html>
<head>
<#include "/template/sn_head.ftl">
<script type="text/javascript" src="/html/sn-static/static/js/echarts.min.js"></script>

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
                        <a href="${application!}/portal/initDatatopicPage">农业生产布局</a>
                         &nbsp;&gt;&nbsp;
                        <a href="javascript:void(0);">生产布局统计</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
                     		<pre style="overflow:hidden" >
<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>各种养殖场基本信息统计和大田农业的信息统计</span>
</p></pre>
	<center><div id="main" style="width:800px; height: 520px;" ></div></center>
	<center><div id="main1" style="width:800px; height: 400px;    margin-top: 20px;"></div></center>
	</div></div></div></div></div></div>
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'));
	function goAjax(){

	$.ajax({
			type : "POST",
			dataType : "json",
			url : "ajax/producestatistics",
			success : function(data) {
				getplantinfo(data);
			}
				 
			});
			
			}
	function getplantinfo(data){

		var schema = [
		    {name: 'JDSL', index: 0, text: '基地数量(个)'},
		    {name: 'ZDGM', index: 1, text: '占地规模(亩)'},
		    {name: 'YZNCL1', index: 2, text: '养殖年存栏(万只/头)'},
		    {name: 'YZNCL2', index: 3, text: '养殖年出栏(万只/头)'},
		    {name: 'YZNCL3', index: 4, text: '养殖年产量(吨)'},
		    {name: 'YYYE', index: 5, text: '年营业额(万元)'}
		];
		
		
		var itemStyle = {
		    normal: {
		        opacity: 0.8,
		        shadowBlur: 10,
		        shadowOffsetX: 0,
		        shadowOffsetY: 0,
		        shadowColor: 'rgba(0, 0, 0, 0.5)'
		    }
		};
			var arr=[];
			var arr1=[];
		for(var i=0;i<data.length;i++){
			
				selfme={name:data[i].name,itemStyle: itemStyle,type:'scatter',data:[data[i].value.split(',')]}; 
				selfme1=data[i].name;
				arr.push(selfme);
				arr1.push(selfme1);
			}
		option = {
			title:{
			text:'各个养殖场基本信息'
				},
			 
		    color: [
		        '#dd4444', '#fec42c', '#80F1BE','#c4fe2c','#E87C25','#27727B','#7CE825','#257CE8','blue','#F0805A'
		    ],
		    legend: {
		    	orient:'vertical',
		        x: '650px',
		        data: arr1,
		        textStyle: {
		            color: 'black',
		            fontSize: 12
		        },
		    },
		   grid: {
		  	top:'15%',
	        left: '3%',
	        right: 160,
	        bottom: '3%',
	        containLabel: true
	    }, toolbox: {
						    	show : true,
						        feature : {
						           
						         
						            restore : {show: true},
						            saveAsImage : {show: true}
						           
						        }  
						        
						        }, 
		    tooltip: {
				textStyle:{
					align:'${tooltipalign}'
				},
		        padding: 10,
		        backgroundColor: '#222',
		        borderColor: '#777',
		        borderWidth: 1,
		        formatter: function (obj) {
		            var value = obj.value;
		            return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
		                + obj.seriesName 
		                + '</div>'
		                + schema[0].text + '：' + value[0] + '<br>'
		                + schema[1].text + '：' + value[1] + '<br>'
		                + schema[2].text + '：' + value[2] + '<br>'
		                + schema[3].text + '：' + value[3] + '<br>'
		                + schema[4].text + '：' + value[4] + '<br>'
		                + schema[5].text + '：' + value[5] + '<br>'
		        }
		    },
		    xAxis: {
		        type: 'value',
		        name: '基地数量',
		        nameGap: 16,
		        nameTextStyle: {
		            color: 'black',
		            fontSize: 14
		        },
		        max:5000,
		        splitLine: {
		            show: false
		        },
		        axisLine: {
		            lineStyle: {
		                color: 'black'
		            }
		        },
		        axisLabel: {
                formatter: '{value}个'
           	 	}
		    },
		     
		    yAxis: {
		        type: 'value',
		        name: '占地规模',
		        nameLocation: 'end',
		        nameGap: 20,
		        nameTextStyle: {
		            color: 'black',
		            fontSize: 16
		        },
		        axisLine: {
		            lineStyle: {
		                color: 'black'
		            }
		        },
		        splitLine: {
		            show: false
		        },
		        axisLabel: {
                formatter: '{value}亩'
           	 	}
		    },
		    visualMap: [
		        {
		            left: 'right',
		            top: '50%',
		            dimension: 2,
		            min: 0,
		            max:100000000,
		            itemWidth: 30,
		            itemHeight: 120,
		            calculable: true,
		            precision: 0.1,
		            text: ['圆形大小：养殖年存栏'],
		            textGap: 30,
		            textStyle: {
		                color: 'black'
		            },
		            inRange: {
		                symbolSize: [10, 70]
		            },
		            outOfRange: {
		                symbolSize: [10, 70],
		                color: ['rgba(255,255,255,.2)']
		            },
		            controller: {
		                inRange: {
		                    color: ['#c23531']
		                },
		                outOfRange: {
		                    color: ['#444']
		                }
		            }
		        }
		    ],
		    series:arr
		};
	myChart.setOption(option);
	}

	goAjax();
</script> 
<script>
		var myChart1 = echarts.init(document.getElementById('main1'));
			function goAjax1(){

	$.ajax({
			type : "POST",
			dataType : "json",
			url : "ajax/plantstatistics",
			success : function(data) {
				getChart(data);
			}
				 
			});
			
			}
function getChart(data){
			var arr1=[];
			var arr2=[];
			var arr3=[];
			for(var i=0;i<data.length;i++){
				selfme1=data[i].zzmj;
				arr1.push(selfme1);
				selfme2=eval(data[i].zzcl/10000).toFixed(2);
				arr2.push(selfme2);
				selfme3=data[i].zwzl;
				arr3.push(selfme3);
			}
	option = {
		title:{
			text:'大田农业信息统计'
		},
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        },
	         textStyle:{
				　　align:'left'
				　　},
	    },
	    legend: {
	        data:['种植面积(亩)','种植产量(万吨)','作物种类(种)']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    }, toolbox: {
						    	show : true,
						        feature : {
						            
						            restore : {show: true},
						            saveAsImage : {show: true}
						           
						        }  
						        
						        }, 
	    xAxis : [
	        {	name:'基地种类',
	            type : 'category',
	            data : ['苗圃基地','果园基地','花卉基地']
	        }
	    ],
	    yAxis : [
	       {
            type: 'value',
            name: '种植产量',
            min: 0,
            max: 500,
            axisLabel: {
                formatter: '{value}万吨'
            }
        },
        {
            type: 'value',
            name: '种植面积',
            min: 0,
            max: 2000000,
            axisLabel: {
                formatter: '{value}亩'
            }
        }
	    ],
	    series : [
	        {
	            name:'种植产量(万吨)',
	            type:'bar',
	            data:arr2
	        },
	        {
	            name:'种植面积(亩)',
	            type:'bar',
	             yAxisIndex: 1,
	            data:arr1
	        },
	        {
	            name:'作物种类(种)',
	            type:'bar',
	            data:arr3
	        }
	        ]
	};
	myChart1.setOption(option);
		}	
	goAjax1();
</script>
<#include "/template/sn_footer.ftl">
</body>
</html>