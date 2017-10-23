<!DOCTYPE html>
              <html>
              <head lang="en">
                  <#include "/template/jh-meta.ftl">
                  <title>${site.displayName!}-${channel.displayName!}</title>
                  <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                  <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
                  <!--[if lt IE 9]>
                  <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
                  <script src="/html/jinhu-static/js/respond.min.js"></script>
                  <![endif]-->
                  <style type="text/css">
              		.zxzj-pic-bg{height:125px; background:url(/html/jinhu-static/img/bgwzqd.png) no-repeat left 12px top;}
              		.zxzj-pic-bg ul li{ text-align:center;}
              		.wzqd-ft-bg{margin:0 0 2em 0; height:1em; background:#990000;}
              		.addft{ background:#f0f0f0}
                    .ft-bg {
                                margin: 2.5em 0 3em 0;
                                background-color: #97040c;
                                height: 1em;
                                border-bottom: 3px solid #6B0019;
                            }
                    .ft { background-color: #f0f0f0;} 
                    .mgb20 {margin-bottom: 20px;}
              	</style>
              </head>
              <body class="wxqd-bg-white">
                  <div class="wxqd-bg">
                      <div class="wxqd-logo">
                          <span class="thumbnail thumbnails">
                              <img src="/html/jinhu-static/img/wxqd_logo.png">
                          </span>
                      </div>
              		<div class="container text-center fontSize18">
                   	  <@channelListDirective channelId=own>
                           <div class="row wxqd-red mgb20">
                               <div class="col-md-11">
                                   <div class="row">
                   					<#list channels as cha>
              							<#if (cha_index lt 4)>
              								 <div class="col-xs-6 col-md-3">
              									 <a href="${cha.url!}" class="wxqd-nav color-red1">${cha.displayName!}</a>
              								 </div>
              							</#if>
                   					</#list>
                                   </div>
                               </div>
                           </div>
                           <div class="row wxqd-red">
                   			<#list channels as cha>
                   				<#if (cha_index gte 4)>
                   				<div class="${(cha_index%3==1)?string('col-md-offset-1','')} col-xs-6 col-md-3">
                   					<a href="${cha.url!}" class="wxqd-nav color-red1">${cha.displayName!}</a>
                   				</div>
                   				</#if>
                   			</#list>
                           </div>
                   	  </@channelListDirective>
                      </div>
                  </div>
                  <div class="container">
                     <#include "/template/jh-rdzt-current.ftl">
                      <div class="jh-main color-oldgray">
                          <div class="row mgb20">
                              <div class="col-md-4">
              				    <!--五张清单公布说明-->
              					  <@channelDirective channelId=111>
              						<div class="pdb20">
              							   <a href="${channel.url}" target="_blank">
              								<div class="wxqd-pic-bg">
              									<div class="wxqd-pic fontSize18">
              										${channel.displayName!}
              									</div>
              								</div>
              							   </a>
              						</div>
              					  </@channelDirective>
              					   <!--行政权责-->	
              						<@channelDirective channelId=115>
                                     
              						   <div class="wxqd-panel pdb20">
              									<div class="wxqd-panel-t wxqd-red">
              										<a href="${channel.url!}"  target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span> </a>
              										<div class="wxqd-panel-tw"></div>
              									</div>
              									<div class="wxqd-panel-c2 bg-red">
              										<@channelListDirective channelId=channel.id pageSize=5>
              											<#list channels as chan>
     											  <#if (chan_index lt 3)>
     											    <div class="wxqd-panel-bg bg-white mgb20"><a href="${chan.url!}" target="_blank">${chan.displayName!}</a></div>
     											  </#if>
     											  <#if (chan_index gte 3)>
     											    <div class="wxqd-panel-bg bg-white"><a href="${chan.url!}" target="_blank">${chan.displayName!}</a></div>
     											  </#if>
     											</#list>
              										</@channelListDirective>
              									</div>
              							</div>		
                   					</@channelDirective>
                  				
                                  <!--专项资金-->	
              						<@channelDirective channelId=118>	
              						   <div class="wxqd-panel">
              								<div class="zxzj-pic-bg">
              									<div class="wxqd-panel-t wxqd-red">
              										<a href="${channel.url!}" target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span></a>
              										<div class="wxqd-panel-tw"></div>
              									</div>
              									<div class="wxqd-panel-c wxqd-panel-cpd">
              										<@contentListDirective channelId=channel.id pageSize=5 titleLeft=17 order=2>
              											<ul class="panel2-list panel2-list-pds wxqd-red">
              												<#list contents as content>
              												  <li><span class="jh-dotted color-oldgray">·</span><a href="${content.url!}" title="${content.title!}" target="_blank"><span class="panel2-list-content">${content.shortTitle!}</span></a></li>
              												</#list>
              											</ul>
              										</@contentListDirective>
              									</div>
              								</div>
              							</div>
                   					</@channelDirective>
                              </div>
                              
                              <div class="col-md-8 pdTop1em">
                              	<!--行政审批事项-->
              				  <@channelDirective channelId=114>
                                  <div class="wxqd-panel pdb20">
                                      <div class="wxqd-panel-t wxqd-red">
                                          <a href="${channel.url!}" target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span> </a>
                                          <div class="wxqd-panel-tw"></div>
                                      </div>
                                      <div class="wxqd-panel-c bg-white" style="height:183px;">
                                          <@contentListDirective channelId=channel.id pageSize=5 order=2 titleLeft=35>
              								 <ul class="panel2-list panel2-list-pds wxqd-red">
              									<#list contents as content>
              									  <li><span class="jh-dotted color-oldgray">·</span><a title="${content.title!}" href="${content.url!}" target="_blank"><span class="panel2-list-content">${content.shortTitle!}</span><span class="panel2-list-time">${content.publishDate?string('yyyy-MM-dd')}</span></a></li>
              									</#list>
              								</ul>
              							</@contentListDirective>
                                      </div>
                                  </div>
                                </@channelDirective>
                                  <!--行政行业收费-->
              					<@channelDirective channelId=119>
                                  <div class="wxqd-panel pdb20">
                                      <div class="wxqd-panel-t wxqd-red">
                                          <a href="${channel.url!}" target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span> </a>
                                          <div class="wxqd-panel-tw"></div>
                                      </div>
                                      <div class="wxqd-panel-c bg-white" style="height:85px;">
                                          <@contentListDirective channelId=channel.id pageSize=5 titleLeft=35 order=2>
              								 <ul class="panel2-list panel2-list-pds wxqd-red">
              									<#list contents as content>
              									   <li><span class="jh-dotted color-oldgray">·</span><a title="${content.title!}" href="${content.url!}" target="_blank"><span class="panel2-list-content">${content.shortTitle!}</span><span class="panel2-list-time">${content.publishDate?string('yyyy-MM-dd')}</span></a></li>
              									</#list>
              								</ul>
              							</@contentListDirective>
                                      </div>
                                  </div>
              					</@channelDirective>
              					 <!--乡镇职责清单-->
              					<@channelDirective channelId=120>
                                  <div class="wxqd-panel pdb20">
                  					<div class="wxqd-panel-t wxqd-red">
                  						<a href="${channel.url!}" target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span></a>
                  							<div class="wxqd-panel-tw"></div>
                  					</div>
                  
                  					<div class="wxqd-panel-c bg-white wxqd-panel-cpd" style="height:85px;">
                  						<@contentListDirective channelId=channel.id pageSize=5 titleLeft=24 order=2>
              								 <ul class="panel2-list panel2-list-pds wxqd-red">
              									<#list contents as content>
              									 <li><span class="jh-dotted color-oldgray">·</span><a title="${content.title!}" href="${content.url!}" target="_blank"><span class="panel2-list-content">${content.shortTitle!}</span><span class="panel2-list-time">${content.publishDate?string('yyyy-MM-dd')}</span></a></li>
              									</#list>
              								</ul>
              							</@contentListDirective>
                  					</div>
                  				</div>
              					</@channelDirective>
                                  <!--项目申报-->
              					<@channelDirective channelId=117>
              						<div class="wxqd-panel">
              							<div class="wxqd-panel-t wxqd-red">
              								<a href="${channel.url!}" target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span></a>
              									<div class="wxqd-panel-tw"></div>
              							</div>
              							<div class="wxqd-panel-c bg-white wxqd-panel-cpd" style="height:85px;">
              								<@contentListDirective channelId=channel.id pageSize=5 titleLeft=24 order=2>
              									 <ul class="panel2-list panel2-list-pds wxqd-red">
              										<#list contents as content>
              										  <li><span class="jh-dotted color-oldgray">·</span><a title="${content.title!}" href="${content.url!}" target="_blank"><span class="panel2-list-content">${content.shortTitle!}</span><span class="panel2-list-time">${content.publishDate?string('yyyy-MM-dd')}</span></a></li>
              										</#list>
              									</ul>
              								</@contentListDirective>
              							</div>
              						</div>
              					</@channelDirective>
                              </div>
                          </div>
                  	</div>
                 </div>  
              </div>
               <#include "jh-footer.ftl">  
                  <script type="text/javascript" src="/html/jinhu-static/js/visit-record.js"></script>  
                	<script type="text/javascript" src="/html/jinhu-static/js/search-jinhu.js"></script>  
                  <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
                  <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
                  <script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
                  <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
                  <script type="text/javascript">
                      $(function () {
                          $('input, textarea').placeholder();
                      });
                  </script>
               
              </body>
              </html>
              
             
            
           
          
         
        
       
      
     
    
   
  
 