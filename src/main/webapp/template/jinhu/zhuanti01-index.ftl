<!DOCTYPE html>
         <html>
         <head lang="en">
             <#include "/template/jh-meta.ftl">
	     <meta name="keywords" content="${channel.displayName}">
             <title>${site.displayName}-${channel.displayName}</title>
             <link href="/html/jinhu-static-z01/bootstrap/css/bootstrap.min.css" rel="stylesheet">
             <link href="/html/jinhu-static-z01/css/style.ts.css" rel="stylesheet">
             <!--[if lt IE 9]>
             <script src="/html/jinhu-static-z01/js/html5shiv.min.js"></script>
             <script src="/html/jinhu-static-z01/js/respond.min.js"></script>
             <![endif]-->
         </head>
         <body class="ztrd4-bg">
         <div class="container">
             <div class="ztrd4-logo text-center">
               <#if channel.channelIcon??>
                 <img src="${channel.channelIcon!}">
                 </#if>
             </div>
         </div>
         <div class="pos-r">
             <img src="/html/jinhu-static-z01/img/zt4_bg1.png" class="ztrd4-bg1">
             <div class="container">
                 <div class="jh-main fontSize16 bg-white ztrd4">
                     <div class="row borderBottom mgb20 pdb20">
                       <@contentListDirective channelId=own pageSize=1 pageNum=1 titleLeft=12 order=2>  
         				<#list contents as cmsContent>
                         <div class="col-md-7">
                             <a href="${cmsContent.url!}" target="_blank" class="thumbnail thumbnails thumbnails2">
                                 <img src="${cmsContent.titleImageUrl!}" class="thumbnail-border-green thumbnail-img-pd">
                             </a>
                         </div>
                         <div class="col-md-5">
         				
                         
         				 <a href="${cmsContent.url!}" target="_blank">
                                 <h3 class="color-green text-center mgb30 borderBottom pdb20">${cmsContent.title!}</h3>
                                 <p class="color-gray text-right">${cmsContent.publishDate?string("yyyy年MM月dd日")}</p>
                                 <p class="ztrd4-line-height">${cmsContent.brief!}<span class="color-green">【 详细 】</span></p>
                             </a>
                           </div>
         				</#list> 
         	
         				</@contentListDirective>
                            
                         
                     </div>
                  
                   <@channelListDirective channelId=own>
                     <#list channels as childChannel>
                      <#if (childChannel_index % 2)==0>
                        <div class="row">
                    </#if>
                         <div class="col-md-6">
                             <div class="ztrd4-t">
         					<@channelDirective channelId=childChannel.id>
         
                                 <div class="ztrd4-tbg fontSize18 mgb10"><a href="${channel.url}" target="_blank">${channel.displayName}</a> </div>
         						<@contentListDirective channelId=channel.id pageSize=6 pageNum=1 titleLeft=28 order=2>  
         							<#list contents as cmsContent>
         							<#if cmsContent_index == 0>
         							
                                 <div class="ztrd4-pd borderBottom clearfix">
                                     <div class="col-xs-6">
                                         <a href="${cmsContent.url}" target="_blank" class="thumbnail thumbnails">
                                             <img src="${cmsContent.titleImageUrl}">
                                         </a>
                                     </div>
                                     <div class="col-xs-6">
                                         <a href="${cmsContent.url}" target="_blank" class="ztrd4-line-height">${cmsContent.brief!}<span class="color-green">【 详细 】</span></a>
                                     </div>
         							 
                                 </div>
         						</#if>
         						 </#list> 
                                 <div class="ztrd4-pd clearfix">
                                     <ul class="panel2-list">
         							<#list contents as cmsContent>
         								<#if cmsContent_index &gt; 0>
         									<li><span class="jh-dotted">·</span><a href="${cmsContent.url}" target="_blank">
         	${cmsContent.title}
         </a></li>
         								</#if>
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
         
        
       
      
     
    
   
  
 