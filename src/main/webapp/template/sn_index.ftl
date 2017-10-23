<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
<style >
	.carousel-indicators li{
	   border: 1px solid #776B6B;
	}
	.container .data-situation-list li .num_style {
   
     color: #FFF; 
     }
     .num_style:hover{
	text-decoration: underline;
	color:#eee;
     }
</style>
</head>

<body>
	<#include "/template/sn_header.ftl">
    <!--轮播图效果-->
    <div class="scroll">
            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>   
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
		<@contentListDirective pageSize=3 channelId=24>
		<#list contents as co>
                    <div class="item ${(co_index==0)?string('active','')}">
                        <a href="${co.url!}"><img src="${co.titleImageUrl!}" width="100%" height="315" alt="${co.title!}"/></a>
                    </div>
		    </#list>
		    </@contentListDirective>
                    
                </div>
            </div>
            <!--自动轮播-->
            <script>
				$(document).ready(function() {
				$('.carousel').carousel({
				 interval: 5000
				})
				});
		</script>
    </div>
    <div class="wrapper">
        <div class="container">
        	<!--涉农数据整合情况-->
        	<div class="row">
            	<div class="col-md-3 col-lg-3" style="position:relative; padding-right:0px;">
                	
                    <div class="data-situation">
                    	<div class="data-situation-tit icon2">
                        	<img src="/html/sn-static/static/image/font2.png">
                            <p>涉农数据整合情况</p>
                        </div>
                        <ul class="data-situation-list">
                        	<li class="clearfix"><span>数据来源数</span><span id="sys-num" class="num_style"><@dictItemListDirective  code="C07">
								${items?size}</@dictItemListDirective>个</span></li>
                            <li class="clearfix"><span>数据专题量</span><span id="subject-num" class="num_style"><@channelListDirective channelId=2 >
								${channels?size}</@channelListDirective>个</span></li>
                            <li class="clearfix"><span>数据目录类</span><span id="catalog-num" class="num_style"><@directoryNumberDirective type=1 >
					${directoryNumber}类
				    </@directoryNumberDirective></span></li>
			    <@sysDataCountDirective>
                            <li class="clearfix"><span>总数据条数</span><span id="data-num" class="num_style">${record.fullCount}条</span></li>
                            <li class="clearfix" style="border-bottom:none;"><span>数据日增量</span><span id="add-num" class="num_style">${record.addCount}条</span></li>
			    </@sysDataCountDirective>
                        </ul>
                    </div>
                </div>
                <!--热门数据-->
                <div class="col-md-9 col-lg-9">
                	<div class="item-title clearfix">
                    	<div class="item-title-partl icon1 pull-left">
                        	<span>热门数据</span>
                        </div>
                        <a href="/topiecms/portal/channel/sjml/1_1.htm" class="pull-right">了解更多</a>
                    </div>
                    <div class="item-con">
                    	<ul class="box-list clearfix" id="box-list">
			<@contentListDirective channelId="31"  pageSize=3 titleLeft=8>
								<#list contents as cont>
                            	<li style="padding-left:0px;" >
                                	<a href="${cont.url}" title="${cont.title}"><img src="${cont.titleImageUrl!}" class=""  width="100%" height="144"/></a>
					<p><a href="${cont.url}">${cont.shortTitle}</a></p>
                                   
                                </li>
								</#list>
								
				</@contentListDirective>
			<#--<@tableListDirective type=0  pageNum=1 pageSize=3 sort="VisitCount_desc">
				
								<#list tables as t>
                        	<li style="padding-left:0px;">
                            	<a href="/${application!}/portal/data/info/${t.id!}.htm" ><img src="/html/sn-static/static/image/chart${t_index+1}.png" width="100%" height="144"></a>
                            	<p><a href="/${application!}/portal/data/info/${t.id!}.htm"  class="a-btn">${t.gridName!}</a></p>
                            </li>
			    </#list>
			</@tableListDirective>-->
                            
                        </ul>
                    </div>
                </div>	
            </div>
            <!--实时资讯-->
            <div class="row mgt15">
            	<div class="col-md-9 col-lg-9">
                	<div class="item-title clearfix">
                    	<div class="item-title-partl icon3 pull-left">
                        	<span>实时资讯</span>
                        </div>
                        <a href="/topiecms/portal/channel/nczx/11_1.htm" class="pull-right">了解更多</a>
                    </div>
                    <div class="real-time-info">

                    	<div class="col-md-4 col-lg-4" style="padding:0px;">
                        	<div class="real-time-infol">
				<@pictureListDirective titleLeft=12 pageSize=1>
				 <#list contents as content>
					 <img src="${content.titleImageUrl!}" width="100%" height="190">
					<p><a href="${content.url!}">${content.shortTitle!}</a></p>
				 </#list>
				</@pictureListDirective>

                                
                            </div>	
                        </div>
                        <div class="col-md-8" style="padding-right:0px;">
                        	<ul class="real-time-infor" id="real-time-infor">
							<@contentListDirective channelId=8  pageSize=5 titleLeft=18>
								<#list contents as cont>
                            	<li class="clearfix">
                                	<a href="${cont.url}" class="pull-left icon${cont_index+1}" title="${cont.title}">${cont.shortTitle}</a>
                                    <span class="pull-right">${cont.publishDate?string("yyyy-MM-dd")}<span>
                                </li>
								</#list>
							</@contentListDirective>
                               
                            </ul>
                        </div>
                    </div>
                </div>
                 <div class="col-md-3 col-lg-3" style="padding-left:0px;">
                	<a href="/topiecms/portal/initDatatopicPage" target="_blank"><img src="/html/sn-static/static/image/img111.jpg" width="100%" height="267px;"></a>
                </div>
            </div>
            <!--热门专题-->
            <div class="row">
            	<div class="col-md-12">
                	<div class="item-title clearfix">
                    	<div class="item-title-partl icon4 pull-left">
                        	<span>统计年鉴</span>
                        </div>
                        <!--<a href="" class="pull-right">了解更多</a>-->
                    </div>
                    <div class="hot-subject">
                    	<div id="pic_list_1">
                        	<a class="prev" href="javascript:void(0)"><img src="/html/sn-static/static/image/prev.png" width="35" height="54"></a>
                            <a class="next" href="javascript:void(0)"><img src="/html/sn-static/static/image/next.png" width="35" height="54"></a>
                        	<div class="box">
                            	<ul class="list clearfix">
				<@contentListDirective channelId="29"  pageSize=52 titleLeft=8>
								<#list contents as cont>
                            	<li >
                                	<a href="${cont.url}" title="${cont.title}"><img src="${cont.titleImageUrl!}" class="img-circle" width="125" height="125"><p>${cont.shortTitle}</p></a>
                                   
                                </li>
								</#list>
								
				</@contentListDirective>

                                	<!--<li><a href="javascript:void(0);"><img src="/html/sn-static/static/image/link1.png" class="img-circle" width="125" height="125"><p>种子备案</p></a></li>
                                    <li><a href="javascript:void(0);"><img src="/html/sn-static/static/image/link5.png" class="img-circle" width="125" height="125"><p>观光采摘旅游</p></a></li>
                                    <li><a href="javascript:void(0);"><img src="/html/sn-static/static/image/link5.png" class="img-circle" width="125" height="125"><p>观光采摘旅游</p></a></li>
                                --></ul>
                            </div>
                            <script type="text/javascript">
								$("#pic_list_1").cxScroll();
								$('#pic_list_2').cxScroll({
									direction: 'left'
								});
							</script>
                        </div>
                    </div>	
                </div>
            </div>
        </div>
    </div>
	<#include "/template/sn_footer.ftl">
<script type="text/javascript" src="/html/sn-static/static/js/webindex.js"></script>
<script type="text/javascript">
	$(".data-situation-list").bind("click",function(){
		window.location.href="/topiecms/portal/content/873.htm";
	});
</script>
</body>
</html>
