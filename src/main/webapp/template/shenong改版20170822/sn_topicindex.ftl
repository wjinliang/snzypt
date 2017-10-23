<html>
<head>
<#include "/template/sn_head.ftl">
</head>
<style >
.morez{
    margin-left: 20px;
    font-size: 20px;
    color: #0e82d9;
}
.zt a{
	width:75px;
	height:75px;
}
.datagather {
    position: relative;
    top: 40px;
    display: inline-block;
    letter-spacing: -10px;
    margin-top: 0px;
    margin-bottom: 10px;
    line-height: 58px;
    font-size: 48px;
    font-weight: 300;
    color: #E6E6E6;
    text-align: center;
}
@media screen and (max-width: 1024px) { 
.zt{width:24px; height:96px; background:url(/html/sn-static/static/image/more.png) no-repeat; background-size:contain; position:fixed; left:5px; bottom:5px; cursor:pointer;}
.zt a{display:block; width:24px; height:96px;}
  }
}

</style>
<body>
<#include "/template/sn_header.ftl">
    <div class="wrapper" id="wrapper">
    	<div class="container">
        	<div class="row mgt15">
            	<div class="col-md-4 col-lg-4">
                	<div class="dataSubjt-left">
                    	<img src="/html/sn-static/static/image/sjzt1.png" width="100%" height="170">
                        <div class="serveSubjt-con mgt15">
				<@channelDirective channelId=26>
                        	<h3><a href="javacript:void(0);">${channel.displayName!}</a></h3>

                            <p class="pText">${channel.desc!}</p>
			    </@channelDirective >
                        </div>	
                    </div>
                </div>
                <div class="col-md-8 col-lg-8">
                	<div class="dataSubjt-right">
                    	<ul class="dataSubjt-right-top clearfix">
                        	<li>
                            	<div class="panel-body">
                                    <p>农村总数</p>
                                    <div style="text-align:center;">
                                        <i class="ico1">&nbsp;</i>
                                        <span class="num" id="num1">${villageCount}</span>
                                        <span>个</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>常驻人口</p>
                                    <div style="text-align:center;">
                                        <i class="ico2">&nbsp;</i>
                                        <span class="num" id="num2">0</span>
                                        <span>万</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>经济收入</p>
                                    <div style="text-align:center;">
                                        <i class="ico3">&nbsp;</i>
                                        <span class="num" id="num3">0</span>
                                        <span>万</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>农业用地</p>
                                    <div style="text-align:center;">
                                        <i class="ico4">&nbsp;</i>
                                        <span class="num" id="num4">${mianji}</span>
                                        <span>亩</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>涉农企业</p>
                                    <div style="text-align:center;">
                                        <i class="ico5">&nbsp;</i>
                                        <span class="num" id="num5">${snqiyeCount}</span>
                                        <span>个</span>
                                    </div>
                                </div>
                            <li>
                        </ul>
                        <ul class="dataSubjt-right-bottom clearfix">
                        	<li>
                            	<div class="panel-body">
                                	<i class="ico01">&nbsp;</i>
                                    <a href="initVillageCountPage">基本信息</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico02">&nbsp;</i>
                                    <a href="initplantpage">种植生产</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico03">&nbsp;</i>
                                    <a href="nature">自然资源</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico04">&nbsp;</i>
                                    <a href="initxumutongjipage">畜牧养殖</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico05">&nbsp;</i>
                                    <a href="" data-toggle="modal" data-target="#myModal17">村务信息</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico06">&nbsp;</i>
                                    <a href="market">市场资源</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico07">&nbsp;</i>
                                    <a href="kjsfh">农业科技</a>	
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="border-gray mgt15"></div>
            <div class="row mgt15">
            	<div class="col-md-4 col-lg-4">
                	<div class="dataSubjt-left">
                    	<img src="/html/sn-static/static/image/sjzt2.png" width="100%" height="170">
                        <div class="serveSubjt-con mgt15">

                        	<@channelDirective channelId=27>
                        	<h3><a href="javacript:void(0);">${channel.displayName!}</a></h3>

                            <p class="pText">${channel.desc!}</p>
			    </@channelDirective >
                        </div>	
                    </div>
                </div>
                <div class="col-md-8 col-lg-8">
                	<div class="dataSubjt-right">
                    	<ul class="dataSubjt-right-top clearfix">
                        	<li>
                            	<div class="panel-body">
                                    <p>设施农业面积</p>
                                    <div style="text-align:center;">
                                        <i class="ico21">&nbsp;</i>
                                        <span class="num" id="num021">1000</span>
                                        <span>公顷</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>大田种植面积</p>
                                    <div style="text-align:center;">
                                        <i class="ico22">&nbsp;</i>
                                        <span class="num" id="num022">0</span>
                                        <span>公顷</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>农产品总产量</p>
                                    <div style="text-align:center;">
                                        <i class="ico23">&nbsp;</i>
                                        <span class="num" id="num023">0</span>
                                        <span>亿元</span>
                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>农产品净值</p>
                                    <div style="text-align:center;">
                                        <i class="ico24">&nbsp;</i>

                                        <span class="num" id="num024">0</span>
                                        <span>亿元</span>

                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>农产品成本</p>
                                    <div style="text-align:center;">
                                        <i class="ico25">&nbsp;</i>

                                        <span class="num" id="num025">0</span>
                                        <span>亿元</span>

                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>农业劳动生产率</p>
                                    <div style="text-align:center;">
                                        <i class="ico26">&nbsp;</i>

                                        <span class="num" id="num026">0</span>
                                        <span>%</span>

                                    </div>
                                </div>
                            <li>
                        </ul>
                        <ul class="dataSubjt-right-bottom clearfix">
                        	<li>
                            	<div class="panel-body">
                                	<i class="ico11">&nbsp;</i>
                                    <a href="" data-toggle="modal" data-target="#myModal17">生产分布地图</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico12">&nbsp;</i>
                                    <a href="" data-toggle="modal" data-target="#myModal17">设施环境监控</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico13">&nbsp;</i>
                                    <a href="" data-toggle="modal" data-target="#myModal17">视频环境监控</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico14">&nbsp;</i>
                                    <a href="statistics" >生产布局统计</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico15">&nbsp;</i>
                                    <a href="" data-toggle="modal" data-target="#myModal17">农业生产模型</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico14">&nbsp;</i>
                                    <a href="sheshistaticstics" >设施农业统计</a>	
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="border-gray mgt15"></div>
            <div class="row mgt15">
            	<div class="col-md-4 col-lg-4">
                	<div class="dataSubjt-left">
                    	<img src="/html/sn-static/static/image/sjzt3.png" width="100%" height="170">
                        <div class="serveSubjt-con mgt15">

                        	<@channelDirective channelId=28>
                        	<h3><a href="javacript:void(0);">${channel.displayName!}</a></h3>

                            <p class="pText">${channel.desc!}</p>
			    </@channelDirective >
                        </div>	
                    </div>
                </div>
                <div class="col-md-8 col-lg-8">
                	<div class="dataSubjt-right">
                    	<ul class="dataSubjt-right-top clearfix">
                        	<li>
                            	<div class="panel-body">
                                    <p>农业园区数目</p>
                                    <div style="text-align:center;">
                                        <i class="ico31">&nbsp;</i>

                                        <span class="num" id="num021">704</span>
                                        <span>个</span>

                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>休闲农业经营主体数</p>
                                    <div style="text-align:center;">
                                        <i class="ico32">&nbsp;</i>

                                        <span class="num" id="num022">3103</span>
                                        <span>个</span>

                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>名优特农产品数</p>
                                    <div style="text-align:center;">
                                        <i class="ico33">&nbsp;</i>

                                        <span class="num" id="num023">0</span>
                                        <span>个</span>

                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>旅游产品种类</p>
                                    <div style="text-align:center;">
                                        <i class="ico34">&nbsp;</i>

                                        <span class="num" id="num024">0</span>
                                        <span>种</span>

                                    </div>
                                </div>
                            <li>
                            <li>
                            	<div class="panel-body">
                                    <p>旅游产品数目</p>
                                    <div style="text-align:center;">
                                        <i class="ico35">&nbsp;</i>

                                        <span class="num" id="num025">0</span>
                                        <span>家</span>

                                    </div>
                                </div>
                            <li>
                        </ul>
                        <ul class="dataSubjt-right-bottom clearfix">
				<li>
                            	<div class="panel-body">
                                	<i class="ico01">&nbsp;</i>
                                    <a href="xiangcun/initXiangCunLvYouCountPage">基本信息</a>	
                                </div>
                            </li>
                        	<li>
                            	<div class="panel-body">
                                	<i class="ico011">&nbsp;</i>
                                    <a href="xiangcun/initXiangCunLvYouHuYiJiCountPage">乡村旅游分类</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico012">&nbsp;</i>
                                    <a href="" data-toggle="modal" data-target="#myModal17">休闲度假旅游</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico013">&nbsp;</i>
                                    <a href="" data-toggle="modal" data-target="#myModal17">节庆文化旅游</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico014">&nbsp;</i>
                                    <a href="" data-toggle="modal" data-target="#myModal17">体验民俗旅游</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico015">&nbsp;</i>
                                    <a href="" data-toggle="modal" data-target="#myModal17">名优特产旅游</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico016">&nbsp;</i>
                                    <a href="" data-toggle="modal" data-target="#myModal17">科普教育旅游</a>	
                                </div>
                            </li>
                            <li>
                            	<div class="panel-body">
                                	<i class="ico017">&nbsp;</i>
                                    <a href="" data-toggle="modal" data-target="#myModal17">特色农业园区</a>	
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>	
            </div>
		   <div class="row mgb10 mgt10">
			<a class="morez" href="/topiecms/portal/channel/hdjl/29_1.htm">查看更多专题>></a>
		    </div>
        </div>
	<div class="zt" id="zt"><a href="/topiecms/portal/channel/hdjl/29_1.htm"></a></div>
    </div>
