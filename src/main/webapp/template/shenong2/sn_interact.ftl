<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
</head>

<body>
	
<#include "/template/sn_header.ftl">
    <div class="wrapper">
    	<div class="container">
            <div class="row mgt15">
            	<ul class="interact-list clearfix">
		<#assign enArr = ["DOWNLOAD","DATA SHARE","SURVEY","FEED BACK"] >
		<@channelListDirective channelId=4>
							<#list channels as chan>
                        
                	<li style="padding-left:0px;"><a href="${chan.url!}">${chan.displayName!}<br>${enArr[chan_index]}</a></li>
			</#list>
		</@channelListDirective><!--
                    <li><a href="" target="_blank">数据共享<br>DATA SHARE</a></li>
                    <li><a href="" target="_blank">问卷调查<br>SURVEY</a></li>
                    <li style="padding-right:0px;"><a href="" target="_blank">意见反馈<br>FEED BACK</a></li>-->
                </ul>
            </div>
            <div class="row">
            	<div class="col-md-12" style="padding:0px;">
                	<div class="item-title clearfix">
                    	<div class="item-title-partl icon3 pull-left">
                        	<span>实时资讯</span>
                        </div>
                        <a href="/topiecms/portal/channel/nczx/11_1.htm" class="pull-right">了解更多</a>
                    </div>	
                    <div class="real-time-info">
                    	<div class="col-md-4" style="padding-left:0px;">
				<@pictureListDirective titleLeft=12 pageSize=1>
				 <#list contents as content>
					<div class="real-time-infol" style="height:170px;">
					<img src="${content.titleImageUrl!}" width="100%" height="170">
					<p><a href="${content.url!}">${content.shortTitle!}</a></p>
				 </#list>
				</@pictureListDirective>
                        	
                            </div>
                        </div>
                        <div class="col-md-8" style="padding-right:0px;">
                        	<ul class="interact-real-list">
							<@contentListDirective channelId=8  pageSize=2 titleLeft=28 contentLeft=120>
								<#list contents as cont>
                            	<li class="clearfix ">
                                	<p><a href="${cont.url}" class="pull-left icon${cont_index+1}" title="${cont.title}">${cont.shortTitle}</a></p>
					<p class="pText">${cont.brief!}</p>
                                </li>
								</#list>
							</@contentListDirective>
                            	<!--<li>
                                	<p><a href="" class="icon1">昨日郑糖低位 现货价格稳中有降</a></p>
                                    <p class="pText">为提高我市科学安全用药水平，加快推进绿色防控技术应用，保障农业生产安全、农产品质量安全和农业生态安全，根据《北京市农作物病为提高我市科学安全用药水平，加快推进绿色防控技术应用，保障农业生产安全、农产品质量安全和农业生态安全，根据《北京市农作物病为提高我市科学安全用药水平，加快推进绿色防控技术应用，保障农业生产安全、农产品质量安全和农业生态安全，根据《北京市农作物病为提高我市科学安全用药水平，加快推进绿色防控技术应用，保障农业生产安全、农产品质量安全和农业生态安全，根据《北京市农作物病为提高我市科学安全用药水平，加快推进绿色防控技术应用，保障农业生产安全、农产品质量安全</p>
                                </li>-->
                               
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mgt20">
            	<div class="col-md-6" style="padding-left:0px;">
                	<div style="background:#f1f1f1; padding:10px;">
                        <div class="item-title clearfix alter-title">
                            <div class="item-title-partl icon8 pull-left">
                                <span>资料下载</span>
                            </div>
                        </div>
                        <div class="dowload-con1">
                            <ul class="clearfix">
			    <@contentListDirective channelId=7  pageSize=6 titleLeft=7>
								<#list contents as cont>
                            	<li>
                                	<a href="${cont.url}" title="${cont.title}">${cont.shortTitle}</a>
					
                                </li>
								</#list>
							</@contentListDirective>
                               
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                	<div class="item-title clearfix alter-title">
                         <div class="item-title-partl icon9 pull-left">
                             <span>联系我们</span>
                         </div>
                     </div>
                     <div class="dowload-con2 clearfix">
                     	  <!-- <div class="pull-left"><a href="/html/shenong/lianxiwomen.html" target="_blank">
			  <img src="/html/sn-static/static/image/map.png" width="250" height="100" style="border:1px solid #D0DEFB;"></a>
			  </div>-->
			   <div class="pull-left"><a href="/html/sn-static/static/image/map.png" target="_blank"><img src="/html/sn-static/static/image/map.png" width="250" height="100" style="border:1px solid #D0DEFB;"></a></div>
                           <div class="pull-right">
                           		<ul>
                                	<li>北京市朝阳区北沙滩7号院3号楼</li>
                                    <li>010-64866144</li>
                                    <li>wangzf@bjaginfo.gov.cn</li>
                                </ul>
                           </div>
                     </div>		
                </div>
            </div>
        </div>
    </div>
   <#include "/template/sn_footer.ftl">
</body>
</html>
