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
                               	.row .ggfw-cycx2 .ggfw-btn {
       height: 30.38px;
       overflow: hidden;
   }
                               </style>
                         </head>
                         <body>
                         <#include "/template/jh-head.ftl">
                         <#include "/template/jh-daohang.ftl">
                         <div class="container bg-white">
                          <#include "/template/jh-daohang2.ftl">
                             <div class="jh-main">
                                 <div class="panel panel-default panel1">
                         	<@channelDirective channelId=38>
                                     <div class="panel-heading panel1-t"><a href="${channel.url!}" target="_blank" class="panel1-ton fontSize18">${channel.displayName}</a></div>
                         	</@channelDirective  >
                                     <iframe src="http://222.184.56.249:8088/hawbsprj/jhxq.do" width="100%" height="381px" frameborder="0"></iframe>
                                 </div>
                                 <div class="row text-center fontSize16">
                                     <div class="col-md-4">
                                         <div class="ggfw-list-bg">
                                           <@channelDirective channelId=40>
                       
                                           <a href="${channel.url}" target="_blank" style="color:white;">
                                             <div class="ggfw-list-bg1">
                                              ${channel.displayName}
                                             </div>
                                             </a>
                       </@channelDirective>
                                         </div>
                                     </div>
                                     <div class="col-md-8 pdTop1em">
                                         <div class="ggfw-list-bg">
                                             <div class="row">
                                                <@channelDirective channelId=39>
                                              
                                                 <div class="col-xs-3">
                                                   <a href="${channel.url}" target="_blank" style="color:white;">
                                                     <div class="ggfw-list-bg1">
                                                        ${channel.displayName}<!-- 五项清单-->
                                                     </div>
                                                     </a>
                                                 </div>
                                                 <div class="col-xs-9 fontSize14">
                                                     <div class="row ggfw-list-pd">
                                                       <@channelListDirective channelId =channel.id >
                                                         <#list channels as channel>
                                                           <div class="col-xs-6 col-md-3">
                                                             <a target="_blank"  href="${channel.url}">${channel.displayName}</a>
                                                         </div>
                                                           </#list>
                       </@channelListDirective>
                                                         
                                                     </div>
                                                 </div>
                                                  </@channelDirective>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                              <div class="row mgt20">
    				<div class="col-md-9">
                               <@channelDirective channelId=41>
                                 <a href="${channel.url}" target="_blank">
                                 <div class="color-green fontSize18 pd5 dis-b">${channel.displayName}</div></a>
                                 </@channelDirective>
    			     <div class="clearfix zwgk-mgb1">
    			     <@channelListDirective channelId=41 >
    			     <#list channels as cmsChannel>
    					 <div class="col-xs-3 col-md-2">
    					<a href="${cmsChannel.url!}" target="_blank" class="thumbnail thumbnails text-left">
    					    <img src="${cmsChannel.channelIcon!}">
    					</a>
    				    </div>
    				</#list>
    			     </@channelListDirective>
    				    <a href="${channel.url}" target="_blank">
                                </div>
                                         <div class="borderTopDotted borderTopDotted1 clearfix">
                         			<@channelDirective channelId=44> 
                                             <div class="col-sm-2 ggfw-cycx1 box-center color-green">
                                               <div><span class="ggfw-cycx1-circle"><span class="glyphicon glyphicon-search"></span></span> <span>常用查询</span></div>
                                                                                   </div></a></@channelDirective>
                                                                                   <div class="col-sm-10 ggfw-cycx2">
                                                                                       <div class="row ggfw-btn-pd ggfw-btn-pd1 text-center">
                                                                                           <@contentListDirective channelId=44 pageSize=12 pageNum=1><#list contents as content><div class="col-xs-4 col-md-2">
                                                                                                          <a title="${content.title!}" href="${content.url!}" target="_blank" class="ggfw-btn">${content.title!}</a>
                                                                                                      </div>
                                                                                                        	
                                                                                                        </#list></@contentListDirective>
                                                <!-- <div><span class="ggfw-cycx1-circle"><span class="glyphicon glyphicon-search"></span></span> <span>常用查询</span></div>
                                             </div>
                                             <div class="col-sm-10 ggfw-cycx2">
                                                 <div class="row ggfw-btn-pd ggfw-btn-pd1 text-center">
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">便民电话</a>
                                                     </div>
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">公积金查询</a>
                                                     </div>
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">车辆违章</a>
                                                     </div>
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">供电信息</a>
                                                     </div>
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">城乡养老</a>
                                                     </div>
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">IP专属</a>
                                                     </div>
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">话费查询</a>
                                                     </div>
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">公路客运</a>
                                                     </div>
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">人才招牌</a>
                                                     </div>
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">社会保障</a>
                                                     </div>
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">火车时刻</a>
                                                     </div>
                                                     <div class="col-xs-4 col-md-2">
                                                         <a href="#" class="ggfw-btn">天气预报</a>
                                                     </div>-->
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="col-md-3 pdTop1em">
                                         <div class="panel panel-default panel2">
                         		<@channelDirective channelId=43>
                                             <div class="panel-heading panel2-t fontSize18"><a href="${channel.url}" target="_blank" >${channel.displayName}</a></div>
                                             <div class="panel-body">
                                                 <ul class="panel2-list panel2-list-sm">
                         			<@contentListDirective channelId=channel.id pageSize=5 titleLeft=18>
                         			<#list contents as content>
                                                     <li><a target="_blank" href="${content.url}" target="_blank" title="${content.title!}" >${content.title}</a></li> 
                         			</#list>
                         			</@contentListDirective>
                                                 </ul>
                                             </div>
                         		</@channelDirective >
                                         </div>
                         		<@channelDirective channelId=42>
                                         <div class="color-green fontSize18 pd2 dis-b"><a target="_blank"  href="${channel.url!}" class="color-green">${channel.displayName}</a></div>
                                         <div class="row ggfw-lstd-pd">
                         		<@channelListDirective channelId=channel.id>
                         		<#list channels as cchannel>
                                             <div class="col-xs-3">
                                                 <a href="${cchannel.url} " target="_blank" class="thumbnail thumbnails text-center">
                                                     <img src="${cchannel.channelIcon!}">
                                                     <p>${cchannel.displayName}</p>
                                                 </a>
                                             </div>
                         		   </#list>
                         		   </@channelListDirective>
                                         </div>
                         		</@channelDirective>
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
                         	
                                 $('.ggfw-navTab1-content').height($('.navTab5').height()-1);
                                 $('.ggfw-cycx1').height($('.ggfw-cycx2').height()-1);
                                 $(window).resize(function() {
                                     $('.ggfw-navTab1-content').height($('.navTab5').height()-1);
                                     $('.ggfw-cycx1').height($('.ggfw-cycx2').height()-1);
                                 });
                             });
                         </script>
                         </body>
                         </html>
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 