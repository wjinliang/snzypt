<!DOCTYPE html>
           <html>
           <head lang="en">
                <#include "/template/jh-meta.ftl">
               <title>${site.displayName!}-${cmsVideo.name!}</title>
             	<meta name="keywords" content="" />
               <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
               <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
               <!--[if lt IE 9]>
               <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
               <script src="/html/jinhu-static/js/respond.min.js"></script>
               <![endif]-->
	       <style>
		.jhvideo{
			width:60%;
			margin-left: auto;
			margin-right: auto;
			margin-top:30px;
		}
	       </style>
           </head>
           <body>
           
           <#include "/template/jh-head.ftl"/>
           <#include "/template/jh-daohang.ftl"/>
           <div class="container bg-white">
              
               <div class="jh-main jh-article">
                   <div class="jh-article-title fontSize22 text-center"><span style="">${cmsVideo.name?default("")}</span></div>
                   <div class="jh-article-info text-center">
                       <span>发布日期：<#if cmsVideo.publishDate??>${(cmsVideo.publishDate?string("yyyy-MM-dd"))}</#if></span>
                       <span>出处：${cmsVideo.origin?default("")}</span>
                       <span>作者：${cmsVideo.director?default("")}</span>
                       <div class="jh-share-btn" style="margin-top: -15px;">
   			
			<span  class="bdsharebuttonbox">
			<a href="#" class="bds_more" data-cmd="more"></a>
			<a href="#" class="bds_qzone" data-cmd="qzone"></a>
			<a href="#" class="bds_tsina" data-cmd="tsina"></a>
			<a href="#" class="bds_tqq" data-cmd="tqq"></a>
			<a href="#" class="bds_renren" data-cmd="renren"></a>
			<a href="#" class="bds_weixin" data-cmd="weixin"></a>
			</span>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
			
		</div></div>
 <div class="jh-article-p">
                  <div class=" ">
           		<div class=" jhvideo mgt30" >
			<#if cmsVideo.actor??>
				
			<#else>
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
                                              <!--<div class="jp-no-solution">
                                                <span>Update Required</span>
                                                To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                                              </div>-->
                                            </div>
                                          </div>

  				</#if>
  			</div>
                    </div>
                  </br>
                       ${cmsVideo.introduce?default("")}
                   </div>
               </div>
           	
           </div>
           <#include "/template/jh-footer.ftl">
           <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
           <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
           <script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
           <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
	   <link href="/html/jinhu-static/plugins/jPlayer-2.9.1/skin/pink.flag/jplayer.pink.flag.css" rel="stylesheet" type="text/css" />
	   <script type="text/javascript" src="/html/jinhu-static/plugins/jPlayer-2.9.1/dist/jplayer/jquery.jplayer.min.js"></script>

           <script type="text/javascript">
               $(function () {
                   $('input, textarea').placeholder();
                                    if($("#jquery_jplayer_1")){
                                      $("#jquery_jplayer_1").jPlayer({
                                      ready: function () {
                                        $(this).jPlayer("setMedia", {
                                          title: "${cmsVideo.name!}",
                                          m4v: "${cmsVideo.videoUrl!}",
                                          ogv: "${cmsVideo.videoUrl!}",
                                          webmv: "${cmsVideo.videoUrl!}"
                                        }).jPlayer("play");;
                                      },
                                      swfPath: "/html/jinhu-static/plugins/jPlayer-2.9.1/dist/jplayer/jquery.jplayer.swf",
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
				    }
               });
           </script>
           </body>
</html>