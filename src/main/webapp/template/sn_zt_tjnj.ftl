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
            <div class="row">
            	<div class="col-md-12"><h1 style="margin-top:0px;"><span class="set_tit">统计年鉴专题</span></h1></div>
            	<div class="col-md-12">
                	<ul class="agric_list1 clearfix">
                    	<li>
                        	<div>
                            	<span class="topict_tit1">集体资产总额</span>
                                <span class="topict_tit2">三资监管平台</span>
                                <span class="topict_tit3">2016</span>
                            </div>
                            <div class="topic_tjicon topic_icon1 mgt10"><span class="topict_tit4" style="margin-right:30px;">5849.8467</span>亿元</div>
                        </li>
                        <li>
                        	<div>
                            	<span class="topict_tit1">经济组织总收入</span>
                                <span class="topict_tit2">三资监管平台</span>
                                <span class="topict_tit3">2016</span>
                            </div>
                            <div class="topic_tjicon topic_icon2 mgt10"><span class="topict_tit4" style="margin-right:30px;">6012.0999</span>亿元</div>
                        </li>
                        <li>
                        	<div>
                            	<span class="topict_tit1">经济组织利润总额</span>
                                <span class="topict_tit2">三资监管平台</span>
                                <span class="topict_tit3">2016</span>
                            </div>
                            <div class="topic_tjicon topic_icon3 mgt10"><span class="topict_tit4" style="margin-right:30px;">214.1137</span>亿元</div>
                        </li>
                        <li class="mgt20">
                        	<div>
                            	<span class="topict_tit1">农村营业收入</span>
                                <span class="topict_tit2">北京统计年鉴</span>
                                <span class="topict_tit3">2015</span>
                            </div>
                            <div class="topic_tjicon topic_icon4 mgt10"><span class="topict_tit4" style="margin-right:30px;">5614.7281</span>亿元</div>
                        </li>
                        <li class="mgt20">
                        	<div>
                            	<span class="topict_tit1">农村营业利润总额</span>
                                <span class="topict_tit2">北京统计年鉴</span>
                                <span class="topict_tit3">2015</span>
                            </div>
                            <div class="topic_tjicon topic_icon3 mgt10"><span class="topict_tit4" style="margin-right:30px;">213.5138</span>亿元</div>
                        </li>
						<li class="mgt20">
                        	<div>
                            	<span class="topict_tit1">农用地面积</span>
                                <span class="topict_tit2">221信息平台</span>
                                <span class="topict_tit3">2007</span>
                            </div>
                            <div class="topic_tjicon topic_icon1 mgt10"><span class="topict_tit4" style="margin-right:30px;">375226.9498</span>公顷</div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row mgt15">
            	<div class="col-md-12"><h1 style="margin-top:0px;"><span class="set_tit">农村专题</span></h1></div>
                <div class="col-md-12">
                	<!--农村专题-->
                	<div class="chart_container">
                    	<div class="chart_title">
                            <ul class="clearfix">
                                <li rel="zt_rep" class="hover"><span>农村基本情况</span></li>
                                <li rel="zt_rep"><span>农村固定资产投资情况</span></li>
                                <li rel="zt_rep"><span>耕地面积</span></li>
                                <li rel="zt_rep"><span>农作物播种面积及造林面积</span></li>  
                            </ul>
                        </div>
                        <div class="chart_con" rel="zt_rep_pad" style="display:block;">
                            <div class="show_chart1">
                            	<div id="chart02" style="width:100%; height:100%;"></div>
                            </div>
                            <div class="show_chart_info">
                            	<p><span>说明:<span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>1.从业人员指标1998年以前为乡村劳动力。</span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>2.乡政府个数、镇政府个数、村民委员会个数由北京市民政局提供。</span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>3.2006年乡镇及行政村人口和从业人员为农业普查数据；2007年以后乡镇及行政村人口和从业人员为农业普查口径，包含居住半年以上外来人口。</span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>4.2006年乡镇及行政村户数为农业普查数据，为自然户口径；2007年以后为居住一年以上的户口径。</span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>5.数据为0的可能为未采集的数据。</span>
				</p>
                            </div>
                        </div>
                        <div class="chart_con" rel="zt_rep_pad" style="display:block;">
			    <div class="show_chart1">
                            	<div id="chart03" style="width:100%; height:100%;"></div>
                            </div>
                            <div class="show_chart_info">
                            	<p><span>说明:</span>
				&nbsp;&nbsp;&nbsp;&nbsp;<span>1.本表非农户固定资产投资为全面调查；农户固定资产投资为抽样调查。</span>
				&nbsp;&nbsp;&nbsp;&nbsp;<span>2.行业划分执行2011年国民经济行业分类标准(GB/T 4754-2011)。</span>
				</p>
                            </div>
                        </div>
                        <div class="chart_con" rel="zt_rep_pad" style="display:block;">
				<div class="show_chart1">
					<div id="chart04" style="width:100%; height:100%;"></div>
				    </div>
				    <div class="show_chart_info">
					<p><span>说明:</span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>2009年耕地面积相关数据为第二次全国土地调查数据，2010-2013年为各年土地变更调查数据。</span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>资料来源：北京市国土资源局。</span>
					</p>

				    </div>
                        	<!--<ul class="show_chart2List clearfix">
                                	<li>
                                    	<div class="show_chart2">
                                    		<div id="chart05" style="width:95%; height:300px;"></div>
                                        </div>
                                        <div class="show_chart_info">
                                            说明：农村基本情况农村基本情况农村基本情况农村基本情况农村基本情况农村基本情况农村基本情况
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart2">
                                    		<div id="chart06" style="width:95%; height:300px;"></div>
                                        </div>
                                        <div class="show_chart_info">
                                            说明：农村基本情况农村基本情况农村基本情况农村基本情况农村基本情况农村基本情况农村基本情况
                                        </div>
                                    </li>
                                </ul>  -->  
                        </div>
                        <div class="chart_con" rel="zt_rep_pad" style="display:block;">
                            <div class="show_chart1">
                            	<div id="chart05" style="width:100%; height:100%;"></div>
                            </div>
                            <div class="show_chart_info">
			    <p><span>说明:</span>
			&nbsp;&nbsp;&nbsp;&nbsp;<span>1．蔬菜播种面积2006年为农业普查衔接数据，1997年-2005年为历史修订数据。</span>	
			&nbsp;&nbsp;&nbsp;&nbsp;<span>2．造林面积2009年以前为人工造林面积，2009年起调整为荒山荒(沙)地造林面积，包括人工造林、无林地和疏林地新封面积。</span>
				</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--农业专题-->
                <div class="col-md-12">
                	<h1 style="margin-top:0px;"><span class="set_tit">农业专题</span></h1>
                    <div class="chart_container" style="padding:10px;">
                    	<div class="chart_title1">
                            <ul class="clearfix">
                                <li rel="zt_rep1" class="hover"><span>种业生产</span></li>
                                <li rel="zt_rep1"><span>农业观光园、民俗旅游</span></li>
                                <li rel="zt_rep1"><span>农业生产条件</span></li>
                                <li rel="zt_rep1"><span>设施农业</span></li> 
                                <li rel="zt_rep1"><span>水产品生产</span></li>
                                <li rel="zt_rep1"><span>林业及干鲜果品生产</span></li>
                                <li rel="zt_rep1"><span>牲畜饲养及畜产品产量</span></li>
                                <li rel="zt_rep1"><span>主要农产品产量</span></li>
                                <li rel="zt_rep1"><span>主要农作物播种面积及产量</span></li> 
                            </ul>
                        </div>
                        <!--两张图表-->
                        <div class="chart_con" rel="zt_rep_pad1" style="display:block;">
                        	<ul class="show_chart2List clearfix">
                                	<li>
                                    	<div class="show_chart3">
                                    		<div id="chart06" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart07" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                </ul>    
                        </div>
                        <div class="chart_con" rel="zt_rep_pad1" style="display:block;">
                        	<div class="">
                            	<div id="chart08" style="width:100%; height:100%;"></div>
                            </div>	   
                        </div>
                        <div class="chart_con" rel="zt_rep_pad1" style="display:block;">
                        	 <ul class="show_chart2List clearfix">
                                	<li>
                                    	<div class="show_chart3">
                                    		<div id="chart09" style="width:100%; height:300px;"></div>
                                        </div>
                                        <div class="show_chart_info">
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart10" style="width:100%; height:300px;"></div>
                                        </div>
                                        <div class="show_chart_info">
                                        </div>
                                    </li>
				    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart11" style="width:100%; height:300px;"></div>
                                        </div>
                                        <div class="show_chart_info">
                                        </div>
                                    </li>
				    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart12" style="width:100%; height:300px;"></div>
                                        </div>
                                        <div class="show_chart_info">
						农业生产条件 5个图 
                                        </div>
                                    </li>
                                </ul> 	    
                        </div>
                        <div class="chart_con" rel="zt_rep_pad1" style="display:block;">
                        	
                            	<!-- <ul class="show_chart2List clearfix">
                                	<li>
                                    	<div class="show_chart3">
                                    		<div id="chart13" style="width:100%; height:300px;"></div>
                                        </div>
                                        <div class="show_chart_info">
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart14" style="width:100%; height:300px;"></div>
                                        </div>
                                        <div class="show_chart_info">
                                        </div>
                                    </li>
				    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart15" style="width:100%; height:300px;"></div>
                                        </div>
                                        <div class="show_chart_info">
                                        </div>
                                    </li>
				    </ul>-->
				    <div class="show_chart1">
                            	<div id="chart13" style="width:100%; height:300px;;"></div>
                            </div>
			    <div class="show_chart1">
                            	<div id="chart14" style="width:100%; height:300px;"></div>
                            </div>
			    <div class="show_chart1">
                            	<div id="chart15" style="width:100%; height:300px;"></div>
                            </div>
                           	    
                        </div>
                        <div class="chart_con" rel="zt_rep_pad1" style="display:block;">
                        	<ul class="show_chart2List clearfix">
                                	<li>
                                    	<div class="show_chart3">
                                    		<div id="chart16" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart17" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                </ul> 		    
                        </div>
                        <div class="chart_con" rel="zt_rep_pad1" style="display:block;">
                        	<ul class="show_chart2List clearfix">
                                	<li>
                                    	<div class="show_chart3">
                                    		<div id="chart18" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart19" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                </ul> 		    
                        </div>
                        <div class="chart_con" rel="zt_rep_pad1" style="display:block;">
                        	<ul class="show_chart2List clearfix">
                                	<li>
                                    	<div class="show_chart3">
                                    		<div id="chart20" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart21" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                </ul> 		    
                        </div>
                        <div class="chart_con" rel="zt_rep_pad1" style="display:block;">
                        	<div class="show_chart1">
                            	<div id="chart22" style="width:100%; height:100%;"></div>
                            </div>	    
                        </div>
                        <div class="chart_con" rel="zt_rep_pad1" style="display:block;">
                        	<ul class="show_chart2List clearfix">
                                	<li>
                                    	<div class="show_chart3">
                                    		<div id="chart23" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart24" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
				    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart25" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                </ul>	    
                        </div>
                    </div>	
                </div>
                <!--农经专题-->
                <div class="col-md-12">
                	<h1 style="margin-top:0px;"><span class="set_tit">农经专题</span></h1>
                    <div class="chart_container" style="padding-top:15px;">
                    	<div class="chart_title1">
                            <ul class="clearfix">
                                <li rel="zt_rep2" class="hover"><span>农村经济收入与分配</span></li>
                                <li rel="zt_rep2"><span>平均每一个从业人员创造的总价值</span></li>
                                <li rel="zt_rep2"><span>农林牧渔业总产值</span></li>
                                <li rel="zt_rep2"><span>乡镇企业各业基本情况</span></li> 
                                <li rel="zt_rep2"><span>乡镇企业出口供货情况</span></li>
                            </ul>
                        </div>
                        <!--"show_chart1"div块只显示一张图表-->
                        <div class="chart_con" rel="zt_rep_pad2" style="display:block;">
                            <div class="show_chart1">
                            	<div id="chart26" style="width:100%; height:100%;"></div>
                            </div>
                            <div class="show_chart_info">
                            	
                            </div>
                        </div>
                        <div class="chart_con" rel="zt_rep_pad2" style="display:block;">
                        	<div class="show_chart1">
                            	<div id="chart27" style="width:100%; height:100%;"></div>
                            </div>
                            <div class="show_chart_info">
                            	<p><span>说明:</span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>1.2006年从业人员为农普数据，2007年以后为农业普查口径，含居住半年以上的外来人口。</span>	
					&nbsp;&nbsp;&nbsp;&nbsp;<span>2.2006年农林牧渔业总产值及分行业产值为与农业普查衔接的数据，1997-2005年为历史修订数据。</span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>3.2010年按照新的《统计用产品分类目录》，将原归属林业产值的核桃、板栗等林产品调整至农业产值，并对2009年数据作了调整。</span>
							</p>
                            </div>  
                        </div>
                        <div class="chart_con" rel="zt_rep_pad2" style="display:block;">
                            <ul class="show_chart2List clearfix">
                                	<li>
                                    	<div class="show_chart3">
                                    		<div id="chart34" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart35" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
				   
                                </ul>	
                            
                        </div>
                        <div class="chart_con" rel="zt_rep_pad2" style="display:block;">
                            <ul class="show_chart2List clearfix">
                                	<li>
                                    	<div class="show_chart3">
                                    		<div id="chart28" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart29" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
				    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart30" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
				    <li>
                                    	<div class="show_chart3">
                                    		<div id="chart31" style="width:95%; height:300px;"></div>
                                        </div>
                                    </li>
                                </ul>	
                        </div>
                        <div class="chart_con" rel="zt_rep_pad2" style="display:block;">
                           <div class="show_chart1">
                            	<div id="chart33" style="width:100%; height:100%;"></div>
                            </div>
                            <div class="show_chart_info">
                            	<p><span>说明:</span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>1.2006年从业人员为农普数据，2007年以后为农业普查口径，含居住半年以上的外来人口。</span>	
					&nbsp;&nbsp;&nbsp;&nbsp;<span>2.2006年农林牧渔业总产值及分行业产值为与农业普查衔接的数据，1997-2005年为历史修订数据。</span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>3.2010年按照新的《统计用产品分类目录》，将原归属林业产值的核桃、板栗等林产品调整至农业产值，并对2009年数据作了调整。</span>
							</p>
                            </div>  
                        </div>
                </div>
            </div>
        </div>
    </div>
    <!--footer开始-->
    <#include "/template/sn_footer.ftl">
    <script type="text/javascript" src="/html/sn-static/static/js/myMove.js"></script>
    <script type="text/javascript" src="/html/sn-static/static/js/zt_tjnj_charts.js"></script>
	
</body>
</html>
