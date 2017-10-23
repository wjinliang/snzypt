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
        	<#include "/template/sn_zt_daohang.ftl">
            <div class="row mgt15">
            	<h1 style="margin-top:0px;"><span class="set_tit">村情信息服务专题</span></h1>
                <div class="col-md-9" style="padding-left:0px;">
                	<ul class="agric_list1 clearfix">
                    	<li>
                        	<div>
                            	<span class="topict_tit1">农村总数</span>
                                <span class="topict_tit2">北京统计年鉴</span>
                                <span class="topict_tit3">2015</span>
                            </div>
                            <div class="topic_xcicon topic_icon1 mgt10"><span class="topict_tit4" style="margin-right:30px;">3936</span>个</div>
                        </li>
                        <li>
                        	<div>
                            	<span class="topict_tit1">常驻人口</span>
                                <span class="topict_tit2">北京统计年鉴</span>
                                <span class="topict_tit3">2015</span>
                            </div>
                            <div class="topic_xcicon topic_icon2 mgt10"><span class="topict_tit4" style="margin-right:30px;">539.5</span>万人</div>
                        </li>
                        <li>
                        	<div>
                            	<span class="topict_tit1">常住户数</span>
                                <span class="topict_tit2">北京统计年鉴</span>
                                <span class="topict_tit3">2015</span>
                            </div>
                            <div class="topic_xcicon topic_icon3 mgt10"><span class="topict_tit4" style="margin-right:30px;">221.4</span>万户</div>
                        </li>
                        <li class="mgt20">
                        	<div>
                            	<span class="topict_tit1">农业户籍人口</span>
                                <span class="topict_tit2">三资监管平台</span>
                                <span class="topict_tit3">2016</span>
                            </div>
                            <div class="topic_xcicon topic_icon4 mgt10"><span class="topict_tit4" style="margin-right:30px;">239.8348</span>万人</div>
                        </li>
                        <li class="mgt20">
                        	<div>
                            	<span class="topict_tit1">农户家庭</span>
                                <span class="topict_tit2">三资监管平台</span>
                                <span class="topict_tit3">2016</span>
                            </div>
                            <div class="topic_xcicon topic_icon5 mgt10"><span class="topict_tit4" style="margin-right:30px;">100.7382</span>万户</div>
                        </li>
						 <li class="mgt20">
                        	<div>
                            	<span class="topict_tit1">农村劳动力</span>
                                <span class="topict_tit2">三资监管平台</span>
                                <span class="topict_tit3">2016</span>
                            </div>
                            <div class="topic_xcicon topic_icon6 mgt10"><span class="topict_tit4" style="margin-right:30px;">154.5133</span>万人</div>
                        </li>
                    </ul>	
                </div>
                <div class="col-md-3">
                	<a href="../../initItemCountPage" target="_blank" class="snIcon">
                    	<img src="/html/sn-static/static/image/snicon5.png" height="80">
                        <p style="margin-top:80px;">点击查看</p>
                        <p style="margin-top:0px;">村情报告</p>
                    </a>
                </div>
            </div>
            <div class="row mgt15">
            	<div class="col-md-5" style="padding-left:0;">
                	<h1 class="set_tit1">农村总数基本情况</h1>
                    <div class="chartItem chartH">
                        <div id="xczt_chart01" style="height:100%;"></div>	
                    </div>
                </div>
                <div class="col-md-7">
                	<h1 class="set_tit1">种植生产情况</h1>
                	<div class="chart_container chartH">
                    	<div class="chart_title xcchart_title">
                            <ul class="clearfix">
                                <li rel="xczt_rep" class="hover"><span>北京市农村种植基本情况</span></li>
                                <li rel="xczt_rep"><span>北京市农村苗圃面积拍名</span></li> 
                            </ul>
                        </div>
                        <div class="chart_con" rel="xczt_rep_pad" style="display:block;">
                            <div class="show_chart4">
                            	<div id="xczt_chart02" style="width:100%; height:100%;"></div>
                            </div>
                        </div>
                        <div class="chart_con" rel="xczt_rep_pad" style="display:block;">
                            <div class="show_chart4">
                            	<div id="xczt_chart03" style="width:100%; height:100%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
            	<h1 class="set_tit1">自然资源分布情况</h1>
            	<div class="chart_container" style="padding:15px;">
                	<ul class="show_chart3List clearfix">
                          <li class="firstLi">
                               <div class="show_chart4">
                                    <div id="xczt_chart04" style="width:95%; height:260px;"></div>
                               </div>
                           </li>
                           <li class="lastLi">
                               <div class="show_chart4">
                                   <div id="xczt_chart05" style="width:95%; height:260px;"></div>
                               </div>
                          </li>
                     </ul>
                </div>
            </div>
            <div class="row">
            	<div class="col-md-12">
                	<h1 style="margin-top:0px;"><span class="set_tit">农经专题</span></h1>
                    <div class="chart_container" style="padding-top:15px;">
                    	<div class="chart_title1">
                            <ul class="clearfix">
                                <li rel="xczt_rep1" class="hover"><span>畜牧养殖</span></li>
                                <li rel="xczt_rep1"><span>市场资源</span></li>
                                <li rel="xczt_rep1"><span>农业科技</span></li>
                            </ul>
                        </div>
                        <!--ul包含至少两张图表-->
                        <div class="chart_con" rel="xczt_rep_pad1" style="display:block;">
                        	<ul class="show_chart2List clearfix setLimGin">
                                	<li>
                                    	<div class="show_chart3">
                                    		<div id="xczt_chart06" style="width:100%; height:230px;"></div>
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart3">
                                    		<div id="xczt_chart07" style="width:100%; height:230px;"></div>
                                        </div>
                                    </li>
                                    <li class="threeLiMg">
                                    	<div class="show_chart3">
                                    		<div id="xczt_chart08" style="width:100%; height:230px;"></div>
                                        </div>
                                    </li>
                                </ul>    
                        </div>
                        <!--ul包含至少两张图表-->
                        <div class="chart_con" rel="xczt_rep_pad1" style="display:block;">
                        	<ul class="show_chart2List clearfix">
                                	<li>
                                    	<div class="show_chart3">
                                    		<div id="xczt_chart09" style="width:100%; height:230px;"></div>
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart3">
                                    		<div id="xczt_chart10" style="width:100%; height:230px;"></div>
                                        </div>
                                    </li>
                                </ul>    
                        </div>
                        <!--div包含一张图表-->
                        <div class="chart_con" rel="xczt_rep_pad1" style="display:block;">
                            <!--<div class="show_chart1">
                            	<div id="xczt_chart11" style="width:100%; height:100%;"></div>
                            </div>-->
			    <ul class="show_chart2List clearfix">
                          <li class="firstLi">
                               <div class="show_chart3">
                                    <div id="xczt_chart11" style="width:95%; height:260px;"></div>
                               </div>
                           </li>
                           <li class="lastLi">
                               <div class="show_chart3">
                                   <div id="xczt_chart12" style="width:95%; height:260px;"></div>
                               </div>
                          </li>
                     </ul>
                        </div>
                </div>
            </div>
         </div>
    </div>
    <!--footer开始-->
    <#include "/template/sn_footer.ftl">
    <script type="text/javascript" src="/html/sn-static/static/js/myMove.js"></script>
    <script type="text/javascript" src="/html/sn-static/static/js/zt_cqfw_charts.js"></script>
</body>
</html>
