<!DOCTYPE html>
        <html>
        <head lang="en">
             <#include "/template/jh-meta.ftl">
            <title>${site.displayName}-${channel.displayName}</title>
            <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
            <!--[if lt IE 9]>
            <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
            <script src="/html/jinhu-static/js/respond.min.js"></script>
            <![endif]-->
        </head>
        <body>
        <#include "/template/jh-head.ftl">
        <#include "/template/jh-daohang.ftl">
        <div class="container bg-white">
            <#include "/template/jh-current.ftl">
            <div class="jh-main">
                <div class="row">
                    <div class="col-md-4">
        		<@channelDirective channelId=own>
                        <div class="fontSize18 pd3 color-green">${channel.displayName}</div>
                        <ul class="news-list1 news-list1-sm fontSize16 clearfix">
        		<@channelListDirective channelId=channel.id order=1 >
        		 <#list channels as channel>
                            <li class="${(channel_index==0)?string('active','')}">
        		    <a href="${channel.url}"><span class="glyphicon glyphicon-play-circle"></span>${channel.displayName}</a> </li>
                          </#list> 
        		</@channelListDirective> 
                        </ul>
        		</@channelDirective>
                    </div>
                    <div class="col-md-8 pdTop1em">
 		   <div class="fontSize18 pd3 color-green" style="visibility: hidden;">&nbsp;</div>
 		   <@channelListDirective channelId=own>
 			<#list channels as channel>
 			<#if channel_index==0>
 					<@contentListDirective channelId=channel.id pageSize=18 pageNum=pageNum titleLeft=38 order=2> 
 						<div class="wxqd-panel">
 						    <div class="wxqd-panel-t">
 							<span class="wxqd-panel-tbg wxqd-panel-tbg1"><span class="color-white fontSize18">${channel.displayName}</span></span>
 						    </div>
 						    <#if own==110>
 							<div class="wxqd-panel-c wxqd-panel-cpd2 bg-gray">
 							 <div class="row ggfw-btn-pd2 text-center fontSize18">
 								<#list contents as cmsContent>
 								    <div class="col-xs-4">
 									<a target="_blank" href="${cmsContent.url}" title="${cmsContent.title}"  class="ggfw-btn">
 									 ${cmsContent.shortTitle} 
 									</a>
 								    </div>
 								</#list>
 							  </div>
 							</div>
 						    <#else> 
 						       <div class="wxqd-panel-c wxqd-panel-cpd1 bg-gray">
 							<ul class="panel2-list panel2-list-pds">
 							  <#list contents as cmsContent>
 								<li><span class="jh-dotted">·</span><a target="_blank"  title="${cmsContent.title}" href="${cmsContent.url}">
 								<span class="panel2-list-content"> ${cmsContent.shortTitle} </span>
 								<span class="panel2-list-time">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>	
 							  </#list>
 							 </ul>
 							</div>
 						    </#if>
 						</div>
 						<#if own!=110>
 						${pagination} 
 						  </#if>
 					</@contentListDirective>
 				   </#if> 
 				</#list>
 		   </@channelListDirective> 
 	    </div>
                </div>
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
                $('#navTab1 a').click(function (e) {
                    e.preventDefault();
                    $(this).tab('show');
                });
                $('#navTab2 a').click(function (e) {
                    e.preventDefault();
                    $(this).tab('show');
                });
                $('#navTab3 a').click(function (e) {
                    e.preventDefault();
                    $(this).tab('show');
                });
            });
        </script>
        </body>
        </html>
        
       
      
     
    
   
  
 