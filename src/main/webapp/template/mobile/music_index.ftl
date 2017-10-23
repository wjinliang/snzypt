<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0,minimum-scale=1.0, user-scalabele=no"/><!-- 手机屏幕网页初始大小占屏幕面积100% -->
<title>${channel.displayName}</title>
<!--css-->
<link type="text/css" rel="stylesheet" href="${htmlFolder}${htmlMobileFolder}/css/global.css"><!--全局样式-->
<link type="text/css" rel="stylesheet" href="${htmlFolder}${htmlMobileFolder}/css/main.css">
<!--javaScript-->
<script src="${htmlFolder}${htmlMobileFolder}/js/retina.js"></script><!--适应2倍屏-->
</head>

<body>

<!--头部开始-->
<header id="header" class="ub ub-pj">
    <div class="ub ub-ac ub-pc f20 cWh mg-l2"><a href="${site.mUrl}"><span style="color:white">首页</span></a><div class="jtRit mg-l2 mg-r2 ub ub-ac ub-pc"></div><span>${channel.displayName}</span></div>
    <span class="right"></span>
</header>
<#include "daohang.ftl">
<!-- 头部结束 -->

<!--MainBody-->
<!--Card News-->
 <@channelListDirective channelId=own>
  <#list channels as channel>
<div class="ub ub-ver">
    <div class="ub lineT lineB-blu1">
        <div class="ub zwywTit">${channel.displayName}</div>
    </div>
    <div>
      <@audioListDirective channelId=channel.id pageSize=4 titleLeft=25 order=1>
      <#list cmsAudios as content>
        <div class="ub lineB mg-a2 mg-b0 pd-b2 link">
           <div class="ub ub-f1 ub-ver">
                <div class="ub f18 cBla3"><a href="${content.mUrl}">${content.name}</a></div>
               <div class="ub ub-f1 ub-ae pd-t2">
                   <div class="f12 cBla2 mg-r2">${content.publishDate?string("yyyy-MM-dd")}</div>
                   <div class="ub-f1 f12 cBla2">${content.origin}</div>
                   <div class="f14 cBla2 lineA uc-a pd-a1 newsPoint">&bull;&bull;&bull;</div>
               </div>
           </div>
        </div>
         </#list>
      </@audioListDirective>
        <div class="ub bgGra1 pd-a2 f14 cBla1 link"><a href="${channel.url}">查看更多&nbsp;&bull;&bull;&bull;</a></div>
    </div>
</div>
 </#list>
</@channelListDirective>


<!--End-->
<!--End MainBody-->

</body>
<#include "/template/mobile/foot.ftl" />
</html>
