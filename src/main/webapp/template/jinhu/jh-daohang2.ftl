<ol class="breadcrumb fontSize14 jh-breadcrumb jh-breadcrumbn">
       <@channelListDirective channelId=own order=1 excludeIds="10,20,22,23,24,25,27,29,30,31,32,33,34,35,48,49,54,57,58,59,60,61">
            <#list channels as channel>
       	 <li><span class="jh-dotted">·</span><a href="${channel.url}" target="_blank">${channel.displayName}</a></li>
            </#list>
       </@channelListDirective>
       </ol>
       
      
     
    
   
  
 