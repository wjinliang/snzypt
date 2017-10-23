<!DOCTYPE html>
             <html>
             <head lang="en">
                 <#include "/template/jh-meta.ftl">
                 <title>${site.displayName!}-${cmsContent.title!}</title>
               	<meta name="keywords" content="${cmsContent.keywords!}" />
                 <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                 <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
                 <!--[if lt IE 9]>
                 <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
                 <script src="/html/jinhu-static/js/respond.min.js"></script>
                 <![endif]-->
     	    <style type="text/css">
     		.jh-main .mapTitle{padding:40px 20px; font-size:20px; list-style:none; text-align:center;}
     		.jh-main .mapTitle a{color:#fff; font-family:"黑体";}
     		.jh-main .mljinhu, .jh-main .other, .jh-main .xwzx, .jh-main .zwgk, .jh-main .ggfw, .jh-main .zmhd{padding:20px 0; border-bottom:1px dashed #d3d3d3;}
     		.jh-main .mapContent{margin-top:20px; list-style:none; margin-left:20px;}
     		.jh-main .mapContent a{margin-right:20px; font-size:14px; line-height:25px;}
     		.clear{overflow:hidden; height:0px; clear:both;}
     		.jh-main .other .mapTitle{background:#D3C2FA}
     		.jh-main .mljinhu .mapTitle{background:#e54e31;}
     		.jh-main .xwzx .mapTitle{background:#13ECE1;}
     		.jh-main .zwgk .mapTitle{background:#FDB693;}
     		.jh-main .ggfw .mapTitle{background:#81b2ec;}
     		.jh-main .zmhd .mapTitle{background:#2cc99e}
     	</style>
             </head>
             <body>
             
             <#include "/template/jh-head.ftl"/>
             <#include "/template/jh-daohang.ftl"/>
             <div class="container bg-white">
                
                <div class="jh-main">
          	<div class="color-green fontSize18" style="padding:10px 10px 10px 20px; background:url(/html/jinhu-static/img/green.png) left center no-repeat;">网站地图</div>
         	
     	<@channelListDirective siteId=6 >
     	<#list channels as cha>
     	<div class="other ${cha.enName!}">
             	<ul style="clear:both;">
                 	<li class="col-md-2 mapTitle col-sm-3 col-xs-2">
                     	<a href="${cha.url!}" target="_blank" title="${cha.displayName}">${cha.displayName}</a>
                     </li>
                     <li class="col-md-8 mapContent col-sm-8 col-xs-9">
     		<@channelListDirective channelId=cha.id  excludeIds='10'>
     			<#list channels as channel>
                     	<a href="${channel.url}" target="_blank" title="${channel.displayName!}">${channel.displayName!}</a>
     			</#list>
     		</@channelListDirective>
                     </li>
                     <div class="clear"></div>
                 </ul>
             </div>
     	</#list>
     	</@channelListDirective>
         </div>
             </div>
             <#include "/template/jh-footer.ftl">
             <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
             <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
             <script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
             <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
             <script type="text/javascript">
                 $(function () {
                     $('input, textarea').placeholder();
                 });
             </script>
             </body>
     </html>
     
    
   
  
 