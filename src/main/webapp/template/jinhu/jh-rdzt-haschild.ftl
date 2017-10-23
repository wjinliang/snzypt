<!DOCTYPE html>
          <html>
          <head lang="en">
              <#include "/template/jh-meta.ftl">
 	     <meta name="keywords" content="${channel.displayName}">
              <title>${site.displayName!}-${channel.displayName!}</title>
              <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
              <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
 	    <link href="/html/jinhu-static/css/style.wq1.css" rel="stylesheet">
              <!--[if lt IE 9]>
              <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
              <script src="/html/jinhu-static/js/respond.min.js"></script>
              <![endif]-->
 	     <style type="text/css">
 		.fhsy{height:50px; line-height:50px; text-align:right;}
 		.fhsy a{font-family:"黑体"; margin-left:10px;}
 		.container .ztrd4-logo{padding:20px 0 20px 0;}
 		</style>
          </head>
          <body class="ztrd4-bg">
          <div class="container">
 	 <div class="fhsy"><a href="${site.url!}"><!--<img src="/html/jinhu-static/img/fhsy.png">-->返回主站</a></div>
              <div class="ztrd4-logo text-center">
                <#if channel.channelIcon??>
                  <img src="${channel.channelIcon!}">
                  </#if>
              </div>
          </div>
          <div class="pos-r ztrd_4">
              <div class="container">
                  <div class="jh-main fontSize16 bg-white">
                   
                    <@channelListDirective channelId=own>
                      <#list channels as childChannel>
                       <#if (childChannel_index % 2)==0>
                         <div class="row" style="min-height:280px">
                     </#if>
                          <div class="col-md-6">
                              <div class="ztrd4-t">
          					<@channelDirective channelId=childChannel.id>
          
                                  <div class="ztrd4-tbg fontSize18 mgb10"><a href="${channel.url}" target="_blank">${channel.displayName}</a> </div>
          						<@contentListDirective channelId=channel.id pageSize=6 pageNum=1 titleLeft=28 order=2>  
          							
                                  <div class="ztrd4-pd clearfix">
                                      <ul class="panel2-list">
          							<#list contents as cmsContent>
          									<li><span class="jh-dotted">·</span><a title="${cmsContent.title}" href="${cmsContent.url}" target="_blank">
          	${cmsContent.title}
          </a></li>
          							</#list>
                                      </ul>
                                  </div>
          						
          				
          							</@contentListDirective>
          					</@channelDirective>  
                              </div>
                          </div>
                         <#if (childChannel_index % 2)==1>
                         </div>
                     </#if>
                        </#list>
                        </@channelListDirective>
                      </div>
                    
                  </div>
              </div>
          </div>
          <#include "/template/jh-footer.ftl">
          <script type="text/javascript" src="/html/jinhu-static-z01/js/jquery-1.12.1.min.js"></script>
          <script type="text/javascript" src="/html/jinhu-static-z01/js/jquery.placeholder.min.js"></script>
          <script type="text/javascript" src="/html/jinhu-static-z01/bootstrap/js/bootstrap.min.js"></script>
          <script type="text/javascript" src="/html/jinhu-static-z01/js/js.js"></script>
          <script type="text/javascript">
              $(function () {
                  $('input, textarea').placeholder();
              });
          </script>
          </body>
          </html>
          
         
        
       
      
     
    
   
  
 