<!doctype html>
<html>
<head>

<#include "/template/sn_head.ftl">
	<!--[if lt IE 10]> 
	<style>
		.head-bottom{background:url(/html/sn-static/static/image/navbanner.png) no-repeat;}
	</style>
	<![endif]-->
</head>

<body>
<#include "/template/sn_header.ftl">
	
    <div class="wrapper" id="wrapper">
    	<div class="container">
        	<div class="row mgt15">
            	<div class="col-md-12">
                	<ul class="agric_list clearfix" id="agric_list">
                    	<li>
                        	<a href="../cqfw/index.htm" target="_blank">
                            	<div class="subjects">村情信息服务专题</div>
                                <img src="/html/sn-static/static/image/sjztimg1.png">
                            </a>
                        </li>
                        <li>
                        	<a href="#" target="_blank">
                            	<div class="subjects">休闲农业专题</div>
                                <img src="/html/sn-static/static/image/sjztimg2.png">
                            </a>
                        </li>
                        <li>
                        	<a href="../tjnj/index.htm" target="_blank">
                            	<div class="subjects">统计年鉴专题</div>
                                <img src="/html/sn-static/static/image/sjztimg3.png">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row mgt15">
            	<h1 style="margin-top:0px;"><span class="set_tit">休闲农业专题</span></h1>
                <div class="col-md-9" style="padding-left:0px;">
                	<ul class="agric_list1 clearfix">
                    	<li>
                        	<div>
                            	<span class="topict_tit1">民俗旅游户</span>
                                <span class="topict_tit2">休闲农业采集</span>
                                <span class="topict_tit3">2015</span>
                            </div>
                            <div class="topic_bg1 mgt10"><span class="topict_tit4" style="margin-right:30px;">3103</span>户</div>
                        </li>
                        <li>
                        	<div>
                            	<span class="topict_tit1">民俗旅游村</span>
                                <span class="topict_tit2">休闲农业采集</span>
                                <span class="topict_tit3">2015</span>
                            </div>
                            <div class="topic_bg2 mgt10"><span class="topict_tit4" style="margin-right:30px;">335</span>个</div>
                        </li>
                        <li>
                        	<div>
                            	<span class="topict_tit1">休闲农业园区</span>
                                <span class="topict_tit2">休闲农业采集</span>
                                <span class="topict_tit3">2015</span>
                            </div>
                            <div class="topic_bg3 mgt10"><span class="topict_tit4" style="margin-right:30px;">704</span>个</div>
                        </li>
                        <li class="mgt20">
                        	<div>
                            	<span class="topict_tit1">特色农产品</span>
                                <span class="topict_tit2">美丽乡村网站</span>
                                <span class="topict_tit3">2014</span>
                            </div>
                            <div class="topic_bg4 mgt10"><span class="topict_tit4" style="margin-right:30px;">28</span>种</div>
                        </li>
                        <li class="mgt20">
                        	<div>
                            	<span class="topict_tit1">星级园区</span>
                                <span class="topict_tit2">Hi乡村网站</span>
                                <span class="topict_tit3">2016</span>
                            </div>
                            <div class="topic_bg5 mgt10"><span class="topict_tit4" style="margin-right:30px;">79</span>家</div>
                        </li>
                        <li class="mgt20">
                        	<div>
                            	<span class="topict_tit1">最美乡村</span>
                                <span class="topict_tit2">美丽乡村网站</span>
                                <span class="topict_tit3">2017</span>
                            </div>
                            <div class="topic_bg6 mgt10"><span class="topict_tit4" style="margin-right:30px;">29</span>个</div>
                        </li>
                    </ul>	
                </div>
                <div class="col-md-3">
                	<a href="" target="_blank" class="snIcon">
                    	<img src="/html/sn-static/static/image/snicon2.png" height="80">
                        <p style="margin-top:80px;">点击查看</p>
                        <p style="margin-top:0px;">休闲农业推荐</p>
                    </a>
                </div>
            </div>
            <div class="row">
            	<div class="col-md-6">
                	<h1 class="set_tit1">民俗旅游户（各区统计）</h1>
                    <div class="chartItem">
                        <div id="chart01" style="height:100%;"></div>	
                    </div>
                </div>
                <div class="col-md-6">
                	<h1 class="set_tit1">民俗旅游村（各区统计）</h1>
                    <div class="chartItem">
                        <div id="chart02" style="height:100%;"></div>	
                    </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-md-6">
                	<h1 class="set_tit1">休闲农业园区（各区统计）</h1>
                    <div class="chartItem">
                        <div id="chart03" style="height:100%;"></div>	
                    </div>
                </div>
                <div class="col-md-6">
                	<h1 class="set_tit1">星级园区</h1>
                    <div class="chartItem">
                        <div id="chart04" style="height:100%;"></div>	
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--footer开始-->
<#include "/template/sn_footer.ftl">
    <script type="text/javascript" src="/html/sn-static/static/js/myMove.js"></script>
   
	
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart1 = echarts.init(document.getElementById('chart02'));
		// 指定图表的配置项和数据
		var xAxis="";
		function initVillageIndex1() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "../../xiangcun/ajax/xclylvctest",
				success : function(data) {
			 xAxis=data.quxian;
			option = {
				   /* title : {
				         x:'center',
				        text: '全市民俗旅游村',
				    },*/
				    tooltip : {
				        trigger: 'axis',
				         formatter: function (params,data){
						        	var tio= "";
						        	for(var i=0;i<params.length;i++){
							        	if(params[i].value==""||typeof(params[i].value)=='undefined'){
							        		params[i].value=0;
							        	}
		       					  	  tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].name + ' : ' + parseFloat(params[i].value).toFixed(0) +'个<br/>'
		       					  	}
		       					  return tio;
		       					  }
				    },
				    //legend: {
				    //top:'6%'
				    //},
				    toolbox: {
				        show : true,
				        feature : {
				            //dataView : {show: true, readOnly: true},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				   /* dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:100,  //结束值为60%
						    },
				    */calculable : true,
				     grid:{
				     		top:30,
				     		right:0,
					    	bottom:44
				    },
				    xAxis : 
			        {
			       // name:'所在区划',
			            type : 'category',
			            data : ['朝阳区','海淀区','丰台区','石景山区','门头沟区','房山区','通州区','顺义区','大兴区','昌平区','平谷区','怀柔区','密云区','延庆区'],
			            axisLabel : {  
		                    show:true, 
		                    
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }    
			        },
				    yAxis : [
				        {
				           name:'数量（个）',
				            type : 'value',
				             axisLabel: {
                                formatter: '{value} 个'
                               }
				        }
				    ],
				    series : [
				       
				        {name:'数量（个）',
				             //label: { normal: {  show: true,  position: 'inside' } },
				            type:'bar',
				            data:data,
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
				        }
				        
				    ]
				};
			myChart1.setOption(option);
		},
		 error :function(e){
			   alert("请求错误");
		   }
		});
			}
		// 使用刚指定的配置项和数据显示图表。
		initVillageIndex1();
	</script>
	 
	
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('chart01'));
		// 指定图表的配置项和数据
		var xAxis="";
		function initVillageIndex() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "../../xiangcun/ajax/xulvlyh",
				success : function(data) {
				
			 xAxis=data.quxian;
			option = {
				    /*title : {
				         x:'center',
				        text: '北京市民俗旅游户',
				    },*/
				    tooltip : {
				        trigger: 'axis',
				        formatter: function (params,data){
						        	var tio= "";
						        	for(var i=0;i<params.length;i++){
							        	if(params[i].value==""||typeof(params[i].value)=='undefined'){
							        		params[i].value=0;
							        	}
		       					  	  tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].name + ' : ' + parseFloat(params[i].value).toFixed(0) +'个<br/>'
		       					  	}
		       					  return tio;
		       					  }
				    },
				    legend: {
				    top:'6%'
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            //dataView : {show: true, readOnly: true},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				   /* dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:100,  //结束值为60%
						    },*/
				    calculable : true,
				    grid:{
				     		left:55,
				     		top:30,
				     		right:0,
					    	bottom:44
				    },
				    xAxis : 
			        {
			        //name:'所在区划',
			            type : 'category',
			            data : ['朝阳区','海淀区','丰台区','石景山区','门头沟区','房山区','通州区','顺义区','大兴区','昌平区','平谷区','怀柔区','密云区','延庆区'],
			            axisLabel : {  
		                    show:true, 
		                    
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }
		                
			        },
				    yAxis : [
				        {
				           name:'数量（个）',
				            type : 'value',
				             axisLabel: {
					     show:true, 
						formatter: '{value} 个'
					       },
				        }
				    ],
				    series : [
				       
				        {
				            name:'数量（个）',
				            type:'bar',
					     //label: { normal: {  show: true,  position: 'inside' } },
				            data:data,
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
	
	

<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart2 = echarts.init(document.getElementById('chart03'));
		// 指定图表的配置项和数据
		var xAxis="";
		function initVillageIndex2() {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "../../xiangcun/ajax/xclylvyuanqu",
				success : function(data) {
				
			 xAxis=data.quxian;
			option = {
				   /* title : {
				         x:'center',
				        text: '全市休闲农业园区',
				    },*/
				    tooltip : {
				        trigger: 'axis',
				        			        formatter: function (params,data){
						        	var tio= "";
						        	for(var i=0;i<params.length;i++){
							        	if(params[i].value==""||typeof(params[i].value)=='undefined'){
							        		params[i].value=0;
							        	}
		       					  	  tio +='<span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:'+params[i].color+'"></span>'
		                		 	   + params[i].name + ' : ' + parseFloat(params[i].value).toFixed(0) +'个<br/>'
		       					  	}
		       					  return tio;
		       					  }
				    },
				    legend: {
				    top:'6%'
				    },
				    toolbox: {
				        show : true,
				        feature : {
				           // dataView : {show: true, readOnly: true},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    /*dataZoom:{
						        orient:"horizontal", //水平显示
						        show:true, //显示滚动条
						        start:0, //起始值为20%
						        end:100,  //结束值为60%
						    },*/
				    calculable : true,
				    grid:{
				     		top:30,
				     		right:0,
					    	bottom:44
				    },
				    xAxis : 
			        {
			       // name:'所在区划',
			            type : 'category',
			            data : ['朝阳区','海淀区','丰台区','石景山区','门头沟区','房山区','通州区','顺义区','大兴区','昌平区','平谷区','怀柔区','密云区','延庆区'],
			            axisLabel : {  
		                    show:true, 
		                    
		                    interval: 0,    // {number}  
		                    rotate: 45  
		                   // margin: 8     
		                }    
			        },
				    yAxis : [
				        {
				           name:'数量（个）',
				            type : 'value',
				             axisLabel: {
                                formatter: '{value} 个'
                               }
				        }
				    ],
				    series : [
				       
				        {
				            name:'数量（个）',
				            type:'bar', 
					    //label: { normal: {  show: true,  position: 'inside' } },
				            data:data,
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
				        }
				        
				    ]
				};
			myChart2.setOption(option);
		},
		 error :function(e){
			   alert("请求错误");
		   }
		});
			}
		// 使用刚指定的配置项和数据显示图表。
		initVillageIndex2();
	</script>
</body>
</html>
