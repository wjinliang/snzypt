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
                                  <link href="${htmlFolder}/plugins/jkplayer/skin/pink.flag/css/jplayer.pink.flag.min.css" rel="stylesheet" type="text/css" />
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
                                  <h2>${cmsAudio.name}</h2>
                                  <div id="jp_container_1" class="jp-video jp-video-360p" role="application" aria-label="media player">
                                            <div class="jp-type-single">
                                              <div id="jquery_jplayer_1" class="jp-jplayer"></div>
                                              <div class="jp-gui">
                                                <div class="jp-video-play">
                                                  <button class="jp-video-play-icon" role="button" tabindex="0">play</button>
                                                </div>
                                                <div class="jp-interface">
                                                  <div class="jp-progress">
                                                    <div class="jp-seek-bar">
                                                      <div class="jp-play-bar"></div>
                                                    </div>
                                                  </div>
                                                  <div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
                                                  <div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
                                                  <div class="jp-details">
                                                    <div class="jp-title" aria-label="title">&nbsp;</div>
                                                  </div>
                                                  <div class="jp-controls-holder">
                                                    <div class="jp-volume-controls">
                                                      <button class="jp-mute" role="button" tabindex="0">mute</button>
                                                      <button class="jp-volume-max" role="button" tabindex="0">max volume</button>
                                                      <div class="jp-volume-bar">
                                                        <div class="jp-volume-bar-value"></div>
                                                      </div>
                                                    </div>
                                                    <div class="jp-controls">
                                                      <button class="jp-play" role="button" tabindex="0">play</button>
                                                      <button class="jp-stop" role="button" tabindex="0">stop</button>
                                                    </div>
                                                    <div class="jp-toggles">
                                                      <button class="jp-repeat" role="button" tabindex="0">repeat</button>
                                                      <button class="jp-full-screen" role="button" tabindex="0">full screen</button>
                                                    </div>
                                                  </div>
                                                </div>
                                              </div>
                                              <div class="jp-no-solution">
                                                <span>Update Required</span>
                                                To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                                              </div>
                                            </div>
                                          </div>
                                          <p></p>
                                          <h2>歌手：${cmsAudio.singer}</h2>
                                          <h2>歌词：</h2>
                                          <div>${cmsAudio.introduce}</div>
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
                                      ready: function () {
                                        $(this).jPlayer("setMedia", {
                                          title: "${cmsAudio.name}",
                                          m4v: "${cmsAudio.audioUrl}",
                                          ogv: "${cmsAudio.audioUrl}",
                                          webmv: "${cmsAudio.audioUrl}",
                                          poster: "${cmsAudio.audioUrl}"
                                        });
                                      },
                                      swfPath: "/html/plugins/jkplayer/jplayer/jquery.jplayer.swf",
                                      supplied: "webmv, ogv, m4v,mp4,avi,flv",
                                      size: {
                                        width: "640px",
                                        height: "360px",
                                        cssClass: "jp-video-360p"
                                      },
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
                                  
                                 
                                
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 