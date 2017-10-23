
 
 <div class="nav-bg">
     <div class="container mgb0">
         <div class="nav-list fontSize18 text-center clearfix row">
             <div class="col-xs-4 col-sm-2"><a href="${site.url}">首页</a> </div>
 	    <@channelListDirective siteId=site.id order=1 excludeIds="8">
                           	     <#list channels as channel>
 				     <div class="col-xs-4 col-sm-2 ${(channel.id==superChannel.id)?string('current','')}">
 				      <a href="${channel.url}">${channel.displayName}</a>
 				      </div>
                           	     </#list>
                </@channelListDirective>
         </div>
     </div>
 </div>
  
 