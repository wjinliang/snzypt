<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0,minimum-scale=1.0, user-scalabele=no"/><!-- 手机屏幕网页初始大小占屏幕面积100% -->
<title>首页</title>
<!--css-->
<link type="text/css" rel="stylesheet" href="${htmlFolder}${htmlMobileFolder}/css/global.css"><!--全局样式-->
<link type="text/css" rel="stylesheet" href="${htmlFolder}${htmlMobileFolder}/css/main.css">
<!--javaScript-->
<script src="${htmlFolder}${htmlMobileFolder}js/retina.js"></script><!--适应2倍屏-->
</head>

<body>
<!--头部开始-->
<header id="header" class="ub ub-pj">
    <div class="ub ub-ac ub-pc logo"><div class="ico_logo"></div></div>
    <span class="right"></span>
</header>
<#include "/template/mobile/daohang.ftl" />

<div class="headNav ub ub-ver lineB">
 	<div class="ub pd-t1"> 
        <@channelDirective channelId=21><div class="ubw3 link"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>

        <@channelDirective channelId=27><div class="ubw3 link"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>
        <@channelDirective channelId=28><div class="ubw3 link"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>
        <@channelDirective channelId=29><div class="ubw3 link"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>
    </div>
     <div class="ub pd-t1">
        <@channelDirective channelId=66><div class="ubw3 link"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>
        <@channelDirective channelId=67><div class="ubw3 link"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>
        <@channelDirective channelId=68><div class="ubw3 link"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>
        <@channelDirective channelId=32><div class="ubw3 link"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>
    </div> 
</div>
<!-- 头部结束 -->

<!--Banner-->
<!--效果html开始-->
<div class="main_visual">
    <@contentListDirective channelId=36 pageSize=5 titleLeft=25 order=1>
  <div class="flicking_con">
    <#list contents as content>
    <a href="#">${content_index+1}</a>
    </#list>
  </div>
  <div class="main_image">
    <ul>
       <#list contents as content>
      <li><span class="img_5"><a href="${content.mUrl}"><img src="${content.titleImageUrl}"></a><p class="caption">${content.title}</p></span></li>
       </#list>
    </ul>
  </div>
   </@contentListDirective>
</div>
<!--效果html结束-->
<!--End Banner-->

<!--News-->
<div class="ub ub-ver">
   <@contentListDirective channelId=38 pageSize=4 titleLeft=25 order=1>
      <#list contents as content>
	<div class="ub lineB mg-a2 mg-b0 pd-b2 link" onClick="location.href='details.html'">
    	<div class="newsPic ub"><img src="${content.titleImageUrl}"></div>
       <div class="ub ub-f1 ub-ver pd-l2">
       		<div class="ub f18 cBla3"><a href="${content.mUrl}">${content.title}</a></div>
           <div class="ub ub-f1 ub-ae">
               <div class="f12 cBla2 mg-r2">${content.publishDate?string("yyyy-MM-dd")}</div>
               <div class="ub-f1 f12 cBla2">${content.origin}</div>
               <div class="f14 cBla2 lineA uc-a pd-a1 newsPoint">&bull;&bull;&bull;</div>
           </div>
       </div>
    </div>
     </#list>
      </@contentListDirective>
    <@channelDirective channelId=38><div class="ub ub-pc bgGra1 pd-a2 f14 cBla1 link"><a href="${channel.url}">查看更多&nbsp;&bull;&bull;&bull;</a></div></@channelDirective>
</div>
<!--End News-->

