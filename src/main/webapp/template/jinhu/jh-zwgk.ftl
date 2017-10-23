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
                                               
                                         <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
                                            <script type="text/javascript" src="/html/jinhu-static/js/leader.js"></script>
                                               <style type="text/css">
                                                 .jh-main .zwgk_leader_name{display:inline-block; padding:0.3em 0.6em; font-size:16px; margin-right:0.5em;}
                                              </style>
                                         </head>
                                         <body>
                                         <#include "/template/jh-head.ftl">
                                         <#include "/template/jh-daohang.ftl">
                                         <div class="container bg-white">
                                           <ol class="breadcrumb fontSize14 jh-breadcrumb jh-breadcrumbn">
                                           <@channelListDirective channelId=own order=1 excludeIds="20,21,22,23,24,25,27,29,30,31,32,33,34,35,48,49,54,57,58,59,60,61">
                                                <#list channels as channel>
                                              <li><span class="jh-dotted">·</span><a href="${channel.url}" target="_blank">${channel.displayName}</a></li>
                                                </#list>
                                           </@channelListDirective>
                                            <@channelListDirective channelId=26 order=1 excludeIds="85">
                                                <#list channels as channel>
                                              <li><span class="jh-dotted">·</span><a href="${channel.url}" target="_blank">${channel.displayName}</a></li>
                                                </#list>
                                           </@channelListDirective>
                                           </ol>
                                             <div class="jh-main">
                                                 <div class="row">
                                                     <div class="col-md-4">
                                                         <div class="panel panel-default panel2">
                                                           <@channelDirective channelId=20>
                                                             <div class="panel-heading panel2-t fontSize18"><a href="${channel.url!}" target="_blank"> ${channel.displayName}</a></div></@channelDirective>
                                                             <div class="panel-body">
                                                               
                                                               <div class="panel_l panel-default panel1">
                                                                <div class="panel-heading panel1-t"style="border-top: #d3d3d3 solid 1px; border-right: #d3d3d3 solid 1px;" id="leader_1"><a href="javascript:void(0)" class="panel1-ton fontSize18">县&nbsp;&nbsp;&nbsp;&nbsp;委</a></div>
              
                                                                <ul class="list-group zwgk-list-group fontSize12" id="leader_pad_1" style="display:block; margin-bottom:5px;"><@leaderListDirective pageNum=1 pageSize=20 org="县委">
                                                              <#list leaders as leader>
                                                              <li class="list-group-item">
                                                                <div class="zwgk-list-c"><a href="${channel.url!}?param=${leader.id}" target="_blank" title="${leader.name}"><span class="zwgk_leader_name">${leader.name}</span></a>${leader.occupation}</div></li>
                                                              </#list>
                                                              </@leaderListDirective>
                                                                </ul>
                                                             </div>
                                                                <div class="panel_l panel-default panel1">
                                                                <div class="panel-heading panel1-t"style="border-top: #d3d3d3 solid 1px; border-right: #d3d3d3 solid 1px;" id="leader_2"><a href="javascript:void(0)" class="panel1-ton fontSize18">县人大</a></div>
              
                                                                <ul class="list-group zwgk-list-group fontSize12" id="leader_pad_2" style="display:none; margin-bottom:5px;"><@leaderListDirective pageNum=1 pageSize=20 org="县人大">
                                                              <#list leaders as leader>
                                                              <li class="list-group-item">
                                                                <div class="zwgk-list-c"><a href="${channel.url!}?param=${leader.id}" target="_blank" title="${leader.name}"><span class="zwgk_leader_name">${leader.name}</span></a>${leader.occupation}</div></li>
                                                              </#list>
                                                              </@leaderListDirective>
                                                                </ul>
                                                             </div>
                                                                <div class="panel_l panel-default panel1">
                                                                <div class="panel-heading panel1-t"style="border-top: #d3d3d3 solid 1px; border-right: #d3d3d3 solid 1px;" id="leader_3"><a href="javascript:void(0)" class="panel1-ton fontSize18">县政府</a></div>
              
                                                                <ul class="list-group zwgk-list-group fontSize12" id="leader_pad_3" style="display:none; margin-bottom:5px;"><@leaderListDirective pageNum=1 pageSize=20 org="县政府">
                                                              <#list leaders as leader>
                                                              <li class="list-group-item">
                                                                <div class="zwgk-list-c"><a href="${channel.url!}?param=${leader.id}" target="_blank" title="${leader.name}"><span class="zwgk_leader_name">${leader.name}</span></a>${leader.occupation}</div></li>
                                                              </#list>
                                                              </@leaderListDirective>
                                                                </ul>
                                                             </div> 
                                                                <div class="panel_l panel-default panel1 pdb20">
                                                                <div class="panel-heading panel1-t"style="border-top: #d3d3d3 solid 1px; border-right: #d3d3d3 solid 1px;" id="leader_4"><a href="javascript:void(0)" class="panel1-ton fontSize18">县政协</a></div>
              
                                                                <ul class="list-group zwgk-list-group fontSize12" id="leader_pad_4" style="display:none; margin-bottom:5px;"><@leaderListDirective pageNum=1 pageSize=20 org="县政协">
                                                              <#list leaders as leader>
                                                              <li class="list-group-item">
                                                                <div class="zwgk-list-c"><a href="${channel.url!}?param=${leader.id}" target="_blank" title="${leader.name}"><span class="zwgk_leader_name">${leader.name}</span></a>${leader.occupation}</div></li>
                                                              </#list>
                                                              </@leaderListDirective>
                                                                </ul>
                                                             </div>
                                                               
                                                               
                                                                 <div class="thumbnail thumbnails">
                                                                   <@channelDirective channelId=21>
                                                                             <!--部门负责人-->
                                                                     <a  href="${channel.url}" target="_blank"><img src="/html/jinhu-static/img/zwgk_xzf.png"></a>
                                                                     </@channelDirective>
                                                                 </div>
                                                             </div>
                                                         </div>
                                                         <div class="panel panel-default panel2">
                                                            <div class="panel-heading panel2-t panel2-t1 fontSize18">政府信息公开专栏</div>
                                                                 <div class="panel-body">
                                                                     <div class="zwgk-alink-c">
                                                                         <div class="col-xs-6 col-md-12 col-lg-6">
                                                                             <@channelDirective channelId=22>
                                                                               <a href="${channel.url}"  target="_blank" class="zwgk-alink">${channel.displayName}</a><!--政府信息公开指南-->
                                     
                                  </@channelDirective>
                                  
                                                                             
                                                                         </div>
                                                                         <div class="col-xs-6 col-md-12 col-lg-6">
                                                                           <@channelDirective channelId=23>
                                                                               <a href="${channel.url}"  target="_blank" class="zwgk-alink">${channel.displayName}</a><!--政府信息公开制度-->
                                     
                                  </@channelDirective>
                                                                         </div>
                                                                         <div class="col-xs-6 col-md-12 col-lg-6">
                                                                           <@channelDirective channelId=24>
                                                                               <a href="${channel.url}"  target="_blank" class="zwgk-alink">${channel.displayName}</a><!--政府信息公开年报-->
                                     
                                  </@channelDirective>
                                                                         </div>
                                                                         <div class="col-xs-6 col-md-12 col-lg-6">
                                                                           <@channelDirective channelId=25>
                                                                               <a href="${channel.url}"  target="_blank" class="zwgk-alink">${channel.displayName}</a><!--依申请公开-->
                                     
                                  </@channelDirective>
                                                                         </div>
                                                                         <div class="col-xs-12">
                                                                           <@channelDirective channelId=27>
                                                                               <a href="${channel.url}"  target="_blank" class="zwgk-alink">${channel.displayName}</a><!--政府信息公开工作意见箱-->
                                     
                                  </@channelDirective>
                                                                         </div>
                                                                     </div>
                                                                     <div class="clearfix">
                                                                       <@channelDirective channelId=26>
                                                                               <a href="${channel.url}"  target="_blank" class="color-green fontSize16 pd2 dis-b">${channel.displayName}</a><!--政府信息公开目录-->
                                     
                                  </@channelDirective>
                                                                       
                                                                         <ul class="panel2-list">
                                                                           <@channelDirective channelId=85>
                                                                             <li><span class="jh-dotted">·</span><a href="${channel.url}"  target="_blank">${channel.displayName}</a></li>  
                                                                             <!--县政府信息公开目录-->
                                     
                                  </@channelDirective>
                                                                           <@channelDirective channelId=86>
                                                                             <li><span class="jh-dotted">·</span><a href="${channel.url}"  target="_blank">${channel.displayName}</a></li>  
                                                                             <!--县级部门政府信息公开目录-->
                                     
                                  </@channelDirective>
                                                                           <@channelDirective channelId=87>
                                                                             <li><span class="jh-dotted">·</span><a href="${channel.url}" target="_blank">${channel.displayName}</a></li>  
                                                                             <!--镇信息公开目录-->
                                     
                                  </@channelDirective>
                                                                     </ul>
                                                                 </div>
                                                             </div>
                                                         </div>
                                                         <div class="text-center">
                                                           <@channelListDirective channelId=5 order=1 excludeIds="20,21,22,23,24,25,26,27,28,29">
                                                             
                                                             <div class="row zwgk-pd">
                                           		<#list channels as channel>
                                                   <#if channel_index=4> </div>
                                                            <div class="row zwgk-pd">
                                                              </#if>
                                           		     <div class="col-xs-3 col-md-6 col-lg-3">
                                                         
                                                                   <a href="${channel.url}"  target="_blank" class="btn btn-link" style="padding:6px  0">
                                                                      ${channel.displayName}
                                                                   </a>
                                                               </div>
                                           		</#list >
                                                             </div>
                                           		</@channelListDirective> 
                                                                
                                                         </div>
                                                     </div>
                                                     <div class="col-md-8">
                                                         <div class="panel panel-default panel1">
                                                           <@channelDirective channelId=29>
                                                        <div class="panel-heading panel1-t"><a target="_blank" href="${channel.url!}" class="panel1-ton fontSize18">${channel.displayName}</a></div>
                             			   </@channelDirective>
                                                        <div class="panel-body">
                                                            <table class="table table-bordered table-hover table1 text-center">
                                                                <thead>
                                                                <tr>
                                                                    <th>索引号</th>
                                                                    <th>信息名称</th>
                                                                    <th>文件编号</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                               <@pubDocListDirective channelId=29 pageSize=8 pageNum=1>
                             				  <#list docs as doc>
                                                               <tr>
                                                                   <td>${doc.syh!}</td>
                                                                   <td><a href="${doc.url!}" target="_blank">${doc.title!}</a></td>
                                                                   <td>${doc.infoCode!}</td>
                                                               </tr>
                             				  </#list>
                             				  </@pubDocListDirective>
                                                                     </tbody>
                                                                 </table>
                                                             </div>
                                                         </div>
                                         		<@channelDirective channelId=28 >
                                                         <div class="color-green fontSize18 pd3 dis-b"><a href="${channel.url!}" target="_blank" class="color-green">${channel.displayName}</a></div>
                                         		<div class="row zwgk-mgb">
                 					<@channelListDirective channelId=28 >
                 					<#list channels as chan>
                 						    <div class="col-xs-3">
                 							<a href="${chan.url}" target="_blank" class="thumbnail thumbnails text-center">
                 							    <img src="/html/jinhu-static/img/zwgk_${chan.enName!}_icon.png">
                 							    <p>${chan.displayName!}</p>
                 							</a>
                 						    </div>
                 					    </#list>
                 					    </@channelListDirective>
                 					    </div>
                                         	    </@channelDirective >
                                                       <!--<iframe src="http://xxgk.jinhu.gov.cn:8180/zwgk/open/publicshow/searchArticle.do?method=getZfxxgkznzdnb&type=zn&id=215&dept=szf" width="100%" height="362" frameborder="0"></iframe>-->
                                                 </div>   
                                                 </div>
                                             </div>
                                            <#include "/template/jh-links.ftl">
                                         </div>
                                          <#include "/template/jh-footer.ftl">
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
                                               var leader_1 = $("#leader_1");
        	
                                         </script>
                                         </body>
                                         </html>
                                         
                                        
                                       
                                      
                                     
                                    
                                   
                                  
                                 
                                
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 