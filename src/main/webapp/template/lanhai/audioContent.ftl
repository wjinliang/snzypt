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
                           
                                   <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/self.css"/>
                                      <!--ckplayer-->
                                   <link href="${htmlFolder}/plugins/jkplayer/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" />
                                    <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
                                   <script type="text/javascript" src="${htmlFolder}/plugins/jkplayer/jplayer/jquery.jplayer.min.js"></script>
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
                                   <!-- Main -->
                             <div id="main-wrap">
                               <div id="container">
                                 <div class="contentwrap" style="margin:50px">
                                   <div id="jquery_jplayer_1" class="jp-jplayer"></div>
                                               <div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
                                                 <div class="jp-type-single">
                                                   <div class="jp-gui jp-interface">
                                                     <div class="jp-controls">
                                                       <button class="jp-play" role="button" tabindex="0">play</button>
                                                       <button class="jp-stop" role="button" tabindex="0">stop</button>
                                                     </div>
                                                     <div class="jp-progress">
                                                       <div class="jp-seek-bar">
                                                         <div class="jp-play-bar"></div>
                                                       </div>
                                                     </div>
                                                     <div class="jp-volume-controls">
                                                       <button class="jp-mute" role="button" tabindex="0">mute</button>
                                                       <button class="jp-volume-max" role="button" tabindex="0">max volume</button>
                                                       <div class="jp-volume-bar">
                                                         <div class="jp-volume-bar-value"></div>
                                                       </div>
                                                     </div>
                                                     <div class="jp-time-holder">
                                                       <div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
                                                       <div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
                                                       <div class="jp-toggles">
                                                         <button class="jp-repeat" role="button" tabindex="0">repeat</button>
                                                       </div>
                                                     </div>
                                                   </div>
                                                   <div class="jp-details">
                                                     <div class="jp-title" aria-label="title">&nbsp;</div>
                                                   </div>
                                                   <div class="jp-no-solution">
                                                     <span>Update Required</span>
                                                     To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                                                   </div>
                                                 </div>
                                               </div>
                                           <div><a href="${cmsAudio.audioUrl?default('')}" target="_blank">下载</a></div>
                                           <div>${cmsAudio.lyrc?default('')}</div>
                                            
                                      </div>
                                  <#include "/template/comment.ftl"/>  
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
                                   
           
                                 
                                
                                  
                                   <script type="text/javascript">
                                   $(document).ready(function(){
                                      $("#jquery_jplayer_1").jPlayer({
                                           ready: function (event) {
                                             $(this).jPlayer("setMedia", {
                                               title: "${cmsAudio.name}",
                                               m4a: "${cmsAudio.audioUrl}",
                                               oga: "${cmsAudio.audioUrl}"
                                             });
                                           },
                                           swfPath: "${htmlFolder}/plugins/jkplayer/jplayer",
                                           supplied: "m4a, oga",
                                           wmode: "window",
                                           useStateClassSkin: true,
                                           autoBlur: false,
                                           smoothPlayBar: true,
                                           keyEnabled: true,
                                           remainingDuration: true,
                                           toggleDuration: true
                                         });
                                       });   
                                         </script>
                                   </html>
                                   
                                  
                                 
                                
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 