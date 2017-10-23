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
                                   <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/leftmenu.css"/>
                                   <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/self.css"/>
                                   </head>
                                   
                                   
                                   <body>
                                   <!--topnav-->
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
      
      <!--list-->
      <div class="newschannel-floor fn-clear">
      	<!--LeftMenu-->
         <div class="leftlistwrap">
            <div class="hotlist">
              <@channelDirective channelId=channel.pid>
                 <h4><span>${channel.displayName}</span></h4>
              </@channelDirective>
      			
      		<div id="wrapper-250">
                <ul class="accordion">
                  <@channelListDirective channelId=channel.id>
                  <#list channels as cha>
                  <#if cha.id == own>
                   <li id="one${cha_index}"> <a href="#one${cha_index}" class="active">&equiv;&nbsp;&nbsp;${cha.displayName}</a>    
                  <#else>
                   <li id="one${cha_index}"> <a href="${cha.url}">&equiv;&nbsp;&nbsp;${cha.displayName}</a>
                  </#if>
                  <ul class="sub-menu">
                  <@channelListDirective channelId=cha.id>
                  <#list channels as ch>
                      <li><a href="${ch.url}"><em></em>${ch.displayName}</a></li>
                  </#list>
                  </@channelListDirective>
                  </ul>
                  </li>
                  </#list>
                  </@channelListDirective>
                </ul>
              </div>
                  
            </div>
          </div>
          
         <div class="moretabs news-cont" style="margin:0 0 0 40px;">
           <@channelDirective channelId=own><div class="crumb"><h4>${channel.displayName}</h4></div></@channelDirective>
                       <div class="newslist">
                           <@contentListDirective channelId=own pageSize=channel.pageSize pageNum=pageNum titleLeft=32 order=10>
                           <#list contents as cmsContent>
                           <div class="newslist-item">
                               <h2><a href="${cmsContent.url}">${cmsContent.title}</a></h2>
                               <span>${cmsContent.brief?default("")}</span>
                               <p><em class="interact">来源：${cmsContent.origin}</em><em class="time">${cmsContent.publishDate?string("yyyy-MM-dd")}</em></p>
                           </div>
                           </#list>
                           </@contentListDirective>
                       </div>
                      <div class="page_wrap">
                           ${pagination}
                      </div>
                   <div class=" blank_20"></div>
                  
         </div>
         
      </div>
      <div class="  blank_20"></div>
      <!--footer-->
      <div class="footer">
        <div class="footerwrap">
          <div class="linklist">
              <a href="###">关于我们</a>  |  <a href="###">联系我们</a>   |<a href="###">  友情链接 </a> |<a href="###">  客服热线：400-898-9898</a> </div>
              <div class="copyright">
          <p><span>海洋信息网  版权声明 </span>  <span>京ICP备093817344号</span>  <span>京ICP证B2-21366号</span>   <span>  北京市公安局海淀分局备案编号：21341345699 </span>       </p>
      </div>
        </div>
      </div>
      <!--!footer end-->
      
      
      </form>
      </body>
      <!--                       Javascripts 注意不要改变顺序                      -->
      <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
      <script type="text/javascript" src="${htmlFolder}/js/login.js"></script>
      <script type="text/javascript" src="${htmlFolder}/js/jquery-migrate-1.1.1.min.js"></script>
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
      
      <!-- 以下是左侧菜单展开效 -->
      <script src="${htmlFolder}/js/jquery.min.js"></script>
      <script type="text/javascript">
       $(document).ready(function() {
         // Store variables
         var accordion_head = $('.accordion > li > a'),
           accordion_body = $('.accordion li > .sub-menu');
         // Open the first tab on load
         //accordion_head.first().addClass('active').next().slideDown('normal');
         // Click function
         accordion_head.on('click', function(event) {
           // Disable header links
           console.log($(this).next('.sub-menu').html().trim());
           if($(this).next('.sub-menu').html().trim()!="")
           {
           event.preventDefault();
         }
           // Show and hide the tabs on click
           if ($(this).attr('class') != 'active'){
             accordion_body.slideUp('normal');
             $(this).next().stop(true,true).slideToggle('normal');
             accordion_head.removeClass('active');
             $(this).addClass('active');
           }
         });
       });
      </script>
      </html>
      
     
    
   
  
 