<!--modal-->
    <div class="modal fade" id="myModal17" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;">
                                            	<div class="modal-dialog">
                                                    <div class="modal-content" style="height:380px; border:none;">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                            <h4 class="modal-title" id="myModalLabel" style="color:#3399cc;">温馨提示</h4>
                                                        </div>
                                                        <div class="modal-body" style="text-align: center;">
                                                        	<div class="datagather">
                                                                
                                                                <span> 数 据 正 在 采 集 中 </br>暂 无 可 提 供 数 据 ...</span>
                                                            </div>
                                                           
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--弹框js开始-->
											<script>
											$(function () { $('#myModal17').modal({
												keyboard: true,
												show:false
											})});
											</script>
                                        	<!--弹框js结束-->
	<#include "/template/sn_footer.ftl">
	<!--footer结束-->
	<script type="text/javascript" src="/html/sn-static/static/js/webindex.js"></script>
    <!--右侧浮动框-->
    <div>
        <script language="JavaScript" type="text/javascript"> 
            lastScrollY511=0; 
            function lastScrollY512(){  
                var diffY513; 
                    if (document.documentElement && document.documentElement.scrollTop) 
                        diffY513 = document.documentElement.scrollTop; 
                    else if (document.body) 
                            diffY513 = document.body.scrollTop; 
                        else{}
                        
                        percent5=.1*(diffY513-lastScrollY511);  
                        if(percent5>0)
                            percent5=Math.ceil(percent5);  
                        else 
                            percent5=Math.floor(percent5);  
		    document.getElementById("loveright").style.top=parseInt(document.getElementById ("loveright").style.top)+percent5+"px"; 
		    lastScrollY511=lastScrollY511+percent5;  
                        //alert(lastScrollY511); 
			fixedPosition();
                 } 
		suspendcode12="<div id=\"loveright\" style='z-index: 99;right:30px;position:absolute;TOP:300px;'><a href=\'/topiecms/portal/initItemCountPage\' ><img style='' border=0 src=\'/html/sn-static/static/image/abar.png\'></a></div>" 
		document.write(suspendcode12);    
		window.setInterval("lastScrollY512()",1); 


		var oZt = document.getElementById("zt");
		var footer = document.getElementById("footer");
		var header = document.getElementById("headtop");
		var wrapper = document.getElementById("wrapper");
		var pageH = document.body.scrollHeight || document.documentElement.scrollHeight;
		var pageOneH = header.offsetHeight;
		var pageTwo = wrapper.offsetHeight;
		var fh = pageH-pageOneH-pageTwo;
		var ch = document.body.clientHeight;
		fh = footer.offsetHeight+5;
		function fixedPosition(){
			var scrollHeight = document.body.scrollTop || document.documentElement.scrollTop;
			console.log(pageH+"="+ scrollHeight+"="+(pageH-ch-fh) );
			if(scrollHeight > (pageH-ch-fh+5)){
			oZt.style.bottom = fh + "px";
			}
			else{
			oZt.style.bottom = 5 + "px";
			}
		}
        </script>
    </div>
</body>
</html>