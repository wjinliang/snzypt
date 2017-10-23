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
              	   <style>
              		.lineccc-1 {
              		    margin-top: 1.3em;
              		    border-top: 1px solid #ccc;
              		}
              	</style>
                     </head>
                     <body>
                     <#include "/template/jh-head.ftl">
                     <#include "/template/jh-daohang.ftl">
                     <div class="container bg-white">
                         <#include "/template/jh-current.ftl">
                         <div class="jh-main">
                              <div class="row">
                          <div class="col-md-8">
                              <div class="fontSize18 new-list2-t">便民提示</div>
              		<@contentListDirective channelId=43 pageNum=pageNum pageSize=20 order=2>
                              <ul class="panel2-list panel2-list-pd ">
              			<#list contents as content>
                                  <li><a href="${content.url}" title="${content.title!}" target="_blank"><span class="panel2-list-content">${content.title!}</span><span class="panel2-list-time">${content.publishDate?string("yyyy-MM-dd")}</span></a></li>
                                  <#if (content_index==4)>
             			<li class="lineccc-1"></li>
             		     </#if>
             		     <#if (content_index==9)>
             			<li class="lineccc-1"></li>
             		     </#if>
             		     <#if (content_index==14)>
             			<li class="lineccc-1"></li>
             		     </#if>
                                 </#list>
              		</ul>
                              ${pagination!}
              		</@contentListDirective>
                          </div>
              			<div class="col-md-4">
                              <#--<div class="panel panel-default panel2" style="margin-top:35px;">
              		<@channelDirective channelId=34>
                                  <div class="panel-heading panel2-t fontSize18"><a target="_blank" href="${channel.url}" target-"_blank">${channel.displayName!}</a></div>
                                  <div class="panel-body">
                                      <ul class="panel2-list panel2-list-sm">
              			<@contentListDirective channelId=34 pageSize=8 pageNum=1>
              			   <#list contents as content>
                                          <li><span class="jh-dotted">·</span><a title="${content.title!}" href="${content.url}" target="_blank">${content.title!}</a></li>
                                          </#list>
              			</@contentListDirective>
                                      </ul>
                                  </div>
              		    </@channelDirective>
                              </div>-->
              			<div class="clearfix">
                                      <div class="col-sm-4 ggfw-cycx1 color-green ">
              			<@channelDirective channelId=44>
                                          <div><a href="${channel.url!}"  target="_blank"><span class="ggfw-cycx1-circle color-green"><span class="glyphicon glyphicon-search"></span></span> <span class="color-green">${channel.displayName}</span></a></div>
              			</@channelDirective>
                                      </div>
                             <div class="col-sm-12 ggfw-cycx2 mgt10">
                                          <div class="row ggfw-btn-pd ggfw-btn-pd1 text-center ">
              			    <@contentListDirective channelId=44 pageSize=1000 pageNum=1 order=1>
              				    <#list contents as content>
              				    <div class="col-xs-4 col-md-4">
              					<a href="${content.url!}" title="${content.title!}" target="_blank" class="ggfw-btn">${content.title!}</a>
              				    </div>
              				     </#list>
              			     </@contentListDirective>
                                             
                                          </div>
                                      </div>
              		</div>
              
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
                     
    
   
  
 