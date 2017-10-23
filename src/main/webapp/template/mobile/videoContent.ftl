<!DOCTYPE html>
                                  <html>
                                  <head>
                                  <meta charset="utf-8" />
                                <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0,minimum-scale=1.0, user-scalabele=no"/>
                                  <title>【蓝海】信息网</title>
                                                                 
                                     <!--ckplayer-->
                                  <link type="text/css" rel="stylesheet" href="${htmlFolder}${htmlMobileFolder}/css/global.css" /><!--全局样式-->
                                  <link type="text/css" rel="stylesheet" href="${htmlFolder}${htmlMobileFolder}/css/main.css" />
                                  <link href="${htmlFolder}/plugins/jkplayer/skin/pink.flag/css/jplayer.pink.flag.min.css" rel="stylesheet" type="text/css" />
                                  <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
                                  <script type="text/javascript" src="${htmlFolder}/plugins/jkplayer/jplayer/jquery.jplayer.min.js"></script>
                                  <script src="${htmlFolder}${htmlMobileFolder}/js/retina.js"></script><!--适应2倍屏-->  
                                
                                   <style>
                                     #main-wrap {
                                              
                                              width: 95%;
                                              margin: 10px;
                                              
                                          }

                                    
                                     .jp-video-360p{
                                      width: 100%;
                                   }
                                  .jp-video .jp-controls-holder
                                   {
                                    text-align: center;
                                     width: 90%;
                                     margin: 0px;
                                   }
                                    .jp-controls {
                                       width: 90%;
                                     margin: 10px 0px;
                                     float:left;
                                    }
                                  </style>
                                 

                                  </head>
                                  
                                  <body>
                                  <div id="main-wrap">
                                  <div class="main_image">  
                                  <h2>${cmsVideo.name}</h2>
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
                                                   
                                                  </div>
                                                </div>
                                              </div>
                                              <div class="jp-no-solution">
                                                <span>Update Required</span>
                                                To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                                              </div>
                                          </div>  
                                          </div>  
                                         
                                          
                                          
                                        </div>
                                         </div> 
                                         <div style="margin:10px;font-size:1.5rem"> 
                                             <p></p>
                                            <h2>导演：${cmsVideo.director}</h2>
                                            <h2>演员：${cmsVideo.actor}</h2>
                                            <h2>影片介绍：</h2>
                                            <div style="font-size:1.5rem">${cmsVideo.introduce}</div>
                                        </div>
                                  <!-- Main end-->
                                  <div class="blank_20"></div>
                                  <!--!footer-->
                              
                                  <!--!footer end-->
       
                                  
                                  
                                  
                                  
                                  <!--[if lte IE 8]>
                                  <script src="/js/ieBetter.js"></script>
                                  <![endif]-->
                                  
                                  
                                  <!--                       Javascripts 注意不要改变顺序                      -->
                                  
          
                                
                               
                                 
                                  <script type="text/javascript">
                                     $(document).ready(function(){
                                    var width = document.documentElement.clientWidth; 
                                    var height = document.documentElement.clientHeight;
                                      $("#jquery_jplayer_1").jPlayer({
                                      ready: function () {
                                        $(this).jPlayer("setMedia", {
                                          title: "${cmsVideo.name}",
                                          m4v: "${cmsVideo.videoUrl!}",
                                          ogv: "${cmsVideo.videoUrl!}",
                                          webmv: "${cmsVideo.videoUrl!}",
                                          poster: "${cmsVideo.imageUrl!}"
                                        });
                                      },
                                      swfPath: "/${htmlFolder}/plugins/jkplayer/jplayer/jquery.jplayer.swf",
                                      supplied: "webmv, ogv, m4v,mp4,avi,flv",
                                      size: {
                                         width: "100%",
                                         //height: height*40/100,
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
                                        </body>
                                  </html>
                                  
                                 
                                
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 