<!--Card News-->
<div class="ub ub-ver">
    <div class="ub indCard lineT lineB">
        <ul>
            <@channelDirective channelId=20><li class="card_on" onclick="showCard(this,'navCont','card')">${channel.displayName}</li></@channelDirective>
            <@channelDirective channelId=37><li class="card_off" onclick="showCard(this,'navCont','card')">${channel.displayName}</li></@channelDirective>
       </ul>
    </div>
   
    <div id="navCont0" style="display:block;">
      
         <@contentListDirective channelId=20 pageSize=4 titleLeft=25 order=1>
          <#list contents as content>
        <div class="ub lineB mg-a2 mg-b0 pd-b2 link">
           <div class="ub ub-f1 ub-ver">
                <div class="ub f18 cBla3"><a href="${content.mUrl}">${content.title}</a></div>
               <div class="ub ub-f1 ub-ae pd-t2">
                   <div class="f12 cBla2 mg-r2">${content.publishDate?string("yyyy-MM-dd")}</div>
                   <div class="ub-f1 f12 cBla2">${content.origin}</div>
                   <div class="f14 cBla2 lineA uc-a pd-a1 newsPoint">&bull;&bull;&bull;</div>
               </div>
           </div>
       </div>
          </#list>
      </@contentListDirective>
      <@channelDirective channelId=20><div class="ub ub-pc bgGra1 pd-a2 f14 cBla1 link"><a href="${channel.url}">查看更多&nbsp;&bull;&bull;&bull;</a></div></@channelDirective>
        </div>

    <div id="navCont1" style="display:none;">
      <@contentListDirective channelId=37 pageSize=4 titleLeft=25 order=1>
      <#list contents as content>
    	<div class="ub lineB mg-a2 mg-b0 pd-b2 link">
           <div class="ub ub-f1 ub-ver">
               <div class="ub f18 cBla3"><a href="${content.mUrl}">${content.title}</a></div>
               <div class="ub ub-f1 ub-ae pd-t2">
                   <div class="f12 cBla2 mg-r2">${content.publishDate?string("yyyy-MM-dd")}</div>
                   <div class="ub-f1 f12 cBla2">${content.origin}</div>
                   <div class="f14 cBla2 lineA uc-a pd-a1 newsPoint">&bull;&bull;&bull;</div>
               </div>
           </div>
       </div>
            </#list>
      </@contentListDirective>
        <@channelDirective channelId=37><div class="ub ub-pc bgGra1 pd-a2 f14 cBla1 link"><a href="${channel.url}">查看更多&nbsp;&bull;&bull;&bull;</a></div></@channelDirective>
    </div>
</div>
<!--End-->

<!--Card News-->
<div class="ub ub-ver">
    <div class="ub indCard lineT lineB">
        <ul>
            <@channelDirective channelId=27><li class="card_on" onclick="showCard(this,'dtCont','card')">${channel.displayName}</li></@channelDirective>
            <@channelDirective channelId=28><li class="card_off" onclick="showCard(this,'dtCont','card')">${channel.displayName}</li></@channelDirective>
       </ul>
    </div>
    <div id="dtCont0" style="display:block;">
      <@contentListDirective channelId=27 pageSize=4 titleLeft=25 order=1>
      <#list contents as content>
       <div class="ub lineB mg-a2 mg-b0 pd-b2 link">
           <div class="ub ub-f1 ub-ver">
               <div class="ub f18 cBla3"><a href="${content.mUrl}">${content.title}</a></div>
               <div class="ub ub-f1 ub-ae pd-t2">
                   <div class="f12 cBla2 mg-r2">${content.publishDate?string("yyyy-MM-dd")}</div>
                   <div class="ub-f1 f12 cBla2">${content.origin}</div>
                   <div class="f14 cBla2 lineA uc-a pd-a1 newsPoint">&bull;&bull;&bull;</div>
               </div>
           </div>
       </div>
         </#list>
      </@contentListDirective>
       <@channelDirective channelId=28><div class="ub ub-pc bgGra1 pd-a2 f14 cBla1 link"><a href="${channel.url}">查看更多&nbsp;&bull;&bull;&bull;</a></div></@channelDirective>
    </div>
    <div id="dtCont1" style="display:none;">
       <@contentListDirective channelId=28 pageSize=4 titleLeft=25 order=1>
      <#list contents as content>
    	 <div class="ub lineB mg-a2 mg-b0 pd-b2 link">
           <div class="ub ub-f1 ub-ver">
               <div class="ub f18 cBla3"><a href="${content.mUrl}">${content.title}</a></div>
               <div class="ub ub-f1 ub-ae pd-t2">
                   <div class="f12 cBla2 mg-r2">${content.publishDate?string("yyyy-MM-dd")}</div>
                   <div class="ub-f1 f12 cBla2">${content.origin}</div>
                   <div class="f14 cBla2 lineA uc-a pd-a1 newsPoint">&bull;&bull;&bull;</div>
               </div>
           </div>
        </div>
         </#list>
      </@contentListDirective>
       <@channelDirective channelId=28><div class="ub ub-pc bgGra1 pd-a2 f14 cBla1 link"><a href="${channel.url}">查看更多&nbsp;&bull;&bull;&bull;</a></div></@channelDirective>
    </div>
</div>
<!--End-->

