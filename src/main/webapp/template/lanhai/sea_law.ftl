<!doctype html>
                                           <html>
                                           <head>
                                           <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                                           <meta http-equiv="X-UA-Compatible" content="IE=edge">
                                           <title>【蓝海】信息网</title>
                                           <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
                                           <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/indexstyle.css"/>
                                           <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/publicstyle.css"/>
                                           <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/quicklink.css"/>
                                           <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/orbit.css"/>
                                           <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/self.css"/>                          
                                           </head>
                                           
                                           
                                           <body>
                                           
                                           <#include "/template/head.ftl"/>
                                           <!--header end-->
                                           <!--nav-->
                                           <div class="nav fn-clear">
                                               <div class="navmain">
                                                   <div class="navshop"><a href="###">海洋商城</a></div>
                                                   <div class="navbar">
                                                   <ul>
                                                     <li><a href="${site.url}" >首页</a></li>
                                                       <#include "/template/daohang.ftl"/>
                                                   </ul></div>
                                               </div>
                                           </div>
                                           <!--nav end-->
                                           <div class="blank_20"></div>
                                           <!--floor1-->
                                           <div class="newschannel-floor fn-clear">
                                               
                                       	<@contentListDirective channelId=106 pageSize=6 pageNum=1 titleLeft=30 order=1>
                                       	<div class="newspic">     
                                       	  <div class="scrollpic">
                                       	    <div id="featured">
                                           		<#list contents as cmsContent>
                                       		  <#if cmsContent_index &lt; 4>
                                          			<a class="orbit-item" href="${cmsContent.url}" data-caption="#htmlCaption${cmsContent_index}">
                                       			<img src="${cmsContent.titleImageUrl}" alt="img1"></a>
                                       		  </#if>
                                       		 </#list>
                                       	   </div>
                                       		 <#list contents as cmsContent>
                                       		    <#if cmsContent_index &lt; 4>
                                           			<span class="orbit-caption" id="htmlCaption${cmsContent_index}">${cmsContent.title}</span>
                                       		    </#if>
                                       		 </#list>
                                       	 </div>
                                       	  <div class="pictext">
                                                    <ul>
                                       	      <#list contents as cmsContent>
                                       	        <#if cmsContent_index &gt; 3>
                                                        <li><a href="${cmsContent.url}">${cmsContent.title}</a></li>
                                       		      </#if>
                                                       </#list>  
                                                    </ul>
                                                </div>
                                       	</@contentListDirective> 
                                               
                                              </div>
                                               <div class="newsmain slidenews" >
                                                   <div class="hd">
                                                         <ul>  
                                                           <@channelDirective channelId=102>
                                                             <a href="${channel.url}" class="newsmore"><em >更多 &gt;  </em></a>
                                                              <li>${channel.displayName}</li>
                                                              </@channelDirective>
                                                          </ul>
                                                   </div>
                                                   <div class="bd">
                                                      <!--选卡1-->
                                                      <ul> 
                                          		<@contentListDirective channelId=102 pageSize=8 pageNum=1 titleLeft=30 order=1>
                                           			<#list contents as cmsContent>
                                          				<#if cmsContent_index ==0 >
                                          					<h4> <a href="${cmsContent.url}">${cmsContent.title?default("")}</a>
                                          					<span>${cmsContent.brief?default("")}</span>
                                          					</h4>
                                          				</#if>
                                          				 <#if cmsContent_index != 0 >
                                          					<li><a href="${cmsContent.url}">${cmsContent.title?default("")}</a></li>
                                          				</#if>
                                           			</#list>
                                           		</@contentListDirective> 
                                                      </ul>
                                                      <!--选卡2-->
                                                   </div>
                                               </div>
                                              
                                              
                                           </div>
                                           <!--floor1 end-->
                                           <div class=" blank_30"></div>
                                           <!--floor2-->
                                           <div class="newschannel-floor fn-clear">
                                              <div class="moretabs news-cont" >
                                                <div class="hd">
                                                      <span class="more">
                                                        <@channelListDirective channelId=own order=1 excludeIds="102,106">
                                                           <#list channels as channel>
                                                             <a href="${channel.url}" style="display:${(channel_index==0)?string('inline','none')}" ><em >更多 &gt;  </em></a>
                                                           </#list>
                                                      
                                                      </span>
                                                      <ul>
                                                      <#list channels as channel>
                                       	           <li>${channel.displayName}</li>
                                                       </#list>
                                                      </@channelListDirective>
                                                        <!-- <@channelListDirective channelId=own order=1 excludeIds="36,37,38">
                                                           <#list channels as channel>
                                                             <li>
                                                           ${channel.displayName}
                                                             </li>
                                                           </#list>
                                           	   			</@channelListDirective>-->
                                                      </ul>
                                                 </div>
                                                <div class="bd"  >
                                                    <div class="conwrap" >
                                           		 <@channelListDirective channelId=own order=1 excludeIds="102,106">
                                           			<#list channels as channel>
                                           				<div class="con" style="${(channel_index==0)?string('display:block;','display:none;')}">
                                           				 <div class="newslist">
                                           				<@contentListDirective channelId=channel.id pageSize=channel.pageSize pageNum=pageNum titleLeft=30 order=1>
                                           						<#list contents as cmsContent>
                                           							<div class="newslist-item">
                                           								<h2><a href="${cmsContent.url}">${cmsContent.title?default("")}</a></h2>
                                           								<span>${cmsContent.brief?default("")}</span>
                                           								<em >${cmsContent.publishDate?string("yyyy-MM-dd HH:mm:ss")}</em>
                                           							</div>
                                           						</#list>
                                           					</div>
                                           					<div class=" blank_20">
                                           				</@contentListDirective>
                                           				</div></div>
                                           			</#list>
                                           	   </@channelListDirective>
                                                    </div>
                                                </div>
                                              </div>
                                              <!--点击排行-->
                                              <div class="leftlistwrap">
                                                 <div class="hotlist">
                                                      <h4><span>点击排行</span></h4>
                                                      <ul >
                                                        <@contentVisitListDirective contentType=0 titleLeft=10 pageNum=1 channelId = own siteId="${site.id}" days=7 pageSize=12>
                                                        <#list contentVisitList as cmsContent>
                                                         <li><em class="top">${cmsContent_index+1}</em><a href="${cmsContent.url}">${cmsContent.title}</a></li>
                                                        </#list>
                                                         </@contentVisitListDirective>
                                                      </ul>
                                                 </div>
                                                 <div class=" blank_20"></div>
                                                 
                                               </div>
                                           </div>
                                           <div class="  blank_20"></div>
                                           <!--footer-->
                                          <#include "/template/foot.ftl" />
                                           
                                           <!--!footer end-->
                                           
                                           
                                           
                                           <!--[if lte IE 8]>
                                           <script src="js/ieBetter.js"></script>
                                           <![endif]-->
                                           </form>
                                           </body>
                                           <!--                       Javascripts 注意不要改变顺序                      -->
                                           <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
                                            <script type="text/javascript"  src="${htmlFolder}/js/login.js"></script>
                                           <script type="text/javascript" src="${htmlFolder}/js/jquery-migrate-1.1.1.min.js"></script>
                                           <script type="text/javascript" src="${htmlFolder}/js/visit-record.js"></script>
                                           <!-- 焦点图 -->
                                           <script type="text/javascript" src="${htmlFolder}/js/jquery.orbit.min.js"></script>
                                           <script type="text/javascript">
                                           $(window).load(function() {
                                           	$('#featured').orbit({
                                           		bullets : true,
                                           		startClockOnMouseOut : true,
                                           		captionAnimation : 'slideOpen'
                                           	});
                                           	$('#sciencescroll').orbit({
                                           		bullets : true,
                                           		startClockOnMouseOut : true,
                                           		captionAnimation : 'slideOpen'
                                           	});
                                           });
                                           </script>
                                           <script src="${htmlFolder}/js/slides.min.jquery.js" language="javascript" type="text/javascript"></script>
                                           <script type="text/javascript" src="${htmlFolder}/js/tpl.base.js"></script>
                                             <script type="text/javascript"  src="${htmlFolder}/js/login.js"></script>
                                           <script src="${htmlFolder}/js/jquery.SuperSlide.2.1.1.js"></script>
                                           <script type="text/javascript">
                                           jQuery(".slidenews").slide({effect:"fold"});</script>
                                           <script type="text/javascript">	
                                           //新闻资讯-选卡效果
                                           jQuery(".moretabs").slide({ mainCell:".conwrap", targetCell:".more a", effect:"fold"});	
                                           </script>
                                           <script type="text/javascript" src="${htmlFolder}/js/quick_links.js"></script>
                                           <!-- 右侧栏 -->
                                           <script type="text/javascript">
                                           	$(".quick_links_panel li").mouseenter(function(){
                                           		$(this).children(".mp_tooltip").animate({left:-92,queue:true});
                                           		$(this).children(".mp_tooltip").css("visibility","visible");
                                           		$(this).children(".ibar_login_box").css("display","block");
                                           	});
                                           	$(".quick_links_panel li").mouseleave(function(){
                                           		$(this).children(".mp_tooltip").css("visibility","hidden");
                                           		$(this).children(".mp_tooltip").animate({left:-121,queue:true});
                                           		$(this).children(".ibar_login_box").css("display","none");
                                           	});
                                           	$(".quick_toggle li").mouseover(function(){
                                           		$(this).children(".mp_qrcode").show();
                                           	});
                                           	$(".quick_toggle li").mouseleave(function(){
                                           		$(this).children(".mp_qrcode").hide();
                                           	});
                                           	</script>
                                           <!-- 焦点图 -->
                                           <script type="text/javascript" src="${htmlFolder}/js/jquery.orbit.min.js"></script>
                                           <script type="text/javascript">
                                           $(window).load(function() {
                                           	$('#featured').orbit({
                                           		bullets : true,
                                           		startClockOnMouseOut : true,
                                           		captionAnimation : 'slideOpen'
                                           	});
                                           	$('#sciencescroll').orbit({
                                           		bullets : true,
                                           		startClockOnMouseOut : true,
                                           		captionAnimation : 'slideOpen'
                                           	});
                                           });
                                           </script>
                                           </html>
                                           
                                          
                                         
                                        
                                       
                                      
                                     
                                    
                                   
                                  
                                 
                                
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 