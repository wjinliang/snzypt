
   
   <div class="nav-bg">
       <div class="container mgb0">
           <div class="nav-list fontSize18 text-center clearfix row">
               <div class="col-xs-4 col-sm-2 current" ><a href="<#if site??>${site.url}<#else>/html/jinhu/index.html</#if>">首页</a> </div>
   	    <@channelListDirective siteId=6 order=1 excludeIds="8">
                             	     <#list channels as channel>
   				     <div class="col-xs-4 col-sm-2">
   				      <a href="${channel.url}">${channel.displayName}</a>
   				      </div>
                             	     </#list>
                  </@channelListDirective>
           </div>
       </div>
   </div>
    
   
  
 