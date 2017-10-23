    <@channelListDirective siteId=2 excludeIds="25" order=1>
                         	     <#list channels as channel>
                         	       <li>
                         			      <a href="${channel.url}" class='${(channel.id==own)?string("navcurrent","")}'>${channel.displayName}</a>
                         	       </li>
                         	     </#list>
              </@channelListDirective> 
          
         
        
       
      
     
    
   
  
 