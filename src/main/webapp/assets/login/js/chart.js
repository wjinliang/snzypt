 

//图表分析-- 人员
var ryC = echarts.init(document.getElementById('ry'));
var ry = {
		legend: {
			data:['数据提供量','数据使用量']
		},
		calculable : true,
		grid: {
			borderWidth: 0,
			x:50,
			y:60,
			x2:10,
			y2:40
	
		},
		xAxis : [
			{
				type : 'category',
				boundaryGap : false,
				splitLine:{
					lineStyle:{
						color: '#ddd',
						width: 1,
						type: 'dotted'
					}
				},
				data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
			}
		],
		yAxis : [
			{
				type : 'value',
				axisLine:{
					show: true,
					lineStyle: {
						color: '#666',
						width: 0
					}
				}
			}
		],
		series : [
			{
				name:'数据使用量',
				type:'line',
				smooth:true,
				itemStyle: {normal: {areaStyle: {type: 'default'}}},
				data:[120, 180, 230, 280, 380, 580, 500, 680, 500, 480, 430, 280]
			},
			{
				name:'数据提供量',
				type:'line',
				smooth:true,
				itemStyle: {normal: {areaStyle: {type: 'default'}}},
				data:[200, 330, 600, 620, 680, 630, 760, 620, 440, 780, 600, 720]
			}
		]
};
ryC.setOption(ry);



                
//图表分析-- 平台收益
var syC = echarts.init(document.getElementById('sy'));
var sy = {
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			type : 'line',          // 默认为直线，可选为：'line' | 'shadow'
			lineStyle: {
				color:'#ffd37e',
				width: 2
			}
        },
        textStyle:{// 字体样式
            color:'#fff',
            fontSize:12,
            fontFamily: 'MicroSoft YaHei'
        },
    },
    calculable: false,
    grid: {
        borderWidth: 0,
        x:60,
        y:60,
        x2:10,
        y2:40

    },
    legend: {
        orient : 'horizontal',
        x : 'center',y : 'top',
        data:['平台收益']
    },
    xAxis : [
        {
            type : 'category',
            show: true,
            axisTick : false,
            data : ['5月5日','5月6日','5月7日','5月8日','5月9日'],
            axisLabel:{
        	 	show: true,
			    interval: 'auto',
			    formatter: null,
			    textStyle: {
			        color: '#333'
			    }
            },
			splitLine:{
                lineStyle:{
                    color: '#ddd',
                    width: 1,
                    type: 'dotted'
                }
            },
            axisLine:{
                show: true,
                lineStyle: {
                    color: '#ccc',
                    width: 1
                }
            }
        }
    ],
    yAxis : [
        {
            type : 'value',
				axisLine:{
					show: true,
					lineStyle: {
						color: '#666',
						width: 0
					}
				}
        }
    ],
    series : [
        {
            name:'平台收益',
            type:'line',
            symbol:'emptyCircle',
            symbolSize: 1 | 4,
            stack: '总量',
            itemStyle: {
					normal: {
					color: '#ffd37e'
					}
				},
            data:[150,201,330,444,500]
        }
    ]
};
syC.setOption(sy);

