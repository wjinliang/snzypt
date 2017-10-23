<!DOCTYPE html>
                                       <html>
                                       <head>
                                       <meta charset="utf-8" />
                                      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
                                       <meta http-equiv="X-UA-Compatible" content="IE=edge">
                                       <title>【蓝海】信息网</title>
                                     <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
                                     <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/indexstyle.css"/>
                                     <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/publicstyle.css"/>
                               
                                      
                                          <!--ckplayer-->
                                      
                                        <script type="text/javascript"  src="${htmlFolder}/js/login.js"></script>
                                       
                                       <script type="text/javascript" src="${htmlFolder}/js/visit-record.js"></script>
                                       
                                       </head>
                                       
                                       <body>
                                       
                                       <!--topnav-->
                                       <#include "/template/head.ftl"/>
                                       <!--header end-->
                                       <!--nav-->
                                       <div class="nav fn-clear">
                                            <div class="navmain">
                                               <div class="navshop"><a href="###">海洋商城</a></div>
                                               <div class="navbar">
                                               <ul>
                                       	<li>
                                       	<a href="${site.url}">首页</a>
                                       	</li>
                                       	    <ul>
                                               <#include "/template/daohang.ftl" />    
                                               </ul></div>
                                           </div>
                                       </div>
               
                        
               
                          <div class="musicrecomm-floor">   
                          <!--音乐电台-->
                            <div class="musicradio-box fn-clear">
                                <div class="musicradio-nav">
                                    <ul class="musicradio-navlist">
                                      <@channelListDirective channelId=67 excludeIds=96>
                                      <#list channels as channel>
                                        <li>
                                           <a href="${channel.url}"><h4 class="fontblue">${channel.displayName}</h4></a>
                                        </li>
                                        </#list>
                                      </@channelListDirective>
                                    </ul>
                                </div>    
                            </div>          
                          <!--音乐内容-->
                           <div class="musicoriginal-pannel">
                             <div class="musicoriginal-title"><h2>${channel.displayName}</h2></div>
                                   <div class="musicoriginal-list">
                                     <ul>
                                    <@audioListDirective channelId=own pageNum=1 pageSize=10>
                                     <#list cmsAudios as cmsAudio>
                                        <li style="width:1000px;"><a style="left:220px;" href="${cmsAudio.url}" class="name">${cmsAudio.name}</a><h4>${cmsAudio.singer}</h4><font style="left:480px;">${cmsAudio.count}次播放</font><span style="left:680px"><em>${cmsAudio.commentCount}次评论</em></span><font style="left:840px;">${cmsAudio.publishDate?string("yyyy-MM-dd")}</font></li>
                                      </#list>
                                     </@audioListDirective>   
                                     </ul>
                                  </div>
                               </div>                                     
                             </div>
                             <div id="pagination" style="text-align:center">${pagination}</div>   
                               </body>
                                       
                                       <!-- Main end-->
                                       <div class="blank_20"></div>
                                       <!--!footer-->
                                       <#include "/template/foot.ftl" />
                                       <!--!footer end-->
            
                                       
                                       
                                       
                                       
                                       <!--[if lte IE 8]>
                                       <script src="/js/ieBetter.js"></script>
                                       <![endif]-->
                                       
                                       
                                       <!--                       Javascripts 注意不要改变顺序                      -->
                                       
               
                                     
                                    
                                      
                                       
                                       </html>
                                       
                                      
                                     
                                    
                                   
                                  
                                 
                                
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 