<!--Card News-->
<div class="ub ub-ver">
    <div class="ub indCard lineT lineB">
        <ul>
            <@channelDirective channelId=29><li class="card_on" onclick="showCard(this,'mtCont','card')">${channel.displayName}</li></@channelDirective>
            <@channelDirective channelId=32><li class="card_off" onclick="showCard(this,'mtCont','card')">${channel.displayName}</li></@channelDirective>
       </ul>
    </div>
    <div id="mtCont0" style="display:block;">
         <@contentListDirective channelId=29 pageSize=4 titleLeft=25 order=1>
      <#list contents as content>
       <div class="ub lineB mg-a2 mg-b0 pd-b2 link">
           <div class="ub ub-f1 ub-ver">
               <div class="ub f18 cBla3"><a href="${content.mUrl}">${content.title}</a></div>
               <div class="ub ub-f1 ub-ae pd-t2">
                   <div class="f12 cBla2 mg-r2">${content.publishDate?string("yyyy-MM-dd")}</div>
                   <div class="ub-f1 f12 cBla2">${content.origin}</div>
                   <div class="f14 cBla2 lineA uc-a pd-a1 newsPoint">&bull;&bull;&bull;</div>
               </div>
           </div>
        </div>
         </#list>
      </@contentListDirective>
        <@channelDirective channelId=29><div class="ub ub-pc bgGra1 pd-a2 f14 cBla1 link"><a href="${channel.url}">查看更多&nbsp;&bull;&bull;&bull;</a></div></@channelDirective>
    </div>
    <div id="mtCont1" style="display:none;">
    	<@contentListDirective channelId=32 pageSize=4 titleLeft=25 order=1>
      <#list contents as content>
       <div class="ub lineB mg-a2 mg-b0 pd-b2 link">
           <div class="ub ub-f1 ub-ver">
               <div class="ub f18 cBla3"><a href="${content.mUrl}">${content.title}</a></div>
               <div class="ub ub-f1 ub-ae pd-t2">
                   <div class="f12 cBla2 mg-r2">${content.publishDate?string("yyyy-MM-dd")}</div>
                   <div class="ub-f1 f12 cBla2">${content.origin}</div>
                   <div class="f14 cBla2 lineA uc-a pd-a1 newsPoint">&bull;&bull;&bull;</div>
               </div>
           </div>
        </div>
         </#list>
      </@contentListDirective>
        <@channelDirective channelId=32><div class="ub ub-pc bgGra1 pd-a2 f14 cBla1 link"><a href="${channel.url}">查看更多&nbsp;&bull;&bull;&bull;</a></div></@channelDirective>
    </div>
</div>
<!--End-->

<div class="ub ub-ver pd-a3 f14 footer cBla3">
    <div class="ub ub-pc">版权所有：蓝海信息网</div>
</div>

</body>
<#include "/template/mobile/foot.ftl" />
<script type="text/javascript" src="${htmlFolder}${htmlMobileFolder}/js/public.js"></script><!--Tab & Public-->
<script type="text/javascript" src="${htmlFolder}${htmlMobileFolder}/js/jquery-1.8.3.min.js"></script><!--Banner-->
<script type="text/javascript" src="${htmlFolder}${htmlMobileFolder}/js/jquery.event.drag-1.5.min.js"></script><!--Banner-->
<script type="text/javascript" src="${htmlFolder}${htmlMobileFolder}/js/jquery.touchSlider.js"></script><!--Banner-->
<script type="text/javascript"><!--Banner-->
$(document).ready(function(){

  $(".main_visual").hover(function(){
    $("#btn_prev,#btn_next").fadeIn()
  },function(){
    $("#btn_prev,#btn_next").fadeOut()
  });
  
  $dragBln = false;
  
  $(".main_image").touchSlider({
    flexible : true,
    speed : 200,
    btn_prev : $("#btn_prev"),
    btn_next : $("#btn_next"),
    paging : $(".flicking_con a"),
    counter : function (e){
      $(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
    }
  });
  
  $(".main_image").bind("mousedown", function() {
    $dragBln = false;
  });
  
  $(".main_image").bind("dragstart", function() {
    $dragBln = true;
  });
  
  $(".main_image a").click(function(){
    if($dragBln) {
      return false;
    }
  });
  
  timer = setInterval(function(){
    $("#btn_next").click();
  }, 5000);
  
  $(".main_visual").hover(function(){
    clearInterval(timer);
  },function(){
    timer = setInterval(function(){
      $("#btn_next").click();
    },5000);
  });
  
  $(".main_image").bind("touchstart",function(){
    clearInterval(timer);
  }).bind("touchend", function(){
    timer = setInterval(function(){
      $("#btn_next").click();
    }, 5000);
  });
  
});
</script>
</html>
