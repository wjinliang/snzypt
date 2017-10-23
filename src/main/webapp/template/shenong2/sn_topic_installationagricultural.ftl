
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
                        <a href="${application!}/portal/initDatatopicPage">设施农业统计专题</a>
                         &nbsp;&gt;&nbsp;
                        <a href="javascript:void(0);">设施农业统计</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
                     	    		<pre style="overflow:hidden" >
<p><span>说明:</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>设施农业中各种信息的统计</span>
</p></pre>
	<center><div id="main" style="width:600px; height: 480px;" ></div></center>
	</div></div></div></div></div></div>
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'));
	function goAjax(){

	$.ajax({
			type : "POST",
			dataType : "json",
			url : "ajax/sheshistatistics",
			success : function(data) {
				getplantinfo(data);
			}
				 
			});
			
			}
	function getplantinfo(data){
	 
		var schema = [
			{name: 'JDSL', index: 0, text: '基地数量'},
		    {name: 'TUQIANG', index: 1, text: '土墙'},
		    {name: 'ZHUANQIANG', index: 2, text: '砖墙'},
		    {name: 'ZHUANHUN', index: 3, text: '砖混'},
		    {name: 'QITAQIAGJIEGOU', index: 4, text: '其他墙结构'},
		    {name: 'SHUCAI', index: 5, text: '蔬菜'},
		    {name: 'HUAHUI', index: 6, text: '花卉'},
		    {name: 'GUOSHU', index: 7, text: '果树'},
		    {name: 'QITAZUOWU', index: 8, text: '其他作物'}
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
			console.log(data);
		option = {
			 
		    color: [
		        '#dd4444', 'blue', '#80F1BE','#FCCE10','black'
		    ],
		    legend: {
		        y: 'auto',
		        data: arr1,
		        textStyle: {
		            color: 'black',
		            fontSize: 12
		        }
		    },
		    grid: {
		        x: '10%',
		        x2: 150,
		        y: '18%',
		        y2: '10%'
		    },
		    tooltip: {
		     textStyle:{
				　　align:'left'
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
		                + schema[0].text + '：' + value[0] + ' 个<br>'
		                + schema[1].text + '：' + value[1] + ' 种<br>'
		                + schema[2].text + '：' + value[2] + ' 种<br>'
		                + schema[3].text + '：' + value[3] + ' 种<br>'
		                + schema[4].text + '：' + value[4] + ' 种<br>'
		                + schema[5].text + '：' + value[5] + ' 种<br>'
		                + schema[6].text + '：' + value[6] + ' 种<br>'
		                + schema[7].text + '：' + value[7] + ' 种<br>'
		                + schema[8].text + '：' + value[8] + ' 种<br>'	
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
		        max:1500,
		        splitLine: {
		            show: false
		        },
		        axisLine: {
		            lineStyle: {
		                color: 'black'
		            }
		        }
		    },
		    yAxis: {
		        type: 'value',
		        name: '土墙数量',
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
		        }
		    },
		    visualMap: [
		        {
		            left: 'right',
		            top: '10%',
		            dimension: 2,
		            min: 0,
		            max:100,
		            itemWidth: 30,
		            itemHeight: 120,
		            calculable: true,
		            precision: 0.1,
		            text: ['圆形大小：砖墙数量'],
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
<#include "/template/sn_footer.ftl">
</body>
</html>