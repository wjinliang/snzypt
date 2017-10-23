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
                        <#include "/template/jh-daohang2.ftl">
                        <div class="jh-main">
                            <div class="panel panel-default panel1">
                    	<@channelDirective channelId=12><!--政务要闻-->
                    		  <div class="panel-heading panel1-t"><a href="${channel.url}" target="_blank" class="panel1-ton fontSize18">${channel.displayName}</a></div>
                    			<div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-5">
                                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                                                                                 <!-- Indicators -->
                                                                                                 <ol class="carousel-indicators carousel-indicators1">
                                                                                                     <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                                                                                     <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                                                     				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                                                     				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
                                                                                                 </ol>
                                                                     
                                                                                                 <!-- Wrapper for slides -->
                                                                                                 <div class="carousel-inner" role="listbox">
                                                                     			    <@pictureListDirective pageSize=4 pageNum=1 >
                                                                     			     <#list contents as cmsContent>
                                                                     			      <div class="item ${(cmsContent_index==0)?string('active','')}">
                                                                                                               <a href="${cmsContent.url}" title="${cmsContent.title}" target="_blank"><img src="${cmsContent.titleImageUrl!}" style="height: 290px;width: 100%;"/></a>
                                                                     					  <div class="carousel-caption carousel-caption1">
                                                                                                                   <p><a target="_blank" href="${cmsContent.url}" style="color:white;">${cmsContent.shortTitle}</a></p>
                                                                                                                 </div>
                                                                                                     </div>
                                                                     				</#list> 
                                                                                                    </@pictureListDirective>
                                                                                                 </div>
                                                                     
                                                                                                 <!-- Controls -->
                                                                                                 <!--<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                                                                                     <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                                                                                     <span class="sr-only">Previous</span>
                                                                                                 </a>
                                                                                                 <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                                                                                     <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                                                                                     <span class="sr-only">Next</span>
                                                                                                 </a>-->
                                                                                             </div>
                                                                                       
                                            
                                        </div>
                                        <div class="col-md-7 pdTop1em">
                                            <!-- Nav tabs --><#--<@contentListDirective channelId=17 pageSize=1 titleLeft=17 order=2>
                    			  <#list contents as cmsContent>
                    			<a href="${cmsContent.url}" title="${cmsContent.title!}" target="_blank"><p class="fontSize22 color-green">${cmsContent.shortTitle!}</p></a>
                  			</#list>
                  			</@contentListDirective>-->
                    			<@contentListDirective channelId=channel.id pageSize=10 titleLeft=33 order=2>
                                 <ul class="panel2-list">
                    			  <#list contents as cmsContent>
                    				<li><span class="jh-dotted">·</span><a title="${cmsContent.title}" target="_blank" href="${cmsContent.url}"><span class="panel2-list-content">${cmsContent.shortTitle}</span><span class="panel2-list-time">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>	
                    			  </#list>
                                   </ul>
                    			</@contentListDirective>
                                        </div>
                                    </div>
                                 </div>
                    	 </@channelDirective>
                             </div> 
                            <div class="row">
  			  <@channelListDirective channelId=own excludeIds='12,17,18,19'>
  			   <#list channels as channel>
                                <div class="col-md-6">
                                    <div class="panel panel-default panel1">
                                        <div class="panel-heading panel1-t"><a href="${channel.url}" target="_blank" class="panel1-ton fontSize18">${channel.displayName}</a></div>
                                        <div class="panel-body">
                                            <ul class="panel2-list panel2-list-pd">
  					  <#if channel.id==16>
                                            <@videoListDirective channelId=16 pageSize=7 pageNum=1 titleLeft=42 >
                     	<#list cmsVideos as video>
                           <li> <a href="${video.url!}" title="${video.name}" target="_blank"><span class="panel2-list-content">${video.name!}</span>
                             <span class="panel2-list-time">${video.publishDate?string("yyyy-MM-dd")}</span></a></li>
                     		
                     	</#list>
                     	
                     </@videoListDirective>
                      </#if>
                    			<@contentListDirective channelId=channel.id pageSize=7 titleLeft=36 order=2>
                    			  <#list contents as cmsContent>
                    				<li><a target="_blank" title="${cmsContent.title}" href="${cmsContent.url}"><span class="panel2-list-content">${cmsContent.shortTitle}</span><span class="panel2-list-time">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>	
                    			  </#list>
                    			  </@contentListDirective>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
  			      </#list>
  			      </@channelListDirective>
                               </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="ggfw-list-bg text-center">
                    		<@channelDirective channelId=19><!-- 热点专题-->
                                        <div class="ggfw-list-bg2">
                                           <a href="${channel.url!}" target="_blank" style="color: white;">${channel.displayName!}</a>
                                        </div>
                                        <div class="row ggfw-list-pd1">
                    			<@channelListDirective channelId=channel.id order=4 pageSize=6>
                    			<#list channels as channel>
                    				<div class="col-xs-6">
                    				    <a href="${channel.url}"  target="_blank">${channel.displayName}</a>
                    				</div>
                    			</#list>
                    			</@channelListDirective>
                                        </div>
                    		    </@channelDirective>
                                    </div>
                                </div>
                                <div class="col-md-4 pdTop1em">
                                    <div class="panel panel-default panel2">
                    		<@channelDirective channelId=17><!-- 公告公示-->
                                        <div class="panel-heading panel2-t fontSize18"><a target="_blank" href="${channel.url}">${channel.displayName}</a></div>
                                        <div class="panel-body">
                                            <ul class="panel2-list panel2-list-sm">
                    			<@contentListDirective channelId=channel.id pageSize=3 titleLeft=12 order=2>
                    			  <#list contents as cmsContent>
                                                <li><span class="jh-dotted">·</span><a title="${cmsContent.title}" target="_blank" href="${cmsContent.url}">${cmsContent.shortTitle}<span class="panel2-list-time" style="width:30%">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>
                                                </#list>
                    			</@contentListDirective>
                                            </ul>
                                        </div>
                    		    </@channelDirective>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="panel panel-default panel2">
                    		<@channelDirective channelId=18><!-- 中国政声网政声传递-->
                                        <div class="panel-heading panel2-t fontSize18"><a target="_blank" href="${channel.url}">${channel.displayName}</a></div>
                                        <div class="panel-body">
                                            <ul class="panel2-list panel2-list-sm">
                                             <@contentListDirective channelId=channel.id pageSize=3 titleLeft=12 order=2>
                    			  <#list contents as cmsContent>
                                                <li><span class="jh-dotted">·</span><a title="${cmsContent.title}" target="_blank" href="${cmsContent.url}">${cmsContent.shortTitle}<span class="panel2-list-time" style="width:30%">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>
                                                </#list>
                    			</@contentListDirective>
                                            </ul>
                                        </div>
                    		    </@channelDirective>
                                    </div>
                                </div>
                            </div>
                      </div>
                        <#include "/template/jh-links.ftl">
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
                    
                   
 
  
 