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
           
           
           
                                   <!--nav end-->
                       <div class="videochannel-floor fn-clear">
                          <div class="videosortpannel">
                                <div class="slidevideo">
                                    <div class="bd">
                                        <ul>
                                   <@videoListDirective channelId=66 pageNum=1 pageSize=8 order=2>
                                   <#list cmsVideos as cmsVideo>
                                     <li>
                                         <div class="videoitem">
                                                 <div class="vidoeitem-img"> 
                                                 <div class="view third-effect">
                                                 <img src="${cmsVideo.imageUrl}" width="230px" height="131px"/> <div class="mask">
                 <a href="${cmsVideo.url}" target="_blank" class="info" title="Full Image">Full Image</a></div></div>
                                                 
                                                 </div>
                                                <h4>${cmsVideo.name}</h4> 
                                                <p><span>${cmsVideo.count}次播放</span> <span>${cmsVideo.commentCount}次评论</span></p>
                                               <div class="videoitem-user">
                                                <#if cmsVideo.actor?length lt 6>
                                                  <span>${cmsVideo.actor}</span>
                                                <#else>
                                                  <span>${cmsVideo.actor[0..6]}</span>
                                               </#if>
                                                </div>
                                         </div>
                                     </li>  
                                     </#list>
                                   </@videoListDirective>  
                                 </ul>
                                        </div>
                                      </div>  
                                   </div>
                                   <div class="page_wrap">${pagination}</div>
                                 </div>
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
                                   
           
                                 
                                
                                  
                                  
                                   
                                  
                                 
                                
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 