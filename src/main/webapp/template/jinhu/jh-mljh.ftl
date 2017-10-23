<!DOCTYPE html>
                                 <html>
                                 <head lang="en">
                                      <#include "/template/jh-meta.ftl">
                                     <title>${site.displayName}-${channel.displayName}</title>
                                     <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                                     <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
                   		  <link href="/html/jinhu-static/css/style.wq1.css" rel="stylesheet">
                                     <!--[if lt IE 9]>
                                     <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
                                     <script src="/html/jinhu-static/js/respond.min.js"></script>
                                     <![endif]-->
                                        <style>
                   		  		.nav-tabs.navTab1 > li.active > a, .nav-tabs.navTab1 > li.active > a:hover {
           cursor: pointer;
          
       }	.nav-tabs.navTab2 > li.active > a, .nav-tabs.navTab2 > li.active > a:hover{
          cursor: pointer;
      }</style>
                                 </head>
                                 <body>
                                 <#include "/template/jh-head.ftl">
                                 <#include "/template/jh-daohang.ftl">
                                 <div class="container bg-white">
                                 
                                  	<#include "/template/jh-daohang2.ftl">
                                     <div class="jh-main">
                                         <div class="panel panel-default panel1">
                                 		<@channelDirective channelId=2><!--城市概况-->
                                 		  <div class="panel-heading panel1-t"><a href="${channel.url}" target="_blank" class="panel1-ton fontSize18">${channel.displayName}</a></div>
                                 			<div class="panel-body">
                                                 <div class="row">
                                                     <div class="col-md-5">
                                                         <span class="thumbnail thumbnails thumbnailb">
                                                             <img src="${channel.channelIcon!}" height="180px">
                                                         </span>
                                                     </div>
                                                     <div class="col-md-7">
                                                         <!-- Nav tabs -->
                                 						<@channelListDirective channelId=2 order=1>
                                 							<ul class="nav nav-tabs fontSize16 navTab1 text-center" role="tablist" id="navTab1"> 
                                 								<#list channels as channel>
                                 								 <li role="presentation" class="${(channel_index==0)?string('active','')}"><a href="#chgk${channel.id}" data-url="${channel.url}" aria-controls="#chgk${channel.id}" role="tab" data-toggle="tab">${channel.displayName}</a></li>
                                 								</#list>
                                 							</ul>
                                 							  <!-- Tab panes -->
                                 							<div class="tab-content navTab1-content pTextIndent">
                                 								<#list channels as channel>
                                 									<div role="tabpanel"   class="tab-pane ${(channel_index==0)?string('active','')}" id="chgk${channel.id}">
                                 										<div style="overflow: hidden;height: 146px;">${channel.contentText!}</div>
                                                                     <a href="${channel.url}" target="_blank"  class="navTab2-detail">【详细】</a>
                                 									</div>
                                 								</#list>
                                 							</div>  	
                                 						</@channelListDirective>
                                                     </div>
                                                 </div>
                                           </div>
                                       
                                 		</@channelDirective>
                                         <div class="row">
                                             <div class="col-md-4">
                                 		<@channelDirective channelId=11><!--生活旅游-->
                                                 <div class="panel panel-default panel2">
                                                     <div class="panel-heading panel2-t fontSize18"><a href="${channel.url}" target="_blank">${channel.displayName}</a></div>
                                                     <div class="panel-body">
                                                         <div class="row panel2-b">
                                 						<@channelListDirective channelId=channel.id order=4>
                                 							<#list channels as channel>
                                 								<div class="col-md-6 col-xs-4">
                                 									<a href="${channel.url}" target="_blank" class="thumbnail thumbnails">
                                 										<img src="/html/jinhu-static/img/shly_pic${channel_index+1}.png">
                                 									</a>
                                 								</div>
                                 							</#list>
                                 						</@channelListDirective>
                                                         </div>
                                                     </div>
                                                 </div>
                                 		</@channelDirective>
                                             </div>
                                             <div class="col-md-8">
                                 			<@channelDirective channelId=3><!--经济发展-->
                                 				<a href="${channel.url}" target="_blank" class="color-green fontSize18 pd1 dis-b">${channel.displayName}</a>
                                 				<@channelListDirective channelId=channel.id order=4>
                                                 <ul class="nav nav-tabs navTab2 text-center" role="tablist" id="navTab2">
                                 						<#list channels as channel>
                                 						 <li role="presentation" class="${(channel_index==0)?string('active','')}">
                                 						 <a href="#jjfz${channel.id}" data-url="${channel.url}"  aria-controls="#jjfz${channel.id}" role="tab" data-toggle="tab">${channel.displayName}</a>
                                 						 </li>
                                 						</#list>
                                 					</ul>
                                 					  <!-- Tab panes -->
                                 					<div class="tab-content navTab1-content pTextIndent">
                                 						<#list channels as channel>
                                 							<div role="tabpanel" class="tab-pane ${(channel_index==0)?string('active','')}" id="jjfz${channel.id}">
                                 								<div class="row">
                                 									<div class="col-xs-5">
                                 										<div class="thumbnail thumbnails thumbnailb">
                                 											<img src="${channel.channelIcon!}">
                                 										</div>
                                 									</div>
                                 									<div class="col-xs-7">
                   										<div style="overflow: hidden;height: 179px;">${channel.contentText!}</div>
                                                                     <a href="${channel.url}" target="_blank"  class="navTab2-detail">【详细】</a>
                                 										<!--${channel.contentText!}
                                 										<a href="${channel.url}" target="_blank"  class="navTab2-detail">【详细】</a>-->
                                 									</div>
                                 								</div>
                                 							</div>
                                 						</#list>
                                 					</div>  	
                                 				</@channelListDirective>
                                 			</@channelDirective>
                                             </div>
                                 	    
                                         </div>
                                         <div class="row">
                                             <div class="col-md-4 pdTop1em">
                                 			<!--城市荣誉-->
                                                 <div class="panel panel-default panel2">
                                                     <div class="panel-heading panel2-t fontSize18">城市荣誉</div>
                   				  <div class="panel-body">
                                       	<div>
                                       	<div id="m_demo">
                                           	<div id="m_demo1">
                                           		<table cellpadding="0" cellspacing="0" width="100%" border="0">
                                                   	<tbody>
                                                       	<tr>
                                                           	<td class="paddClass">
                                                               	<table cellpadding="0" cellspacing="0" width="100%" align="center"; border="0">
                                                                   	<tbody>
                   							<@contentListDirective channelId=10 pageSize=1000 pageNum=1 titleLeft=20 order=1>
                   								
                   								<#list contents as cmsContent>
                   								<tr>
                   									<td class="tdClass panel2-list"><span class="jh-dotted">·</span>${cmsContent.title}</td>
                   								</tr>
                                 							</#list> 
                                                 <#if contents?size lt 10>
                                                   <#list contents as cmsContent>
                                                     <#if (10-contents?size-cmsContent_index) gt 0> 
                   								<tr>
                   									<td class="tdClass panel2-list" style="line-height: 26.5px;"><span class="jh-dotted"> </span> </td>
                   								</tr>
                                                       </#if>
                                 							</#list> 
                                                   </#if>
                                 						</@contentListDirective>
                                                                       	
                                                                       </tbody>
                                                                   </table>
                                                               </td>
                                                           </tr>
                                                       </tbody>
                                                   </table>
                                               </div>
                                               <div id="m_demo2">
                                                    
                                                 </div>
                                 			<div id="m_demo3">
                                               </div>
                                             </div>
                   			   </div>
                                             </div>
                   			   </div>
                                             </div>
                                             <div class="col-md-8">
                                 			<@channelDirective channelId=9><!--社会事业-->
                                 				<a href="${channel.url}" target="_blank" class="color-green fontSize18 pd1 dis-b">${channel.displayName}</a>
                                 				<@channelListDirective channelId=channel.id order=4>
                                                 <ul class="nav nav-tabs navTab2 text-center navTab21" role="tablist" id="navTab3">
                                 					<#list channels as channel>
                                 						<li role="presentation" class="${(channel_index==0)?string('active','')}"><a href="#shsy${channel.id}" data-url="${channel.url}" aria-controls="#shsy${channel.id}" role="tab" data-toggle="tab">${channel.displayName}</a></li>
                                 					</#list>
                                 				</ul>
                                                 <!-- Tab panes -->
                                 				<div class="tab-content navTab1-content pTextIndent">
                                 						<#list channels as channel>
                                 							<div role="tabpanel" class="tab-pane ${(channel_index==0)?string('active','')}" id="shsy${channel.id}">
                                 								<div class="row">
                                                                <@contentListDirective channelId=channel.id pageSize=1 pageNum=pageNum titleLeft=32 order=10>
                                                                  <#list contents as cmsContent>
                                 									<div class="col-xs-5">
                                 										<div class="thumbnail thumbnails thumbnailb">
                                 											<img src="${cmsContent.titleImageUrl}">
                                 										</div>
                                 									</div>
                                 									<div class="col-xs-7">
                   										
                   										<div style="overflow: hidden;height:180px;"><p>
          	<span style="font-size:16px;">${cmsContent.brief!}</span></p></div>
                                                                     <a href="${channel.url}" target="_blank"  class="navTab2-detail">【详细】</a>
                                 										
                                 									</div>
                                                                    </#list>
                                                                  </@contentListDirective>
                                 								</div>
                                 							</div>
                                 						</#list>
                                 				</div> 
                                 				</@channelListDirective>
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
                                       
                   		      var trLen = $("#tb tr").length;
                   		if(trLen>=9){
                   			gunDong();
                   			}
                                         $('#navTab1 a').hover(function () {
                           										$(this).tab('show');
                           									      });
                           										  $('#navTab1 a').click(function () {
                           										window.open($(this).data('url'));
                           									      });
                           									      $('#navTab2 a').hover(function () {
                           										$(this).tab('show');
                           									      });
                           										  $('#navTab2 a').click(function () {
                           										window.open($(this).data('url'));
                           									      });
                           									      $('#navTab3 a').hover(function () {
                           										$(this).tab('show');
                           									      });
                           										  $('#navTab3 a').click(function () {
                           										window.open($(this).data('url'));
                           									      });
                   							
                   				
                   							
                                     });
                       		var speed = 30;
                   		var m_demo = document.getElementById("m_demo");
                   		var m_demo2 = document.getElementById("m_demo2");
                   		var m_demo1 = document.getElementById("m_demo1");
                   		var m_demo3 = document.getElementById("m_demo3");
                   		m_demo2.innerHTML = m_demo1.innerHTML;
                   		m_demo3.innerHTML = m_demo1.innerHTML;
                   		function Marquee1(){
                   			if(m_demo2.offsetHeight - m_demo.scrollTop <= 0){
                   				m_demo.scrollTop -= m_demo1.offsetHeight;
                   				}
                   			else{
                   				 m_demo.scrollTop++;
                   				}
                   			
                   			}
                   			var myVar = setInterval(Marquee1 , speed);
                   			 m_demo.onmouseover = function(){clearInterval(myVar);}
                   			  m_demo.onmouseout = function(){myVar = setInterval(Marquee1 , speed);}
                                 </script>
                                 </body>
                                 </html>
                                 
                                
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 