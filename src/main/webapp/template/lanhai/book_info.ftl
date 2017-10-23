<!DOCTYPE html>
                          <html>
                          <head>
                          <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                          <meta http-equiv="X-UA-Compatible" content="IE=edge">
                          <title>【蓝海】信息网</title>
                          <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
                          <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/indexstyle.css"/>
                          <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/publicstyle.css"/>
                          <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/self.css"/>
                          <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/orbit.other.css"/>
                          <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
                          <script type="text/javascript" src="${htmlFolder}/js/jquery-migrate-1.1.1.min.js"></script>
                          <!-- 焦点图 -->
                          <script type="text/javascript" src="${htmlFolder}/js/login.js"></script>
                           <script type="text/javascript" src="${htmlFolder}/js/visit-record.js"></script>
                          <script type="text/javascript" src="${htmlFolder}/js/jquery.orbit.min.js"></script>
                         
                           <style>
                             #bookscroll img{
                                width:660px;
                                height: 360px;
                             }
                             .bookgood-main img{
                              width:75px;
                              height: 95px；
                             }
                             .bookrecom-main img{
                              width:95px;
                              height: 120px;
                             }
                             .booknew-main img{
                              width:128px;
                              height: 165px;
                             }
                             .book-main img{
                               width:400px;
                              height: 300px;
                             }
           
                           </style>
            
                          </head>
                          
                          <body>
                          <#include "/template/head.ftl"/>
                          <div class="nav fn-clear">
                               <div class="navmain">
                                  <div class="navshop"><a href="###">海洋商城</a></div>
                                     <div class="navbar">
                                        <ul>
                                           <li><a href="${site.url}" >首页</a></li>
                                               <#include "/template/daohang.ftl"/>
                                         </ul></div>
                                     </div>
                            </div>
                          <div class="blank_20"></div>
                   <div class="bookchannel-floor fn-clear">
                   <div class="bookleftwrap">
                       <div class="bookclassify">
                        <h4>小说分类</h4> 
                        <ul>
                          <@channelListDirective channelId=68 order=1>
                          <#list channels as channel>
                           <li class=" bgwither"><a href="${channel.url}">${channel.displayName}</a></li>
                           </#list>
                          </@channelListDirective>
                        </ul>
                     </div>
                   </div>
                   <div class="bookrightwrap">
                       <div class="bookrecom">
                          
                              <div class="book-main">
                            <img src="${cmsNovel.imageUrl}" />
                           <@novelDirective novelId=own>             
                      		  <h4>分类：${cmsNovel.type?default('')}</h4>
                                        <h3>${cmsNovel.name}</h3>
                                          <span>作者：${cmsNovel.author}</span>
                       		   <p>更新时间：${cmsNovel.updateTime?string("yyyy-MM-dd HH:mm:ss")}</p>
                        		  <h5>简介</h5>
                        		  <em>${cmsNovel.introduce?default('')} </em>
                             <#list files as file>
                       		      <a href="${file.attachmentUrl}" >${file.attachmentName}-下载</a>
                             </#list>    
                            </@novelDirective>  
                   </div> 
                 
                </div>
             </div>
             <div class="blank_20"></div>      
             <#include "/template/comment.ftl"/>  
             <div class="blank_20"></div>  
             </div>    
             <#include "/template/foot.ftl" />
                                              
              <!--!footer end-->
              </body>
              <!--                       Javascripts 注意不要改变顺序                      -->
 
              <script type="text/javascript">
              $(window).load(function() {
                $('#bookscroll').orbit({
                  bullets : true,
                  startClockOnMouseOut : true,
                  captionAnimation : 'slideOpen'
                });
              });
              </script>
             
              <!-- 右侧栏 -->
              <script type="text/javascript">
                $(".quick_links_panel li").mouseenter(function(){
                  $(this).children(".mp_tooltip").animate({left:-92,queue:true});
                  $(this).children(".mp_tooltip").css("visibility","visible");
                  $(this).children(".ibar_login_box").css("display","block");
                });
                $(".quick_links_panel li").mouseleave(function(){
                  $(this).children(".mp_tooltip").css("visibility","hidden");
                  $(this).children(".mp_tooltip").animate({left:-121,queue:true});
                  $(this).children(".ibar_login_box").css("display","none");
                });
                $(".quick_toggle li").mouseover(function(){
                  $(this).children(".mp_qrcode").show();
                });
                $(".quick_toggle li").mouseleave(function(){
                  $(this).children(".mp_qrcode").hide();
                });
                </script>
              </html>
              
             
            
           
          
         
        
       
      
     
    
   
  
 